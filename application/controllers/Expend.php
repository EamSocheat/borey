<?php
defined('BASEPATH') OR exit('No direct script access allowed');
ini_set('display_errors', 1);
date_default_timezone_set("Asia/Bangkok");
class Expend extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('M_login');
		$this->load->library('session');
		$this->load->model('M_check_user');
		$this->load->model('M_menu');
		$this->load->helper('form');
		$this->load->model('M_common');
		$this->load->model('M_expend');
		$this->load->library("excel");
		//$this->load->library('../controllers/upload');
	}
	public function index(){

		if(!$this->M_check_user->check()){
			redirect('/Login');
		}
		$dataMenu['menu_active'] = "Expend";
		$data['header'] = $this->load->view('v_header', $dataMenu, TRUE);
		$data['footer'] = $this->load->view('v_footer', NULL, TRUE);
		$data['iframe'] = $this->load->view('v_iframe', NULL, TRUE);

		$this->load->view('v_expend',$data);
	}

	public function getExpend(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}

		$dataSrch = array(
			'limit' 		=> $this->input->post('perPage'),
			'offset' 		=> $this->input->post('offset'),
			'exp_id' 		=> $this->input->post('expId'),
			'sup_nm' 		=> $this->input->post('suppNm'),
			'bra_nm' 		=> $this->input->post('expPro'),
			'sta_nm'		=> $this->input->post('expSta'),
			'txtSrchExpendSD' 	=> $this->reOrderDate($this->input->post('txtSrchExpendSD')),
			'txtSrchExpendED'	=> $this->reOrderDate($this->input->post('txtSrchExpendED'))
		);
		$data["OUT_REC"] = $this->M_expend->selectExpend($dataSrch);
		$data["OUT_REC_CNT"] = $this->M_expend->countExpend($dataSrch);
		echo json_encode($data);
	}
    
	public function uploadImageExpend(){
	    $expPhoto = "";
	    if(!empty($_FILES['fileExpPhoto']['name'])){
	        $expPhoto = $this->M_common->uploadImage($_FILES['fileExpPhoto'],'fileExpPhoto','./upload/borey/expend','/borey/expend/');
	    }else{
	        $expPhoto = $this->input->post('expImgPath');
	    }
	    echo $expPhoto;
	}
	public function save(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}

	    $expStaffId = "";
		
		if($this->input->post('cboStaffPay') == '0'){
			$expStaffId = $_SESSION['usrId'];
		}else{
			$expStaffId = $this->input->post('cboStaffPay');
		}
		$expPhoto = $this->input->post('expImage');
		$itemDescArr = explode(",",$this->input->post('itemDescArr'));
		$itemQtyKhrArr = explode(",",$this->input->post('itemQtyKhrArr'));
		$itemUnitPriceKhrArr = explode(",",$this->input->post('itemUnitPriceKhrArr'));
		$itemTotalPriceKhrArr = explode(",",$this->input->post('itemTotalPriceKhrArr'));
		$itemQtyArr = explode(",",$this->input->post('itemQtyArr'));
		$itemUnitPriceArr = explode(",",$this->input->post('itemUnitPriceArr'));
		$itemTotalPriceArr = explode(",",$this->input->post('itemTotalPriceArr'));
		$itemNoArr = explode(",",$this->input->post('itemNoArr'));
		
		for($i=0; $i<sizeof($itemDescArr);$i++){
		    $data = array(
		        'exp_total_price'		=> str_replace(",","",$this->input->post('txtTotalExp')),
		        'exp_date'		=> date('Y-m-d',strtotime($this->input->post('txtExpendDate'))),
		        'exp_req_date'		=> date('Y-m-d',strtotime($this->input->post('txtRequestDate'))),
		        //'exp_des'		=> $this->input->post('txtDesc'),
		        'exp_des'		=> $itemDescArr[$i],
		        'exp_qty_khr'		=> $itemQtyKhrArr[$i],
		        'exp_unit_price_khr'		=> $itemUnitPriceKhrArr[$i],
		        'exp_total_price_khr'		=> $itemTotalPriceKhrArr[$i],
		        'exp_qty'		=> $itemQtyArr[$i],
		        'exp_unit_price'		=> $itemUnitPriceArr[$i],
		        'exp_total_price'		=> $itemTotalPriceArr[$i],
		        'exp_item_no'		=> $itemNoArr[$i],
		        'exp_inv_no'		=> $this->input->post('txtInvNo'),
		        'exp_image'		=> $expPhoto,
		        'sta_id'		=> $expStaffId,
		        'sup_id'		=> $this->input->post('txtSuppIdVal'),
		        'bra_id'		=> $this->input->post('projectNm'),
		        'useYn'			=> "Y",
		        'com_id'		=> $_SESSION['comId']
		    );
		    
		    if($this->input->post('expId') != null && $this->input->post('expId') != ""){
		        //update data
		        $data['exp_id'] = $this->input->post('expId');
		        $data['upUsr'] = $_SESSION['usrId'];
		        $data['upDt'] = date('Y-m-d H:i:s');
		        $this->M_expend->update($data);
		    }else{
		        //insert data
		        $data['regUsr'] = $_SESSION['usrId'];
		        $data['regDt'] = date('Y-m-d H:i:s');
		        $this->M_expend->insert($data);
		    }
		}
		

		echo 'OK';
	}


	public function getBranchType(){
		$data["OUT_REC"] = $this->M_branch->selectBrandType();
		echo json_encode($data);
	}

	public function delete(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}

		$delObj = $this->input->post('delObj');
		$cntDel = 0;
		for($i=0; $i<sizeof($delObj); $i++){
			/*$cntActiveContract	= 0;
			$cntActiveSell		= 0;
			//check contract table using branch or not
			$dataCol = array(
				'tbl_nm' 		=> "tbl_contract",
				'id_nm' 		=> "exp_id",
				'com_id' 		=> "com_id"
			);

			$dataVal = array(
				'id_val' 		=> $delObj[$i]['expId'],
				'com_val' 		=> $_SESSION['comId']
			);
			$chkData	= $this->M_common->checkActiveRecord($dataCol,$dataVal);
			$cntActiveContract += $chkData[0]->active_rec;

			$dataCol = array(
				'tbl_nm' 		=> "tbl_sell",
				'id_nm' 		=> "exp_id",
				'com_id' 		=> "com_id"
			);

			$dataVal = array(
				'id_val' 		=> $delObj[$i]['expId'],
				'com_val' 		=> $_SESSION['comId']
			);
			$chkData		= $this->M_common->checkActiveRecord($dataCol,$dataVal);
			$cntActiveSell += $chkData[0]->active_rec;

			if($cntActiveContract > 0 || $cntActiveSell > 0){
				continue;
			}else{
				$data = array(
					'exp_id'	=> $delObj[$i]['expId'],
					'useYn'		=> "N",
					'com_id'	=> $_SESSION['comId'],
					'upDt'		=> date('Y-m-d H:i:s'),
					'upUsr'		=> $_SESSION['usrId']
				);
				$this->M_expend->update($data);
				$cntDel+=1;
			}*/

			$data = array(
				'exp_id'	=> $delObj[$i]['expId'],
				'useYn'		=> "N",
				'com_id'	=> $_SESSION['comId'],
				'upDt'		=> date('Y-m-d H:i:s'),
				'upUsr'		=> $_SESSION['usrId']
			);
			$this->M_expend->update($data);
			$cntDel+=1;
		}
		echo $cntDel;
	}

	public function reOrderDate($input_date){
		$output_date = "";
		if($input_date != "" && $input_date != ""){
			$output_date = explode("-",$input_date)[2]."-".explode("-",$input_date)[1]."-".explode("-",$input_date)[0];
		}
//		return explode("-",$input_date)[2]."-".explode("-",$input_date)[1]."-".explode("-",$input_date)[0];
		return $output_date;
	}
	
	
	
    function download_excel(){
        $object = new PHPExcel();
        $object->setActiveSheetIndex(0);

        $table_columns = array("ល.រ","គម្រោង", "អ្នកផ្គត់ផ្គង់", "លេខ​វិ​ក័​យ​ប័ត្រ", "បរិយាយ"," ", "តម្លៃប្រាក់រៀល (៛)"," ", " ", "តម្លៃជាដុល្លារ ($)"," ","ថ្ងៃស្នើសុំ​","ថ្ងៃចំណាយ","អ្នកទូទាត់");
		$table_columns2 = array(" "," ", " ", " ", "វិ​ក័​យ​ប័ត្រ","បរិមាណ", "តម្លៃក្នុង១ឯកតា", "សរុប", "បរិមាណ", "តម្លៃក្នុង១ឯកតា", "សរុប", " "," "," ");
        $column = 0;

        /**
         * get header
         */
        foreach($table_columns as $field){
            $object->getActiveSheet()->setCellValueByColumnAndRow($column, 1, $field);
            $column++;
        	
        }
		
		$column = 0;
		foreach($table_columns2 as $field){
           	$object->getActiveSheet()->setCellValueByColumnAndRow($column, 2, $field);
            $column++;
			
        }
		$object->getActiveSheet()->mergeCells('F1:H1');
		$object->getActiveSheet()->mergeCells('I1:K1');
		$object->getActiveSheet()->setCellValueByColumnAndRow(5, 1, "តម្លៃប្រាក់រៀល (៛)");
		$object->getActiveSheet()->setCellValueByColumnAndRow(8, 1, "តម្លៃជាដុល្លារ ($)");
        /**
         * set style to header
         */
        $styleArray = array(
            //'font' => array('bold' => true,'color' => array('rgb' => 'FF0000'),),
			'font' => array('bold' => false,'name'=>'Khmer OS Battambang','size'=>'9px'),
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,),
            'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'color' => array('rgb' => 'f8e9ba')
            ),
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN),
                'top' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,),
                /*'fill' => array(
                    'type' => \PHPExcel_Style_Fill::FILL_GRADIENT_LINEAR,
                    'rotation' => 90,
                    'startcolor' => array('argb' => 'FFA0A0A0',),'endcolor' => array('argb' => '333333',),),*/
            ),
        );
    	
        $object->getActiveSheet()->mergeCells('A1:A2');
        $object->getActiveSheet()->mergeCells('B1:B2');
        $object->getActiveSheet()->mergeCells('C1:C2');
        $object->getActiveSheet()->mergeCells('D1:D2');
        $object->getActiveSheet()->mergeCells('E1:E2');
        $object->getActiveSheet()->mergeCells('L1:L2');
        $object->getActiveSheet()->mergeCells('M1:M2');
        $object->getActiveSheet()->mergeCells('N1:N2');
        $object->getActiveSheet()->setCellValueByColumnAndRow(1, 1, "គម្រោង");
		$object->getActiveSheet()->setCellValueByColumnAndRow(2, 1, "អ្នកផ្គត់ផ្គង់");
		$object->getActiveSheet()->setCellValueByColumnAndRow(3, 1, "​វិ​ក័​យ​ប័ត្រ");
		$object->getActiveSheet()->setCellValueByColumnAndRow(4, 1, "បរិយាយ");
    	/*foreach(range('A1','N1') as $columnID) {
		    $object->getActiveSheet()->getColumnDimension($columnID)->setAutoSize(true);
		}
    	foreach(range('A2','N2') as $columnID) {
		    $object->getActiveSheet()->getColumnDimension($columnID)->setAutoSize(true);
		}*/
        $object->getActiveSheet()->getStyle('A1:N1')->applyFromArray($styleArray);
        $object->getActiveSheet()->getStyle('A2:N2')->applyFromArray($styleArray);
        $object->getDefaultStyle()->getFont()->setName('Khmer OS Siemreap');
        $object->getDefaultStyle()->getFont()->setSize('9px');
	    
     	
        /**
         * retrieve data from table database
         */
        $dataSrch = array(
            'expIdArray' => $this->input->post("expIdArray")
        );
        $expend_data = $this->M_expend->selectExpend($dataSrch);

        // /**
         // * match header and data
         // */
		$style_center = array(
	        
	    );
	    $style_border_center = array(
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN),
                'top' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN)
            ),
            'alignment' => array(
	            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
	        ),
        );
        
         $style_border_right = array(
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN),
                'top' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN)
            ),
            'alignment' => array(
	            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_RIGHT,
	        ),
        );
       
        $excel_row = 3;
        $noItem=1;
        foreach($expend_data as $row){
        	//
        	$object->getActiveSheet()->getStyle('A'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_center);
        	$object->getActiveSheet()->getStyle('L'.$excel_row.':N'.$excel_row)->applyFromArray($style_border_center);
        	$object->getActiveSheet()->getStyle('F'.$excel_row.':K'.$excel_row)->applyFromArray($style_border_right);
        	//
            $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, $noItem);
            $object->getActiveSheet()->setCellValueByColumnAndRow(1, $excel_row, $row->bra_nm_kh);
            $object->getActiveSheet()->setCellValueByColumnAndRow(2, $excel_row, ($row->sup_nm_kh == null ? "None" : $row->sup_nm_kh));
            $object->getActiveSheet()->setCellValueByColumnAndRow(3, $excel_row, ($row->exp_inv_no == null ? "None" : $row->exp_inv_no));
            $object->getActiveSheet()->setCellValueByColumnAndRow(4, $excel_row, $row->exp_des);
            $object->getActiveSheet()->setCellValueByColumnAndRow(5, $excel_row, ($row->exp_qty_khr == 0 ? "" : $row->exp_qty_khr));
            $object->getActiveSheet()->setCellValueByColumnAndRow(6, $excel_row, ($row->exp_unit_price_khr == 0 ? "" : $row->exp_unit_price_khr));
            $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, ($row->exp_total_price_khr == 0 ? "" : $row->exp_total_price_khr));
            $object->getActiveSheet()->setCellValueByColumnAndRow(8, $excel_row, ($row->exp_qty == 0 ? "" : $row->exp_qty));
            $object->getActiveSheet()->setCellValueByColumnAndRow(9, $excel_row, ($row->exp_unit_price == 0 ? "" : $row->exp_unit_price));
            $object->getActiveSheet()->setCellValueByColumnAndRow(10, $excel_row,($row->exp_total_price == 0 ? "" : $row->exp_total_price));
            $object->getActiveSheet()->setCellValueByColumnAndRow(11, $excel_row, date('d/m/Y',strtotime($row->exp_req_date)));
            $object->getActiveSheet()->setCellValueByColumnAndRow(12, $excel_row, date('d/m/Y',strtotime($row->exp_date)));
            $object->getActiveSheet()->setCellValueByColumnAndRow(13, $excel_row, $row->sta_nm_kh);
            $excel_row++;
            $noItem++;
            
        
        }
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(7);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(25);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(25);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(17);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(35);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(7);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(7);
        $object->getActiveSheet()->getColumnDimension('J')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('K')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('L')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('M')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('N')->setWidth(15);
        $object_writer = PHPExcel_IOFactory::createWriter($object, 'Excel5');
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="Payment_'.date('Y/m/d').'.xls"');
        $object_writer->save('php://output');
    }

}

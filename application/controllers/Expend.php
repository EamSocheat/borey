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

        $table_columns = array("គម្រោង", "អ្នកផ្គត់ផ្គង់", "លេខ​វិ​ក័​យ​ប័ត្រ", "បរិយាយ"," ", "តម្លៃប្រាក់រៀល (៛)"," ", " ", "តម្លៃជាដុល្លារ ($)"," ","ថ្ងៃស្នើសុំ​","ថ្ងៃចំណាយ","អ្នកទូទាត់");
		$table_columns2 = array(" ", " ", " ", " ","បរិមាណ", "តម្លៃក្នុង១ឯកតា", "សរុប", "បរិមាណ", "តម្លៃក្នុង១ឯកតា", "សរុប", " "," "," ");
        $column = 0;

        /**
         * get header
         */
        foreach($table_columns as $field){
            $object->getActiveSheet()->setCellValueByColumnAndRow($column, 1, $field);
            $column++;
                        
            /**
             * set auto width foreach column size
             */
            // foreach (range($field, $object->getActiveSheet()->getHighestDataColumn()) as $col) {
                // $object->getActiveSheet()->getColumnDimension($col)->setAutoSize(true);
            // }
        }
		
		// $column = 0;
		// foreach($table_columns2 as $field){
            // $object->getActiveSheet()->setCellValueByColumnAndRow($column, 2, $field);
            // $column++;
                        
            // /**
             // * set auto width foreach column size
             // */
            // foreach (range($field, $object->getActiveSheet()->getHighestDataColumn()) as $col) {
                // $object->getActiveSheet()->getColumnDimension($col)->setAutoSize(true);
            // }
        // }

        /**
         * set style to header
         */
        $styleArray = array(
            //'font' => array('bold' => true,'color' => array('rgb' => 'FF0000'),),
			'font' => array('bold' => true,),
            'alignment' => array('horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,),
            'fill' => array(
                'type' => PHPExcel_Style_Fill::FILL_SOLID,
                'color' => array('rgb' => 'B2B2B2')
            ),
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN,
                    'color' => array('rgb' => 'DDDDDD'),),
                'top' => array(
                    'style' => \PHPExcel_Style_Border::BORDER_THIN,),
                /*'fill' => array(
                    'type' => \PHPExcel_Style_Fill::FILL_GRADIENT_LINEAR,
                    'rotation' => 90,
                    'startcolor' => array('argb' => 'FFA0A0A0',),'endcolor' => array('argb' => '333333',),),*/
            ),
        );
        $object->getActiveSheet()->getStyle('A1:I1')->applyFromArray($styleArray);
        $object->getDefaultStyle()->getFont()->setName('Khmer OS Battambang');
        
        /**
         * retrieve data from table database
         */
        // $dataSrch = array(
            // 'payIdArray' => $this->input->post("payIdArray")
        // );
        // $contract_data = $this->M_payment->selectPaymentData($dataSrch);

        // /**
         // * match header and data
         // */
        // // $excel_row = 2;
        // foreach($contract_data as $row){
            // $curr = $row->pay_loan_int_type;
            // $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, $row->pay_no);
            // $object->getActiveSheet()->setCellValueByColumnAndRow(1, $excel_row, $row->con_no);
            // $object->getActiveSheet()->setCellValueByColumnAndRow(2, $excel_row, $this->commaAmt($row->pay_usr_amount_calculate).$this->addCurrncy($row->pay_cur_id,$row->pay_usr_amount_calculate));
            // $object->getActiveSheet()->setCellValueByColumnAndRow(3, $excel_row, $this->commaAmt($row->pay_loan).$this->addCurrncy($curr,$row->pay_loan));
            // $object->getActiveSheet()->setCellValueByColumnAndRow(4, $excel_row, $this->commaAmt($row->pay_int).$this->addCurrncy($curr,$row->pay_int));
            // $object->getActiveSheet()->setCellValueByColumnAndRow(5, $excel_row, $this->commaAmt($row->pay_loan+$row->pay_int).$this->addCurrncy($curr,$row->pay_loan+$row->pay_int));
            // $object->getActiveSheet()->setCellValueByColumnAndRow(6, $excel_row, $this->commaAmt($row->con_principle).$this->addCurrncy($curr,$row->con_principle));
            // $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, $row->pay_date);
            // $object->getActiveSheet()->setCellValueByColumnAndRow(8, $excel_row, $row->cus_nm);
            // $excel_row++;
        // }

        $object_writer = PHPExcel_IOFactory::createWriter($object, 'Excel5');
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="Payment_'.date('Y/m/d').'.xls"');
        $object_writer->save('php://output');
    }

}

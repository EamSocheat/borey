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
    
	public function getExpendExcel(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    
	    $dataSrch = array(
	        'limit' 		=> 1000000,
	        'offset' 		=> 0,
	        'sup_nm' 		=> $this->input->post('suppNm'),
	        'bra_nm' 		=> $this->input->post('expPro'),
	        'sta_nm'		=> $this->input->post('expSta'),
	        'txtSrchExpendSD' 	=> $this->reOrderDate($this->input->post('txtSrchExpendSD')),
	        'txtSrchExpendED'	=> $this->reOrderDate($this->input->post('txtSrchExpendED'))
	    );
	    $data["OUT_REC"] = $this->M_expend->selectExpend($dataSrch);
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
		        'exp_req_staff_id'		=> $this->input->post('cboReqStaff'),
		        'exp_voucher_no'		=> $this->input->post('txtVoNo'),
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

        $table_columns = array("ល.រ","គម្រោង", "អ្នកផ្គត់ផ្គង់", "លេខ​វិ​ក័​យ​ប័ត្រ", "បរិយាយ"," ", "តម្លៃប្រាក់រៀល (៛)"," ", " ", "តម្លៃជាដុល្លារ ($)"," ","លេខប័ណ្ណ","អ្នកស្នើសុំ","ថ្ងៃស្នើសុំ​","ថ្ងៃចំណាយ","អ្នកទូទាត់");
		$table_columns2 = array(" "," ", " ", " ", "វិ​ក័​យ​ប័ត្រ","បរិមាណ", "តម្លៃក្នុង១ឯកតា", "សរុប", "បរិមាណ", "តម្លៃក្នុង១ឯកតា", "សរុប", " "," "," "," "," ");
        $column = 0;

        /**
         * get header
         */
        foreach($table_columns as $field){
            $object->getActiveSheet()->setCellValueByColumnAndRow($column, 5, $field);
            $column++;
        	
        }
		
		$column = 0;
		foreach($table_columns2 as $field){
           	$object->getActiveSheet()->setCellValueByColumnAndRow($column, 6, $field);
            $column++;
			
        }
		$object->getActiveSheet()->mergeCells('F5:H5');
		$object->getActiveSheet()->mergeCells('I5:K5');
		$object->getActiveSheet()->setCellValueByColumnAndRow(5, 5, "តម្លៃប្រាក់រៀល (៛)");
		$object->getActiveSheet()->setCellValueByColumnAndRow(8, 5, "តម្លៃជាដុល្លារ ($)");
        /**
         * set style to header
         */
        $styleArray = array(
            //'font' => array('bold' => true,'color' => array('rgb' => 'FF0000'),),
			'font' => array('bold' => false,'name'=>'Khmer OS Battambang','size'=>'10px'),
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
        
        $styleFont = array(

            'font' => array('bold' => true,'name'=>'Khmer OS Battambang','size'=>'11px'),
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,),
       
        );
        
        $styleFont_10 = array(
            
            'font' => array('bold' => true,'name'=>'Khmer OS Battambang','size'=>'10px'),
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,),
            
        );
    	
        $object->getActiveSheet()->mergeCells('A5:A6');
        $object->getActiveSheet()->mergeCells('B5:B6');
        $object->getActiveSheet()->mergeCells('C5:C6');
        $object->getActiveSheet()->mergeCells('D5:D6');
        $object->getActiveSheet()->mergeCells('E5:E6');
        $object->getActiveSheet()->mergeCells('L5:L6');
        $object->getActiveSheet()->mergeCells('M5:M6');
        $object->getActiveSheet()->mergeCells('N5:N6');
        $object->getActiveSheet()->mergeCells('O5:O6');
        $object->getActiveSheet()->mergeCells('P5:P6');
        $object->getActiveSheet()->setCellValueByColumnAndRow(1, 5, "គម្រោង");
		$object->getActiveSheet()->setCellValueByColumnAndRow(2, 5, "អ្នកផ្គត់ផ្គង់");
		$object->getActiveSheet()->setCellValueByColumnAndRow(3, 5, "​វិ​ក័​យ​ប័ត្រ");
		$object->getActiveSheet()->setCellValueByColumnAndRow(4, 5, "បរិយាយ");
    	/*foreach(range('A1','N1') as $columnID) {
		    $object->getActiveSheet()->getColumnDimension($columnID)->setAutoSize(true);
		}
    	foreach(range('A2','N2') as $columnID) {
		    $object->getActiveSheet()->getColumnDimension($columnID)->setAutoSize(true);
		}*/
		
		$titleSearchDate = "ទាំងអស់";
		if($this->input->post("expSchDateStart") != null && $this->input->post("expSchDateEnd") != null){
		    $titleSearchDate = " ចាប់ពី ".$this->input->post("expSchDateStart")." ដល់ ".$this->input->post("expSchDateEnd");
		}else{
		    if($this->input->post("expSchDateStart") != null ){
		        $titleSearchDate = " ចាប់ពី ".$this->input->post("expSchDateStart");
		    }
		    if($this->input->post("expSchDateEnd") != null){
		        $titleSearchDate =" ដល់ ".$this->input->post("expSchDateEnd");
		    }
		}
		
		$object->getActiveSheet()->getStyle('A1:P1')->applyFromArray($styleFont);
		$object->getActiveSheet()->getStyle('A2:P2')->applyFromArray($styleFont);
		$object->getActiveSheet()->getStyle('A3:P3')->applyFromArray($styleFont);
        $object->getActiveSheet()->getStyle('A5:P5')->applyFromArray($styleArray);
        $object->getActiveSheet()->getStyle('A6:P6')->applyFromArray($styleArray);
        $object->getDefaultStyle()->getFont()->setName('Khmer OS Siemreap');
        $object->getDefaultStyle()->getFont()->setSize('10px');
        $object->getActiveSheet()->setCellValueByColumnAndRow(5, 1, "បុរីហ្គាឡាក់ស៊ី១១");
        $object->getActiveSheet()->setCellValueByColumnAndRow(5, 2, "Borey Galaxy11");
        $object->getActiveSheet()->setCellValueByColumnAndRow(5, 3, "របាយការណ៍ការចំណាយ( ".$titleSearchDate.")");
        /**
         * retrieve data from table database
        */
        $dataSrch = array(
            'expIdArray' => $this->input->post("expIdArray")
        );
        $expend_data = $this->M_expend->selectExpendExcel($dataSrch);
        
        
        
        /**
        * match header and data
        */
		$style_font_bold = array(
		    'font' => array('bold' => true,),
		    'borders' => array(
		        'allborders' => array(
		            'style' => PHPExcel_Style_Border::BORDER_THIN),
		        'top' => array(
		            'style' => PHPExcel_Style_Border::BORDER_THIN)
		    ),
	    );
		$style_font_bold_bg = array(
		    'font' => array('bold' => true,'size'=>'11px'),
		    'borders' => array(
		        'allborders' => array(
		            'style' => PHPExcel_Style_Border::BORDER_THIN),
		        'top' => array(
		            'style' => PHPExcel_Style_Border::BORDER_THIN)
		    ),
		    'fill' => array(
		        'type' => PHPExcel_Style_Fill::FILL_SOLID,
		        'color' => array('rgb' => 'f8e9ba')
		    ),
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
       
        $excel_row = 7;
        $noItem=1;
        $totalExpendUsd;
        $totalExpendKhr;
        
        $checkStaff=null;
        $checkSizeData=0;
        $totalExpendUsdAll=0;
        $staffExp=null;
        foreach($expend_data as $row){
            $checkSizeData++;
            //check staff expsend
            if(($checkStaff != null && $checkStaff != $row->sta_id)){
                //generate total expend
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_border_right);
                $object->getActiveSheet()->getStyle('H'.$excel_row.':H'.$excel_row)->applyFromArray($style_font_bold);
                $object->getActiveSheet()->getStyle('K'.$excel_row.':K'.$excel_row)->applyFromArray($style_font_bold);
                $object->getActiveSheet()->getStyle('I'.$excel_row.':J'.$excel_row)->applyFromArray($style_border_center);
                $object->getActiveSheet()->getStyle('L'.$excel_row.':P'.$excel_row)->applyFromArray($style_border_center);
                $object->getActiveSheet()->getStyle('J'.$excel_row.':K'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
                $object->getActiveSheet()->getStyle('G'.$excel_row.':H'.$excel_row)->getNumberFormat()->setFormatCode("_(\"៛\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
                $object->getActiveSheet()->mergeCells('A'.$excel_row.':G'.$excel_row);
                $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, "ថ្លៃចំណាយសរុប");
                $object->getActiveSheet()->mergeCells('I'.$excel_row.':J'.$excel_row);
                $object->getActiveSheet()->mergeCells('L'.$excel_row.':P'.$excel_row);
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_font_bold);
                
                $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, $totalExpendKhr);
                $object->getActiveSheet()->setCellValueByColumnAndRow(10, $excel_row, $totalExpendUsd);
                //
                
                //generate khmer to dollar
                $excel_row=$excel_row+1;
                $khrToDollar= $totalExpendKhr/4000;
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_border_right);
                $object->getActiveSheet()->getStyle('H'.$excel_row.':H'.$excel_row)->applyFromArray($style_font_bold);
                $object->getActiveSheet()->getStyle('G'.$excel_row.':H'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
                $object->getActiveSheet()->mergeCells('A'.$excel_row.':G'.$excel_row);
                $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, "អត្រាប្តូរប្រាក់ 1$ = 4000៛");
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_font_bold);
                
                $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, $khrToDollar);
                //
                
                //generate Total all dollar
                $excel_row=$excel_row+1;
                $totalAll= $khrToDollar+$totalExpendUsd;
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_border_right);
                $object->getActiveSheet()->getStyle('H'.$excel_row.':H'.$excel_row)->applyFromArray($style_font_bold);
                $object->getActiveSheet()->getStyle('G'.$excel_row.':H'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
                $object->getActiveSheet()->mergeCells('A'.$excel_row.':G'.$excel_row);
                $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, "សរុប(".$staffExp.")");
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_font_bold);
                
                $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, $totalAll);
                $excel_row++;
                $excel_row++;
                $noItem =1;
                $totalExpendUsdAll = $totalExpendUsdAll+$totalAll;
                $totalAll=0;
                $totalExpendUsd=0;
            }
            
            
        	//
        	$object->getActiveSheet()->getStyle('A'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_center);
        	$object->getActiveSheet()->getStyle('L'.$excel_row.':P'.$excel_row)->applyFromArray($style_border_center);
        	$object->getActiveSheet()->getStyle('F'.$excel_row.':F'.$excel_row)->applyFromArray($style_border_center);
        	$object->getActiveSheet()->getStyle('I'.$excel_row.':I'.$excel_row)->applyFromArray($style_border_center);
        	$object->getActiveSheet()->getStyle('G'.$excel_row.':H'.$excel_row)->applyFromArray($style_border_right);
        	$object->getActiveSheet()->getStyle('J'.$excel_row.':K'.$excel_row)->applyFromArray($style_border_right);
        	$object->getActiveSheet()->getStyle('J'.$excel_row.':K'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
        	$object->getActiveSheet()->getStyle('G'.$excel_row.':H'.$excel_row)->getNumberFormat()->setFormatCode("_(\"៛\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
        	
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
            $object->getActiveSheet()->setCellValueByColumnAndRow(11, $excel_row, ($row->exp_voucher_no == null ? "None" : $row->exp_voucher_no));
            $object->getActiveSheet()->setCellValueByColumnAndRow(12, $excel_row, ($row->exp_req_staff_nm == null ? "None" : $row->exp_req_staff_nm));
            $object->getActiveSheet()->setCellValueByColumnAndRow(13, $excel_row, date('d/m/Y',strtotime($row->exp_req_date)));
            $object->getActiveSheet()->setCellValueByColumnAndRow(14, $excel_row, date('d/m/Y',strtotime($row->exp_date)));
            $object->getActiveSheet()->setCellValueByColumnAndRow(15, $excel_row, $row->sta_nm_kh);
            $excel_row++;
            $noItem++;
            $totalExpendUsd+= floatval($row->exp_total_price);
            $totalExpendKhr+= floatval($row->exp_total_price_khr);
            
            $checkStaff = $row->sta_id;
            $staffExp = $row->sta_nm_kh;
            //check staff expsend
            if($checkSizeData== sizeof($expend_data)){
                //generate total expend
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_border_right);
                $object->getActiveSheet()->getStyle('H'.$excel_row.':H'.$excel_row)->applyFromArray($style_font_bold);
                $object->getActiveSheet()->getStyle('K'.$excel_row.':K'.$excel_row)->applyFromArray($style_font_bold);
                $object->getActiveSheet()->getStyle('I'.$excel_row.':J'.$excel_row)->applyFromArray($style_border_center);
                $object->getActiveSheet()->getStyle('L'.$excel_row.':P'.$excel_row)->applyFromArray($style_border_center);
                $object->getActiveSheet()->getStyle('J'.$excel_row.':K'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
                $object->getActiveSheet()->getStyle('G'.$excel_row.':H'.$excel_row)->getNumberFormat()->setFormatCode("_(\"៛\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
                $object->getActiveSheet()->mergeCells('A'.$excel_row.':G'.$excel_row);
                $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, "ថ្លៃចំណាយសរុប");
                $object->getActiveSheet()->mergeCells('I'.$excel_row.':J'.$excel_row);
                $object->getActiveSheet()->mergeCells('L'.$excel_row.':P'.$excel_row);
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_font_bold);
                
                $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, $totalExpendKhr);
                $object->getActiveSheet()->setCellValueByColumnAndRow(10, $excel_row, $totalExpendUsd);
                //
                
                //generate khmer to dollar
                $excel_row=$excel_row+1;
                $khrToDollar= $totalExpendKhr/4000;
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_border_right);
                $object->getActiveSheet()->getStyle('H'.$excel_row.':H'.$excel_row)->applyFromArray($style_font_bold);
                $object->getActiveSheet()->getStyle('G'.$excel_row.':H'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
                $object->getActiveSheet()->mergeCells('A'.$excel_row.':G'.$excel_row);
                $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, "អត្រាប្តូរប្រាក់ 1$ = 4000៛");
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_font_bold);
                
                $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, $khrToDollar);
                //
                
                //generate Total all dollar
                $excel_row=$excel_row+1;
                $totalAll= $khrToDollar+$totalExpendUsd;
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_border_right);
                $object->getActiveSheet()->getStyle('H'.$excel_row.':H'.$excel_row)->applyFromArray($style_font_bold);
                $object->getActiveSheet()->getStyle('G'.$excel_row.':H'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
                $object->getActiveSheet()->mergeCells('A'.$excel_row.':G'.$excel_row);
                $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, "សរុប(".$staffExp.")");
                $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_font_bold);
                
                $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, $totalAll);
                $totalExpendUsdAll = $totalExpendUsdAll+$totalAll;
                $totalAll=0;
                $totalExpendUsd=0;
            }
        
        }
        
        //Total 
        $excel_row=$excel_row+1;
        $excel_row=$excel_row+1;
        $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_border_right);
        $object->getActiveSheet()->getStyle('H'.$excel_row.':H'.$excel_row)->applyFromArray($style_font_bold_bg);
        $object->getActiveSheet()->getStyle('G'.$excel_row.':H'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
        $object->getActiveSheet()->mergeCells('A'.$excel_row.':G'.$excel_row);
        
        $object->getActiveSheet()->setCellValueByColumnAndRow(0, $excel_row, "ថ្លៃចំណាយសរុបទាំងអស់");
        $object->getActiveSheet()->getStyle('A'.$excel_row.':G'.$excel_row)->applyFromArray($style_font_bold_bg);
        
        $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, $totalExpendUsdAll);
        //
        
        
        //approve....
        $excel_row=$excel_row+1;
        $excel_row=$excel_row+1;
        $object->getActiveSheet()->getStyle('A'.$excel_row.':P'.$excel_row)->applyFromArray($styleFont_10);
        $object->getActiveSheet()->setCellValueByColumnAndRow(2, $excel_row, "Prepared By");
        $object->getActiveSheet()->setCellValueByColumnAndRow(4, $excel_row, "Accounting & Finacial");
        $object->getActiveSheet()->mergeCells('H'.$excel_row.':I'.$excel_row);
        $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, "Seen & Agreed by");
        
        
        $excel_row=$excel_row+1;
        $excel_row=$excel_row+1;
        $excel_row=$excel_row+1;
        $excel_row=$excel_row+1;
        $excel_row=$excel_row+1;
        $excel_row=$excel_row+1;
        $object->getActiveSheet()->getStyle('A'.$excel_row.':P'.$excel_row)->applyFromArray($styleFont_10);
        $object->getActiveSheet()->setCellValueByColumnAndRow(2, $excel_row, "_______________________");
        $object->getActiveSheet()->setCellValueByColumnAndRow(4, $excel_row, "_______________________");
        $object->getActiveSheet()->mergeCells('H'.$excel_row.':I'.$excel_row);
        $object->getActiveSheet()->setCellValueByColumnAndRow(7, $excel_row, "_________________________");
        //
        
        $object->getActiveSheet()->getColumnDimension('A')->setWidth(7);
        $object->getActiveSheet()->getColumnDimension('B')->setWidth(25);
        $object->getActiveSheet()->getColumnDimension('C')->setWidth(25);
        $object->getActiveSheet()->getColumnDimension('D')->setWidth(17);
        $object->getActiveSheet()->getColumnDimension('E')->setWidth(40);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(7);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(7);
        $object->getActiveSheet()->getColumnDimension('J')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('K')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('L')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('M')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('N')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('O')->setWidth(15);
        $object->getActiveSheet()->getColumnDimension('P')->setWidth(15);
        
        $gdImage = imagecreatefrompng(base_url('/upload/fix/galaxy11-logo.png'));
        // Add a drawing to the worksheetecho date('H:i:s') . " Add a drawing to the worksheet\n";
        $objDrawing = new PHPExcel_Worksheet_MemoryDrawing();
        $objDrawing->setName('Sample image');
        $objDrawing->setDescription('Sample image');
        $objDrawing->setImageResource($gdImage);
        $objDrawing->setRenderingFunction(PHPExcel_Worksheet_MemoryDrawing::RENDERING_PNG);
        $objDrawing->setMimeType(PHPExcel_Worksheet_MemoryDrawing::MIMETYPE_DEFAULT);
        $objDrawing->setHeight(50);
        $objDrawing->setCoordinates('D1');
        $objDrawing->setWorksheet($object->getActiveSheet());
        
        $object->getActiveSheet()->getProtection()->setSheet(true);
        $object->getActiveSheet()->getProtection()->setSort(true);
        $object->getActiveSheet()->getProtection()->setInsertRows(true);
        $object->getActiveSheet()->getProtection()->setFormatCells(true);
        
        $object->getActiveSheet()->getProtection()->setPassword('password123');
        
        $object_writer = PHPExcel_IOFactory::createWriter($object, 'Excel5');
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="របាយការណ៍ចំណាយ '.$titleSearchDate.'.xls"');
        $object_writer->save('php://output');
        exit;
        echo 'OK';
    }

}

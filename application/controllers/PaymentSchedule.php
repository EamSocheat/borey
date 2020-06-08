<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Bangkok");

class PaymentSchedule extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model('M_login');
        $this->load->library('session');
        $this->load->model('M_check_user');
        $this->load->model('M_menu');
        $this->load->helper('form');
        $this->load->model('M_contract');
        $this->load->model('M_common');
        $this->load->model('M_house');
        $this->load->model('M_sell');
        $this->load->model('M_sale_payment');
        $this->load->model('M_commission');
        $this->load->model('M_commission_setting');
        $this->load->model('M_staff');
        $this->load->model('M_installment');
        $this->load->model('M_house');
        $this->load->library("excel");
    }
    
    
    
    public function index(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $dataMenu['menu_active'] = "PaymentSchedule";
        $data['header'] = $this->load->view('v_header', $dataMenu, TRUE);
        $data['footer'] = $this->load->view('v_footer', NULL, TRUE);
        $data['iframe'] = $this->load->view('v_iframe', NULL, TRUE);
        
        $this->load->view('v_payment_schedule',$data);
    }
	public function getPaymentMethod(){
		$data["OUT_REC"] = $this->M_common->selectPaymentMethod();
        echo json_encode($data);
	}
	
	public function getPayment(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	   
	    $payMonth = $this->input->post('payMonth');
	    $startDate = null;
	    $endDate = null;
	    if($payMonth != null || $payMonth != ""){
	        $startDate =  date('Y-m-d',strtotime('01-'.$payMonth));
	        $endDate   = date('Y-m-t',strtotime('01-'.$payMonth));
	        
	    }
	    
	    $dataSrch = array(
	        'start_date'        => $startDate,
	        'end_date'        => $endDate,
	    );
	    $paymentSchedule = $this->M_installment->selectPaymentScheduleByMonth($dataSrch);
	    $object = new PHPExcel();
	    $object->setActiveSheetIndex(0);
	    $table_columns = array('ល.រ','លេខកូដ​dsfddsggfgf' ,);
	    
		
		$gdImage = imagecreatefrompng(base_url('/upload/fix/galaxy11-logo.png'));
	    // Add a drawing to the worksheetecho date('H:i:s') . " Add a drawing to the worksheet\n";
	    $objDrawing = new PHPExcel_Worksheet_MemoryDrawing();
	    $objDrawing->setName('Sample image');
	    $objDrawing->setDescription('Sample image');
	    $objDrawing->setImageResource($gdImage);
	    $objDrawing->setRenderingFunction(PHPExcel_Worksheet_MemoryDrawing::RENDERING_PNG);
	    $objDrawing->setMimeType(PHPExcel_Worksheet_MemoryDrawing::MIMETYPE_DEFAULT);
	    $objDrawing->setHeight(35);
	    $objDrawing->setCoordinates('F1');
	    $objDrawing->setWorksheet($object->getActiveSheet());
		
	    /**
	     * get header
	     */
	    $table_columns = array("ល.រ","គម្រោង", "លេខផ្ទះ", "ឈ្មោះអតិថិជន",  "ប្រភេទកិច្ចសន្យា","តំលៃលក់"," ","ប្រាក់កក់"," "," ","បង់ផ្ទះ"," "," "," ", "បង់សេវាបន្ថែម"," "," ");
	    $table_columns2 = array(" "," ", " ", " "," ", " ","ថ្ងៃបានបង់", "ប្រាក់បានបង់",  "លេខ​វិ​ក័​យ​ប័ត្រ", "ថ្ងៃត្រូវបង់", "ប្រាក់ត្រូវបង់","ថ្ងៃបានបង់", "ប្រាក់បានបង់", "លេខ​វិ​ក័​យ​ប័ត្រ","ថ្ងៃបានបង់", "ប្រាក់បានបង់","សេវាបន្ថែម","លេខ​វិ​ក័​យ​ប័ត្រ");
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
		
		$style_header = array(
		    'font' => array('bold' => true,'name'=>'Khmer OS Siemreap','size'=>'10px'),
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
                
            ),
		);
		$styleTitle = array(

            'font' => array('bold' => true,'name'=>'Khmer OS Siemreap','size'=>'10px'),
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,),
       
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
		
		$style_border_left = array(
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN),
                'top' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN)
            ),
            'alignment' => array(
	            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
	        ),
        );
		
		$styleBold = array(

            'font' => array('bold' => true,'name'=>'Khmer OS Siemreap',),
        );
		
		
		$object->getActiveSheet()->getStyle('A5:R5')->applyFromArray($style_header);
        $object->getActiveSheet()->getStyle('A6:R6')->applyFromArray($style_header);
	    
	    $excel_row = 7;
	    $noItem=1;
		$totalHousePrice=0;
		$totalBookPrice=0;
		$totalInstPrice=0;
		$totalInstPaidPrice=0;
		$totalOtherPayPrice=0;
		$totalHouse=0;
		$totalHouseSold=0;
		$totalHouseFree=0;
	    foreach($paymentSchedule as $row){
	        $totalHouse+=1;
	        if($row->pro_status == 'S'){
	            $totalHouseSold+=1;
	        }else{
	            $totalHouseFree+=1;
	        }
			//
			$object->getDefaultStyle()->getFont()->setName('Khmer OS Siemreap');
			$object->getDefaultStyle()->getFont()->setSize('10px');
			//
			
			$totalHousePrice 		= $totalHousePrice + floatval($row->sell_price);
			$totalBookPrice 		= $totalBookPrice + floatval($row->book_amount);
			$totalInstPrice 		= $totalInstPrice + floatval($row->inst_amt_pay);
			$totalInstPaidPrice 	= $totalInstPaidPrice + floatval($row->inst_total_paid_amount);
			$totalOtherPayPrice 	= $totalOtherPayPrice + floatval($row->other_pay_amount);
			
	        $colNum=0;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $noItem);
			$colNum++;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $row->bra_nm_kh);
	        $colNum++;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $row->pro_code);
	        $colNum++;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $row->cus_name);
	        $colNum++;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $row->con_type_nm_kh);
	        $colNum++;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $row->sell_price);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->con_date);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->book_amount);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->con_code);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->inst_date);
	        $colNum++;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->inst_amt_pay);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->inst_paid_date);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->inst_total_paid_amount);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->inst_paid_code);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->other_pay_date);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->other_pay_amount);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->other_pay_des);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->oth_pay_inv_code);
	        $colNum++;
			//
			$object->getActiveSheet()->getStyle('A'.$excel_row.':C'.$excel_row)->applyFromArray($style_border_center);
			$object->getActiveSheet()->getStyle('D'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_left);
			$object->getActiveSheet()->getStyle('F'.$excel_row.':F'.$excel_row)->applyFromArray($style_border_right);
			$object->getActiveSheet()->getStyle('F'.$excel_row.':F'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
			$object->getActiveSheet()->getStyle('G'.$excel_row.':G'.$excel_row)->applyFromArray($style_border_center);
			$object->getActiveSheet()->getStyle('H'.$excel_row.':H'.$excel_row)->applyFromArray($style_border_right);
			$object->getActiveSheet()->getStyle('H'.$excel_row.':H'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
			$object->getActiveSheet()->getStyle('I'.$excel_row.':I'.$excel_row)->applyFromArray($style_border_center);
			$object->getActiveSheet()->getStyle('J'.$excel_row.':J'.$excel_row)->applyFromArray($style_border_center);
			$object->getActiveSheet()->getStyle('K'.$excel_row.':K'.$excel_row)->applyFromArray($style_border_right);
			$object->getActiveSheet()->getStyle('K'.$excel_row.':K'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
			$object->getActiveSheet()->getStyle('L'.$excel_row.':L'.$excel_row)->applyFromArray($style_border_center);
			$object->getActiveSheet()->getStyle('M'.$excel_row.':M'.$excel_row)->applyFromArray($style_border_right);
			$object->getActiveSheet()->getStyle('M'.$excel_row.':M'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
			$object->getActiveSheet()->getStyle('N'.$excel_row.':N'.$excel_row)->applyFromArray($style_border_center);
			$object->getActiveSheet()->getStyle('O'.$excel_row.':O'.$excel_row)->applyFromArray($style_border_center);
			$object->getActiveSheet()->getStyle('P'.$excel_row.':P'.$excel_row)->applyFromArray($style_border_right);
			$object->getActiveSheet()->getStyle('P'.$excel_row.':P'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
			$object->getActiveSheet()->getStyle('Q'.$excel_row.':Q'.$excel_row)->applyFromArray($style_border_center);
			$object->getActiveSheet()->getStyle('R'.$excel_row.':R'.$excel_row)->applyFromArray($style_border_center);
			//
	        $excel_row++;
	        $noItem++;
	        //
	    }
		
		
		$colNum=0;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "សរុប");
		$colNum = $colNum+5;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $totalHousePrice);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->con_date);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$totalBookPrice);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->con_code);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->inst_date);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$totalInstPrice);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->inst_paid_date);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$totalInstPaidPrice);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->inst_paid_code);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->other_pay_date);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$totalOtherPayPrice);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->other_pay_des);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->oth_pay_inv_code);
		$colNum++;
		
		$object->getActiveSheet()->mergeCells('A'.$excel_row.':E'.$excel_row);
		$object->getActiveSheet()->getStyle('A'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_center);
		$object->getActiveSheet()->getStyle('A'.$excel_row.':E'.$excel_row)->applyFromArray($styleBold);
		$object->getActiveSheet()->getStyle('F'.$excel_row.':R'.$excel_row)->applyFromArray($style_border_right);
		$object->getActiveSheet()->getStyle('F'.$excel_row.':R'.$excel_row)->applyFromArray($styleBold);
		$object->getActiveSheet()->getStyle('F'.$excel_row.':R'.$excel_row)->getNumberFormat()->setFormatCode("_(\"$\"* #,##0.00_);_(\"$\"* \(#,##0.00\);_(\"$\"* \"-\"??_);_(@_)");
		$excel_row++;

		//		
		$excel_row++;
		$colNum=2;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "សំគាល់");
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "ចំនួន");
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "ភាគរយ%");
		$object->getActiveSheet()->getStyle('C'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_center);
		$object->getActiveSheet()->getStyle('C'.$excel_row.':E'.$excel_row)->applyFromArray($styleBold);
		
		$excel_row++;
		$colNum=2;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "ផ្ទះលក់");
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $totalHouseSold);
		$colNum++;
		$houseSoldPer = ceil(($totalHouseSold*100) / $totalHouse);
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $houseSoldPer."%");
		$object->getActiveSheet()->getStyle('C'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_center);
		$object->getActiveSheet()->getStyle('C'.$excel_row.':C'.$excel_row)->applyFromArray($styleBold);
		
		$excel_row++;
		$colNum=2;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "ផ្ទះនៅសល់");
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $totalHouseFree);
		$colNum++;
		$houseFreePer = 100 - $houseSoldPer;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $houseFreePer."%");
		$object->getActiveSheet()->getStyle('C'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_center);
		$object->getActiveSheet()->getStyle('C'.$excel_row.':C'.$excel_row)->applyFromArray($styleBold);
		
		$excel_row++;
		$colNum=2;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "ផ្ទះសរុប");
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $totalHouse);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "100%");
		$object->getActiveSheet()->getStyle('C'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_center);
		$object->getActiveSheet()->getStyle('C'.$excel_row.':C'.$excel_row)->applyFromArray($styleBold);
		//
		//style
		
		$object->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('H')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('I')->setWidth(20);
        $object->getActiveSheet()->getColumnDimension('J')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('K')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('L')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('M')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('N')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('O')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('P')->setAutoSize(true);
		$object->getActiveSheet()->getColumnDimension('Q')->setAutoSize(true);
		$object->getActiveSheet()->getColumnDimension('R')->setAutoSize(true);
		
		$object->getActiveSheet()->mergeCells('A5:A6');
        $object->getActiveSheet()->mergeCells('B5:B6');
        $object->getActiveSheet()->mergeCells('C5:C6');
        $object->getActiveSheet()->mergeCells('D5:D6');
        $object->getActiveSheet()->mergeCells('E5:E6');
		$object->getActiveSheet()->mergeCells('F5:F6');
		
		$object->getActiveSheet()->mergeCells('G5:I5');
		$object->getActiveSheet()->mergeCells('J5:N5');
		$object->getActiveSheet()->mergeCells('O5:R5');
		
		$object->getActiveSheet()->getStyle('A1:R1')->applyFromArray($styleTitle);
		$object->getActiveSheet()->getStyle('A2:R2')->applyFromArray($styleTitle);
		$object->getActiveSheet()->getStyle('A3:R3')->applyFromArray($styleTitle);
		$object->getActiveSheet()->setCellValueByColumnAndRow(6, 5, "ប្រាក់កក់");
		$object->getActiveSheet()->setCellValueByColumnAndRow(9, 5, "បង់ផ្ទះ");
		
		
		//approve....
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$object->getActiveSheet()->getStyle('A'.$excel_row.':R'.$excel_row)->applyFromArray($styleBold);
		$object->getActiveSheet()->setCellValueByColumnAndRow(3, $excel_row, "Prepared By");
		$object->getActiveSheet()->setCellValueByColumnAndRow(5, $excel_row, "Checked By");
		//$object->getActiveSheet()->mergeCells('H'.$excel_row.':I'.$excel_row);
		$object->getActiveSheet()->setCellValueByColumnAndRow(16, $excel_row, "Acknowledge by");
		
		
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$object->getActiveSheet()->getStyle('A'.$excel_row.':R'.$excel_row)->applyFromArray($styleBold);
		$object->getActiveSheet()->setCellValueByColumnAndRow(3, $excel_row, "_______________________");
		$object->getActiveSheet()->setCellValueByColumnAndRow(5, $excel_row, "_______________________");
		//$object->getActiveSheet()->mergeCells('H'.$excel_row.':I'.$excel_row);
		$object->getActiveSheet()->setCellValueByColumnAndRow(16, $excel_row, "_________________________");
		//
		
		//
	    $object->getDefaultStyle()->getFont()->setName('Khmer OS Siemreap');
	    $object->getDefaultStyle()->getFont()->setSize('10px');
	    $object->getActiveSheet()->setCellValueByColumnAndRow(8, 1, "បុរីហ្គាឡាក់ស៊ី១១");
	    $object->getActiveSheet()->setCellValueByColumnAndRow(8, 2, "BOREY GALAXY 11");
	    $object->getActiveSheet()->setCellValueByColumnAndRow(8, 3, "តាមដានការបង់ប្រាក់របស់អតិថិជនប្រចាំខែ( ".$payMonth.")");
		
	    $object->getActiveSheet()->getProtection()->setSheet(true);
	    $object->getActiveSheet()->getProtection()->setSort(true);
	    $object->getActiveSheet()->getProtection()->setInsertRows(true);
	    $object->getActiveSheet()->getProtection()->setFormatCells(true);
	    
	    $object->getActiveSheet()->getProtection()->setPassword('password123');
	    
	    $object_writer = PHPExcel_IOFactory::createWriter($object, 'Excel5');
	    header('Content-Type: application/vnd.ms-excel');
	    header('Content-Disposition: attachment;filename="តាមដានការបង់ប្រាក់របស់អតិថិជនប្រចាំខែ( "'.$payMonth.'").xls"');
	    $object_writer->save('php://output');
	    
	    //$data["OUT_REC"] = $this->M_installment->selectAllPayment($dataSrch);
	    
	    //echo json_encode($data);
	}
	
	public function getContractInfo(){
		if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	   
	    $payMonth = $this->input->post('payMonth');
	    $startDate = null;
	    $endDate = null;
	    if($payMonth != null || $payMonth != ""){
	        $startDate =  date('Y-m-d',strtotime('01-'.$payMonth));
	        $endDate   = date('Y-m-t',strtotime('01-'.$payMonth));
	        
	    }
	    
	    $dataSrch = array(
	        'start_date'        => $startDate,
	        'end_date'        => $endDate,
	    );
	    $paymentSchedule = $this->M_installment->selectContractInfo($dataSrch);
	    $object = new PHPExcel();
	    $object->setActiveSheetIndex(0);
	    
		
		$gdImage = imagecreatefrompng(base_url('/upload/fix/galaxy11-logo.png'));
	    // Add a drawing to the worksheetecho date('H:i:s') . " Add a drawing to the worksheet\n";
	    $objDrawing = new PHPExcel_Worksheet_MemoryDrawing();
	    $objDrawing->setName('Sample image');
	    $objDrawing->setDescription('Sample image');
	    $objDrawing->setImageResource($gdImage);
	    $objDrawing->setRenderingFunction(PHPExcel_Worksheet_MemoryDrawing::RENDERING_PNG);
	    $objDrawing->setMimeType(PHPExcel_Worksheet_MemoryDrawing::MIMETYPE_DEFAULT);
	    $objDrawing->setHeight(30);
	    $objDrawing->setCoordinates('E1');
	    $objDrawing->setWorksheet($object->getActiveSheet());
		
	    /**
	     * get header
	     */
	    $table_columns = array("ល.រ","គម្រោង", "លេខផ្ទះ", "ឈ្មោះអតិថិជន",  " រយៈពេលសាងសង់ ","ថ្ងៃចាប់ផ្តើមកក់","ថ្ងៃចុះកិច្ចសន្យា","ថ្ងៃប្រគល់ផ្ទះ","ថែមជូន");
	    $column = 0;
	    
	    /**
	     * get header
	     */
	    foreach($table_columns as $field){
	        $object->getActiveSheet()->setCellValueByColumnAndRow($column, 5, $field);
	        $column++;
	        
	    }
	    
		$style_header = array(
		    'font' => array('bold' => true,'name'=>'Khmer OS Siemreap','size'=>'10px'),
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
                
            ),
		);
		$styleTitle = array(

            'font' => array('bold' => true,'name'=>'Khmer OS Siemreap','size'=>'10px'),
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,),
       
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
		
		$style_border_left = array(
            'borders' => array(
                'allborders' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN),
                'top' => array(
                    'style' => PHPExcel_Style_Border::BORDER_THIN)
            ),
            'alignment' => array(
	            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_LEFT,
	        ),
        );
		
		$styleBold = array(

            'font' => array('bold' => true,'name'=>'Khmer OS Siemreap',),
        );
		
		$styleBoldCenter = array(

            'font' => array('bold' => true,'name'=>'Khmer OS Siemreap',),
			'alignment' => array(
	            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
	        ),
        );
		$object->getActiveSheet()->getStyle('A5:I5')->applyFromArray($style_header);
	    
	    $excel_row = 6;
	    $noItem=1;
		$totalHousePrice=0;
		$totalBookPrice=0;
		$totalInstPrice=0;
		$totalInstPaidPrice=0;
		$totalOtherPayPrice=0;
		$totalHouse=0;
		$totalHouseSold=0;
		$totalHouseFree=0;
	    foreach($paymentSchedule as $row){
	        $totalHouse+=1;
	        if($row->pro_status == 'S'){
	            $totalHouseSold+=1;
	        }else{
	            $totalHouseFree+=1;
	        }
			//
			$object->getDefaultStyle()->getFont()->setName('Khmer OS Siemreap');
			$object->getDefaultStyle()->getFont()->setSize('10px');
			//
			
	        $colNum=0;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $noItem);
			$colNum++;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $row->bra_nm_kh);
	        $colNum++;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $row->pro_code);
	        $colNum++;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $row->cus_name);
	        $colNum++;
			$month_build="";
			if($row->sell_date_org != null && $row->sell_date_org != "" ){
				$month_build=$row->pro_sell_time_build." ខែ";
			}
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $month_build);
	        $colNum++;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $row->con_date);
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,$row->sell_date);
	        $colNum++;
			if($row->sell_date_org == null || $row->sell_date_org == "" ){
				$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,"");
			}else{
				$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,date('d-m-Y', strtotime("+".intval($row->pro_sell_time_build)." months", strtotime($row->sell_date_org))));
			}
	        $colNum++;
			$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row,rtrim($row->sell_des," "));
	        $colNum++;
			//
			$object->getActiveSheet()->getStyle('A'.$excel_row.':C'.$excel_row)->applyFromArray($style_border_center);
			$object->getActiveSheet()->getStyle('D'.$excel_row.':D'.$excel_row)->applyFromArray($style_border_left);
			$object->getActiveSheet()->getStyle('E'.$excel_row.':H'.$excel_row)->applyFromArray($style_border_center);
			$object->getActiveSheet()->getStyle('I'.$excel_row.':I'.$excel_row)->applyFromArray($style_border_left);
			//
	        $excel_row++;
	        $noItem++;
	        //
	    }
		

		//		
		$excel_row++;
		$colNum=2;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "សំគាល់");
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "ចំនួន");
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "ភាគរយ%");
		$object->getActiveSheet()->getStyle('C'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_center);
		$object->getActiveSheet()->getStyle('C'.$excel_row.':E'.$excel_row)->applyFromArray($styleBold);
		
		$excel_row++;
		$colNum=2;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "ផ្ទះលក់");
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $totalHouseSold);
		$colNum++;
		$houseSoldPer = ceil(($totalHouseSold*100) / $totalHouse);
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $houseSoldPer."%");
		$object->getActiveSheet()->getStyle('C'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_center);
		$object->getActiveSheet()->getStyle('C'.$excel_row.':C'.$excel_row)->applyFromArray($styleBold);
		
		$excel_row++;
		$colNum=2;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "ផ្ទះនៅសល់");
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $totalHouseFree);
		$colNum++;
		$houseFreePer = 100 - $houseSoldPer;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $houseFreePer."%");
		$object->getActiveSheet()->getStyle('C'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_center);
		$object->getActiveSheet()->getStyle('C'.$excel_row.':C'.$excel_row)->applyFromArray($styleBold);
		
		$excel_row++;
		$colNum=2;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "ផ្ទះសរុប");
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $totalHouse);
		$colNum++;
		$object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, "100%");
		$object->getActiveSheet()->getStyle('C'.$excel_row.':E'.$excel_row)->applyFromArray($style_border_center);
		$object->getActiveSheet()->getStyle('C'.$excel_row.':C'.$excel_row)->applyFromArray($styleBold);
		//
		//style
		
		$object->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
        $object->getActiveSheet()->getColumnDimension('F')->setWidth(17);
        $object->getActiveSheet()->getColumnDimension('G')->setWidth(17);
        $object->getActiveSheet()->getColumnDimension('H')->setWidth(17);
		$object->getActiveSheet()->getColumnDimension('I')->setWidth(90);
		
		
		//approve....
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$object->getActiveSheet()->getStyle('A'.$excel_row.':R'.$excel_row)->applyFromArray($styleBold);
		$object->getActiveSheet()->setCellValueByColumnAndRow(3, $excel_row, "Prepared By");
		$object->getActiveSheet()->setCellValueByColumnAndRow(5, $excel_row, "Checked By");
		//$object->getActiveSheet()->mergeCells('H'.$excel_row.':I'.$excel_row);
		$object->getActiveSheet()->setCellValueByColumnAndRow(8, $excel_row, "Acknowledge by");
		
		
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$excel_row=$excel_row+1;
		$object->getActiveSheet()->getStyle('A'.$excel_row.':I'.$excel_row)->applyFromArray($styleBold);
		$object->getActiveSheet()->setCellValueByColumnAndRow(3, $excel_row, "_______________________");
		$object->getActiveSheet()->setCellValueByColumnAndRow(5, $excel_row, "_______________________");
		//$object->getActiveSheet()->mergeCells('H'.$excel_row.':I'.$excel_row);
		$object->getActiveSheet()->setCellValueByColumnAndRow(8, $excel_row, "_________________________");
		//
		
		//
	    $object->getDefaultStyle()->getFont()->setName('Khmer OS Siemreap');
	    $object->getDefaultStyle()->getFont()->setSize('10px');
		$object->getActiveSheet()->getStyle('G1:G1')->applyFromArray($styleBoldCenter);
		$object->getActiveSheet()->getStyle('G2:G2')->applyFromArray($styleBoldCenter);
		$object->getActiveSheet()->getStyle('G3:G3')->applyFromArray($styleBoldCenter);
	    $object->getActiveSheet()->setCellValueByColumnAndRow(6, 1, "បុរីហ្គាឡាក់ស៊ី១១");
	    $object->getActiveSheet()->setCellValueByColumnAndRow(6, 2, "BOREY GALAXY 11");
	    $object->getActiveSheet()->setCellValueByColumnAndRow(6, 3, "របាយការណ៏ប្រគល់ផ្ទះទៅអតិថិជន");
		/*
	    $object->getActiveSheet()->getProtection()->setSheet(true);
	    $object->getActiveSheet()->getProtection()->setSort(true);
	    $object->getActiveSheet()->getProtection()->setInsertRows(true);
	    $object->getActiveSheet()->getProtection()->setFormatCells(true);
	    $object->getActiveSheet()->getProtection()->setPassword('password123');
	    */
	    $object_writer = PHPExcel_IOFactory::createWriter($object, 'Excel5');
	    header('Content-Type: application/vnd.ms-excel');
	    header('Content-Disposition: attachment;filename="តាមដានការបង់ប្រាក់របស់អតិថិជនប្រចាំខែ( "'.$payMonth.'").xls"');
	    $object_writer->save('php://output');
	}
	
	public function getSellPaymentInfo(){
		
	}
	public function savePayment(){
	    $max_id = (string)$this->input->post('txtInstNum');
	    $zero   = '';
	    for($i = strlen($max_id); $i <= 5; $i++){
	        $zero = '0'.$zero;
	    }
	    $inv_code = $zero.$max_id;
	    
	    $dataPay = array(
	        'inst_id'        	=> $this->input->post('instId'),
	        'inst_paid_date'  	=> date('Y-m-d H:i:s',strtotime($this->input->post('txtPayDate'))),
	        'inst_paid_des' 		=> $this->input->post('txtDesc'),
	        'rec_id'        => $this->input->post('cboReceiver'),
	        'inst_paid_status'        => $this->input->post('txtInstType'),
	        'met_id'        => $this->input->post('cboPaymentMet'),
	        'rec_id'        => $this->input->post('cboReceiver'),
	        'inst_total_paid_amount'        => $this->input->post('txtInstPayAmt'),
	        'inst_paid_penalty'        => $this->input->post('txtPenaltyAmt'),
	        'inst_paid_yn'        => "Y",
	        'inst_paid_inv_code'        =>$inv_code
	        
	    );
	    
	    //insert data
	    $dataPay['useYn']  = 'Y';
	    $dataPay['com_id'] = $_SESSION['comId'];
	    $dataPay['regUsr'] = $_SESSION['usrId'];
	    $dataPay['regDt']  = date('Y-m-d H:i:s');
	    
	    $id = $this->M_installment->insertPayment($dataPay);
	    
	    $data = array(
	        'inst_id'      => $this->input->post('instId'),
            'inst_paid_yn'     => "Y",
	        'com_id'    => $_SESSION['comId'],
	        'upDt'      => date('Y-m-d H:i:s'),
	        'upUsr'     => $_SESSION['usrId']
	    );
	    $this->M_installment->update($data);
	    echo $id;
	}
    public function getInstallment(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        $startDate = $this->input->post('txtSrchContSD');
        $endDate   = $this->input->post('txtSrchContED');
        
        if($startDate != null || $startDate != ""){
            $startDate = date('Y-m-d H:i:s',strtotime($startDate));
        }

        if($endDate != null || $endDate != ""){
            $endDate = date('Y-m-d H:i:s',strtotime($endDate));
        }
        

        $dataSrch = array(
            'limit'         => $this->input->post('perPage'),
            'offset'        => $this->input->post('offset'),
            'inst_id'        => $this->input->post('instId'),
            'sell_code'        => $this->input->post('txtSrchSellCode'),
            'inst_start_dt'  => $startDate,
            'inst_end_dt'    => $endDate,
        	'srch_all'		=> $this->input->post('srchAll'),
            'pro_code'		=> $this->input->post('txtSrchProCode')
        );

        $data["OUT_REC"] = $this->M_installment->selectInstallmentData($dataSrch);
        $data["OUT_REC_CNT"] = $this->M_installment->countInstallmentData($dataSrch);
        echo json_encode($data);
    }


    public function delete(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $delObj = $this->input->post('delObj');
        $cntDel = 0;
        for($i = 0; $i<sizeof($delObj); $i++){
            $data = array(
                    'con_id'    => $delObj[$i]['contId'],
                    'useYn'     => "N",
                    'com_id'    => $_SESSION['comId'],
                    'upDt'      => date('Y-m-d H:i:s'),
                    'upUsr'     => $_SESSION['usrId']
            );
            $this->M_contract->update($data);
            $cntDel += 1;
        }
        echo $cntDel;
    }

    
}

?>
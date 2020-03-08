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
	        $endDate   = date('Y-m-d',strtotime('31-'.$payMonth));
	        
	    }
	    
	    $dataSrch = array(
	        'start_date'        => $startDate,
	        'end_date'        => $endDate,
	    );
	    $data["OUT_REC"] = $this->M_installment->selectAllPayment($dataSrch);
	    $productData = $this->M_house->selectHouseExcel(null);
	    $object = new PHPExcel();
	    $object->setActiveSheetIndex(0);
	    $table_columns = array('ល.រ','លេខកូដ' ,);
	    
	    /**
	     * get header
	     */
	    foreach($table_columns as $field){
	        $object->getActiveSheet()->setCellValueByColumnAndRow($column, 5, $field);
	        $column++;
	        
	    }
	    $excel_row = 6;
	    $noItem=1;
	    foreach($productData as $row){
	        $colNum=0;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $noItem);
	        $colNum++;
	        $object->getActiveSheet()->setCellValueByColumnAndRow($colNum, $excel_row, $row->pro_code);
	        $colNum++;
	        
	        
	        //
	        $excel_row++;
	        $noItem++;
	        //
	    }
	    
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
	    $object->getDefaultStyle()->getFont()->setName('Khmer OS Siemreap');
	    $object->getDefaultStyle()->getFont()->setSize('10px');
	    $object->getActiveSheet()->setCellValueByColumnAndRow(5, 1, "បុរីហ្គាឡាក់ស៊ី១១");
	    $object->getActiveSheet()->setCellValueByColumnAndRow(5, 2, "Borey Galaxy11");
	    $object->getActiveSheet()->setCellValueByColumnAndRow(5, 3, "របាយការណ៍ការចំណាយ( ".$titleSearchDate.")");
	    
	    $object->getActiveSheet()->getProtection()->setSheet(true);
	    $object->getActiveSheet()->getProtection()->setSort(true);
	    $object->getActiveSheet()->getProtection()->setInsertRows(true);
	    $object->getActiveSheet()->getProtection()->setFormatCells(true);
	    
	    $object->getActiveSheet()->getProtection()->setPassword('password123');
	    
	    $object_writer = PHPExcel_IOFactory::createWriter($object, 'Excel5');
	    header('Content-Type: application/vnd.ms-excel');
	    header('Content-Disposition: attachment;filename="តាមដានការបង់ប្រាក់ប្រចាំខែរបស់អតិថិជន.xls"');
	    $object_writer->save('php://output');
	    
	    //$data["OUT_REC"] = $this->M_installment->selectAllPayment($dataSrch);
	    
	    //echo json_encode($data);
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
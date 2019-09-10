<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Bangkok");

class InstallmentPayment extends CI_Controller{
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
        
    }
    
    
    
    public function index(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $dataMenu['menu_active'] = "InstallmentPayment";
        $data['header'] = $this->load->view('v_header', $dataMenu, TRUE);
        $data['footer'] = $this->load->view('v_footer', NULL, TRUE);
        $data['iframe'] = $this->load->view('v_iframe', NULL, TRUE);
        
        $this->load->view('v_installment_payment',$data);
    }
	public function getPaymentMethod(){
		$data["OUT_REC"] = $this->M_common->selectPaymentMethod();
        echo json_encode($data);
	}
	public function getSellDetail(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	   
	    $dataSrch = array(
	        'sell_id'        => $this->input->post('sellId'),
	    );
	    
	    $data["OUT_REC"] = $this->M_sell->selectSellDataDetail($dataSrch);
	    echo json_encode($data);
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
	        'inst_paid_inv_code'        =>$inv_code,
	        'inst_paid_tran_id'        =>$this->input->post('txtTran')
	        
	    );
	    
	    //insert data
	    $dataPay['useYn']  = 'Y';
	    $dataPay['com_id'] = $_SESSION['comId'];
	    $dataPay['regUsr'] = $_SESSION['usrId'];
	    $dataPay['regDt']  = date('Y-m-d H:i:s');
	    
	    $id = $this->M_installment->insertPayment($dataPay);
	    $code_id = $id;
	    $max_id = (string)$code_id;
	    $zero   = '';
	    for($i = strlen($max_id); $i <= 5; $i++){
	        $zero = '0'.$zero;
	    }
	    $code_id = $zero.$max_id;
	    $dataUpdate = array(
	        'inst_paid_code' => $code_id,
	        'inst_paid_id' => $id,
	    );
	    $this->M_installment->updatePayment($dataUpdate);
	    
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
    
    public function getPayment(){
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
            'pro_code'		=> $this->input->post('txtSrchProCode'),
			'inst_paid_code'		=> $this->input->post('txtSrchInstPaidCode')
        );
        
        $data["OUT_REC"] = $this->M_installment->selectPaymentData($dataSrch);
        $data["OUT_REC_CNT"] = $this->M_installment->countPaymentData($dataSrch);
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
                    'inst_id'    => $delObj[$i]['instId'],
                    'inst_paid_yn'     => "N",
                    'com_id'    => $_SESSION['comId'],
                    'upDt'      => date('Y-m-d H:i:s'),
                    'upUsr'     => $_SESSION['usrId']
            );
            $dataPayment = array(
                'inst_paid_id'    => $delObj[$i]['instPaidId'],
                'useYn'     => "N",
                'com_id'    => $_SESSION['comId'],
                'upDt'      => date('Y-m-d H:i:s'),
                'upUsr'     => $_SESSION['usrId']
            );
            
            $this->M_installment->updatePayment($dataPayment);
            $this->M_installment->update($data);
            $cntDel += 1;
        }
        echo $cntDel;
    }

    
}

?>
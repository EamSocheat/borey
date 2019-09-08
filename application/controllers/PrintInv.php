<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PrintInv extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('M_login');
		$this->load->library('session');
		$this->load->model('M_check_user');
		$this->load->model('M_menu');
		$this->load->helper('form'); 
		$this->load->model('M_contract');
		$this->load->model('M_common');
		$this->load->model('M_sell');
		$this->load->model('M_installment');
	}
	public function index(){
	    
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    $dataPrint = $this->input->post('printData');
	    $this->load->view('popup/v_print_inv',$dataPrint);
	}
	
	public function printInvBooking(){
	    
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    $dataPrint["printData"] = $this->input->post('printData');
	    $data = $this->input->post('printData');
	    //print_r($dataPrint[0]["base_url"]);
	    //echo $dataPrint1 = $dataPrint[0]["base_url"];
	    $dataSrch = array(
	        'con_id'        => $data[0]["con_id"],
	    );
	    
	    $dataPrint["OUT_REC"] = $this->M_contract->selectContractDataDetail($dataSrch);
	    
	    return $this->load->view('popup/v_print_inv',$dataPrint);
	}
	
	public function printInvSelling(){
	    
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    $dataPrint["printData"] = $this->input->post('printData');
	    $data = $this->input->post('printData');
	    //print_r($dataPrint[0]["base_url"]);
	    //echo $dataPrint1 = $dataPrint[0]["base_url"];
	    $dataSrch = array(
	        'sell_id'        => $data[0]["sell_id"],
	        'sale_pay_id'        => $data[0]["pay_id"],
	    );
	    
	    $dataPrint["OUT_REC"] = $this->M_sell->selectSellDataDetail($dataSrch);
	    $dataPrint["AMT_BALANCE"] = $this->M_sell->selectSumBalancePay($dataSrch);
	    $dataPrint["TOTAL_PAY"] = $this->M_sell->selectSumTotalPay($dataSrch);
	    return $this->load->view('popup/v_print_inv_sell',$dataPrint);
	}
	
	
	public function printInvPaymentShedule(){
	    
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    $dataPrint["printData"] = $this->input->post('printData');
	    $data = $this->input->post('printData');
	    $dataSrch = array(
	        'sell_id'        => $data[0]["sell_id"]
	    );
	    
	    $dataPrint["OUT_REC"] = $this->M_installment->selectInstallmentDataPrint($dataSrch);
	    return $this->load->view('popup/v_print_payment_shedule',$dataPrint);
	}
	
	
	public function printInvPayment(){
	    
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    $dataPrint["printData"] = $this->input->post('printData');
	    $data = $this->input->post('printData');
	    $dataSrch = array(
	        'inst_paid_id'        => $data[0]["inst_paid_id"]
	    );
	    
	    $dataPrint["OUT_REC"] = $this->M_installment->selectPaymentDataPrint($dataSrch);
	    return $this->load->view('popup/v_print_inv_payment',$dataPrint);
	}
}   

<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Bangkok");

class OtherPayment extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model('M_login');
        $this->load->library('session');
        $this->load->model('M_check_user');
        $this->load->model('M_menu');
        $this->load->helper('form');
        $this->load->model('M_salary');
        $this->load->model('M_common');
        $this->load->model('M_installment');
        $this->load->model('M_other_payment');
    }

	public function index(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}
		$dataMenu['menu_active'] = "OtherPayment";
		$data['header'] = $this->load->view('v_header', $dataMenu, TRUE);
		$data['footer'] = $this->load->view('v_footer', NULL, TRUE);
		$data['iframe'] = $this->load->view('v_iframe', NULL, TRUE);

		$this->load->view('v_other_payment',$data);
	}

	public function getSalary(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}

		$dataSrch = array(
			'limit' 		=> $this->input->post('perPage'),
			'offset' 		=> $this->input->post('offset'),
			'sal_id' 		=> $this->input->post('salId'),
			'sta_id'		=> $this->input->post('staffId'),
			'sal_status'	=> $this->input->post('salStatus'),
			'sal_month'		=> $this->input->post('salMonth'),
			'sal_month_end'		=> $this->input->post('salMonthEnd')
		);
		$data["OUT_REC"] 	 = $this->M_salary->selectSalary($dataSrch);
		$data["OUT_REC_CNT"] = $this->M_salary->countSalary($dataSrch);
		echo json_encode($data);
	}

	public function saveOtherPayment(){ 
        $dataPay = array(
            'oth_pay_date'  	=> date('Y-m-d H:i:s',strtotime($this->input->post('txtPayDate'))),
            'oth_pay_des' 		=> $this->input->post('txtDesc'),
            'rec_id'        => $this->input->post('cboReceiver'),
            'met_id'        => $this->input->post('cboPaymentMet'),
            'rec_id'        => $this->input->post('cboReceiver'),
            'oth_pay_amt'        => $this->input->post('txtPayAmt'),
            'oth_pay_tran_id'        =>$this->input->post('txtTran'),
            'sell_id'        	=> $this->input->post('cboProCode')
            
        );
        
        //insert data
        $dataPay['useYn']  = 'Y';
        $dataPay['com_id'] = $_SESSION['comId'];
        $dataPay['regUsr'] = $_SESSION['usrId'];
        $dataPay['regDt']  = date('Y-m-d H:i:s');
        
        $id = $this->M_common->selectInvoiceNoOtherPayment();
        $code_id = $id[0]->set_conf_value;
        $data['set_conf_value'] = (intval($id[0]->set_conf_value) + 1);
        $this->M_common->updateInvoiceNoOtherPayment($data);
        
        $max_id = (string)$code_id;
        $zero   = '';
        for($i = strlen($max_id); $i <= 5; $i++){
            $zero = '0'.$zero;
        }
        $dataPay['oth_pay_inv_code']  = $zero.$max_id;
        $this->M_other_payment->insertOtherPayment($dataPay);
        $data =array();
        
        echo $id;
	}


	public function delete(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}

		$delObj = $this->input->post('delObj');
		$cntDel = 0;
		for($i=0; $i<sizeof($delObj); $i++){
			$data = array(
				'sal_id'	=> $delObj[$i]['salId'],
				'useYn'		=> "N",
				'com_id'	=> $_SESSION['comId'],
				'upDt'		=> date('Y-m-d H:i:s'),
				'upUsr'		=> $_SESSION['usrId']
			);
			$this->M_salary->update($data);
			$cntDel+=1;
		}
		echo $cntDel;
	}

}

?>

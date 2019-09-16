<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Bangkok");

class CommissionReport extends CI_Controller{
    public function __construct(){
        parent::__construct();
        //$this->load->model('M_login');
        $this->load->library('session');
        $this->load->model('M_check_user');
        $this->load->model('M_menu');
        $this->load->helper('form');
        $this->load->model('M_commission');
        $this->load->model('M_common');
        //$this->load->model('M_salary');
        $this->load->model('M_branch');
    }

	public function index(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}
		$dataMenu['menu_active'] = "CommissionReport";
		$data['header'] = $this->load->view('v_header', $dataMenu, TRUE);
		$data['footer'] = $this->load->view('v_footer', NULL, TRUE);
		$data['iframe'] = $this->load->view('v_iframe', NULL, TRUE);

		$this->load->view('v_commission',$data);
	}
	
	
	public function getCommissionData(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}

		$dataSrch = array(
			'limit' 		=> $this->input->post('perPage'),
			'offset' 		=> $this->input->post('offset'),
			'commi_id' 		=> $this->input->post('commId'),
			'sell_code'		=> $this->input->post('sellCode'),
			'seller_id'		=> $this->input->post('sellerId'),
			'txtSaleSDate' 	=> $this->reOrderDate($this->input->post('saleSDate')),
			'txtSaleEDate' 	=> $this->reOrderDate($this->input->post('saleEDate')),
			'txtApprSDate' 	=> $this->reOrderDate($this->input->post('apprSDate')),
			'txtApprEDate' 	=> $this->reOrderDate($this->input->post('apprEDate')),
			'commi_is_approve'	=> $this->input->post('cboStatus'),
		    'pro_code'		=> $this->input->post('proCode'),
		    'commi_type'		=> $this->input->post('commiType')
		);
		$data["OUT_REC"] 	 = $this->M_commission->selectCommissionData($dataSrch);
		$data["OUT_REC_CNT"] = $this->M_commission->countCommissionData($dataSrch);
		echo json_encode($data);
	}
	
	public function approveCommision(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    
	    $data = array(
	        'commi_id'	=> $this->input->post('commiId'),
	        'commi_approve_date'=> date('Y-m-d',strtotime($this->input->post('txtCommiApprDate'))),
	        'commi_approve_des'	=> $this->input->post('txtDes'),
	        'commi_is_approve'	=> str_replace(",","",$this->input->post('cboStatus')),
	        'commi_amt_approve'		=> str_replace(",","",$this->input->post('txtCommiPay')),
	        'com_id'		=> $_SESSION['comId']
	    );
	    
	    $data['upUsr']	= $_SESSION['usrId'];
	    $data['upDt']	= date('Y-m-d H:i:s');
	    $this->M_commission->update($data);
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
			$data = array(
				'commi_id'	=> $delObj[$i]['commiId'],
				'useYn'		=> "N",
				'com_id'	=> $_SESSION['comId'],
				'upDt'		=> date('Y-m-d H:i:s'),
				'upUsr'		=> $_SESSION['usrId']
			);
			$this->M_commission->update($data);
			$cntDel+=1;
		}
		echo $cntDel;
	}

	public function reOrderDate($input_date){
		$output_date = "";
		if($input_date != "" && $input_date != ""){
			$output_date = explode("-",$input_date)[2]."-".explode("-",$input_date)[1]."-".explode("-",$input_date)[0];
		}
		return $output_date;
	}
	
}

?>

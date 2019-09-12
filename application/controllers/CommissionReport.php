<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

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
			'commi_is_approve'	=> $this->input->post('cboStatus')
		);
		$data["OUT_REC"] 	 = $this->M_commission->selectCommissionData($dataSrch);
		$data["OUT_REC_CNT"] = $this->M_commission->countCommissionData($dataSrch);
		echo json_encode($data);
	}

	public function save(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}

		$salGetMonth = "";
		$staId		 = $this->input->post('txtStaffNm');
		$salMonth	 = "01-".$this->input->post('txtSalMonth');
		$salStatus   = $this->input->post('salStatus');
		if($salStatus == "P"){
			$salGetMonth = "";
		}else if($salStatus == "G"){
			$salGetMonth = date('Y-m-d H:i:s');
		}

		$data = array(
			'sal_start_dt'	=> date('Y-m-d',strtotime($this->input->post('txtSalSDate'))),
			'sal_end_dt'	=> date('Y-m-d',strtotime($this->input->post('txtSalEDate'))),
			'sal_month'		=> date('Y-m-d',strtotime($salMonth)),
			'sal_amt'		=> str_replace(",","",$this->input->post('txtSalAmt')),
			'sal_comm'		=> str_replace(",","",$this->input->post('txtSalcomm')),
			'sal_overtime'	=> str_replace(",","",$this->input->post('txtSalOT')),
			'sal_get_date'	=> $salGetMonth,
			'sta_id'		=> $staId,
			'sal_status'	=> $salStatus,
			'useYn'			=> "Y",
			'com_id'		=> $_SESSION['comId']
		);

		$dataSalMonth = array(
			'sal_month'	=> date('Y-m-d',strtotime($salMonth))
		);
		$dataCurrentMonth = $this->M_salary->countDataCurrentMonth($dataSalMonth);

		if(sizeof($dataCurrentMonth) > 0){
//			print_r("This is month already given.");
			echo 'DUPLICATE';
			return;
		}


		if($this->input->post('salId') != null && $this->input->post('salId') != ""){
			//update data
			$data['sal_id'] = $this->input->post('salId');
			$data['upUsr'] 	= $_SESSION['usrId'];
			$data['upDt']	= date('Y-m-d H:i:s');
			$this->M_salary->update($data);
		}else{
			//insert data
			$data['regUsr']	= $_SESSION['usrId'];
			$data['regDt']	= date('Y-m-d H:i:s');
			$this->M_salary->insert($data);
		}

		echo 'OK';
	}

	public function updateSalaryStatus(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}

		if($this->input->post('salId') != null && $this->input->post('salId') != ""){
			//update data
			$data['sal_status']	= $this->input->post('salStatus');
			$data['sal_id'] = $this->input->post('salId');
			$data['upUsr'] 	= $_SESSION['usrId'];
			$data['upDt']	= date('Y-m-d H:i:s');
			$this->M_salary->update($data);
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

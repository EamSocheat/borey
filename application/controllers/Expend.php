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
    
		$itemArr = explode(",",$this->input->post('itemArr'));
		
		$data = array(
			//'bra_id' 		=> $this->input->post('txtBraId'),
            //'pos_id' 		=> $this->input->post('txtPosId'), 
			'exp_total_price'		=> str_replace(",","",$this->input->post('txtTotalExp')),
			'exp_date'		=> date('Y-m-d',strtotime($this->input->post('txtExpendDate'))),
			//'exp_des'		=> $this->input->post('txtDesc'),
		    'exp_des'		=> $itemArr[0],
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

		echo 'OK'.$itemArr[0]->expDes.'A';
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

}

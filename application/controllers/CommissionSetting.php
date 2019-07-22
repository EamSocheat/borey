<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Bangkok");

class CommissionSetting extends CI_Controller {
	
	public function __construct(){
		parent::__construct();
		$this->load->model('M_company');
		$this->load->model('M_user');
		$this->load->model('M_staff');
		$this->load->model('M_position');
		$this->load->model('M_menu');
		$this->load->library('encrypt');
		$this->load->model('M_check_user');
		$this->load->model('M_commission_setting');
	}
	
	public function index(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    
	    $dataMenu['menu_active'] = "CommissionSetting";
	    $data['header'] = $this->load->view('v_header', $dataMenu, TRUE);
	    $data['footer'] = $this->load->view('v_footer', NULL, TRUE);
	    $data['iframe'] = $this->load->view('v_iframe', NULL, TRUE);
	    
	    $this->load->view('v_commission_setting',$data);
	  
	}
	
	public function getCommissionSetting(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
      	$dataSrch = array(
            'limit' 		=> $this->input->post('perPage'),
            'offset' 		=> $this->input->post('offset'),
            'pos_id' 		=> $this->input->post('posId'),
            'bra_id' 		=> $this->input->post('braId'),
      		'comset_id' 	=> $this->input->post('comsetId')
        );
      	
      	$data = null;
      	$data["OUT_REC"] = $this->M_commission_setting->selectCommissionSetting($dataSrch);
      	$data["OUT_REC_CNT"] = $this->M_commission_setting->countCommissionSetting($dataSrch);
	    
	    echo json_encode($data);
	}
	
	public function getCommissionSettingDetail(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    $dataSrch = array(
	        'limit' 		=> $this->input->post('perPage'),
	        'offset' 		=> $this->input->post('offset'),
	        'pos_id' 		=> $this->input->post('posId'),
	        'bra_id' 		=> $this->input->post('braId'),
	        'comset_id' 	=> $this->input->post('comsetId')
	    );
	    $data = null;
	    $data["OUT_REC"] = $this->M_commission_setting->selectCommissionSettingDetail($dataSrch);
	    
	    echo json_encode($data);
	}
	
	public function getUserAccountMenu(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
      	$dataSrch = array(
            'limit' 		=> $this->input->post('perPage'),
            'offset' 		=> $this->input->post('offset'),
            'sta_id' 		=> $this->input->post('staId'),
            'usr_nm' 		=> $this->input->post('usrNm'),
      		'usr_id' 		=> $this->input->post('usrId')
        );
	    $dataOut = $this->M_user->selectUserMenu($dataSrch);
	    foreach($dataOut as $key){
	    	$key->usr_pwd = $this->encrypt->decode($key->usr_pwd,"PWD_ENCR");
	    }
	    $data["OUT_REC"] = $dataOut;
	    echo json_encode($data);
	}
	
	public function save(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    
	    $catDataArr = $this->input->post('catData');
	    
	    $this->db->trans_begin();
	    $data = array(
	        'pos_id' 	=> $catDataArr[0]['cboPosition'] ,
	        'bra_id'	=> $catDataArr[0]['cboBranch'] ,
	        'regDt'		=> date('Y-m-d H:i:s'),
	        'comset_commi_yn'=> $catDataArr[0]['txtComiYn'],
	        'comset_salary_yn'=> $catDataArr[0]['txtSalaryYn'],
	        'useYn'		=> "Y",
	        'com_id'	=> $_SESSION['comId']
	    
	    );
	    
	    if($catDataArr[0]['commsetId'] != null && $catDataArr[0]['commsetId'] != ""){
	        //update data
	        $data['comset_id'] = $catDataArr[0]['commsetId'];
	        $data['upUsr'] = $_SESSION['usrId'];
	        $data['upDt'] = date('Y-m-d H:i:s');
	        $this->M_commission_setting->update($data);
	        $comSet_id = $catDataArr[0]['commsetId'];
	    }else{
	        //insert data
	        $data['regUsr'] = $_SESSION['usrId'];
	        $data['regDt'] = date('Y-m-d H:i:s');
	        $comSet_id=$this->M_commission_setting->insertCommissionSetting($data);    
	      
	    }
	    $this->M_commission_setting->removeCommissionSettingDetail($comSet_id,$_SESSION['comId']);
	   
	    for($i=0; $i<sizeof($catDataArr); $i++){
	        $catData = array(
	            'comset_id'    => $comSet_id,
	            'cat_id'    => $catDataArr[$i]['catId'],
	            'comset_type'    => $catDataArr[$i]['commType'],
	            'comset_amt'    => $catDataArr[$i]['commAmt'],
	            'comset_type_ex'    => $catDataArr[$i]['commTypeEx'],
	            'comset_amt_ex'    => $catDataArr[$i]['commAmtEx'],
	            'useYn'		=> "Y",
	            'com_id'	=> $_SESSION['comId'],
	            'regUsr'	=> $_SESSION['usrId'],
	            'regDt'		=> date('Y-m-d H:i:s')
	        
	        );
	        $this->M_commission_setting->insertCommissionSettingDetail($catData);
	    }
	    
	    
	    if ($this->db->trans_status() === FALSE){
	        $this->db->trans_rollback();
	        echo 'ERR';
	    }else{
	        $this->db->trans_commit();
	        echo 'OK';
	    } 
	    
	}
	
	public function checkSetting(){
	    $setting = $this->M_commission_setting->checkSetting($this->input->post('posId'),$this->input->post('braId'));
	    if(sizeof($setting) > 0){
	        echo 'ERROR';
	    }else{
	        echo 'OK';
	    }
	}
	
	public function delete(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    
	    $delObj = $this->input->post('delObj');
	    $cntDel=0;
	    for($i=0; $i<sizeof($delObj); $i++){
	      
            $data = array(
                'comset_id'    => $delObj[$i]['comsetId'],
                'useYn'		=> "N",
                'com_id'	=> $_SESSION['comId'],
                'upDt'		=> date('Y-m-d H:i:s'),
                'upUsr'		=> $_SESSION['usrId']
            );
            $this->M_commission_setting->update($data);
            $this->M_commission_setting->updateDetail($data);
            $cntDel+=1;
	        
	    }
	    //
	    echo $cntDel;
	}
	
}
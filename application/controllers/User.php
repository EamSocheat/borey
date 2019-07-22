<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Bangkok");

class User extends CI_Controller {
	
	public function __construct(){
		parent::__construct();
		$this->load->model('M_company');
		$this->load->model('M_user');
		$this->load->model('M_staff');
		$this->load->model('M_position');
		$this->load->model('M_menu');
		$this->load->library('encrypt');
		$this->load->model('M_check_user');
	}
	
	public function index(){
	    $this->load->view('v_register');
	    
	}
	
	public function getUserAccount(){
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
	    $data["OUT_REC"] = $this->M_user->selectUser($dataSrch);
	    $data["OUT_REC_CNT"] = $this->M_user->countUser($dataSrch);
	    
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
	    
	    $this->db->trans_begin();
	    $data = array(
	        'usr_nm' 	=> $this->input->post('txtUserNm'),
	        'usr_pwd'	=> $this->encrypt->encode($this->input->post('txtPwd'),"PWD_ENCR"),
	        'regDt'		=> date('Y-m-d H:i:s'),
	        'usr_wri_yn'=> $this->input->post('txtAddYn'),
	        'usr_edit_yn'=> $this->input->post('txtEditYn'),
	        'useYn'		=> "Y",
	        'usr_str'	=> "Y",
	        'com_id'	=> $_SESSION['comId'],
	        'sta_id'	=> $this->input->post('cboStaff')
	    );
	    
	    if($this->input->post('userAccId') != null && $this->input->post('userAccId') != ""){
	        //update data
	        $data['usr_id'] = $this->input->post('userAccId');
	        $data['upUsr'] = $_SESSION['usrId'];
	        $data['upDt'] = date('Y-m-d H:i:s');
	        $this->M_user->update($this->input->post('userAccId'),$data);
	        $usr_id = $this->input->post('userAccId');
	    }else{
	        //insert data
	        $data['regUsr'] = $_SESSION['usrId'];
	        $data['regDt'] = date('Y-m-d H:i:s');
	        $usr_id=$this->M_user->insert($data);    
	      
	    }
	    $this->M_menu->removeMenuUser($usr_id);
	    $this->M_menu->insertMenuUserByMenuId($this->input->post('menuArr'),$usr_id);
	    
	    if ($this->db->trans_status() === FALSE){
	        $this->db->trans_rollback();
	        echo 'ERR';
	    }else{
	        $this->db->trans_commit();
	        echo 'OK';
	    } 
	    
	}
	
	public function checkUserName(){
	    $user = $this->M_user->checkUserName($this->input->post('userNm'));
	    if(sizeof($user) > 0){
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
                'usr_id'    => $delObj[$i]['usrId'],
                'useYn'		=> "N",
                'com_id'	=> $_SESSION['comId'],
                'upDt'		=> date('Y-m-d H:i:s'),
                'upUsr'		=> $_SESSION['usrId']
            );
            
            $dataMenu = array(
                'usr_id'    => $delObj[$i]['usrId'],
                'useYn'		=> "N",
                'upDt'		=> date('Y-m-d H:i:s')
            );
            
            $this->M_user->update($delObj[$i]['usrId'],$data);
            $this->M_menu->update($dataMenu);
            $cntDel+=1;
	        
	    }
	    //
	    echo $cntDel;
	}
	
}
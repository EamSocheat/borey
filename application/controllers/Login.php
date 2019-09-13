<?php
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Bangkok");

class Login extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('M_login');
		$this->load->library('session');
		$this->load->helper('form'); 
		$this->load->library('encrypt');
	}
	
	public function index()
	{	
		$this->session->sess_destroy();
		
		$this->load->view('/v_login');
		
	}
	
	
	//
	
	
	public function checkLogin(){
		
		$usrNm=$this->input->post('usrNm');
		$usrPwd=$this->input->post('usrPwd');
		
		
		$login = $this->M_login->checkUser($usrNm,$usrPwd);
		$str=false;
		if($login != null){
		    foreach($login as $r){
		        if($this->encrypt->decode($r->usr_pwd,"PWD_ENCR") == $usrPwd){
		            $comNm= $r->com_nm;
		            $usrNm=$r->usr_nm;
		            $comId = $r->com_id;
		            $usrId = $r->usr_id;
		            $staffPos= $r->pos_nm_kh;
		            $staffPhone= $r->sta_phone1;
		            $staffPhoto= $r->sta_photo;
		            $staffNm=$r->sta_nm;
		            $addYn=$r->usr_wri_yn;
		            $editYn=$r->usr_edit_yn;
		            
		            $this->setSession($usrNm,$comId,$comNm,$usrId,$staffPos,$staffPhone,$staffPhoto,$staffNm,$editYn,$addYn);
		            $str=true;
		            break;
		        }
		        
		        
		        $data = array(
		            'usrId' 	=> $usrId,
		            'comId' 	=> $comId,
		            'logDate' 	=> date('Y-m-d H:i:s'),
		        );
		        
		        $this->M_login->insertUserLogin($data);
		        
		    }
		}
    	
		if($str){
		    echo "OK";	
		}else{
		    echo "ERROR";
		}
	}
	
	public function logout(){
		
		$this->clearSession();

	}
	
	
	public function getEmail(){
	    $usrNm=$this->input->post('usrNm');
	    $emailArr= $this->M_login->getEmail($usrNm);
	   
	    if(sizeof( $emailArr) > 0){
	        $email = "";
	        foreach($emailArr as $r){
	            $email = $r->usrEmail;
	            break;
	        }
	        
	        if($email !="" && $email != null){
	            $emailObj = explode("@",$email);
	            $email = $emailObj[0];
	            $tmp="";
	            for($i=0; $i < strlen($email)-2; $i++ ){
	                $tmp.="*";
	            }
	            $email=  substr($email,0,2).$tmp.'@'.$emailObj[1];
	            echo $email;
	        }else{
	            echo "ERR";
	        }
	        
	    }else{
	        echo "ERR";
	    }
	   
	}
	
	
	
	public function sendEmail(){
	    $usrNm=$this->input->post('usrNm');
	    $emailChk= $this->M_login->getPwd($usrNm);
	    echo $emailChk;
	}
	
	
	function setSession($userNm,$comId,$comNm,$usrId,$staffPos,$staffPhone,$staffPhoto,$staffNm,$editYn,$addYn){
    	
    	$newsession = array(
    			'usrNm'  => $userNm,
    			'comId'  => $comId,
    			'comNm'  => $comNm,
    			'usrId'  => $usrId,
    			'staffPos' => $staffPos,
				'staffPhone' => $staffPhone,
    			'staffPhoto' => $staffPhoto,
				'staffNm' => $staffNm,
    	        'editYn' => $editYn,
    	        'addYn' => $addYn
    	);
    	
    	$this->session->set_userdata($newsession);
    	while(!isset($_SESSION['usrId'])){
			$this->session->set_userdata($newsession);
		}
    }
    function clearSession(){
    	$this->session->sess_destroy();
    	
    }
	
	
}

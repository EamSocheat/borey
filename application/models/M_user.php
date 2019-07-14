<?php
	class M_user extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	$this->load->library('session');
        	//session_start();
        	$this->load->library('encrypt');
    	}
        
    	function selectUserName($usrIdNm, $usrId){
    	    $this->db->select('usr_nm');
    	    $this->db->from('tbl_user as usr');
    	    $this->db->where('usr.useYn', 'Y');
    	    $this->db->where('usr.usr_nm', $usrIdNm);
    	    if($usrId !="" && $usrId != null){
    	        $this->db->where('usr.usrId <> '.$usrId);
    	    }
    	   
    	    $result = $this->db->get()->result();
    	    return $result;
    	}
    	
    	function checkUserName($usrNm){
    	    $this->db->select('usr_nm');
    	    $this->db->from('tbl_user as usr');
    	    $this->db->where('usr.useYn', 'Y');
    	    $this->db->where('usr.usr_nm', $usrNm);
    	    
    	    $result = $this->db->get()->result();
    	    return $result;
    	}
    	
    	function select($usrId,$usrPos){
  
        	$this->db->select('*,tblcompany.comNm,(SELECT usrNm from tbluser as usr1 where usr1.usrId=usr.regUsr AND usr1.comId=usr.comId ) AS regNm');
        	$this->db->from('tbluser AS usr');
        	$this->db->join('tblcompany', 'usr.comId = tblcompany.comId');
        	$this->db->order_by("usr.usrId", "desc");
        	$this->db->where('usr.comId', $_SESSION['comId']);
        	$this->db->where('usr.useYn', 'Y');

        	$resultRtn;
        	if(isset($usrId)){
        		$this->db->where('usrId',$usrId);
        		
        		$result = $this->db->get()->result();
        		
        		$resultObj = new ArrayObject();
        		$resultArr = Array();
        		foreach($result as $item) {
        			$resultObj['comNm'] 	= $item->comNm;
        			$resultObj['usrId'] 	= $item->usrId;
        			$resultObj['usrNm'] 	= $item->usrNm;
        			$resultObj['usrPwd'] 	= $this->encrypt->decode($item->usrPwd,"PWD_ENCR");
        			$resultObj['usrPhone'] 	= $item->usrPhone;
        			$resultObj['usrAddr'] 	= $item->usrAddr;
        			$resultObj['usrEmail'] 	= $item->usrEmail;
        			$resultObj['usrDOB'] 	= $item->usrDob;
        			$resultObj['usrPos'] 	= $item->usrPos;
        			$resultObj['usrStr'] 	= $item->usrStr;
        			$resultObj['usrIdNm'] 	= $item->usrIdNm;
        			$resultObj['regUsr'] 	= $item->regUsr;
        			
        			$resultArr[] = $resultObj;
        		} 
        		return $resultArr;
        	}else{
        		$this->db->where_not_in('usrId', $_SESSION['usrId']);
        		//
        		if(isset($usrPos)){
        			$this->db->where('usr.usrPos', $usrPos);
        		}
        		
        		//agency's seller data
        		//if($_SESSION['usrPos'] != "Admin"){
        		    $this->db->where('usr.regUsr', $_SESSION['usrId']);
        		//}
        		
        		$result = $this->db->get()->result();
        		return $result;
        	}
        	
        	
   
		}
		
		
		function selectUser($usrId,$usrPos){
			
			$this->db->select('*,tblcompany.comNm,(SELECT usrNm from tbluser as usr1 where usr1.usrId=usr.regUsr AND usr1.comId=usr.comId ) AS regNm');
			$this->db->from('tbluser AS usr');
			$this->db->join('tblcompany', 'usr.comId = tblcompany.comId');
			$this->db->order_by("usr.usrId", "desc");
			$this->db->where('usr.comId', $_SESSION['comId']);
			$this->db->where('usr.useYn', 'Y');
			
			$resultRtn;
			if(isset($usrId)){
				$this->db->where('usrId',$usrId);
				
				$result = $this->db->get()->result();
				
				$resultObj = new ArrayObject();
				$resultArr = Array();
				foreach($result as $item) {
					$resultObj['comNm'] 	= $item->comNm;
					$resultObj['usrId'] 	= $item->usrId;
					$resultObj['usrNm'] 	= $item->usrNm;
					$resultObj['usrPwd'] 	= $this->encrypt->decode($item->usrPwd,"PWD_ENCR");
					$resultObj['usrPhone'] 	= $item->usrPhone;
					$resultObj['usrAddr'] 	= $item->usrAddr;
					$resultObj['usrEmail'] 	= $item->usrEmail;
					$resultObj['usrDOB'] 	= $item->usrDob;
					$resultObj['usrPos'] 	= $item->usrPos;
					$resultObj['usrStr'] 	= $item->usrStr;
					
					$resultArr[] = $resultObj;
				}
				return $resultArr;
			}else{
				//$this->db->where_not_in('usrId', $_SESSION['usrId']);
				//
				if(isset($usrPos)){
					$this->db->where('usr.usrPos', $usrPos);
				}
				
				if($_SESSION['usrPos'] !="Admin"){
					$this->db->where('usr.usrId', $_SESSION['usrId']);
				}
				
				$result = $this->db->get()->result();
				return $result;
			}
			
		}

		function selectCompany(){
		    $this->db->select('*');
		    $this->db->from('tblcompany');
		    $this->db->where('comId', $_SESSION['comId']);
		
		    $result = $this->db->get()->result();
		    return $result;
		}
		
		
		public function update($id,$data){
			$this->db->where('usr_id', $id);
			$this->db->where('com_id', $_SESSION['comId']);
			$this->db->update('tbl_user', $data);
		}
		
		public function insert($data){
			$this->db->insert('tbl_user',$data);
			return $this->db->insert_id();
		}
		
		
		public function selectCount(){
			$this->db->select('count(usrId) AS usrSell');
			$this->db->from('tbluser AS usr');
			$this->db->where('usr.comId', $_SESSION['comId']);
			$this->db->where('usr.useYn', 'Y');
			$this->db->where('usr.usrPos', "Sale");
			$this->db->where('usr.usrStr', "Y");
			
			$result = $this->db->get()->result();
			return $result;
		}
		public function updateCompany($data){
		   
		    $this->db->where('comId', $_SESSION['comId']);
		    $this->db->update('tblcompany', $data);
		}

    }
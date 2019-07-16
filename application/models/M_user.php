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
	
    	function selectUser($dataSrch){
  
        	$this->db->select('*');
        	//$this->db->from('tbl_staff');
        	$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_staff.bra_id');
        	$this->db->join('tbl_position','tbl_position.pos_id = tbl_staff.pos_id');
        	$this->db->where('tbl_staff.com_id', $_SESSION['comId']);
        	$this->db->where('tbl_staff.useYn', 'Y');
        	$this->db->where('tbl_user.useYn', 'Y');
        	//---
        	if($dataSrch['sta_id'] != null && $dataSrch['sta_id'] != ""){
        	    $this->db->where('tbl_staff.sta_id', $dataSrch['sta_id']);
        	}
        	
        	//
        	if($dataSrch['sta_nm'] != null && $dataSrch['sta_nm'] != ""){
        	    $this->db->like('tbl_staff.sta_nm', $dataSrch['sta_nm']);
        	}
        	
        	//
        	if($dataSrch['sta_nm_kh'] != null && $dataSrch['sta_nm_kh'] != ""){
        	    $this->db->like('tbl_staff.sta_nm_kh', $dataSrch['sta_nm_kh']);
        	}
        	
        	//
        	if($dataSrch['sta_phone'] != null && $dataSrch['sta_phone'] != ""){
        	    $this->db->like('tbl_staff.sta_nm_kh', $dataSrch['sta_phone']);
        	}
        	
        	//
        	if($dataSrch['sta_phone'] != null && $dataSrch['sta_phone'] != ""){
        	    $this->db->like('tbl_staff.sta_nm_kh', $dataSrch['sta_phone']);
        	}
        	
        	//
        	if($dataSrch['pos_id'] != null && $dataSrch['pos_id'] != ""){
        	    $this->db->where('tbl_staff.pos_id', $dataSrch['pos_id']);
        	}
        	
        	//
        	if($dataSrch['bra_id'] != null && $dataSrch['bra_id'] != ""){
        	    $this->db->where('tbl_staff.bra_id', $dataSrch['bra_id']);
        	}
        	
        	
        	$this->db->order_by("usr_id", "desc");
        	return $this->db->get('tbl_user',$dataSrch['limit'],$dataSrch['offset'])->result();
		}
		
		function countStaff($dataSrch){
  
        	$this->db->select('count(sta_id) as total_rec');
        	$this->db->from('tbl_staff');
        	$this->db->join('tbl_branch','tbl_branch.bra_id = tbl_staff.bra_id');
        	$this->db->where('tbl_staff.com_id', $_SESSION['comId']);
        	$this->db->where('tbl_staff.useYn', 'Y');
        	//---
        	if($dataSrch['sta_id'] != null && $dataSrch['sta_id'] != ""){
        	    $this->db->where('tbl_staff.sta_id', $dataSrch['sta_id']);
        	}
        	
        	//
        	if($dataSrch['sta_nm'] != null && $dataSrch['sta_nm'] != ""){
        	    $this->db->like('tbl_staff.sta_nm', $dataSrch['sta_nm']);
        	}
        	
        	//
        	if($dataSrch['sta_nm_kh'] != null && $dataSrch['sta_nm_kh'] != ""){
        	    $this->db->like('tbl_staff.sta_nm_kh', $dataSrch['sta_nm_kh']);
        	}
        	
        	//
        	if($dataSrch['sta_phone'] != null && $dataSrch['sta_phone'] != ""){
        	    $this->db->like('tbl_staff.sta_nm_kh', $dataSrch['sta_phone']);
        	}
        	
        	//
        	if($dataSrch['sta_phone'] != null && $dataSrch['sta_phone'] != ""){
        	    $this->db->like('tbl_staff.sta_nm_kh', $dataSrch['sta_phone']);
        	}
        	
        	//
        	if($dataSrch['pos_id'] != null && $dataSrch['pos_id'] != ""){
        	    $this->db->where('tbl_staff.pos_id', $dataSrch['pos_id']);
        	}
        	
        	//
        	if($dataSrch['bra_id'] != null && $dataSrch['bra_id'] != ""){
        	    $this->db->where('tbl_staff.bra_id', $dataSrch['bra_id']);
        	}
        	        	
        	
        	$this->db->order_by("sta_id", "desc");
        	return $this->db->get()->result();
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
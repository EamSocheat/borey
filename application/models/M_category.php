<?php
	class M_category extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	
    	}
		
    	function selectCategoryData($dataSrch){
    	    $this->db->select('cat_id, cat_nm, cat_nm_kh, cat_photo, cat_des, regDt, upDt, useYn, com_id');
    	    //$this->db->from('tbl_category');
    	    $this->db->where('com_id', $_SESSION['comId']);
    	    $this->db->where('useYn', 'Y');
    	    
    	    if($dataSrch['cat_id'] != null && $dataSrch['cat_id'] != ""){
    	        $this->db->where('tbl_category.cat_id', $dataSrch['cat_id']);
    	    }
    	    
    	    if($dataSrch['cat_nm'] != null && $dataSrch['cat_nm'] != ""){
    	        $this->db->like('tbl_category.cat_nm', $dataSrch['cat_nm']);
    	    }
    	    
    	    if($dataSrch['cat_nm_kh'] != null && $dataSrch['cat_nm_kh'] != ""){
    	        $this->db->like('tbl_category.cat_nm_kh', $dataSrch['cat_nm_kh']);
    	    }
    	    
    	    $this->db->order_by("com_id", "cat_nm");
    	    return $this->db->get('tbl_category',$dataSrch['limit'],$dataSrch['offset'])->result();
    	}
    	
    	public function countCategoryData($dataSrch){
    	    $this->db->select('count(cat_des) as total_rec');
    	    $this->db->from('tbl_category');
    	    $this->db->where('com_id', $_SESSION['comId']);
    	    $this->db->where('useYn', 'Y');
    	    
    	    if($dataSrch['cat_nm'] != null && $dataSrch['cat_nm'] != ""){
    	        $this->db->like('tbl_category.cat_nm', $dataSrch['cat_nm']);
    	    }
    	    
    	    if($dataSrch['cat_nm_kh'] != null && $dataSrch['cat_nm_kh'] != ""){
    	        $this->db->like('tbl_category.cat_nm_kh', $dataSrch['cat_nm_kh']);
    	    }
    	    
    	    return $this->db->get()->result();
    	}
    	
    	public function updateCategoryDB($data){
    	    $this->db->where('cat_id', $data['cat_id']);
    	    $this->db->update('tbl_category', $data);
    	}
    	
    	public function insertCategoryDB($data){
    	    $this->db->insert('tbl_category',$data);
    	    return $this->db->insert_id();
    	}
		
    }
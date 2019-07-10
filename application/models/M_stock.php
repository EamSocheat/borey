<?php
	class M_stock extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	
    	}

    	function selectStock($dataSrch){
  
        	$this->db->select('*');
        	//$this->db->from('tbl_stock');
        	$this->db->where('tbl_stock.com_id', $_SESSION['comId']);
        	$this->db->where('tbl_stock.useYn', 'Y');
        	//---
        	if($dataSrch['sto_id'] != null && $dataSrch['sto_id'] != ""){
        	    $this->db->where('tbl_stock.sto_id', $dataSrch['sto_id']);
        	}
        	
        	//
        	if($dataSrch['sto_nm'] != null && $dataSrch['sto_nm'] != ""){
        	    $this->db->like('tbl_stock.sto_nm', $dataSrch['sto_nm']);
        	}
        	
        	//
        	if($dataSrch['sto_nm_kh'] != null && $dataSrch['sto_nm_kh'] != ""){
        	    $this->db->like('tbl_stock.sto_nm_kh', $dataSrch['sto_nm_kh']);
        	}        	
        	
        	//
        	if($dataSrch['bra_id'] != null && $dataSrch['bra_id'] != ""){
        	    $this->db->where('tbl_stock.bra_id', $dataSrch['bra_id']);
        	}
        	
        	
        	$this->db->order_by("sto_id", "desc");
        	return $this->db->get('tbl_stock',$dataSrch['limit'],$dataSrch['offset'])->result();
		}
		
		function countStock($dataSrch){
        	$this->db->select('count(sto_id) as total_rec');
        	$this->db->from('tbl_stock');
        	$this->db->where('tbl_stock.com_id', $_SESSION['comId']);
        	$this->db->where('tbl_stock.useYn', 'Y');
        	//---
        	if($dataSrch['sto_id'] != null && $dataSrch['sto_id'] != ""){
        	    $this->db->where('tbl_stock.sto_id', $dataSrch['sto_id']);
        	}
        	
        	//
        	if($dataSrch['sto_nm'] != null && $dataSrch['sto_nm'] != ""){
        	    $this->db->like('tbl_stock.sto_nm', $dataSrch['sto_nm']);
        	}
        	
        	//
        	if($dataSrch['sto_nm_kh'] != null && $dataSrch['sto_nm_kh'] != ""){
        	    $this->db->like('tbl_stock.sto_nm_kh', $dataSrch['sto_nm_kh']);
        	}        	
        	
        	//
        	if($dataSrch['bra_id'] != null && $dataSrch['bra_id'] != ""){
        	    $this->db->where('tbl_stock.bra_id', $dataSrch['bra_id']);
        	}
        	return $this->db->get()->result();
		}

		public function update($data){
			$this->db->where('com_id', $_SESSION['comId']);
			$this->db->where('sto_id', $data['sto_id']);
			$this->db->update('tbl_stock', $data);
		}
		
		public function insert($data){
			$this->db->insert('tbl_stock',$data);
			return $this->db->insert_id();
		}
    }
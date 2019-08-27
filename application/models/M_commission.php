<?php
	class M_commission extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	
    	}
    	
        public function update($data){
            $this->db->where('com_id', $_SESSION['comId']);
            $this->db->where('con_id', $data['commi_id']);
            $this->db->update('tbl_commission', $data);
        }
        
        public function insert($data){
            $this->db->insert('tbl_commission',$data);
            return $this->db->insert_id();
        }
	
    }
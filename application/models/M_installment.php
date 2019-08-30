<?php
	class M_installment extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	
    	}
    	
		public function selectInstallmentDetail($dataSrch){
            $this->db->select('tbl_installment.*,tbl_installment_payment.*');
        	$this->db->from('tbl_installment');
        	$this->db->join('tbl_installment_payment','tbl_installment_payment.inst_id = tbl_installment.inst_id and tbl_installment_payment.useYn="Y"','left');
        	$this->db->where('tbl_installment.com_id', $_SESSION['comId']);
        	$this->db->where('tbl_installment.useYn', 'Y');
        	//$this->db->where('tbl_installment_payment.useYn', 'Y');
        	if($dataSrch['inst_id'] != null && $dataSrch['inst_id'] != ""){
        	    $this->db->where('tbl_installment.inst_id', $dataSrch['inst_id']);
        	}
			if($dataSrch['sell_id'] != null && $dataSrch['sell_id'] != ""){
        	    $this->db->where('tbl_installment.sell_id', $dataSrch['sell_id']);
        	}
        	$this->db->order_by("inst_num", "asc");
        	return $this->db->get()->result();
        }
    	
        public function selectId(){
            $this->db->select_max('tbl_contract.con_id', 'con_id');
            $this->db->from('tbl_contract');
            $this->db->where('com_id', $_SESSION['comId']);
            return $this->db->get()->result();
        }

        public function update($data){
            $this->db->where('com_id', $_SESSION['comId']);
            $this->db->where('inst_id', $data['inst_id']);
            $this->db->update('tbl_installment', $data);
        }
        
        public function insert($data){
            $this->db->insert('tbl_installment',$data);
            return $this->db->insert_id();
        }
        
		public function insertDetial($data){
            $this->db->insert('tbl_contract_detail',$data);
            return $this->db->insert_id();
        }
    }
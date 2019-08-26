<?php
	class M_sale_payment extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	
    	}
    	
		public function selectPaymentCode($data){
            $this->db->select('tbl_sale_payment.sale_pay_code');
            //$this->db->from('tbl_sale_payment');
            $this->db->where('com_id', $_SESSION['comId']);
            $this->db->where('sell_id', $data['sell_id']);
            $this->db->order_by("tbl_sale_payment.sale_pay_id", "desc");
            return $this->db->get('tbl_sale_payment',1,null)->result();
        }
    	
        public function selectId(){
            $this->db->select_max('tbl_contract.con_id', 'con_id');
            $this->db->from('tbl_contract');
            $this->db->where('com_id', $_SESSION['comId']);
            return $this->db->get()->result();
        }

        public function update($data){
            $this->db->where('com_id', $_SESSION['comId']);
            $this->db->where('con_id', $data['con_id']);
            $this->db->update('tbl_contract', $data);
        }
        
        public function insert($data){
            $this->db->insert('tbl_sale_payment',$data);
            return $this->db->insert_id();
        }
        
		public function insertDetial($data){
            $this->db->insert('tbl_contract_detail',$data);
            return $this->db->insert_id();
        }
    }
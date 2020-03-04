<?php
	class M_other_payment extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	
    	}
		
    	function selectOtherPaymentData($dataSrch){
    	    $this->db->select('*,(select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=1 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh,
                                    (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=2 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh2,
                                    (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=3 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh3');
    	    //$this->db->from('tbl_category');
    	     $this->db->join('tbl_sell','tbl_sell.sell_id = tbl_other_payment.sell_id ');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
    	    $this->db->join('tbl_staff','tbl_staff.sta_id = tbl_other_payment.rec_id');
            $this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_installment_payment.met_id');
            
    	    $this->db->where('com_id', $_SESSION['comId']);
    	    $this->db->where('useYn', 'Y');
    	    
    	    if($dataSrch['oth_pay_id'] != null && $dataSrch['oth_pay_id'] != ""){
    	        $this->db->where('tbl_other_payment.oth_pay_id', $dataSrch['oth_pay_id']);
    	    }
    	    

			if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
				$this->db->group_start();
				$this->db->like('tbl_category.cat_nm', $dataSrch['srch_all']);
				$this->db->or_like('tbl_category.cat_nm_kh', $dataSrch['srch_all']);
				$this->db->group_end();
			}
    	    
    	    $this->db->order_by("com_id", "cat_nm");
    	    return $this->db->get('tbl_other_payment',$dataSrch['limit'],$dataSrch['offset'])->result();
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

			if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
				$this->db->group_start();
				$this->db->like('tbl_category.cat_nm', $dataSrch['srch_all']);
				$this->db->or_like('tbl_category.cat_nm_kh', $dataSrch['srch_all']);
				$this->db->group_end();
			}
    	    
    	    return $this->db->get()->result();
    	}
    	
	 	public function insertOtherPayment($data){
            $this->db->insert('tbl_other_payment',$data);
            return $this->db->insert_id();
        }
		
    }

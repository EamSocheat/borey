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
            $this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_other_payment.met_id');
            
    	    $this->db->where('tbl_other_payment.com_id', $_SESSION['comId']);
    	    $this->db->where('tbl_other_payment.useYn', 'Y');
    	    //$this->db->where('tbl_sell.useYn', 'Y');
    	    
    	    if($dataSrch['oth_pay_id'] != null && $dataSrch['oth_pay_id'] != ""){
    	        $this->db->where('tbl_other_payment.oth_pay_id', $dataSrch['oth_pay_id']);
    	    }
    	    
    		if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
    	    	$this->db->where('tbl_sell.sell_id',$dataSrch['pro_code']);
    	    }
    	    
    		if(($dataSrch['pay_date'] != null && $dataSrch['pay_date'] != "")
                && ($dataSrch['pay_date_end'] != null && $dataSrch['pay_date_end'] != "")){
                    $this->db->where('tbl_other_payment.oth_pay_date >=', date('Y-m-d', strtotime($dataSrch['pay_date'])));
                    $this->db->where('tbl_other_payment.oth_pay_date <=', date('Y-m-d', strtotime($dataSrch['pay_date_end'])));
            }else{
                if($dataSrch['pay_date'] != null && $dataSrch['pay_date'] != ""){
                    $this->db->where('tbl_other_payment.oth_pay_date >=', date('Y-m-d', strtotime($dataSrch['pay_date'])));
                }
                if($dataSrch['pay_date_end'] != null && $dataSrch['pay_date_end'] != ""){
                    $this->db->where('tbl_other_payment.oth_pay_date <=', date('Y-m-d', strtotime($dataSrch['pay_date_end'])));
                }
            }
    	    
    	    $this->db->order_by("oth_pay_date","desc");
    	    return $this->db->get('tbl_other_payment',$dataSrch['limit'],$dataSrch['offset'])->result();
    	}
    	
    	public function countOtherPaymentData($dataSrch){
    	    $this->db->select('count(oth_pay_id) as total_rec');
    	    $this->db->from('tbl_other_payment');
    	    $this->db->join('tbl_sell','tbl_sell.sell_id = tbl_other_payment.sell_id ');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
    	    $this->db->join('tbl_staff','tbl_staff.sta_id = tbl_other_payment.rec_id');
            $this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_other_payment.met_id');
    	    $this->db->where('tbl_other_payment.com_id', $_SESSION['comId']);
    	    $this->db->where('tbl_other_payment.useYn', 'Y');
    	    //$this->db->where('tbl_sell.useYn', 'Y');
    	    
    		if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
    	    	$this->db->where('tbl_sell.sell_id',$dataSrch['pro_code']);
    	    }
    	    
    		if(($dataSrch['pay_date'] != null && $dataSrch['pay_date'] != "")
                && ($dataSrch['pay_date_end'] != null && $dataSrch['pay_date_end'] != "")){
                    $this->db->where('tbl_other_payment.oth_pay_date >=', date('Y-m-d', strtotime($dataSrch['pay_date'])));
                    $this->db->where('tbl_other_payment.oth_pay_date <=', date('Y-m-d', strtotime($dataSrch['pay_date_end'])));
            }else{
                if($dataSrch['pay_date'] != null && $dataSrch['pay_date'] != ""){
                    $this->db->where('tbl_other_payment.oth_pay_date >=', date('Y-m-d', strtotime($dataSrch['pay_date'])));
                }
                if($dataSrch['pay_date_end'] != null && $dataSrch['pay_date_end'] != ""){
                    $this->db->where('tbl_other_payment.oth_pay_date <=', date('Y-m-d', strtotime($dataSrch['pay_date_end'])));
                }
            }
    	    
    	    return $this->db->get()->result();
    	}
    	
	 	public function insertOtherPayment($data){
            $this->db->insert('tbl_other_payment',$data);
            return $this->db->insert_id();
        }
		
		public function selectOtherPaymentNum($sell_id){
			$this->db->select('oth_pay_num,sell_id');
    	    $this->db->where('tbl_other_payment.useYn', 'Y');
    	    $this->db->where('tbl_other_payment.sell_id', $sell_id);
    	    $this->db->order_by("oth_pay_id","desc");
    	    return $this->db->get('tbl_other_payment',1,null)->result();
        }
        
        function selectOtherPaymentDataPrint($dataSrch){
            $this->db->select('*');
            $this->db->from('tbl_other_payment');
            $this->db->join('tbl_sell','tbl_sell.sell_id = tbl_other_payment.sell_id ');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
            $this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell_customer.cus_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_staff','tbl_staff.sta_id = tbl_other_payment.rec_id');
            $this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_other_payment.met_id');
            $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
            $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
            
            $this->db->where('tbl_other_payment.com_id', $_SESSION['comId']);
            $this->db->where('tbl_other_payment.useYn', 'Y');
            //$this->db->where('tbl_sell.useYn', 'Y');
            
            if($dataSrch['oth_pay_id'] != null && $dataSrch['oth_pay_id'] != ""){
                $this->db->where('tbl_other_payment.oth_pay_id', $dataSrch['oth_pay_id']);
            }
            
            return $this->db->get()->result();
        }
        
        public function update($data){
            $this->db->where('com_id', $_SESSION['comId']);
            $this->db->where('oth_pay_id', $data['oth_pay_id']);
            $this->db->update('tbl_other_payment', $data);
        }
    }

<?php
	class M_sell extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	
    	}
    	function selectContractType(){
    		$this->db->select('*');
    		$this->db->from('tbl_contract_type');
    		return $this->db->get()->result();
    	}
    	
    	function selectSumBalancePay($dataSrch){
    	    $this->db->select('sum(tbl_sale_payment.sale_pay_amt_cash) as total_balance_pay,"" as no_no');
    	    $this->db->from('tbl_sale_payment');
    	    $this->db->where('tbl_sale_payment.sell_id', $dataSrch['sell_id']);
    	    $this->db->where('tbl_sale_payment.com_id', $_SESSION['comId']);
    	    $this->db->where('tbl_sale_payment.useYn', 'Y');
    	    return $this->db->get()->result();
    	}
    	
    	function selectSumTotalPay($dataSrch){
    	    $this->db->select('sum(tbl_sale_payment.sale_pay_real_amount) as total_real_pay,"" as no_no');
    	    $this->db->from('tbl_sale_payment');
    	    $this->db->where('tbl_sale_payment.sell_id', $dataSrch['sell_id']);
    	    $this->db->where('tbl_sale_payment.com_id', $_SESSION['comId']);
    	    $this->db->where('tbl_sale_payment.useYn', 'Y');
    	    return $this->db->get()->result();
    	}
    	
    	function selectSumAdvPayPer($dataSrch){
    	    $this->db->select('sum(tbl_installment.inst_pay_per) as total_adv,sum(tbl_installment.inst_amt_pay) as total_adv_amt');
    	    $this->db->from('tbl_installment');
    	    $this->db->where('tbl_installment.sell_id', $dataSrch['sell_id']);
    	    $this->db->where('tbl_installment.inst_type', "ADV");
    	    
    	    $this->db->where('tbl_installment.com_id', $_SESSION['comId']);
    	    return $this->db->get()->result();
    	}
    	
    	function selectSellDataDetail($dataSrch){
    	    //$this->db->select('*,conType.con_type_nm_kh as con_type_nm_kh,tbl_sell.con_type_id as sell_con_type_id,seller.sta_id as sell_seller_id,seller.sta_nm_kh as seller_nm,reciev.sta_nm_kh as reciver');
    	    $this->db->select('*,conType.con_type_nm_kh as con_type_nm_kh,tbl_sell.con_type_id as sell_con_type_id,tbl_sell.seller_id as sell_seller_id');
    	
    	    $this->db->from('tbl_sell');
    	    //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
    	    $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
    	    $this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell_customer.cus_id');
    	    $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id');
    	    $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
    	    $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
    	    $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
    	    $this->db->join('tbl_contract','tbl_contract.con_id = tbl_sell.con_id', 'left');
    	    //$this->db->join('tbl_sale_payment','tbl_sale_payment.sell_id = tbl_sell.sell_id');
    	    //$this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_sale_payment.sale_pay_met_id');
    	    $this->db->join('tbl_staff seller','seller.sta_id = tbl_sell.seller_id');
    	    //$this->db->join('tbl_staff reciev','reciev.sta_id = tbl_sale_payment.rec_id');
    	    $this->db->join('tbl_contract_type conType','conType.con_type_id = tbl_sell.con_type_id');
    	    
    	    $this->db->where('tbl_sell.com_id', $_SESSION['comId']);
    	    $this->db->where('tbl_sell.useYn', 'Y');
    	 
    	    
    	    if($dataSrch['sell_id'] != null && $dataSrch['sell_id'] != ""){
    	        $this->db->where('tbl_sell.sell_id', $dataSrch['sell_id']);
    	    }
    	    
    	    if($dataSrch['sale_pay_id'] != null && $dataSrch['sale_pay_id'] != ""){
    	        $this->db->where('tbl_sale_payment.sale_pay_id', $dataSrch['sale_pay_id']);
    	    }
    	    //$this->db->order_by("tbl_sale_payment.sale_pay_id", "desc");
    	   
    	    return $this->db->get()->result();
    	}
        
    	function selectSellData($dataSrch){
    	    $this->db->select('*,(select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=1 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh,
                                    (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=2 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh2,
                                    (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=3 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh3');
            //$this->db->from('tbl_contract');
            //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
    	    //$this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
    	    //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell_customer.cus_id');
            $this->db->join('tbl_staff seller','seller.sta_id = tbl_sell.seller_id');
            //$this->db->join('tbl_staff reciev','reciev.sta_id = tbl_contract.seller_id');
            //$this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_sell.con_pay_met');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
            $this->db->where('tbl_sell.com_id', $_SESSION['comId']);
            $this->db->where('tbl_sell.useYn', 'Y');

            if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
                $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
            }
            
            if($dataSrch['sell_code'] != null && $dataSrch['sell_code'] != ""){
                $this->db->like('tbl_sell.sell_code', $dataSrch['sell_code']);
            }

    	 	if(($dataSrch['sell_start_dt'] != null && $dataSrch['sell_start_dt'] != "") 
                && ($dataSrch['sell_end_dt'] != null && $dataSrch['sell_end_dt'] != "")){
                $this->db->where('tbl_sell.sell_date >=', date('Y-m-d', strtotime($dataSrch['sell_start_dt'])));
                $this->db->where('tbl_sell.sell_date <=', date('Y-m-d', strtotime($dataSrch['sell_end_dt'])));
            }else{
                if($dataSrch['sell_start_dt'] != null && $dataSrch['sell_start_dt'] != ""){
                    $this->db->where('tbl_sell.sell_date >=', date('Y-m-d', strtotime($dataSrch['sell_start_dt'])));
                }
                if($dataSrch['sell_end_dt'] != null && $dataSrch['sell_end_dt'] != ""){
                    $this->db->where('tbl_sell.sell_date <=', date('Y-m-d', strtotime($dataSrch['sell_end_dt'])));
                }
            }
       
            
            if($dataSrch['srch_seller'] != null && $dataSrch['srch_seller'] != ""){
                $this->db->where('tbl_sell.seller_id', $dataSrch['srch_seller']);
                
            }
            
            if($dataSrch['srch_customer'] != null && $dataSrch['srch_customer'] != ""){
                //$this->db->like('tbl_customer.cus_nm', $dataSrch['srch_customer']);
                $this->db->or_like('tbl_customer.cus_nm_kh', $dataSrch['srch_customer']);
                $this->db->or_like('tbl_customer.cus_phone1', $dataSrch['srch_customer']);
                $this->db->or_like('tbl_customer.cus_phone2', $dataSrch['srch_customer']);
            }
            
            if($dataSrch['srch_customer'] != null && $dataSrch['srch_customer'] != ""){
                //$this->db->like('tbl_customer.cus_nm', $dataSrch['srch_customer']);
                $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
                $this->db->join('tbl_customer cust','cust.cus_id = tbl_sell_customer.cus_id');
                
                $this->db->like('cust.cus_nm_kh', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone1', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone2', $dataSrch['srch_customer']);
                $this->db->or_like('cust.con_no', $dataSrch['srch_all']);
                
                $this->db->group_by('tbl_sell.sell_id');
            }
            
            //$this->db->group_by('tbl_sell.sell_id');
            $this->db->order_by("tbl_sell.sell_id", "desc");
            return $this->db->get('tbl_sell',$dataSrch['limit'],$dataSrch['offset'])->result();
    	}

    	public function countSellData($dataSrch){
    		
		    $this->db->select('count(tbl_sell.sell_id) as total_rec');
		    $this->db->from('tbl_sell');
		    //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
		    //$this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
		    //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell_customer.cus_id');
		    $this->db->join('tbl_staff seller','seller.sta_id = tbl_sell.seller_id');
		    //$this->db->join('tbl_staff reciev','reciev.sta_id = tbl_contract.seller_id');
		    //$this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_sell.con_pay_met');
		    $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id');
		    $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
		    $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
		    $this->db->where('tbl_sell.com_id', $_SESSION['comId']);
		    $this->db->where('tbl_sell.useYn', 'Y');
		    
		    if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
		        $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
		    }
		    
		    if($dataSrch['sell_code'] != null && $dataSrch['sell_code'] != ""){
		        $this->db->like('tbl_sell.sell_code', $dataSrch['sell_code']);
		    }
		    
		    if(($dataSrch['sell_start_dt'] != null && $dataSrch['sell_start_dt'] != "")
		        && ($dataSrch['sell_end_dt'] != null && $dataSrch['sell_end_dt'] != "")){
		            $this->db->where('tbl_sell.sell_date >=', date('Y-m-d', strtotime($dataSrch['sell_start_dt'])));
		            $this->db->where('tbl_sell.sell_date <=', date('Y-m-d', strtotime($dataSrch['sell_end_dt'])));
		    }else{
		        if($dataSrch['sell_start_dt'] != null && $dataSrch['sell_start_dt'] != ""){
		            $this->db->where('tbl_sell.sell_date >=', date('Y-m-d', strtotime($dataSrch['sell_start_dt'])));
		        }
		        if($dataSrch['sell_end_dt'] != null && $dataSrch['sell_end_dt'] != ""){
		            $this->db->where('tbl_sell.sell_date <=', date('Y-m-d', strtotime($dataSrch['sell_end_dt'])));
		        }
		    }
		    
		    
		    if($dataSrch['srch_seller'] != null && $dataSrch['srch_seller'] != ""){
		        $this->db->where('tbl_sell.seller_id', $dataSrch['srch_seller']);
		        
		    }
		    
		    if($dataSrch['srch_customer'] != null && $dataSrch['srch_customer'] != ""){
		        //$this->db->like('tbl_customer.cus_nm', $dataSrch['srch_customer']);
		        $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
		        $this->db->join('tbl_customer cust','cust.cus_id = tbl_sell_customer.cus_id');
		        
		        $this->db->like('cust.cus_nm_kh', $dataSrch['srch_customer']);
		        $this->db->or_like('cust.cus_phone1', $dataSrch['srch_customer']);
		        $this->db->or_like('cust.cus_phone2', $dataSrch['srch_customer']);
		        $this->db->or_like('cust.con_no', $dataSrch['srch_all']);
		        
		        $this->db->group_by('tbl_sell.sell_id');
		    }
		    
		    if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
		        $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
		        $this->db->join('tbl_customer cust','cust.cus_id = tbl_sell_customer.cus_id');
		        
		        $this->db->like('cust.cus_nm_kh', $dataSrch['srch_customer']);
		        $this->db->or_like('cust.cus_phone1', $dataSrch['srch_customer']);
		        $this->db->or_like('cust.cus_phone2', $dataSrch['srch_customer']);
		        $this->db->or_like('cust.con_no', $dataSrch['srch_all']);
		        
		        $this->db->group_by('tbl_sell.sell_id');
		    }
		    //$this->db->group_by('tbl_sell.sell_id');
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
            $this->db->where('sell_id', $data['sell_id']);
            $this->db->update('tbl_sell', $data);
        }
        
        public function insert($data){
            $this->db->insert('tbl_sell',$data);
            return $this->db->insert_id();
        }
        
		public function insertDetial($data){
            $this->db->insert('tbl_sell_detail',$data);
            return $this->db->insert_id();
        }
        
        public function insertConCust($data){
            $this->db->insert('tbl_sell_customer',$data);
            return $this->db->insert_id();
        }
        
        
    }
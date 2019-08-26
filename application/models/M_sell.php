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
    	
    	function selectSellDataDetail($dataSrch){
    	    $this->db->select('*,tbl_sell.con_type_id as sell_con_type_id,seller.sta_id as sell_seller_id,seller.sta_nm_kh as seller_nm,reciev.sta_nm_kh as reciver');
    	    $this->db->from('tbl_sell');
    	    $this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
    	    $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id');
    	    $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
    	    $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
    	    $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
    	    $this->db->join('tbl_contract','tbl_contract.con_id = tbl_sell.con_id', 'left');
    	    $this->db->join('tbl_sale_payment','tbl_sale_payment.sell_id = tbl_sell.sell_id');
    	    $this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_sale_payment.sale_pay_met_id');
    	    $this->db->join('tbl_staff seller','seller.sta_id = tbl_sell.seller_id');
    	    $this->db->join('tbl_staff reciev','reciev.sta_id = tbl_sale_payment.rec_id');
    	    
    	    $this->db->where('tbl_sell.com_id', $_SESSION['comId']);
    	    $this->db->where('tbl_sell.useYn', 'Y');
    	 
    	    
    	    if($dataSrch['sell_id'] != null && $dataSrch['sell_id'] != ""){
    	        $this->db->where('tbl_sell.sell_id', $dataSrch['sell_id']);
    	    }
    	    $this->db->order_by("tbl_sale_payment.sale_pay_id", "desc");
    	    return $this->db->get()->result();
    	}
        
    	function selectSellData($dataSrch){
    	    $this->db->select('*');
            //$this->db->from('tbl_contract');
            $this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
            $this->db->join('tbl_staff seller','seller.sta_id = tbl_sell.seller_id');
            //$this->db->join('tbl_staff reciev','reciev.sta_id = tbl_contract.seller_id');
            //$this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_sell.con_pay_met');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
            $this->db->where('tbl_sell.com_id', $_SESSION['comId']);
            $this->db->where('tbl_sell.useYn', 'Y');

            if($dataSrch['srch_status'] != null && $dataSrch['srch_status'] != ""){
                $this->db->where('tbl_contract.con_sta = ', $dataSrch['srch_status']);
            }
            
            if($dataSrch['conIdArr'] != null && $dataSrch['conIdArr'] != ""){
                $integerIDs = array_map('intval', explode(',', $dataSrch['conIdArr']));
                $this->db->where_in('tbl_contract.con_id', $integerIDs);
            }

            if($dataSrch['con_id'] != null && $dataSrch['con_id'] != ""){
                $this->db->where('tbl_contract.con_id', $dataSrch['con_id']);
            }
            
            if($dataSrch['con_no'] != null && $dataSrch['con_no'] != ""){
                $this->db->like('tbl_contract.con_code', $dataSrch['con_no']);
            }

    	 	if(($dataSrch['con_start_dt'] != null && $dataSrch['con_start_dt'] != "") 
                && ($dataSrch['con_end_dt'] != null && $dataSrch['con_end_dt'] != "")){
                $this->db->where('tbl_contract.con_date >=', date('Y-m-d', strtotime($dataSrch['con_start_dt'])));
                $this->db->where('tbl_contract.con_date <=', date('Y-m-d', strtotime($dataSrch['con_end_dt'])));
            }else{
                if($dataSrch['con_start_dt'] != null && $dataSrch['con_start_dt'] != ""){
                    $this->db->where('tbl_contract.con_date >=', date('Y-m-d', strtotime($dataSrch['con_start_dt'])));
                }
                if($dataSrch['con_end_dt'] != null && $dataSrch['con_end_dt'] != ""){
                    $this->db->where('tbl_contract.con_date <=', date('Y-m-d', strtotime($dataSrch['con_end_dt'])));
                }
            }
            
            if(($dataSrch['con_start_dt_exp'] != null && $dataSrch['con_start_dt_exp'] != "")
                && ($dataSrch['con_end_dt_exp'] != null && $dataSrch['con_end_dt_exp'] != "")){
                    $this->db->where('tbl_contract.con_date_exp >=', date('Y-m-d', strtotime($dataSrch['con_start_dt_exp'])));
                    $this->db->where('tbl_contract.con_date_exp <=', date('Y-m-d', strtotime($dataSrch['con_end_dt_exp'])));
            }else{
                if($dataSrch['con_start_dt_exp'] != null && $dataSrch['con_start_dt_exp'] != ""){
                    $this->db->where('tbl_contract.con_date_exp >=', date('Y-m-d', strtotime($dataSrch['con_start_dt_exp'])));
                }
                if($dataSrch['con_end_dt_exp'] != null && $dataSrch['con_end_dt_exp'] != ""){
                    $this->db->where('tbl_contract.con_date_exp <=', date('Y-m-d', strtotime($dataSrch['con_end_dt_exp'])));
                }
            }
            
            if($dataSrch['srch_seller'] != null && $dataSrch['srch_seller'] != ""){
                $this->db->where('tbl_contract.seller_id', $dataSrch['srch_seller']);
                
            }
            
            if($dataSrch['srch_customer'] != null && $dataSrch['srch_customer'] != ""){
                $this->db->like('tbl_customer.cus_nm', $dataSrch['srch_customer']);
                $this->db->or_like('tbl_customer.cus_nm_kh', $dataSrch['srch_customer']);
                $this->db->or_like('tbl_customer.cus_phone1', $dataSrch['srch_customer']);
                $this->db->or_like('tbl_customer.cus_phone2', $dataSrch['srch_customer']);
            }
            
    	  	if($dataSrch['filter_status'] != null && $dataSrch['filter_status'] != ""){
    	  	    $this->db->where('tbl_contract.con_sta', $dataSrch['filter_status']);
                
            }
            
    	
            
    		if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
                $this->db->like('tbl_customer.cus_nm', $dataSrch['srch_all']);
                $this->db->or_like('tbl_customer.cus_nm_kh', $dataSrch['srch_all']);
                $this->db->or_like('tbl_contract.con_no', $dataSrch['srch_all']);
                $this->db->or_like('tbl_customer.cus_phone1', $dataSrch['srch_all']);
            }
            
            //$this->db->group_by('tbl_contract.con_id');
            $this->db->order_by("tbl_sell.sell_id", "desc");
            return $this->db->get('tbl_sell',$dataSrch['limit'],$dataSrch['offset'])->result();
    	}

    	public function countSellData($dataSrch){
    		
		    $this->db->select('count(tbl_sell.sell_id) as total_rec');
		    $this->db->from('tbl_sell');
		    $this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
		    $this->db->join('tbl_staff seller','seller.sta_id = tbl_sell.seller_id');
		    //$this->db->join('tbl_staff reciev','reciev.sta_id = tbl_contract.seller_id');
		    //$this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_sell.con_pay_met');
		    $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id');
		    $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
		    $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
		    $this->db->where('tbl_sell.com_id', $_SESSION['comId']);
		    $this->db->where('tbl_sell.useYn', 'Y');
		    
		    
		    if($dataSrch['srch_status'] != null && $dataSrch['srch_status'] != ""){
		        $this->db->where('tbl_contract.con_sta = ', $dataSrch['srch_status']);
		    }
		    
		    if($dataSrch['conIdArr'] != null && $dataSrch['conIdArr'] != ""){
		        $integerIDs = array_map('intval', explode(',', $dataSrch['conIdArr']));
		        $this->db->where_in('tbl_contract.con_id', $integerIDs);
		    }
		    
		    if($dataSrch['con_id'] != null && $dataSrch['con_id'] != ""){
		        $this->db->where('tbl_contract.con_id', $dataSrch['con_id']);
		    }
		    
		    if($dataSrch['con_no'] != null && $dataSrch['con_no'] != ""){
		        $this->db->like('tbl_contract.con_code', $dataSrch['con_no']);
		    }
		    
		    if(($dataSrch['con_start_dt'] != null && $dataSrch['con_start_dt'] != "")
		        && ($dataSrch['con_end_dt'] != null && $dataSrch['con_end_dt'] != "")){
		            $this->db->where('tbl_contract.con_date >=', date('Y-m-d', strtotime($dataSrch['con_start_dt'])));
		            $this->db->where('tbl_contract.con_date <=', date('Y-m-d', strtotime($dataSrch['con_end_dt'])));
		    }else{
		        if($dataSrch['con_start_dt'] != null && $dataSrch['con_start_dt'] != ""){
		            $this->db->where('tbl_contract.con_date >=', date('Y-m-d', strtotime($dataSrch['con_start_dt'])));
		        }
		        if($dataSrch['con_end_dt'] != null && $dataSrch['con_end_dt'] != ""){
		            $this->db->where('tbl_contract.con_date <=', date('Y-m-d', strtotime($dataSrch['con_end_dt'])));
		        }
		    }
		    
		    if(($dataSrch['con_start_dt_exp'] != null && $dataSrch['con_start_dt_exp'] != "")
		        && ($dataSrch['con_end_dt_exp'] != null && $dataSrch['con_end_dt_exp'] != "")){
		            $this->db->where('tbl_contract.con_date_exp >=', date('Y-m-d', strtotime($dataSrch['con_start_dt_exp'])));
		            $this->db->where('tbl_contract.con_date_exp <=', date('Y-m-d', strtotime($dataSrch['con_end_dt_exp'])));
		    }else{
		        if($dataSrch['con_start_dt_exp'] != null && $dataSrch['con_start_dt_exp'] != ""){
		            $this->db->where('tbl_contract.con_date_exp >=', date('Y-m-d', strtotime($dataSrch['con_start_dt_exp'])));
		        }
		        if($dataSrch['con_end_dt_exp'] != null && $dataSrch['con_end_dt_exp'] != ""){
		            $this->db->where('tbl_contract.con_date_exp <=', date('Y-m-d', strtotime($dataSrch['con_end_dt_exp'])));
		        }
		    }
		    
		    if($dataSrch['srch_seller'] != null && $dataSrch['srch_seller'] != ""){
		        $this->db->where('tbl_contract.seller_id', $dataSrch['srch_seller']);
		        
		    }
		    
		    if($dataSrch['srch_customer'] != null && $dataSrch['srch_customer'] != ""){
		        $this->db->like('tbl_customer.cus_nm', $dataSrch['srch_customer']);
		        $this->db->or_like('tbl_customer.cus_nm_kh', $dataSrch['srch_customer']);
		        $this->db->or_like('tbl_customer.cus_phone1', $dataSrch['srch_customer']);
		        $this->db->or_like('tbl_customer.cus_phone2', $dataSrch['srch_customer']);
		    }
		    
		    if($dataSrch['filter_status'] != null && $dataSrch['filter_status'] != ""){
		        $this->db->where('tbl_contract.con_sta', $dataSrch['filter_status']);
		        
		    }
		    
		    
		    
		    if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
		        $this->db->like('tbl_customer.cus_nm', $dataSrch['srch_all']);
		        $this->db->or_like('tbl_customer.cus_nm_kh', $dataSrch['srch_all']);
		        $this->db->or_like('tbl_contract.con_no', $dataSrch['srch_all']);
		        $this->db->or_like('tbl_customer.cus_phone1', $dataSrch['srch_all']);
		    }
            
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
    }
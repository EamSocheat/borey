<?php
	class M_contract extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	
    	}
    	function selectContractType(){
    		$this->db->select('*');
    		$this->db->from('tbl_contract_type');
    		return $this->db->get()->result();
    	}
    	
    	function selectContractDataDetail($dataSrch){
    	    $this->db->select('*,seller.sta_nm_kh as seller_nm');
    	    $this->db->from('tbl_contract');
    	    $this->db->join('tbl_contract_customer','tbl_contract_customer.con_id = tbl_contract.con_id');
    	    $this->db->join('tbl_customer','tbl_customer.cus_id = tbl_contract_customer.cus_id');
    	    $this->db->join('tbl_staff seller','seller.sta_id = tbl_contract.seller_id');
    	    //$this->db->join('tbl_staff reciev','reciev.sta_id = tbl_contract.seller_id');
    	    $this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_contract.con_pay_met');
    	    $this->db->join('tbl_contract_detail','tbl_contract_detail.con_id = tbl_contract.con_id');
    	    $this->db->join('tbl_contract_type','tbl_contract_type.con_type_id = tbl_contract.con_type_id');
    	    $this->db->join('tbl_product','tbl_product.pro_id = tbl_contract_detail.pro_id');
    	    $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
    	    $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
    	    $this->db->where('tbl_contract.com_id', $_SESSION['comId']);
    	    $this->db->where('tbl_contract.useYn', 'Y');
    	    
    	 
    	    
    	    if($dataSrch['con_id'] != null && $dataSrch['con_id'] != ""){
    	        $this->db->where('tbl_contract.con_id', $dataSrch['con_id']);
    	    }
    	    
    	    if($dataSrch['con_sta'] != null && $dataSrch['con_sta'] != ""){
    	        $this->db->where('tbl_contract.con_sta', $dataSrch['con_sta']);
    	    }
    	    if($dataSrch['con_code'] != null && $dataSrch['con_code'] != ""){
    	        $this->db->where('tbl_contract.con_code', $dataSrch['con_code']);
    	    }
    	    
    		if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
    	        $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
    	    }
    	    
    	    return $this->db->get()->result();
    	}
        
    	function selectContractData($dataSrch){
    	    $this->db->select('*,(select tbl_customer.cus_nm_kh from tbl_contract_customer inner join tbl_customer on tbl_customer.cus_id = tbl_contract_customer.cus_id  where con_cus_order=1 and tbl_contract_customer.con_id=tbl_contract.con_id ) as cus_nm_kh,
                                    (select tbl_customer.cus_nm_kh from tbl_contract_customer inner join tbl_customer on tbl_customer.cus_id = tbl_contract_customer.cus_id  where con_cus_order=2 and tbl_contract_customer.con_id=tbl_contract.con_id ) as cus_nm_kh2,
                                    (select tbl_customer.cus_nm_kh from tbl_contract_customer inner join tbl_customer on tbl_customer.cus_id = tbl_contract_customer.cus_id  where con_cus_order=3 and tbl_contract_customer.con_id=tbl_contract.con_id ) as cus_nm_kh3');
            //$this->db->from('tbl_contract');
            //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_contract.cus_id');
    	    //$this->db->join('tbl_contract_customer','tbl_contract_customer.con_id = tbl_contract.con_id');
    	    //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_contract_customer.cus_id');
            $this->db->join('tbl_staff seller','seller.sta_id = tbl_contract.seller_id');
            //$this->db->join('tbl_staff reciev','reciev.sta_id = tbl_contract.seller_id');
            $this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_contract.con_pay_met');
            $this->db->join('tbl_contract_detail','tbl_contract_detail.con_id = tbl_contract.con_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_contract_detail.pro_id');
            $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
            $this->db->where('tbl_contract.com_id', $_SESSION['comId']);
            $this->db->where('tbl_contract.useYn', 'Y');

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
                //$this->db->like('tbl_customer.cus_nm', $dataSrch['srch_customer']);
                $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
                $this->db->join('tbl_customer cust','cust.cus_id = tbl_sell_customer.cus_id');
                
                $this->db->like('cust.cus_nm_kh', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone1', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone2', $dataSrch['srch_customer']);
                $this->db->or_like('cust.con_no', $dataSrch['srch_all']);
                
                $this->db->group_by('tbl_sell.sell_id');
            }
            
    	  	if($dataSrch['filter_status'] != null && $dataSrch['filter_status'] != ""){
    	  	    $this->db->where('tbl_contract.con_sta', $dataSrch['filter_status']);
                
            }
            
            if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
                $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
            }
            
    		/* if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
                $this->db->like('tbl_customer.cus_nm', $dataSrch['srch_all']);
                $this->db->or_like('tbl_customer.cus_nm_kh', $dataSrch['srch_all']);
                $this->db->or_like('tbl_contract.con_no', $dataSrch['srch_all']);
                $this->db->or_like('tbl_customer.cus_phone1', $dataSrch['srch_all']);
            } */
            //$this->db->group_by('tbl_contract.con_id'); 
            //$this->db->group_by('tbl_contract.con_id');
            $this->db->order_by("tbl_contract.con_id", "desc");
            return $this->db->get('tbl_contract',$dataSrch['limit'],$dataSrch['offset'])->result();
    	}

    	public function countContractData($dataSrch){
    		
		    $this->db->select('count(tbl_contract.con_id) as total_rec');
            $this->db->from('tbl_contract');
            //$this->db->join('tbl_contract_customer','tbl_contract_customer.con_id = tbl_contract.con_id');
            //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_contract_customer.cus_id');
            //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_contract.cus_id');
            $this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_contract.con_pay_met');
            $this->db->join('tbl_contract_detail','tbl_contract_detail.con_id = tbl_contract.con_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_contract_detail.pro_id');
            $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
            $this->db->where('tbl_contract.com_id', $_SESSION['comId']);
            $this->db->where('tbl_contract.useYn', 'Y');

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
                //$this->db->like('tbl_customer.cus_nm', $dataSrch['srch_customer']);
                $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
                $this->db->join('tbl_customer cust','cust.cus_id = tbl_sell_customer.cus_id');
                
                $this->db->like('cust.cus_nm_kh', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone1', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone2', $dataSrch['srch_customer']);
                $this->db->or_like('cust.con_no', $dataSrch['srch_all']);
                
                $this->db->group_by('tbl_sell.sell_id');
            }
            
            if($dataSrch['filter_status'] != null && $dataSrch['filter_status'] != ""){
                if($dataSrch['filter_status'] != null && $dataSrch['filter_status'] != ""){
                    $this->db->where('tbl_contract.con_sta', $dataSrch['filter_status']);
                    
                }
                
            }
            
            if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
                $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
            }
            
           /*  if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
                $this->db->like('tbl_customer.cus_nm', $dataSrch['srch_all']);
                $this->db->or_like('tbl_customer.cus_nm_kh', $dataSrch['srch_all']);
                $this->db->or_like('tbl_contract.con_no', $dataSrch['srch_all']);
                $this->db->or_like('tbl_customer.cus_phone1', $dataSrch['srch_all']);
            } */
            // $this->db->group_by('tbl_contract.con_id'); 
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
            $this->db->where('con_id', $data['con_id']);
            $this->db->update('tbl_contract', $data);
        }
        
        public function insert($data){
            $this->db->insert('tbl_contract',$data);
            return $this->db->insert_id();
        }
        
		public function insertDetial($data){
            $this->db->insert('tbl_contract_detail',$data);
            return $this->db->insert_id();
        }
        
        public function insertConCust($data){
            $this->db->insert('tbl_contract_customer',$data);
            return $this->db->insert_id();
        }
    }
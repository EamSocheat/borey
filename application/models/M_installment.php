<?php
	class M_installment extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	
    	}
    	
    	public function selectInsertBookedInstallment($data){
    		 $sql = 'INSERT tbl_installment_payment (inst_total_paid_amount,inst_paid_yn,inst_paid_date,
    		 				inst_paid_status,rec_id,met_id,inst_id, regDt,regUsr, useYn,com_id)
                           	SELECT con_total_price, "Y" as inst_paid_yn,con_date as inst_paid_date
                           	,"BOOK" as inst_paid_status, rec_id,con_pay_met,'.$data['inst_id'].', now() as regDt,'.$_SESSION['usrId'].', "Y" as useYn, '.$_SESSION['comId'].'
                           	FROM tbl_contract where con_id ='.$data['con_id'];
		    
		    $this->db->query($sql);
    	}
		public function selectInstallmentDetail($dataSrch){
            $this->db->select('tbl_installment.*');
        	$this->db->from('tbl_installment');
        	//$this->db->join('tbl_installment_payment','tbl_installment_payment.inst_id = tbl_installment.inst_id and tbl_installment_payment.useYn="Y"','left');
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
        
        //
		public function selectInstallmentDataPrint($dataSrch){
            $this->db->select('*');
            $this->db->from('tbl_installment');
            $this->db->join('tbl_sell','tbl_sell.sell_id = tbl_installment.sell_id ');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            $this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
            $this->db->join('tbl_contract_type','tbl_contract_type.con_type_id = tbl_sell.con_type_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
            $this->db->where('tbl_installment.com_id', $_SESSION['comId']);
            $this->db->where('tbl_installment.useYn', 'Y');
        
            
            if($dataSrch['sell_id'] != null && $dataSrch['sell_id'] != ""){
                $this->db->where('tbl_installment.sell_id', $dataSrch['sell_id']);
            }
           	$this->db->order_by("inst_num", "asc");
            return $this->db->get()->result();
        }
    	
        public function selectInstallmentData($dataSrch){
            $this->db->select('tbl_installment.*,tbl_sell.*,tbl_sell_detail.*,tbl_customer.*,tbl_contract_type.*,tbl_product.*,inst1.inst_type as booked_yn');
            //$this->db->from('tbl_installment');
            $this->db->join('tbl_sell','tbl_sell.sell_id = tbl_installment.sell_id ');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            $this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
            $this->db->join('tbl_contract_type','tbl_contract_type.con_type_id = tbl_sell.con_type_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
            $this->db->join('tbl_installment inst1','inst1.sell_id = tbl_installment.sell_id and inst1.inst_type="BOOK"',"left");
            $this->db->where('tbl_installment.com_id', $_SESSION['comId']);
            $this->db->where('tbl_installment.useYn', 'Y');
        	$this->db->where('tbl_sell.useYn', 'Y');
        	
            if($dataSrch['inst_id'] != null && $dataSrch['inst_id'] != ""){
                $this->db->where('tbl_installment.inst_id', $dataSrch['inst_id']);
            }
            if($dataSrch['sell_id'] != null && $dataSrch['sell_id'] != ""){
                $this->db->where('tbl_installment.sell_id', $dataSrch['sell_id']);
            }
            
            if(($dataSrch['inst_start_dt'] != null && $dataSrch['inst_start_dt'] != "")
                && ($dataSrch['inst_end_dt'] != null && $dataSrch['inst_end_dt'] != "")){
                    $this->db->where('tbl_installment.inst_date >=', date('Y-m-d', strtotime($dataSrch['inst_start_dt'])));
                    $this->db->where('tbl_installment.inst_date <=', date('Y-m-d', strtotime($dataSrch['inst_end_dt'])));
            }else{
                if($dataSrch['inst_start_dt'] != null && $dataSrch['inst_start_dt'] != ""){
                    $this->db->where('tbl_installment.inst_date >=', date('Y-m-d', strtotime($dataSrch['inst_start_dt'])));
                }
                if($dataSrch['inst_end_dt'] != null && $dataSrch['inst_end_dt'] != ""){
                    $this->db->where('tbl_installment.inst_date <=', date('Y-m-d', strtotime($dataSrch['inst_end_dt'])));
                }
            }
            //
        	if($dataSrch['sell_code'] != null && $dataSrch['sell_code'] != ""){
                $this->db->like('tbl_sell.sell_code', $dataSrch['sell_code']);
            }
            //
        	if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
                $this->db->like('tbl_product.pro_code', $dataSrch['pro_code']);
            }
            $this->db->where_not_in("tbl_installment.inst_paid_yn","N");
           
            $this->db->order_by("tbl_installment.inst_date", "asc");
            $this->db->order_by("tbl_installment.inst_num", "asc");
            return $this->db->get('tbl_installment',$dataSrch['limit'],$dataSrch['offset'])->result();
        }
        
        
        public function countInstallmentData($dataSrch){
            $this->db->select('count(tbl_installment.inst_id) as total_rec');
            $this->db->from('tbl_installment');
        	$this->db->join('tbl_sell','tbl_sell.sell_id = tbl_installment.sell_id ');
        	$this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            $this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
            $this->db->join('tbl_contract_type','tbl_contract_type.con_type_id = tbl_sell.con_type_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
            $this->db->where('tbl_installment.com_id', $_SESSION['comId']);
            $this->db->where('tbl_installment.useYn', 'Y');
        	$this->db->where('tbl_sell.useYn', 'Y');
        	
            if($dataSrch['inst_id'] != null && $dataSrch['inst_id'] != ""){
                $this->db->where('tbl_installment.inst_id', $dataSrch['inst_id']);
            }
            if($dataSrch['sell_id'] != null && $dataSrch['sell_id'] != ""){
                $this->db->where('tbl_installment.sell_id', $dataSrch['sell_id']);
            }
            
            if(($dataSrch['inst_start_dt'] != null && $dataSrch['inst_start_dt'] != "")
                && ($dataSrch['inst_end_dt'] != null && $dataSrch['inst_end_dt'] != "")){
                    $this->db->where('tbl_installment.inst_date >=', date('Y-m-d', strtotime($dataSrch['inst_start_dt'])));
                    $this->db->where('tbl_installment.inst_date <=', date('Y-m-d', strtotime($dataSrch['inst_end_dt'])));
            }else{
                if($dataSrch['inst_start_dt'] != null && $dataSrch['inst_start_dt'] != ""){
                    $this->db->where('tbl_installment.inst_date >=', date('Y-m-d', strtotime($dataSrch['inst_start_dt'])));
                }
                if($dataSrch['inst_end_dt'] != null && $dataSrch['inst_end_dt'] != ""){
                    $this->db->where('tbl_installment.inst_date <=', date('Y-m-d', strtotime($dataSrch['inst_end_dt'])));
                }
            }
         	//
        	if($dataSrch['sell_code'] != null && $dataSrch['sell_code'] != ""){
                $this->db->like('tbl_sell.sell_code', $dataSrch['sell_code']);
            }
            //
        	if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
                $this->db->like('tbl_product.pro_code', $dataSrch['pro_code']);
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
            $this->db->where('inst_id', $data['inst_id']);
            $this->db->update('tbl_installment', $data);
        }
        
        public function updateBySell($data){
            $this->db->where('com_id', $_SESSION['comId']);
            $this->db->where('sell_id', $data['sell_id']);
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
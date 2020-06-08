<?php
	class M_installment extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	
    	}
    	
    	public function validPayment($data){
			$this->db->select('count(inst_id) as valid_size');
        	$this->db->from('tbl_installment');
        	$this->db->where('tbl_installment.com_id', $_SESSION['comId']);
        	$this->db->where('tbl_installment.useYn', 'Y');
        	$this->db->where('tbl_installment.sell_id', $data['sell_id']);
        	$this->db->where('tbl_installment.inst_num < '.$data['inst_num']);
        	$this->db->where("tbl_installment.inst_paid_yn","N");
        	return $this->db->get()->result();
    	}
    	
    	public function selectInsertBookedInstallment($data){
    		 $sql = 'INSERT tbl_installment_payment (inst_total_paid_amount,inst_paid_yn,inst_paid_date,inst_paid_inv_code,
    		 				inst_paid_status,rec_id,met_id,inst_id, regDt,regUsr, useYn,com_id)
                           	SELECT con_total_price, "Y" as inst_paid_yn,con_date as inst_paid_date, "000001"
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
            $this->db->select('*,(select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=1 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh,
                                    (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=2 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh2,
                                    (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=3 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh3,
                                    (select tbl_customer.cus_gender from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=1 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_gender,
                                    (select tbl_customer.cus_gender from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=2 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_gender2,
                                    (select tbl_customer.cus_gender from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=3 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_gender3,
                                    (select tbl_customer.cus_phone1 from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=1 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_phone1,
                                    (select tbl_customer.cus_phone1 from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=2 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_phone2,
                                    (select tbl_customer.cus_phone1 from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=3 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_phone3');
            $this->db->from('tbl_installment');
            $this->db->join('tbl_sell','tbl_sell.sell_id = tbl_installment.sell_id ');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            //$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_sell.seller_id ');
            //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
            $this->db->join('tbl_contract_type','tbl_contract_type.con_type_id = tbl_sell.con_type_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
            //$this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
            $this->db->where('tbl_installment.com_id', $_SESSION['comId']);
            $this->db->where('tbl_installment.useYn', 'Y');
        
            
            if($dataSrch['sell_id'] != null && $dataSrch['sell_id'] != ""){
                $this->db->where('tbl_installment.sell_id', $dataSrch['sell_id']);
            }
           	$this->db->order_by("inst_num", "asc");
            return $this->db->get()->result();
        }
        
        
        public function selectPaymentDataPrint($dataSrch){
            $this->db->select('*,(select inst_type from tbl_installment inst2 where inst_type="BOOK" and inst2.sell_id = tbl_sell.sell_id limit 1) as is_booked,(select sum(inst_amt_pay) from tbl_installment inst1 where inst_paid_yn="Y" and inst1.inst_num < tbl_installment.inst_num  and inst1.sell_id = tbl_sell.sell_id) as paid_principle');
            $this->db->from('tbl_installment_payment');
            $this->db->join('tbl_installment','tbl_installment.inst_id = tbl_installment_payment.inst_id');
            $this->db->join('tbl_sell','tbl_sell.sell_id = tbl_installment.sell_id ');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            $this->db->join('tbl_staff','tbl_staff.sta_id = tbl_sell.seller_id ');
            //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
            $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
            $this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell_customer.cus_id');
            $this->db->join('tbl_contract_type','tbl_contract_type.con_type_id = tbl_sell.con_type_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
            $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
            $this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_installment_payment.met_id');
            
            $this->db->where('tbl_installment.com_id', $_SESSION['comId']);
            $this->db->where('tbl_installment.useYn', 'Y');
            $this->db->where('tbl_sell.useYn', 'Y');
            $this->db->where("tbl_installment.inst_paid_yn","Y");
            
            $this->db->where('tbl_installment_payment.inst_paid_id', $dataSrch['inst_paid_id']);
            
            return $this->db->get()->result();
        }
    	
        public function selectInstallmentData($dataSrch){
            $this->db->select('tbl_installment.*,tbl_sell.*,tbl_sell_detail.*,tbl_contract_type.*,tbl_product.*,inst1.inst_type as booked_yn,
                                (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=1 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh,
                                    (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=2 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh2,
                                    (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=3 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh3');
            //$this->db->from('tbl_installment');
            $this->db->join('tbl_sell','tbl_sell.sell_id = tbl_installment.sell_id ');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
            $this->db->join('tbl_contract_type','tbl_contract_type.con_type_id = tbl_sell.con_type_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
            $this->db->join('tbl_installment inst1','inst1.sell_id = tbl_installment.sell_id and inst1.inst_type="BOOK"',"left");
            $this->db->where('tbl_installment.com_id', $_SESSION['comId']);
            $this->db->where('tbl_installment.useYn', 'Y');
        	$this->db->where('tbl_sell.useYn', 'Y');
        	$this->db->where("tbl_installment.inst_paid_yn","N");
        	
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
        	    $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
            }
            
            
            if($dataSrch['srch_customer'] != null && $dataSrch['srch_customer'] != ""){
                //$this->db->like('tbl_customer.cus_nm', $dataSrch['srch_customer']);
                $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
                $this->db->join('tbl_customer cust','cust.cus_id = tbl_sell_customer.cus_id');
                
                $this->db->like('cust.cus_nm_kh', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone1', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone2', $dataSrch['srch_customer']);
                
                $this->db->group_by('tbl_sell.sell_id');
            }
            
            $this->db->order_by("tbl_installment.inst_num,tbl_sell.sell_id", "asc");
            $this->db->order_by("tbl_installment.inst_date", "desc");
           
            return $this->db->get('tbl_installment',$dataSrch['limit'],$dataSrch['offset'])->result();
        }
        
        
        public function countInstallmentData($dataSrch){
            $this->db->select('count(tbl_installment.inst_id) as total_rec');
            $this->db->from('tbl_installment');
        	$this->db->join('tbl_sell','tbl_sell.sell_id = tbl_installment.sell_id ');
        	$this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
            $this->db->join('tbl_contract_type','tbl_contract_type.con_type_id = tbl_sell.con_type_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
            $this->db->where('tbl_installment.com_id', $_SESSION['comId']);
            $this->db->where('tbl_installment.useYn', 'Y');
        	$this->db->where('tbl_sell.useYn', 'Y');
        	$this->db->where("tbl_installment.inst_paid_yn","N");
        	
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
        	    $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
            }
            
            
            if($dataSrch['srch_customer'] != null && $dataSrch['srch_customer'] != ""){
                //$this->db->like('tbl_customer.cus_nm', $dataSrch['srch_customer']);
                $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
                $this->db->join('tbl_customer cust','cust.cus_id = tbl_sell_customer.cus_id');
                
                $this->db->like('cust.cus_nm_kh', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone1', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone2', $dataSrch['srch_customer']);
                
                $this->db->group_by('tbl_sell.sell_id');
            }
            
            return $this->db->get()->result();
        }
        
        
        
        public function selectPaymentData($dataSrch){
            $this->db->select('tbl_payment_method.*,tbl_staff.*,tbl_installment_payment.*,tbl_installment.*,tbl_sell.*,tbl_sell_detail.*,tbl_contract_type.*,tbl_product.*,inst1.inst_type as booked_yn,
                                (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=1 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh,
                                    (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=2 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh2,
                                    (select tbl_customer.cus_nm_kh from tbl_sell_customer inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id  where sell_cus_order=3 and tbl_sell_customer.sell_id=tbl_sell.sell_id ) as cus_nm_kh3');
            //$this->db->from('tbl_installment');
            $this->db->join('tbl_installment','tbl_installment.inst_id = tbl_installment_payment.inst_id ');
            $this->db->join('tbl_sell','tbl_sell.sell_id = tbl_installment.sell_id ');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
            $this->db->join('tbl_contract_type','tbl_contract_type.con_type_id = tbl_sell.con_type_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
            $this->db->join('tbl_installment inst1','inst1.sell_id = tbl_installment.sell_id and inst1.inst_type="BOOK"',"left");
            $this->db->join('tbl_staff','tbl_staff.sta_id = tbl_installment_payment.rec_id');
            $this->db->join('tbl_payment_method','tbl_payment_method.met_id = tbl_installment_payment.met_id');
            $this->db->where('tbl_installment.com_id', $_SESSION['comId']);
            $this->db->where('tbl_installment.useYn', 'Y');
            $this->db->where('tbl_sell.useYn', 'Y');
            $this->db->where("tbl_installment.inst_paid_yn","Y");
            $this->db->where("tbl_installment_payment.inst_paid_yn","Y");
            $this->db->where("tbl_installment_payment.useYn","Y");
            if($dataSrch['inst_id'] != null && $dataSrch['inst_id'] != ""){
                $this->db->where('tbl_installment.inst_id', $dataSrch['inst_id']);
            }
            if($dataSrch['sell_id'] != null && $dataSrch['sell_id'] != ""){
                $this->db->where('tbl_installment.sell_id', $dataSrch['sell_id']);
            }
            
            if(($dataSrch['inst_start_dt'] != null && $dataSrch['inst_start_dt'] != "")
                && ($dataSrch['inst_end_dt'] != null && $dataSrch['inst_end_dt'] != "")){
                    $this->db->where('tbl_installment_payment.inst_paid_date >=', date('Y-m-d', strtotime($dataSrch['inst_start_dt'])));
                    $this->db->where('tbl_installment_payment.inst_paid_date <=', date('Y-m-d', strtotime($dataSrch['inst_end_dt'])));
            }else{
                if($dataSrch['inst_start_dt'] != null && $dataSrch['inst_start_dt'] != ""){
                    $this->db->where('tbl_installment_payment.inst_paid_date >=', date('Y-m-d', strtotime($dataSrch['inst_start_dt'])));
                }
                if($dataSrch['inst_end_dt'] != null && $dataSrch['inst_end_dt'] != ""){
                    $this->db->where('tbl_installment_payment.inst_paid_date <=', date('Y-m-d', strtotime($dataSrch['inst_end_dt'])));
                }
            }
            //
            if($dataSrch['sell_code'] != null && $dataSrch['sell_code'] != ""){
                $this->db->like('tbl_sell.sell_code', $dataSrch['sell_code']);
            }
            //
            if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
                $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
            }
            //
            if($dataSrch['inst_paid_code'] != null && $dataSrch['inst_paid_code'] != ""){
                $this->db->like('tbl_installment_payment.inst_paid_code', $dataSrch['inst_paid_code']);
            }
            
            if($dataSrch['srch_customer'] != null && $dataSrch['srch_customer'] != ""){
                //$this->db->like('tbl_customer.cus_nm', $dataSrch['srch_customer']);
                $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
                $this->db->join('tbl_customer cust','cust.cus_id = tbl_sell_customer.cus_id');
                
                $this->db->like('cust.cus_nm_kh', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone1', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone2', $dataSrch['srch_customer']);
                
                $this->db->group_by('tbl_sell.sell_id');
            }
            $this->db->order_by("tbl_installment.sell_id", "desc");
            $this->db->order_by("tbl_installment.inst_num", "asc");
            $this->db->order_by("tbl_installment_payment.inst_paid_date", "desc");
            
            
            return $this->db->get('tbl_installment_payment',$dataSrch['limit'],$dataSrch['offset'])->result();
        }
        
        
        public function countPaymentData($dataSrch){
            $this->db->select('count(tbl_installment.inst_id) as total_rec');
            $this->db->from('tbl_installment_payment');
            $this->db->join('tbl_installment','tbl_installment.inst_id = tbl_installment_payment.inst_id ');
            $this->db->join('tbl_sell','tbl_sell.sell_id = tbl_installment.sell_id ');
            $this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id ');
            //$this->db->join('tbl_customer','tbl_customer.cus_id = tbl_sell.cus_id');
            $this->db->join('tbl_contract_type','tbl_contract_type.con_type_id = tbl_sell.con_type_id');
            $this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
            $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
            $this->db->where('tbl_installment.com_id', $_SESSION['comId']);
            $this->db->where('tbl_installment.useYn', 'Y');
            $this->db->where('tbl_sell.useYn', 'Y');
            $this->db->where("tbl_installment.inst_paid_yn","Y");
            $this->db->where("tbl_installment_payment.inst_paid_yn","Y");
            $this->db->where("tbl_installment_payment.useYn","Y");
            if($dataSrch['inst_id'] != null && $dataSrch['inst_id'] != ""){
                $this->db->where('tbl_installment.inst_id', $dataSrch['inst_id']);
            }
            if($dataSrch['sell_id'] != null && $dataSrch['sell_id'] != ""){
                $this->db->where('tbl_installment.sell_id', $dataSrch['sell_id']);
            }
            
            if(($dataSrch['inst_start_dt'] != null && $dataSrch['inst_start_dt'] != "")
                && ($dataSrch['inst_end_dt'] != null && $dataSrch['inst_end_dt'] != "")){
                    $this->db->where('tbl_installment_payment.inst_paid_date >=', date('Y-m-d', strtotime($dataSrch['inst_start_dt'])));
                    $this->db->where('tbl_installment_payment.inst_paid_date <=', date('Y-m-d', strtotime($dataSrch['inst_end_dt'])));
            }else{
                if($dataSrch['inst_start_dt'] != null && $dataSrch['inst_start_dt'] != ""){
                    $this->db->where('tbl_installment_payment.inst_paid_date >=', date('Y-m-d', strtotime($dataSrch['inst_start_dt'])));
                }
                if($dataSrch['inst_end_dt'] != null && $dataSrch['inst_end_dt'] != ""){
                    $this->db->where('tbl_installment_payment.inst_paid_date <=', date('Y-m-d', strtotime($dataSrch['inst_end_dt'])));
                }
            }
            //
            if($dataSrch['sell_code'] != null && $dataSrch['sell_code'] != ""){
                $this->db->like('tbl_sell.sell_code', $dataSrch['sell_code']);
            }
            //
            if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
                $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
            }
            //
            if($dataSrch['inst_paid_code'] != null && $dataSrch['inst_paid_code'] != ""){
                $this->db->like('tbl_installment_payment.inst_paid_code', $dataSrch['inst_paid_code']);
            }
			
            if($dataSrch['srch_customer'] != null && $dataSrch['srch_customer'] != ""){
                //$this->db->like('tbl_customer.cus_nm', $dataSrch['srch_customer']);
                $this->db->join('tbl_sell_customer','tbl_sell_customer.sell_id = tbl_sell.sell_id');
                $this->db->join('tbl_customer cust','cust.cus_id = tbl_sell_customer.cus_id');
                
                $this->db->like('cust.cus_nm_kh', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone1', $dataSrch['srch_customer']);
                $this->db->or_like('cust.cus_phone2', $dataSrch['srch_customer']);
                
                $this->db->group_by('tbl_sell.sell_id');
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
        
        
        public function insertPayment($data){
            $this->db->insert('tbl_installment_payment',$data);
            return $this->db->insert_id();
        }
        
        public function updatePayment($data){
            $this->db->where('com_id', $_SESSION['comId']);
            $this->db->where('inst_paid_id', $data['inst_paid_id']);
            $this->db->update('tbl_installment_payment', $data);
        }
        
        
        public function selectPaymentScheduleByMonth($dataSrch){
            $sql = "select sell_data.sell_id 
                        	,pro_sell_price
                        	,pro_data.pro_id
                        	,pro_data.pro_code
                            ,sell_data.con_type_nm_kh
                            ,(case 
                            	when (COALESCE(sell_data.pro_sell_price, '') = '')
                                	then  book_data.pro_book_price
                                else sell_data.pro_sell_price
                             end) as sell_price
                            ,(case 
                            	when (COALESCE(sell_data.pro_sell_price, '') = '')
                                	then  cus_book_data.cus_nm
                                else cus_sell_data.cus_nm
                             end) as cus_name
                            ,inst_data.inst_amt_pay
                            ,inst_data.inst_date
                        	,inst_pay_data.inst_total_paid_amount
                            ,inst_pay_data.inst_paid_des
                            ,inst_pay_data.inst_paid_date
                            ,inst_pay_data.inst_paid_code
                            ,other_pay.other_pay_amount
                            ,other_pay.other_pay_des
                            ,other_pay.other_pay_date
                            ,other_pay.oth_pay_inv_code
                            ,book_data.con_total_price as book_amount
                            ,book_data.con_des as book_des
                            ,book_data.con_date
                            ,book_data.con_code
                            ,pro_data.bra_nm_kh
                            ,pro_data.pro_status
                        from (select pro_id
                                ,pro_code
                                ,bra_nm_kh
                                ,pro_status
                                from tbl_product 
                                inner join tbl_branch on tbl_branch.bra_id = tbl_product.bra_id
                                where tbl_product.useYn ='Y'
                                ) pro_data
                        left join (select tbl_product.pro_id
                                   ,tbl_sell.sell_id	
                                   ,pro_sell_price
                                   	,con_type_nm_kh
                                   ,DATE_FORMAT(sell_date, '%d/%m/%Y') as sell_date
                                   	from tbl_sell
                                   	inner join tbl_sell_detail on tbl_sell_detail.sell_id = tbl_sell.sell_id
                                    inner join tbl_product on tbl_product.pro_id = tbl_sell_detail.pro_id
                                    inner join tbl_contract_type on tbl_contract_type.con_type_id = tbl_sell.con_type_id
                                    where tbl_sell.useYn ='Y'
                                   ) sell_data 
                        on pro_data.pro_id = sell_data.pro_id
                        left join (select tbl_sell.sell_id
                                   ,sum(inst_amt_pay) as inst_amt_pay
                                   ,GROUP_CONCAT(DATE_FORMAT(inst_date, '%d/%m/%Y') SEPARATOR ' & ') as inst_date
                                	from tbl_sell
                                   	inner join tbl_sell_detail on tbl_sell_detail.sell_id = tbl_sell.sell_id
                                    left join tbl_installment on tbl_installment.sell_id = tbl_sell.sell_id and tbl_installment.useYn = 'Y' 
                                    where tbl_sell.useYn ='Y'
                                    and tbl_installment.inst_type != 'BOOK'
                                    and inst_date BETWEEN '".$dataSrch['start_date']."' and '".$dataSrch['end_date']."'
                        			GROUP BY sell_id
                                   ) inst_data 
                        on sell_data.sell_id = inst_data.sell_id 
                        left join (select tbl_sell.sell_id
                                   ,sum(inst_total_paid_amount) as inst_total_paid_amount
                                   ,GROUP_CONCAT(inst_paid_des SEPARATOR ' & ') as inst_paid_des
                                   ,GROUP_CONCAT(DATE_FORMAT(inst_paid_date, '%d/%m/%Y') SEPARATOR ' & ') as inst_paid_date
                                   ,GROUP_CONCAT(inst_paid_code SEPARATOR ' & ') as inst_paid_code
                                	from tbl_sell
                                   	inner join tbl_sell_detail on tbl_sell_detail.sell_id = tbl_sell.sell_id
                                    left join tbl_installment on tbl_installment.sell_id = tbl_sell.sell_id and tbl_installment.useYn = 'Y'
                                    left join tbl_installment_payment on tbl_installment_payment.inst_id = tbl_installment.inst_id and tbl_installment_payment.useYn = 'Y' and tbl_installment_payment.inst_paid_yn = 'Y' and inst_paid_date BETWEEN '".$dataSrch['start_date']."' and '".$dataSrch['end_date']."'
                                    where tbl_sell.useYn ='Y'
                                    and tbl_installment.inst_type != 'BOOK'
                        			GROUP BY sell_id
                                   ) inst_pay_data 
                        on sell_data.sell_id = inst_pay_data.sell_id 
                        left join (select tbl_contract_detail.pro_id
                                   ,tbl_contract.con_id
                                   ,con_total_price
                                   ,tbl_contract_detail.pro_book_price
                                   ,tbl_contract.con_des
                                   ,DATE_FORMAT(con_date, '%d/%m/%Y') as con_date
                                   ,con_code
                                   from tbl_contract 
                                   inner join tbl_contract_detail on tbl_contract_detail.con_id = tbl_contract.con_id
                                   where tbl_contract.useYn = 'Y'
                                   and con_sta != 'C'
                                   and con_date BETWEEN '".$dataSrch['start_date']."' and '".$dataSrch['end_date']."'
                                  ) book_data
                        on pro_data.pro_id = book_data.pro_id
                        Left join (select sell_id 
                                   ,sum(oth_pay_amt) as other_pay_amount
                                   ,GROUP_CONCAT(oth_pay_des SEPARATOR ' & ') as other_pay_des
                                   ,GROUP_CONCAT(DATE_FORMAT(oth_pay_date, '%d/%m/%Y') SEPARATOR '-') as other_pay_date
                                   ,GROUP_CONCAT( oth_pay_inv_code SEPARATOR ' & ') as oth_pay_inv_code
                                   from tbl_other_payment
                                   where tbl_other_payment.useYn = 'Y'
                                   and oth_pay_date BETWEEN '".$dataSrch['start_date']."' and '".$dataSrch['end_date']."'
                                   GROUP BY sell_id
                        		  ) other_pay
                        on sell_data.sell_id = other_pay.sell_id
                        Left join (select sell_id 
                                   ,GROUP_CONCAT(cus_nm_kh SEPARATOR ' & ') as cus_nm
                                   from tbl_sell_customer
                                   inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id
                                   where tbl_sell_customer.useYn = 'Y'
                                   GROUP BY sell_id
                        		  ) cus_sell_data
                        on sell_data.sell_id = cus_sell_data.sell_id
                        Left join (select con_id 
                                   ,GROUP_CONCAT(cus_nm_kh SEPARATOR ' & ') as cus_nm
                                   from tbl_contract_customer
                                   inner join tbl_customer on tbl_customer.cus_id = tbl_contract_customer.cus_id
                                   where tbl_contract_customer.useYn = 'Y'
                                   GROUP BY con_id
                        		  ) cus_book_data
                        on book_data.con_id = cus_book_data.con_id
                        order by pro_data.pro_code asc";
            return $this->db->query($sql)->result();
        }
        
        
        public function selectContractInfo($dataSrch){
            $sql = "select sell_data.sell_id 
                        	,pro_sell_price
                        	,pro_data.pro_id
                        	,pro_data.pro_code
                            ,sell_data.con_type_nm_kh
                            ,(case 
                            	when (COALESCE(sell_data.pro_sell_price, '') = '')
                                	then  book_data.pro_book_price
                                else sell_data.pro_sell_price
                             end) as sell_price
                            ,(case 
                            	when (COALESCE(sell_data.pro_sell_price, '') = '')
                                	then  cus_book_data.cus_nm
                                else cus_sell_data.cus_nm
                             end) as cus_name
                            ,sell_data.pro_sell_time_build
                            ,(case 
                            	when (COALESCE(sell_data.sell_des, '') = '')
                                	then  book_data.con_des
                                else sell_data.sell_des
                             end) as sell_des
                            ,sell_data.sell_date
                            ,sell_data.sell_date_org
                            ,book_data.con_total_price as book_amount
                            ,book_data.con_des as book_des
                            ,book_data.con_date
                            ,book_data.con_code
                            ,pro_data.bra_nm_kh
                            ,pro_data.pro_status
                        from (select pro_id
                                ,pro_code
                                ,bra_nm_kh
                                ,pro_status
                                from tbl_product 
                                inner join tbl_branch on tbl_branch.bra_id = tbl_product.bra_id
                                where tbl_product.useYn ='Y'
                                ) pro_data
                        left join (select tbl_product.pro_id
                                   ,tbl_sell.sell_id	
                                   ,pro_sell_price
                                   	,con_type_nm_kh
                                   ,DATE_FORMAT(sell_date, '%d/%m/%Y') as sell_date
                                   ,pro_sell_time_build
                                   ,sell_des
                                   ,sell_date as sell_date_org
                                   	from tbl_sell
                                   	inner join tbl_sell_detail on tbl_sell_detail.sell_id = tbl_sell.sell_id
                                    inner join tbl_product on tbl_product.pro_id = tbl_sell_detail.pro_id
                                    inner join tbl_contract_type on tbl_contract_type.con_type_id = tbl_sell.con_type_id
                                    where tbl_sell.useYn ='Y'
                                   ) sell_data 
                        on pro_data.pro_id = sell_data.pro_id
                        left join (select tbl_contract_detail.pro_id
                                   ,tbl_contract.con_id
                                   ,con_total_price
                                   ,tbl_contract_detail.pro_book_price
                                   ,tbl_contract.con_des
                                   ,DATE_FORMAT(con_date, '%d/%m/%Y') as con_date
                                   ,con_code
                                   from tbl_contract 
                                   inner join tbl_contract_detail on tbl_contract_detail.con_id = tbl_contract.con_id
                                   where tbl_contract.useYn = 'Y'
                                   and con_sta != 'C'
                                  ) book_data
                        on pro_data.pro_id = book_data.pro_id
                        Left join (select sell_id 
                                   ,GROUP_CONCAT(cus_nm_kh SEPARATOR ' & ') as cus_nm
                                   from tbl_sell_customer
                                   inner join tbl_customer on tbl_customer.cus_id = tbl_sell_customer.cus_id
                                   where tbl_sell_customer.useYn = 'Y'
                                   GROUP BY sell_id
                        		  ) cus_sell_data
                        on sell_data.sell_id = cus_sell_data.sell_id
                        Left join (select con_id 
                                   ,GROUP_CONCAT(cus_nm_kh SEPARATOR ' & ') as cus_nm
                                   from tbl_contract_customer
                                   inner join tbl_customer on tbl_customer.cus_id = tbl_contract_customer.cus_id
                                   where tbl_contract_customer.useYn = 'Y'
                                   GROUP BY con_id
                        		  ) cus_book_data
                        on book_data.con_id = cus_book_data.con_id
                        order by pro_data.pro_code asc";
            return $this->db->query($sql)->result();
        }
        
    }
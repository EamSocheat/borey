<?php
	class M_commission extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();

        	$this->load->library('session');
        	//session_start();
        	$this->load->library('encrypt');
    	}
        
    	function selectCommissionData($dataSrch){
			$this->db->select('*,(select sum(inst_pay_per) from tbl_installment where sell_id = tbl_sell.sell_id and inst_type="ADV" and inst_paid_yn = "Y") as user_piad_percent');
			//$this->db->from('tbl_commission');
			$this->db->join('tbl_sell','tbl_sell.sell_id = tbl_commission.sell_id');
			$this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id');
			$this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
			$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_sell.seller_id');
			$this->db->where('tbl_commission.com_id', $_SESSION['comId']);
			$this->db->where('tbl_commission.useYn', 'Y');
			$this->db->where('tbl_sell.useYn', 'Y');

			if($dataSrch['commi_id'] != null && $dataSrch['commi_id'] != ""){
				$this->db->where('tbl_commission.commi_id', $dataSrch['commi_id']);
			}

			if($dataSrch['sell_code'] != null && $dataSrch['sell_code'] != ""){
				$this->db->where('tbl_sell.sell_code', $dataSrch['sell_code']);
			}

			if($dataSrch['seller_id'] != null && $dataSrch['seller_id'] != ""){
				$this->db->where('tbl_sell.seller_id', $dataSrch['seller_id']);
			}

			if(($dataSrch['txtSaleSDate'] != null && $dataSrch['txtSaleSDate'] != "")
				&& ($dataSrch['txtSaleEDate'] != null && $dataSrch['txtSaleEDate'] != "")){

				$this->db->where('tbl_sell.sell_date >=', $dataSrch['txtSaleSDate']);
				$this->db->where('tbl_sell.sell_date <=', $dataSrch['txtSaleEDate']);
			}else{
				if(($dataSrch['txtSaleSDate'] != null && $dataSrch['txtSaleSDate'] != "")){
					$this->db->where('tbl_sell.sell_date >=', $dataSrch['txtSaleSDate']);
				}

				if(($dataSrch['txtSaleEDate'] != null && $dataSrch['txtSaleEDate'] != "")){
					$this->db->where('tbl_sell.sell_date <=', $dataSrch['txtSaleEDate']);
				}
			}

			if(($dataSrch['txtApprSDate'] != null && $dataSrch['txtApprSDate'] != "")
				&& ($dataSrch['txtApprEDate'] != null && $dataSrch['txtApprEDate'] != "")){

				$this->db->where('tbl_commission.commi_approve_date >=', $dataSrch['txtApprSDate']);
				$this->db->where('tbl_commission.commi_approve_date <=', $dataSrch['txtApprEDate']);
			}else{
				if(($dataSrch['txtApprSDate'] != null && $dataSrch['txtApprSDate'] != "")){
					$this->db->where('tbl_commission.commi_approve_date >=', $dataSrch['txtApprSDate']);
				}

				if(($dataSrch['txtApprEDate'] != null && $dataSrch['txtApprEDate'] != "")){
					$this->db->where('tbl_commission.commi_approve_date <=', $dataSrch['txtApprEDate']);
				}
			}

			if($dataSrch['commi_is_approve'] != null && $dataSrch['commi_is_approve'] != ""){
				$this->db->where('tbl_commission.commi_is_approve', $dataSrch['commi_is_approve']);
			}
			
			if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
			    $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
			}

			/*if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
				$this->db->group_start();
				$this->db->like('tbl_salary.pro_nm', $dataSrch['srch_all']);
				$this->db->or_like('tbl_branch.bra_nm', $dataSrch['srch_all']);
				$this->db->or_like('tbl_category.cat_nm', $dataSrch['srch_all']);
				$this->db->group_end();
			}*/

			$this->db->order_by("commi_id", "desc");
			$this->db->order_by("tbl_sell.sell_id", "desc");
			return $this->db->get('tbl_commission', $dataSrch['limit'], $dataSrch['offset'])->result();

    	}

		function countCommissionData($dataSrch){

			$this->db->select('count(commi_id) as total_rec');
			$this->db->from('tbl_commission');
			$this->db->join('tbl_sell','tbl_sell.sell_id = tbl_commission.sell_id');
			$this->db->join('tbl_sell_detail','tbl_sell_detail.sell_id = tbl_sell.sell_id');
			$this->db->join('tbl_product','tbl_product.pro_id = tbl_sell_detail.pro_id');
			$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_sell.seller_id');
			$this->db->where('tbl_commission.com_id', $_SESSION['comId']);
			$this->db->where('tbl_commission.useYn', 'Y');
			$this->db->where('tbl_sell.useYn', 'Y');

			if($dataSrch['commi_id'] != null && $dataSrch['commi_id'] != ""){
				$this->db->where('tbl_commission.commi_id', $dataSrch['commi_id']);
			}

			if($dataSrch['sell_code'] != null && $dataSrch['sell_code'] != ""){
				$this->db->like('tbl_sell.sell_code', $dataSrch['sell_code']);
			}

			if($dataSrch['seller_id'] != null && $dataSrch['seller_id'] != ""){
				$this->db->where('tbl_sell.seller_id', $dataSrch['seller_id']);
			}

			if(($dataSrch['txtSaleSDate'] != null && $dataSrch['txtSaleSDate'] != "")
				&& ($dataSrch['txtSaleEDate'] != null && $dataSrch['txtSaleEDate'] != "")){

				$this->db->where('tbl_sell.sell_date >=', $dataSrch['txtSaleSDate']);
				$this->db->where('tbl_sell.sell_date <=', $dataSrch['txtSaleEDate']);
			}else{
				if(($dataSrch['txtSaleSDate'] != null && $dataSrch['txtSaleSDate'] != "")){
					$this->db->where('tbl_sell.sell_date >=', $dataSrch['txtSaleSDate']);
				}

				if(($dataSrch['txtSaleEDate'] != null && $dataSrch['txtSaleEDate'] != "")){
					$this->db->where('tbl_sell.sell_date <=', $dataSrch['txtSaleEDate']);
				}
			}

			if(($dataSrch['txtApprSDate'] != null && $dataSrch['txtApprSDate'] != "")
				&& ($dataSrch['txtApprEDate'] != null && $dataSrch['txtApprEDate'] != "")){

				$this->db->where('tbl_commission.commi_approve_date >=', $dataSrch['txtApprSDate']);
				$this->db->where('tbl_commission.commi_approve_date <=', $dataSrch['txtApprEDate']);
			}else{
				if(($dataSrch['txtApprSDate'] != null && $dataSrch['txtApprSDate'] != "")){
					$this->db->where('tbl_commission.commi_approve_date >=', $dataSrch['txtApprSDate']);
				}

				if(($dataSrch['txtApprEDate'] != null && $dataSrch['txtApprEDate'] != "")){
					$this->db->where('tbl_commission.commi_approve_date <=', $dataSrch['txtApprEDate']);
				}
			}

			if($dataSrch['commi_is_approve'] != null && $dataSrch['commi_is_approve'] != ""){
				$this->db->where('tbl_commission.commi_is_approve', $dataSrch['commi_is_approve']);
			}
			
			
			if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
			    $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
			}

			/*if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
				$this->db->group_start();
				$this->db->like('tbl_salary.pro_nm', $dataSrch['srch_all']);
				$this->db->or_like('tbl_branch.bra_nm', $dataSrch['srch_all']);
				$this->db->or_like('tbl_category.cat_nm', $dataSrch['srch_all']);
				$this->db->group_end();
			}*/
			return $this->db->get()->result();
		}
    	
		/*
        public function update($data){
            $this->db->where('com_id', $_SESSION['comId']);
            $this->db->where('con_id', $data['commi_id']);
            $this->db->update('tbl_commission', $data);
        }
        */
        public function insert($data){
            $this->db->insert('tbl_commission',$data);
            return $this->db->insert_id();
        }
        
	
		function selectUserMenu($dataSrch){
  
        	$this->db->select('tbl_user.*,tbl_menu_user.menu_id,tbl_staff.sta_id,tbl_staff.sta_nm_kh,tbl_user.regDt as regUsrDt');
        	//$this->db->from('tbl_staff');
        	$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_user.sta_id');
        	$this->db->join('tbl_position','tbl_position.pos_id = tbl_staff.pos_id');
        	$this->db->join('tbl_menu_user','tbl_menu_user.usr_id = tbl_user.usr_id');
        	$this->db->where('tbl_staff.com_id', $_SESSION['comId']);
        	$this->db->where('tbl_staff.useYn', 'Y');
        	$this->db->where('tbl_user.useYn', 'Y');
        	//---
        	if($dataSrch['commi_id'] != null && $dataSrch['commi_id'] != ""){
        	    $this->db->where('tbl_staff.commi_id', $dataSrch['commi_id']);
        	}
        	
        	//
        	if($dataSrch['usr_nm'] != null && $dataSrch['usr_nm'] != ""){
        	    $this->db->like('tbl_user.usr_nm', $dataSrch['usr_nm']);
        	}
        	
    		//---
        	if($dataSrch['usr_id'] != null && $dataSrch['usr_id'] != ""){
        	    $this->db->where('tbl_user.usr_id', $dataSrch['usr_id']);
        	}
        	
        	$this->db->order_by("usr_id", "desc");
        	return $this->db->get('tbl_user',$dataSrch['limit'],$dataSrch['offset'])->result();
		}
	
    	function selectUser($dataSrch){
  
        	$this->db->select('tbl_user.*,tbl_staff.sta_id,tbl_staff.sta_nm_kh,tbl_user.regDt as regUsrDt');
        	//$this->db->from('tbl_staff');
        	$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_user.sta_id');
        	$this->db->join('tbl_position','tbl_position.pos_id = tbl_staff.pos_id');
        	$this->db->where('tbl_staff.com_id', $_SESSION['comId']);
        	$this->db->where('tbl_staff.useYn', 'Y');
        	$this->db->where('tbl_user.useYn', 'Y');
        	$this->db->where_not_in('tbl_staff.sta_nm_kh', null);
        	$this->db->where_not_in('tbl_staff.sta_nm_kh', 'null');
        	//---
        	if($dataSrch['sta_id'] != null && $dataSrch['sta_id'] != ""){
        	    $this->db->where('tbl_staff.sta_id', $dataSrch['sta_id']);
        	}
        	
        	//
        	if($dataSrch['usr_nm'] != null && $dataSrch['usr_nm'] != ""){
        	    $this->db->like('tbl_user.usr_nm', $dataSrch['usr_nm']);
        	}
        	
    		//---
        	if($dataSrch['usr_id'] != null && $dataSrch['usr_id'] != ""){
        	    $this->db->where('tbl_user.usr_id', $dataSrch['usr_id']);
        	}
        	
        	$this->db->order_by("usr_id", "desc");
        	return $this->db->get('tbl_user',$dataSrch['limit'],$dataSrch['offset'])->result();
		}
		
		function countUser($dataSrch){
  
        	$this->db->select('count(tbl_staff.sta_id) as total_rec');
        	$this->db->from('tbl_user');
        	$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_user.sta_id');
        	$this->db->join('tbl_position','tbl_position.pos_id = tbl_staff.pos_id');
        	$this->db->where('tbl_staff.com_id', $_SESSION['comId']);
        	$this->db->where('tbl_staff.useYn', 'Y');
        	$this->db->where('tbl_user.useYn', 'Y');
        	$this->db->where_not_in('tbl_staff.sta_nm_kh', null);
        	$this->db->where_not_in('tbl_staff.sta_nm_kh', 'null');
        	//---
        	if($dataSrch['sta_id'] != null && $dataSrch['sta_id'] != ""){
        	    $this->db->where('tbl_staff.sta_id', $dataSrch['sta_id']);
        	}
        	
        	//
        	if($dataSrch['usr_nm'] != null && $dataSrch['usr_nm'] != ""){
        	    $this->db->like('tbl_user.usr_nm', $dataSrch['usr_nm']);
        	}
        	
			//---
        	if($dataSrch['usr_id'] != null && $dataSrch['usr_id'] != ""){
        	    $this->db->where('tbl_user.usr_id', $dataSrch['usr_id']);
        	}
        	
        	$this->db->order_by("usr_id", "desc");
        	return $this->db->get()->result();
		}

		public function update($data){
			$this->db->where('com_id', $_SESSION['comId']);
			$this->db->where('commi_id', $data['commi_id']);
			$this->db->update('tbl_commission', $data);
		}
		/*
		public function insert($data){
			$this->db->insert('tbl_user',$data);
			return $this->db->insert_id();
		}*/
		
		
		public function selectCount(){
			$this->db->select('count(usrId) AS usrSell');
			$this->db->from('tbluser AS usr');
			$this->db->where('usr.comId', $_SESSION['comId']);
			$this->db->where('usr.useYn', 'Y');
			$this->db->where('usr.usrPos', "Sale");
			$this->db->where('usr.usrStr', "Y");
			
			$result = $this->db->get()->result();
			return $result;
		}
		public function updateCompany($data){
		   
		    $this->db->where('comId', $_SESSION['comId']);
		    $this->db->update('tblcompany', $data);
		}
	
    }
		

    

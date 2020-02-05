<?php
class M_expend extends CI_Model{

	function __construct()
	{
		parent::__construct();
	}

	function selectExpend($dataSrch){

		$this->db->select('tblSta1.sta_nm as exp_req_staff_nm, tbl_expend.*,tbl_staff.*,tbl_supplier.*,tbl_branch.*');
		//$this->db->from('tbl_expend');
		$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_expend.sta_id');
		$this->db->join('tbl_staff tblSta1','tblSta1.sta_id = tbl_expend.exp_req_staff_id', 'left');
		$this->db->join('tbl_supplier','tbl_supplier.sup_id = tbl_expend.sup_id', 'left');
		$this->db->join('tbl_branch','tbl_branch.bra_id = tbl_expend.bra_id');
		$this->db->where('tbl_expend.com_id', $_SESSION['comId']);
		$this->db->where('tbl_expend.useYn', 'Y');

		// for download excell
		if($dataSrch['expIdArr'] != null && $dataSrch['expIdArr'] != ""){
			$integerIDs = array_map('intval', explode(',', $dataSrch['expIdArr']));
			$this->db->where_in('tbl_expend.exp_id', $integerIDs);
		}

		if($dataSrch['exp_id'] != null && $dataSrch['exp_id'] != ""){
			$this->db->where('tbl_expend.exp_id', $dataSrch['exp_id']);
		}

		if($dataSrch['sup_nm'] != null && $dataSrch['sup_nm'] != ""){
			$this->db->where_in('tbl_supplier.sup_id', $dataSrch['sup_nm']);
		}

		if($dataSrch['bra_nm'] != null && $dataSrch['bra_nm'] != ""){
			$this->db->where_in('tbl_branch.bra_id', $dataSrch['bra_nm']);
		}

		if($dataSrch['sta_nm'] != null && $dataSrch['sta_nm'] != ""){
			$this->db->where_in('tbl_staff.sta_id', $dataSrch['sta_nm']);
		}

		if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
			$this->db->group_start();
			$this->db->like('tbl_expend.sup_nm', $dataSrch['srch_all']);
			$this->db->or_like('tbl_expend.bra_nm', $dataSrch['srch_all']);
			$this->db->or_like('tbl_expend.sta_nm', $dataSrch['srch_all']);
			$this->db->group_end();
		}

		if(($dataSrch['txtSrchExpendSD'] != null && $dataSrch['txtSrchExpendSD'] != "")
			&& ($dataSrch['txtSrchExpendED'] != null && $dataSrch['txtSrchExpendED'] != "")){
			$this->db->where('tbl_expend.exp_date >=', $dataSrch['txtSrchExpendSD']);
			$this->db->where('tbl_expend.exp_date <=', $dataSrch['txtSrchExpendED']);
		}else{
			if(($dataSrch['txtSrchExpendSD'] != null && $dataSrch['txtSrchExpendSD'] != "")){
				$this->db->where('tbl_expend.exp_date >=', $dataSrch['txtSrchExpendSD']);
			}

			if(($dataSrch['txtSrchExpendED'] != null && $dataSrch['txtSrchExpendED'] != "")){
				$this->db->where('tbl_expend.exp_date <=', $dataSrch['txtSrchExpendED']);
			}
		}

		/*else{
			if($dataSrch['txtSrchExpendED'] != null && $dataSrch['txtSrchExpendED'] != ""){
				$this->db->where('tbl_expend.exp_date <=', date('Y-m-d', strtotime($dataSrch['txtSrchExpendED'])));
			}

			if($dataSrch['txtSrchExpendSD'] != null && $dataSrch['txtSrchExpendSD'] != ""){
				$this->db->where('tbl_expend.exp_date >=', date('Y-m-d', strtotime($dataSrch['txtSrchExpendSD'])));
			}

		}*/
		
		if($dataSrch['expIdArray'] != null && $dataSrch['expIdArray'] != ""){
        	$integerIDs = array_map('intval', explode(',', $dataSrch['expIdArray']));
        	$this->db->where_in('tbl_expend.exp_id', $integerIDs);
        }
            
		$this->db->order_by("exp_date", "desc");
		$this->db->order_by("tbl_expend.sta_id", "desc");
		return $this->db->get('tbl_expend',$dataSrch['limit'],$dataSrch['offset'])->result();
	}
	
	
	function selectExpendExcel($dataSrch){
	    
	    $this->db->select('tblSta1.sta_nm as exp_req_staff_nm, tbl_expend.*,tbl_staff.*,tbl_supplier.*,tbl_branch.*');
	    //$this->db->from('tbl_expend');
	    $this->db->join('tbl_staff','tbl_staff.sta_id = tbl_expend.sta_id');
	    $this->db->join('tbl_staff tblSta1','tblSta1.sta_id = tbl_expend.exp_req_staff_id', 'left');
	    $this->db->join('tbl_supplier','tbl_supplier.sup_id = tbl_expend.sup_id', 'left');
	    $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_expend.bra_id');
	    $this->db->where('tbl_expend.com_id', $_SESSION['comId']);
	    $this->db->where('tbl_expend.useYn', 'Y');
	    
	    // for download excell
	    if($dataSrch['expIdArr'] != null && $dataSrch['expIdArr'] != ""){
	        $integerIDs = array_map('intval', explode(',', $dataSrch['expIdArr']));
	        $this->db->where_in('tbl_expend.exp_id', $integerIDs);
	    }
	    
	    if($dataSrch['exp_id'] != null && $dataSrch['exp_id'] != ""){
	        $this->db->where('tbl_expend.exp_id', $dataSrch['exp_id']);
	    }
	    
	    if($dataSrch['sup_nm'] != null && $dataSrch['sup_nm'] != ""){
	        $this->db->where_in('tbl_supplier.sup_id', $dataSrch['sup_nm']);
	    }
	    
	    if($dataSrch['bra_nm'] != null && $dataSrch['bra_nm'] != ""){
	        $this->db->where_in('tbl_branch.bra_id', $dataSrch['bra_nm']);
	    }
	    
	    if($dataSrch['sta_nm'] != null && $dataSrch['sta_nm'] != ""){
	        $this->db->where_in('tbl_staff.sta_id', $dataSrch['sta_nm']);
	    }
	    
	    if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
	        $this->db->group_start();
	        $this->db->like('tbl_expend.sup_nm', $dataSrch['srch_all']);
	        $this->db->or_like('tbl_expend.bra_nm', $dataSrch['srch_all']);
	        $this->db->or_like('tbl_expend.sta_nm', $dataSrch['srch_all']);
	        $this->db->group_end();
	    }
	    
	    if(($dataSrch['txtSrchExpendSD'] != null && $dataSrch['txtSrchExpendSD'] != "")
	        && ($dataSrch['txtSrchExpendED'] != null && $dataSrch['txtSrchExpendED'] != "")){
	            $this->db->where('tbl_expend.exp_date >=', $dataSrch['txtSrchExpendSD']);
	            $this->db->where('tbl_expend.exp_date <=', $dataSrch['txtSrchExpendED']);
	    }else{
	        if(($dataSrch['txtSrchExpendSD'] != null && $dataSrch['txtSrchExpendSD'] != "")){
	            $this->db->where('tbl_expend.exp_date >=', $dataSrch['txtSrchExpendSD']);
	        }
	        
	        if(($dataSrch['txtSrchExpendED'] != null && $dataSrch['txtSrchExpendED'] != "")){
	            $this->db->where('tbl_expend.exp_date <=', $dataSrch['txtSrchExpendED']);
	        }
	    }
	    
	    /*else{
	     if($dataSrch['txtSrchExpendED'] != null && $dataSrch['txtSrchExpendED'] != ""){
	     $this->db->where('tbl_expend.exp_date <=', date('Y-m-d', strtotime($dataSrch['txtSrchExpendED'])));
	     }
	     
	     if($dataSrch['txtSrchExpendSD'] != null && $dataSrch['txtSrchExpendSD'] != ""){
	     $this->db->where('tbl_expend.exp_date >=', date('Y-m-d', strtotime($dataSrch['txtSrchExpendSD'])));
	     }
	     
	     }*/
	    
	    if($dataSrch['expIdArray'] != null && $dataSrch['expIdArray'] != ""){
	        $integerIDs = array_map('intval', explode(',', $dataSrch['expIdArray']));
	        $this->db->where_in('tbl_expend.exp_id', $integerIDs);
	    }
	    
	    
	    $this->db->order_by("tbl_expend.sta_id", "desc");
	    $this->db->order_by("exp_date", "asc");
	    return $this->db->get('tbl_expend',$dataSrch['limit'],$dataSrch['offset'])->result();
	}

	function countExpend($dataSrch){

		$this->db->select('count(exp_id) as total_rec');
		$this->db->from('tbl_expend');
		$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_expend.sta_id');
		$this->db->join('tbl_supplier','tbl_supplier.sup_id = tbl_expend.sup_id', 'left');
		$this->db->join('tbl_branch','tbl_branch.bra_id = tbl_expend.bra_id');
		$this->db->where('tbl_expend.com_id', $_SESSION['comId']);
		$this->db->where('tbl_expend.useYn', 'Y');

		if($dataSrch['exp_id'] != null && $dataSrch['exp_id'] != ""){
			$this->db->where('tbl_expend.exp_id', $dataSrch['exp_id']);
		}

		if($dataSrch['sup_nm'] != null && $dataSrch['sup_nm'] != ""){
			$this->db->like('tbl_supplier.sup_nm', $dataSrch['sup_nm']);
		}

		if($dataSrch['bra_nm'] != null && $dataSrch['bra_nm'] != ""){
			$this->db->like('tbl_branch.bra_nm', $dataSrch['bra_nm']);
		}

		if($dataSrch['sta_nm'] != null && $dataSrch['sta_nm'] != ""){
			$this->db->like('tbl_staff.sta_id', $dataSrch['sta_nm']);
		}

		if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
			$this->db->group_start();
			$this->db->like('tbl_expend.sup_nm', $dataSrch['srch_all']);
			$this->db->or_like('tbl_expend.bra_nm', $dataSrch['srch_all']);
			$this->db->or_like('tbl_expend.sta_nm', $dataSrch['srch_all']);
			$this->db->group_end();
		}

		if(($dataSrch['txtSrchExpendSD'] != null && $dataSrch['txtSrchExpendSD'] != "")
			&& ($dataSrch['txtSrchExpendED'] != null && $dataSrch['txtSrchExpendED'] != "")){
			$this->db->where('tbl_expend.exp_date >=', $dataSrch['txtSrchExpendSD']);
			$this->db->where('tbl_expend.exp_date <=', $dataSrch['txtSrchExpendED']);
		}else{
			if(($dataSrch['txtSrchExpendSD'] != null && $dataSrch['txtSrchExpendSD'] != "")){
				$this->db->where('tbl_expend.exp_date >=', $dataSrch['txtSrchExpendSD']);
			}

			if(($dataSrch['txtSrchExpendED'] != null && $dataSrch['txtSrchExpendED'] != "")){
				$this->db->where('tbl_expend.exp_date <=', $dataSrch['txtSrchExpendED']);
			}
		}

		return $this->db->get()->result();
	}

	public function update($data){
		$this->db->where('com_id', $_SESSION['comId']);
		$this->db->where('exp_id', $data['exp_id']);
		$this->db->update('tbl_expend', $data);
	}

	public function insert($data){
		$this->db->insert('tbl_expend',$data);
		return $this->db->insert_id();
	}
}

<?php
class M_commission_setting extends CI_Model{
		
		function __construct() 
		{
        	parent::__construct();
        	
    	}
    	
		function selectCommissionSettingFormular($dataSrch){
    	    
    	    $this->db->select('comset_amt,comset_type,comset_amt_ex,comset_type_ex');
    	    $this->db->from('tbl_commission_setting');
    	    $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_commission_setting.bra_id');
    	    $this->db->join('tbl_position','tbl_position.pos_id = tbl_commission_setting.pos_id');
    	    $this->db->join('tbl_commission_setting_detail','tbl_commission_setting_detail.comset_id = tbl_commission_setting.comset_id');
    	    $this->db->where('tbl_commission_setting.com_id', $_SESSION['comId']);
    	    $this->db->where('tbl_commission_setting.useYn', 'Y');
    	    //---
    	    if($dataSrch['cat_id'] != null && $dataSrch['cat_id'] != ""){
    	        $this->db->where('tbl_commission_setting_detail.cat_id', $dataSrch['cat_id']);
    	    }
    	    
    	    //
    	    if($dataSrch['pos_id'] != null && $dataSrch['pos_id'] != ""){
    	        $this->db->where('tbl_commission_setting.pos_id', $dataSrch['pos_id']);
    	    }
    	    
    	   
    	    return $this->db->get()->result();
    	}
    	
    	function selectCommissionSettingDetail($dataSrch){
    	    
    	    $this->db->select('*');
    	    //$this->db->from('tbl_staff');
    	    $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_commission_setting.bra_id');
    	    $this->db->join('tbl_position','tbl_position.pos_id = tbl_commission_setting.pos_id');
    	    $this->db->join('tbl_commission_setting_detail','tbl_commission_setting_detail.comset_id = tbl_commission_setting.comset_id');
    	    $this->db->where('tbl_commission_setting.com_id', $_SESSION['comId']);
    	    $this->db->where('tbl_commission_setting.useYn', 'Y');
    	    //---
    	    if($dataSrch['comset_id'] != null && $dataSrch['comset_id'] != ""){
    	        $this->db->where('tbl_commission_setting.comset_id', $dataSrch['comset_id']);
    	    }
    	    
    	    //
    	    if($dataSrch['pos_id'] != null && $dataSrch['pos_id'] != ""){
    	        $this->db->where('tbl_commission_setting.pos_id', $dataSrch['pos_id']);
    	    }
    	    
    	    //
    	    if($dataSrch['bra_id'] != null && $dataSrch['bra_id'] != ""){
    	        $this->db->where('tbl_commission_setting.bra_id', $dataSrch['bra_id']);
    	    }
    	    
    	    
    	    $this->db->order_by("tbl_commission_setting.comset_id", "desc");
    	    return $this->db->get('tbl_commission_setting',$dataSrch['limit'],$dataSrch['offset'])->result();
    	}

    	function selectCommissionSetting($dataSrch){
  
        	$this->db->select('*');
        	//$this->db->from('tbl_staff');
        	$this->db->join('tbl_branch','tbl_branch.bra_id = tbl_commission_setting.bra_id');
        	$this->db->join('tbl_position','tbl_position.pos_id = tbl_commission_setting.pos_id');
        	$this->db->where('tbl_commission_setting.com_id', $_SESSION['comId']);
        	$this->db->where('tbl_commission_setting.useYn', 'Y');
        	//---
        	if($dataSrch['comset_id'] != null && $dataSrch['comset_id'] != ""){
        	    $this->db->where('tbl_commission_setting.comset_id', $dataSrch['comset_id']);
        	}
        	
        	//
        	if($dataSrch['pos_id'] != null && $dataSrch['pos_id'] != ""){
        	    $this->db->where('tbl_commission_setting.pos_id', $dataSrch['pos_id']);
        	}
        	
        	//
        	if($dataSrch['bra_id'] != null && $dataSrch['bra_id'] != ""){
        	    $this->db->where('tbl_commission_setting.bra_id', $dataSrch['bra_id']);
        	}
        	
        	
        	$this->db->order_by("comset_id", "desc");
        	return $this->db->get('tbl_commission_setting',$dataSrch['limit'],$dataSrch['offset'])->result();
		}
		
		function countCommissionSetting($dataSrch){
  
        	$this->db->select('count(comset_id) as total_rec');
        	$this->db->from('tbl_commission_setting');
        	$this->db->join('tbl_branch','tbl_branch.bra_id = tbl_commission_setting.bra_id');
        	$this->db->join('tbl_position','tbl_position.pos_id = tbl_commission_setting.pos_id');
        	$this->db->where('tbl_commission_setting.com_id', $_SESSION['comId']);
        	$this->db->where('tbl_commission_setting.useYn', 'Y');
        	//---
        	if($dataSrch['comset_id'] != null && $dataSrch['comset_id'] != ""){
        	    $this->db->where('tbl_commission_setting.comset_id', $dataSrch['comset_id']);
        	}
        	
        	//
        	if($dataSrch['pos_id'] != null && $dataSrch['pos_id'] != ""){
        	    $this->db->where('tbl_commission_setting.pos_id', $dataSrch['pos_id']);
        	}
        	
        	//
        	if($dataSrch['bra_id'] != null && $dataSrch['bra_id'] != ""){
        	    $this->db->where('tbl_commission_setting.bra_id', $dataSrch['bra_id']);
        	}
        	
        	
        	$this->db->order_by("comset_id", "desc");
        	return $this->db->get()->result();
		}

		public function update($data){
			$this->db->where('com_id', $_SESSION['comId']);
			$this->db->where('comset_id', $data['comset_id']);
			$this->db->update('tbl_commission_setting', $data);
		}
		
		public function updateDetail($data){
		    $this->db->where('com_id', $_SESSION['comId']);
		    $this->db->where('comset_id', $data['comset_id']);
		    $this->db->update('tbl_commission_setting_detail', $data);
		}
		
		public function insertCommissionSetting($data){
			$this->db->insert('tbl_commission_setting',$data);
			return $this->db->insert_id();
		}
		
		public function insertCommissionSettingDetail($data){
		    $this->db->insert('tbl_commission_setting_detail',$data);
		    return $this->db->insert_id();
		}
		
		public function updateCommissionSetting($data){
		    $this->db->where('com_id', $_SESSION['comId']);
		    $this->db->where('comset_id', $data['sta_id']);
		    $this->db->update('tbl_commission_setting', $data);
		}
		
		public function removeCommissionSettingDetail($commSetId,$comId){
		    $sql ="delete from tbl_commission_setting_detail where comset_id =".$commSetId." and com_id=".$comId;
		    $this->db->query($sql);
		}
		
		public function checkSetting($pos_id,$bra_id){
		    $this->db->select('tbl_commission_setting.pos_id');
		    $this->db->from('tbl_commission_setting_detail');
		    $this->db->join('tbl_commission_setting','tbl_commission_setting.comset_id = tbl_commission_setting_detail.comset_id');
		    $this->db->where('tbl_commission_setting.useYn', 'Y');
		    $this->db->where('tbl_commission_setting.pos_id', $pos_id);
		    $this->db->where('tbl_commission_setting.bra_id', $bra_id);
		    $this->db->where('tbl_commission_setting.com_id', $_SESSION['comId']);
		    
		    $result = $this->db->get()->result();
		    return $result;
		}

    }
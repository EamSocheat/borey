<?php
	class M_house extends CI_Model{

		function __construct()
		{
			parent::__construct();
		}
		
		public function selectInsertHouse($data){
		    $sql = 'INSERT tbl_product (pro_code,pro_price,pro_street,pro_length,pro_width,pro_area,pro_photo,cat_id,bra_id,
    		 				pro_room,pro_toilet,pro_floor,pro_des,pro_status, regDt,regUsr, useYn,com_id)
                           	SELECT "'.$data["pro_code"].'" as pro_code, pro_price,pro_street, pro_length,pro_width,pro_area,pro_photo,cat_id,bra_id,
                           	pro_room,pro_toilet,pro_floor,pro_des,"F", now() as regDt,'.$_SESSION['usrId'].', "Y" as useYn, '.$_SESSION['comId'].'
                           	FROM tbl_product where pro_id ='.$data['pro_id'];
		    
		    $this->db->query($sql);
		}

		function checkCodeHouse($dataSrch){

			$this->db->select('count(pro_id) as total_rec');
			$this->db->from('tbl_product');
			$this->db->where('tbl_product.com_id', $_SESSION['comId']);
			$this->db->where('tbl_product.useYn', 'Y');
			if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
				$this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
			}
			
			return $this->db->get()->result();
		}
		
		function selectHouse($dataSrch){

			$this->db->select('*');
			//$this->db->from('tbl_product');
			$this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
			$this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
			$this->db->where('tbl_product.com_id', $_SESSION['comId']);
			$this->db->where('tbl_product.useYn', 'Y');

			if($dataSrch['pro_id'] != null && $dataSrch['pro_id'] != ""){
				$this->db->where('tbl_product.pro_id', $dataSrch['pro_id']);
			}

			if($dataSrch['bra_id'] != null && $dataSrch['bra_id'] != ""){
				$this->db->where('tbl_branch.bra_id', $dataSrch['bra_id']);
			}

			if($dataSrch['cat_id'] != null && $dataSrch['cat_id'] != ""){
				$this->db->where('tbl_category.cat_id', $dataSrch['cat_id']);
			}

			if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
				$this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
			}
			
			if($dataSrch['pro_status'] != null && $dataSrch['pro_status'] != ""){
				$this->db->where('tbl_product.pro_status', $dataSrch['pro_status']);
			}
			
			if(($dataSrch['pro_start_price'] != null && $dataSrch['pro_start_price'] != "") &&
				$dataSrch['pro_end_price'] != null && $dataSrch['pro_end_price'] != ""){
				$this->db->where('tbl_product.pro_price >= ', $dataSrch['pro_start_price']);
				$this->db->where('tbl_product.pro_price <= ', $dataSrch['pro_end_price']);
			}else{
				if(($dataSrch['pro_start_price'] != null && $dataSrch['pro_start_price'] != "")){
					$this->db->where('tbl_product.pro_price >=', $dataSrch['pro_start_price']);
				}

				if(($dataSrch['pro_end_price'] != null && $dataSrch['pro_end_price'] != "")){
					$this->db->where('tbl_expend.exp_date <=', $dataSrch['pro_end_price']);
				}
			}

			if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
			    $this->db->where('tbl_product.pro_code', $dataSrch['srch_all']);
			}
			

			$this->db->order_by("pro_id", "desc");
			return $this->db->get('tbl_product',$dataSrch['limit'],$dataSrch['offset'])->result();
		}

		function countHouse($dataSrch){

			$this->db->select('count(pro_id) as total_rec');
			$this->db->from('tbl_product');
			$this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
			$this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
			$this->db->where('tbl_product.com_id', $_SESSION['comId']);
			$this->db->where('tbl_product.useYn', 'Y');

			if($dataSrch['pro_id'] != null && $dataSrch['pro_id'] != ""){
				$this->db->where('tbl_product.pro_id', $dataSrch['pro_id']);
			}

			if($dataSrch['bra_id'] != null && $dataSrch['bra_id'] != ""){
				$this->db->where('tbl_branch.bra_id', $dataSrch['bra_id']);
			}

			if($dataSrch['cat_id'] != null && $dataSrch['cat_id'] != ""){
				$this->db->where('tbl_category.cat_id', $dataSrch['cat_id']);
			}

			if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
				$this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
			}
			
			if($dataSrch['pro_status'] != null && $dataSrch['pro_status'] != ""){
				$this->db->where('tbl_product.pro_status', $dataSrch['pro_status']);
			}
			
			if(($dataSrch['pro_start_price'] != null && $dataSrch['pro_start_price'] != "") &&
				$dataSrch['pro_end_price'] != null && $dataSrch['pro_end_price'] != ""){
				$this->db->where('tbl_product.pro_price >= ', $dataSrch['pro_start_price']);
				$this->db->where('tbl_product.pro_price <= ', $dataSrch['pro_end_price']);
			}else{
				if(($dataSrch['pro_start_price'] != null && $dataSrch['pro_start_price'] != "")){
					$this->db->where('tbl_product.pro_price >=', $dataSrch['pro_start_price']);
				}

				if(($dataSrch['pro_end_price'] != null && $dataSrch['pro_end_price'] != "")){
					$this->db->where('tbl_expend.exp_date <=', $dataSrch['pro_end_price']);
				}
			}

			if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
			    $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
			}
			return $this->db->get()->result();
		}
		
		
		function selectHousePopup($dataSrch){
		    
		    $this->db->select('*');
		    //$this->db->from('tbl_product');
		    $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
		    $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
		    $this->db->join('tbl_commission_setting','tbl_commission_setting.bra_id = tbl_product.bra_id');
		    $this->db->join('tbl_commission_setting_detail','tbl_commission_setting_detail.comset_id = tbl_commission_setting.comset_id and tbl_commission_setting_detail.cat_id = tbl_product.cat_id');
		    //$this->db->join('tbl_commission_setting_detail catSetting','catSetting.cat_id = tbl_product.cat_id');
		    $this->db->where('tbl_product.com_id', $_SESSION['comId']);
		    $this->db->where('tbl_product.useYn', 'Y');
		    $this->db->where('tbl_commission_setting.useYn', 'Y');
		    
		    if($dataSrch['pro_id'] != null && $dataSrch['pro_id'] != ""){
		        $this->db->where('tbl_product.pro_id', $dataSrch['pro_id']);
		    }
		    
		    if($dataSrch['bra_id'] != null && $dataSrch['bra_id'] != ""){
		        $this->db->where('tbl_branch.bra_id', $dataSrch['bra_id']);
		    }
		    
		    if($dataSrch['cat_id'] != null && $dataSrch['cat_id'] != ""){
		        $this->db->where('tbl_category.cat_id', $dataSrch['cat_id']);
		    }
		    
		    if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
		        $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
		    }
		    
		    if($dataSrch['pro_status'] != null && $dataSrch['pro_status'] != ""){
		        $this->db->where('tbl_product.pro_status', $dataSrch['pro_status']);
		    }
		    
		    if(($dataSrch['pro_start_price'] != null && $dataSrch['pro_start_price'] != "") &&
		        $dataSrch['pro_end_price'] != null && $dataSrch['pro_end_price'] != ""){
		            $this->db->where('tbl_product.pro_price >= ', $dataSrch['pro_start_price']);
		            $this->db->where('tbl_product.pro_price <= ', $dataSrch['pro_end_price']);
		    }else{
		        if(($dataSrch['pro_start_price'] != null && $dataSrch['pro_start_price'] != "")){
		            $this->db->where('tbl_product.pro_price >=', $dataSrch['pro_start_price']);
		        }
		        
		        if(($dataSrch['pro_end_price'] != null && $dataSrch['pro_end_price'] != "")){
		            $this->db->where('tbl_expend.exp_date <=', $dataSrch['pro_end_price']);
		        }
		    }
		    
		    if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
		        $this->db->where('tbl_product.pro_code', $dataSrch['srch_all']);
		    }
		    
		    
		    $this->db->order_by("pro_id", "desc");
		    return $this->db->get('tbl_product',$dataSrch['limit'],$dataSrch['offset'])->result();
		}
		
		function countHousePopup($dataSrch){
		    
		    $this->db->select('count(pro_id) as total_rec');
		    $this->db->from('tbl_product');
		    $this->db->join('tbl_category','tbl_category.cat_id = tbl_product.cat_id');
		    $this->db->join('tbl_branch','tbl_branch.bra_id = tbl_product.bra_id');
		    $this->db->join('tbl_commission_setting','tbl_commission_setting.bra_id = tbl_product.bra_id');
		    $this->db->join('tbl_commission_setting_detail','tbl_commission_setting_detail.comset_id = tbl_commission_setting.comset_id and tbl_commission_setting_detail.cat_id = tbl_product.cat_id');
		    //$this->db->join('tbl_commission_setting_detail catSetting','catSetting.cat_id = tbl_product.cat_id');
		    $this->db->where('tbl_product.com_id', $_SESSION['comId']);
		    $this->db->where('tbl_product.useYn', 'Y');
		    $this->db->where('tbl_commission_setting.useYn', 'Y');
		    //$this->db->where('tbl_commission_setting.useYn', 'Y');
		    
		    if($dataSrch['pro_id'] != null && $dataSrch['pro_id'] != ""){
		        $this->db->where('tbl_product.pro_id', $dataSrch['pro_id']);
		    }
		    
		    if($dataSrch['bra_id'] != null && $dataSrch['bra_id'] != ""){
		        $this->db->where('tbl_branch.bra_id', $dataSrch['bra_id']);
		    }
		    
		    if($dataSrch['cat_id'] != null && $dataSrch['cat_id'] != ""){
		        $this->db->where('tbl_category.cat_id', $dataSrch['cat_id']);
		    }
		    
		    if($dataSrch['pro_code'] != null && $dataSrch['pro_code'] != ""){
		        $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
		    }
		    
		    if($dataSrch['pro_status'] != null && $dataSrch['pro_status'] != ""){
		        $this->db->where('tbl_product.pro_status', $dataSrch['pro_status']);
		    }
		    
		    if(($dataSrch['pro_start_price'] != null && $dataSrch['pro_start_price'] != "") &&
		        $dataSrch['pro_end_price'] != null && $dataSrch['pro_end_price'] != ""){
		            $this->db->where('tbl_product.pro_price >= ', $dataSrch['pro_start_price']);
		            $this->db->where('tbl_product.pro_price <= ', $dataSrch['pro_end_price']);
		    }else{
		        if(($dataSrch['pro_start_price'] != null && $dataSrch['pro_start_price'] != "")){
		            $this->db->where('tbl_product.pro_price >=', $dataSrch['pro_start_price']);
		        }
		        
		        if(($dataSrch['pro_end_price'] != null && $dataSrch['pro_end_price'] != "")){
		            $this->db->where('tbl_expend.exp_date <=', $dataSrch['pro_end_price']);
		        }
		    }
		    
		    if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
		        $this->db->where('tbl_product.pro_code', $dataSrch['pro_code']);
		    }
		    return $this->db->get()->result();
		}

		function checkProductCode($dataSrch){
			$this->db->select('pro_code');
			$this->db->from('tbl_product as pro');
			$this->db->where('pro.useYn', 'Y');
			$this->db->where('pro.pro_code', $dataSrch['pro_code']);

			$result = $this->db->get()->result();
			return $result;
		}

		public function update($data){
			$this->db->where('com_id', $_SESSION['comId']);
			$this->db->where('pro_id', $data['pro_id']);
			$this->db->update('tbl_product', $data);
		}

		public function insert($data){
			$this->db->insert('tbl_product',$data);
			return $this->db->insert_id();
		}
    }

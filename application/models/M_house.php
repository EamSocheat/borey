<?php
	class M_house extends CI_Model{

		function __construct()
		{
			parent::__construct();
		}

		function selectExpend($dataSrch){

			$this->db->select('*');
			//$this->db->from('tbl_expend');
			$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_expend.sta_id');
			$this->db->join('tbl_supplier','tbl_supplier.sup_id = tbl_expend.sup_id');
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

			$this->db->order_by("exp_id", "desc");
			return $this->db->get('tbl_expend',$dataSrch['limit'],$dataSrch['offset'])->result();
		}

		function countExpend($dataSrch){

			$this->db->select('count(exp_id) as total_rec');
			$this->db->from('tbl_expend');
			$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_expend.sta_id');
			$this->db->join('tbl_supplier','tbl_supplier.sup_id = tbl_expend.sup_id');
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
				$this->db->like('tbl_staff.sta_nm', $dataSrch['sta_nm']);
			}

			if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
				$this->db->group_start();
				$this->db->like('tbl_expend.sup_nm', $dataSrch['srch_all']);
				$this->db->or_like('tbl_expend.bra_nm', $dataSrch['srch_all']);
				$this->db->or_like('tbl_expend.sta_nm', $dataSrch['srch_all']);
				$this->db->group_end();
			}

			return $this->db->get()->result();
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

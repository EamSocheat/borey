<?php
	class M_salary extends CI_Model{

		function __construct()
		{
			parent::__construct();
		}

		function selectSalary($dataSrch){

			$this->db->select('*');
			//$this->db->from('tbl_salary');
			$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_salary.sta_id');
			$this->db->where('tbl_salary.com_id', $_SESSION['comId']);
			$this->db->where('tbl_salary.useYn', 'Y');

			if($dataSrch['sal_id'] != null && $dataSrch['sal_id'] != ""){
				$this->db->where('tbl_salary.sal_id', $dataSrch['sal_id']);
			}

			if($dataSrch['sta_id'] != null && $dataSrch['sta_id'] != ""){
				$this->db->where('tbl_salary.sta_id', $dataSrch['sta_id']);
			}

			if($dataSrch['sal_status'] != null && $dataSrch['sal_status'] != ""){
				$this->db->where('tbl_salary.sal_status', $dataSrch['sal_status']);
			}
			/*
			if($dataSrch['sal_month'] != null && $dataSrch['sal_month'] != ""){
				$this->db->like('tbl_salary.sal_month', $dataSrch['sal_month']);
			}
			*/
			if(($dataSrch['sal_month'] != null && $dataSrch['sal_month'] != "")
		        && ($dataSrch['sal_month_end'] != null && $dataSrch['sal_month_end'] != "")){
		            $this->db->where('tbl_salary.sal_month >=', date('Y-m-d', strtotime($dataSrch['sal_month'])));
		            $this->db->where('tbl_salary.sal_month <=', date('Y-m-d', strtotime($dataSrch['sal_month_end'])));
		    }else{
		        if($dataSrch['sal_month'] != null && $dataSrch['sal_month'] != ""){
		            $this->db->where('tbl_salary.sal_month >=', date('Y-m-d', strtotime($dataSrch['sal_month'])));
		        }
		        if($dataSrch['sal_month_end'] != null && $dataSrch['sal_month_end'] != ""){
		            $this->db->where('tbl_salary.sal_month <=', date('Y-m-d', strtotime($dataSrch['sal_month_end'])));
		        }
		    }

			/*if($dataSrch['srch_all'] != null && $dataSrch['srch_all'] != ""){
				$this->db->group_start();
				$this->db->like('tbl_salary.pro_nm', $dataSrch['srch_all']);
				$this->db->or_like('tbl_branch.bra_nm', $dataSrch['srch_all']);
				$this->db->or_like('tbl_category.cat_nm', $dataSrch['srch_all']);
				$this->db->group_end();
			}*/

			$this->db->order_by("sal_month", "desc");
			return $this->db->get('tbl_salary',$dataSrch['limit'],$dataSrch['offset'])->result();
		}

		function countSalary($dataSrch){

			$this->db->select('count(sal_id) as total_rec');
			$this->db->from('tbl_salary');
			$this->db->join('tbl_staff','tbl_staff.sta_id = tbl_salary.sta_id');
			$this->db->where('tbl_salary.com_id', $_SESSION['comId']);
			$this->db->where('tbl_salary.useYn', 'Y');

			if($dataSrch['sal_id'] != null && $dataSrch['sal_id'] != ""){
				$this->db->where('tbl_salary.sal_id', $dataSrch['sal_id']);
			}

			if($dataSrch['sta_id'] != null && $dataSrch['sta_id'] != ""){
				$this->db->where('tbl_salary.sta_id', $dataSrch['sta_id']);
			}

			if($dataSrch['sal_status'] != null && $dataSrch['sal_status'] != ""){
				$this->db->where('tbl_salary.sal_status', $dataSrch['sal_status']);
			}
			
			/*
			if($dataSrch['sal_month'] != null && $dataSrch['sal_month'] != ""){
				$this->db->like('tbl_salary.sal_month', $dataSrch['sal_month']);
			}
			*/
			if(($dataSrch['sal_month'] != null && $dataSrch['sal_month'] != "")
		        && ($dataSrch['sal_month_end'] != null && $dataSrch['sal_month_end'] != "")){
		            $this->db->where('tbl_salary.sal_month >=', date('Y-m-d', strtotime($dataSrch['sal_month'])));
		            $this->db->where('tbl_salary.sal_month <=', date('Y-m-d', strtotime($dataSrch['sal_month_end'])));
		    }else{
		        if($dataSrch['sal_month'] != null && $dataSrch['sal_month'] != ""){
		            $this->db->where('tbl_salary.sal_month >=', date('Y-m-d', strtotime($dataSrch['sal_month'])));
		        }
		        if($dataSrch['sal_month_end'] != null && $dataSrch['sal_month_end'] != ""){
		            $this->db->where('tbl_salary.sal_month <=', date('Y-m-d', strtotime($dataSrch['sal_month_end'])));
		        }
		    }
			return $this->db->get()->result();
		}

		function countDataCurrentMonth($dataSalMonth){
			$this->db->select('sal_id');
			$this->db->from('tbl_salary as sal');
			$this->db->where('sal.useYn', 'Y');
			$this->db->where('sal.sal_month', $dataSalMonth['sal_month']);
			$this->db->where('sal.sta_id', $dataSalMonth['sta_id']);
			$result = $this->db->get()->result();

			return $result;
		}

		public function update($data){
			$this->db->where('com_id', $_SESSION['comId']);
			$this->db->where('sal_id', $data['sal_id']);
			$this->db->update('tbl_salary', $data);
		}

		public function insert($data){
			$this->db->insert('tbl_salary',$data);
			return $this->db->insert_id();
		}
    }

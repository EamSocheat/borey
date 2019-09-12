<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class House extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model('M_login');
        $this->load->library('session');
        $this->load->model('M_check_user');
        $this->load->model('M_menu');
        $this->load->helper('form');
        $this->load->model('M_house');
        $this->load->model('M_common');
    }

	public function index(){

		if(!$this->M_check_user->check()){
			redirect('/Login');
		}
		$dataMenu['menu_active'] = "House";
		$data['header'] = $this->load->view('v_header', $dataMenu, TRUE);
		$data['footer'] = $this->load->view('v_footer', NULL, TRUE);
		$data['iframe'] = $this->load->view('v_iframe', NULL, TRUE);

		$this->load->view('v_house',$data);
	}

	public function getHouse(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}

		$dataSrch = array(
			'limit' 		=> $this->input->post('perPage'),
			'offset' 		=> $this->input->post('offset'),
			'pro_id' 		=> $this->input->post('houseId'),
			'bra_id'		=> $this->input->post('braNm'),
			'cat_id' 		=> $this->input->post('catNm'),
			'pro_code' 		=> $this->input->post('codePay'),
			'pro_status' 		=> $this->input->post('proStat'),
			'pro_start_price' 	=> $this->input->post('txtMinPrice'),
			'pro_end_price' 	=> $this->input->post('txtMaxPrice')
		);
		$data["OUT_REC"] = $this->M_house->selectHouse($dataSrch);
		$data["OUT_REC_CNT"] = $this->M_house->countHouse($dataSrch);
		echo json_encode($data);
	}

	public function save(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}

		$housePhoto = "";
		$productCode = "";
		if(!empty($_FILES['fileHousePhoto']['name'])){
			$housePhoto = $this->M_common->uploadImage($_FILES['fileHousePhoto'],'fileHousePhoto','./upload/borey/house','/borey/house/');
		}else{
			$housePhoto = $this->input->post('houseImgPath');
		}

		$data = array(
			'pro_photo'		=> $housePhoto,
			'cat_id'		=> $this->input->post('txtCatIdVal'),
			'bra_id'		=> $this->input->post('txtProjIdVal'),
			'pro_code'		=> $this->input->post('txtCode'),
			'pro_price'		=> str_replace(",","",$this->input->post('txtHousePrice')),
			'pro_number'	=> $this->input->post('txtHouseNo'),
			'pro_length'	=> $this->input->post('txtHouseLength'),
			'pro_width'		=> $this->input->post('txtHouseWidth'),
			'pro_area'		=> $this->input->post('txtHouseArea'),
			'pro_street'	=> $this->input->post('txtStreetNo'),
			'pro_floor'		=> $this->input->post('txtFloorQty'),
			'pro_room'		=> $this->input->post('txtRoomQty'),
			'pro_toilet'	=> $this->input->post('txtToiletQty'),
			'pro_des'		=> $this->input->post('txtDesc'),
			'useYn'			=> "Y",
			'com_id'		=> $_SESSION['comId']
		);
		
		$dupCnt=0;
		if($this->input->post('txtCode') != $this->input->post('txtOldCode')){
			$dataCode = array(
				'pro_code'	=> $this->input->post('txtCode')
			);
			$productCode = $this->M_house->checkCodeHouse($dataCode);
			$dupCnt = intval($productCode[0]->total_rec);
		}
		
		if( $dupCnt > 0){
			echo "DUP";
		}else{
			if($this->input->post('houseId') != null && $this->input->post('houseId') != ""){
				//update data
				$data['pro_id'] = $this->input->post('houseId');
				$data['upUsr'] = $_SESSION['usrId'];
				$data['upDt'] = date('Y-m-d H:i:s');
				$this->M_house->update($data);
			}else{
				//insert data
				$data['pro_status'] = "F";
				$data['regUsr'] = $_SESSION['usrId'];
				$data['regDt'] = date('Y-m-d H:i:s');
				$this->M_house->insert($data);
			}
			echo 'OK';
		}
	}


	public function getBranchType(){
		$data["OUT_REC"] = $this->M_branch->selectBrandType();
		echo json_encode($data);
	}

	public function delete(){
		if(!$this->M_check_user->check()){
			redirect('/Login');
		}

		$delObj = $this->input->post('delObj');
		$cntDel = 0;
		for($i=0; $i<sizeof($delObj); $i++){
			
			$data = array(
				'pro_id'	=> $delObj[$i]['proId'],
				'useYn'		=> "N",
				'com_id'	=> $_SESSION['comId'],
				'upDt'		=> date('Y-m-d H:i:s'),
				'upUsr'		=> $_SESSION['usrId']
			);
			$this->M_house->update($data);
			$cntDel+=1;
		}
		echo $cntDel;
	}

	public function reOrderDate($input_date){
		$output_date = "";
		if($input_date != "" && $input_date != ""){
			$output_date = explode("-",$input_date)[2]."-".explode("-",$input_date)[1]."-".explode("-",$input_date)[0];
		}
		return $output_date;
	}
}

?>

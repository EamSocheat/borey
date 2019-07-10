<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Import extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model('M_login');
        $this->load->library('session');
        $this->load->model('M_check_user');
        $this->load->model('M_menu');
        $this->load->helper('form');
        $this->load->model('M_import');
        $this->load->model('M_common');
    }
    
    public function index(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $dataMenu['menu_active'] = "Import";
        $data['header'] = $this->load->view('v_header', $dataMenu, TRUE);
        $data['footer'] = $this->load->view('v_footer', NULL, TRUE);
        $data['iframe'] = $this->load->view('v_iframe', NULL, TRUE);
        
        $this->load->view('v_import',$data);
    }
    
    public function getCategoryData(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $dataSrch = array (
            'cat_id'    => $this->input->post('cat_id'),
            'cat_nm'    => $this->input->post('categoryNm'),
            'cat_nm_kh' => $this->input->post('categoryNmKh'),
            'limit'     => $this->input->post('limit'),
            'offset'    => $this->input->post('offset'),
        );
        
        $data["OUT_REC"]     = $this->M_category->selectCategoryData($dataSrch);
        $data["OUT_REC_CNT"] = $this->M_category->countCategoryData($dataSrch);
        echo json_encode($data);
    }
    
    public function save(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $catPhoto = "";
        if(!empty($_FILES['categFile']['name'])){
            $catPhoto = $this->M_common->uploadImage($_FILES['categFile'], 'categFile', './upload/stock/category', '/stock/category/');
        }
        
        $data = array(
            'cat_nm'		=> $this->input->post('txtCateNm'),
            'cat_nm_kh'		=> $this->input->post('txtCateNmKh'),
            'cat_photo'	    => $catPhoto,
            'cat_des'		=> $this->input->post('cateDescr'),
            'useYn'			=> "Y",
            'com_id'		=> $_SESSION['comId']
        );
        
        if($this->input->post('cat_id') != null && $this->input->post('cat_id') != ""){
            //update data
            $data['cat_id'] = $this->input->post('cat_id');
            $data['upUsr']  = $_SESSION['usrId'];
            $data['upDt']   = date('Y-m-d H:i:s');
            $this->M_category->updateCategoryDB($data);
            
        }else{
            //insert data
            $data['regUsr'] = $_SESSION['usrId'];
            $data['regDt']  = date('Y-m-d H:i:s');
            $this->M_category->insertCategoryDB($data);
            
        }
        
        echo 'OK';
    }
    
    public function delete(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $delObj = $this->input->post('delObj');
        $cntDel = 0;
        for($i=0; $i<sizeof($delObj); $i++){
            $cntActive = 0;
            
            //check stock table using import or not
            $dataCol = array(
                'tbl_nm' 		=> "tbl_product",
                'id_nm' 		=> "regUsr",
                'com_id' 		=> "com_id"
            );
            
            $dataVal = array(
                'id_val' 		=> $delObj[$i]['catId'],
                'com_val' 		=> $_SESSION['comId']
            );
            $chkData = $this->M_common->checkActiveRecord($dataCol,$dataVal);
            $cntActive += $chkData->active_rec;
            
            
            if($cntActive > 0){
                continue;
            }else{
                $data = array(
                    'cat_id'    => $delObj[$i]['catId'],
                    'useYn'		=> "N",
                    'com_id'	=> $_SESSION['comId'],
                    'upDt'		=> date('Y-m-d H:i:s'),
                    'upUsr'		=> $_SESSION['usrId']
                );
                $this->M_category->updateCategoryDB($data);
                $cntDel += 1;
            }
        }
        echo $cntDel;
    }
    
}

?>
<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class UserAccount extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model('M_login');
        $this->load->library('session');
        $this->load->model('M_check_user');
        $this->load->model('M_menu');
        $this->load->helper('form');
        $this->load->model('M_user_account');
        $this->load->model('M_common');
    }
    
    public function index(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $dataMenu['menu_active'] = "UserAccount";
        $data['header'] = $this->load->view('v_header', $dataMenu, TRUE);
        $data['footer'] = $this->load->view('v_footer', NULL, TRUE);
        $data['iframe'] = $this->load->view('v_iframe', NULL, TRUE);
        
        $this->load->view('v_user_account',$data);
    }    
    
    
    public function save(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
     
        $data = array(
            'bra_id' 		=> $this->input->post('txtBraId'),
            'pos_id' 		=> $this->input->post('txtPosId'),
            'sta_nm'		=> $this->input->post('txtStaffNm'),
            'sta_nm_kh'		=> $this->input->post('txtStaffNmKh'),
            'sta_gender'	=> $this->input->post('cboGender'),
            'sta_dob'		=> date('Y-m-d',strtotime($this->input->post('txtDob'))),
            'sta_addr'		=> $this->input->post('txtAddr'),
            'sta_phone1'	=> $this->input->post('txtPhone1'),
            'sta_phone2'	=> $this->input->post('txtPhone2'),
            'sta_email'		=> $this->input->post('txtEmail'),
            'sta_start_dt'	=> date('Y-m-d',strtotime($this->input->post('txtStartDate'))),
            'sta_end_dt'	=> date('Y-m-d',strtotime($this->input->post('txtStopDate'))),
            'sta_des'		=> $this->input->post('txtDes'),
            'useYn'			=> "Y",
            'com_id'		=> $_SESSION['comId']
        );
        
        if($this->input->post('staId') != null && $this->input->post('staId') != ""){
            //update data
            $data['sta_id'] = $this->input->post('staId');
            $data['upUsr'] = $_SESSION['usrId'];
            $data['upDt'] = date('Y-m-d H:i:s');
            $this->M_staff->update($data);
            
        }else{
            //insert data
            $data['regUsr'] = $_SESSION['usrId'];
            $data['regDt'] = date('Y-m-d H:i:s');
            $this->M_staff->insert($data);
            
        }
        
        echo 'OK';
        
    }
    
}

?>
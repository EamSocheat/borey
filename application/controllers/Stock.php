<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Stock extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model('M_login');
        $this->load->library('session');
        $this->load->model('M_check_user');
        $this->load->model('M_menu');
        $this->load->helper('form');
        $this->load->model('M_stock');
        $this->load->model('M_common');
    }
    
    public function index(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $dataMenu['menu_active'] = "Stock";
        $data['header'] = $this->load->view('v_header', $dataMenu, TRUE);
        $data['footer'] = $this->load->view('v_footer', NULL, TRUE);
        $data['iframe'] = $this->load->view('v_iframe', NULL, TRUE);
        
        $this->load->view('v_stock',$data);
    }    
    
    public function getStock(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $dataSrch = array(
            'limit'         => $this->input->post('perPage'),
            'offset'        => $this->input->post('offset'),
            'sto_id'        => $this->input->post('stoId'),
            'sto_nm'        => $this->input->post('stoNm'),
            'sto_nm_kh'     => $this->input->post('stoNmKh'),
            'bra_id'        => $this->input->post('braId'),
        );
        $data["OUT_REC"] = $this->M_stock->selectStock($dataSrch);
        $data["OUT_REC_CNT"] = $this->M_stock->countStock($dataSrch);
        echo json_encode($data);
    }
}

?>
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class PrintInv extends CI_Controller {
	public function __construct(){
		parent::__construct();
		$this->load->model('M_login');
		$this->load->library('session');
		$this->load->model('M_check_user');
		$this->load->model('M_menu');
		$this->load->helper('form'); 
		$this->load->model('M_branch');
		$this->load->model('M_common');
	}
	public function index(){
	    
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    $dataPrint = $this->input->post('printData');
	    $this->load->view('popup/v_print_inv',$dataPrint);
	}
	
	public function printInvBooking(){
	    
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    $dataPrint["printData"] = $this->input->post('printData');
	    //print_r($dataPrint[0]["base_url"]);
	    //echo $dataPrint1 = $dataPrint[0]["base_url"];
	    return $this->load->view('popup/v_print_inv',$dataPrint);
	}
}   

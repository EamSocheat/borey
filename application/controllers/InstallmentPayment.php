<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Bangkok");

class InstallmentPayment extends CI_Controller{
    public function __construct(){
        parent::__construct();
        $this->load->model('M_login');
        $this->load->library('session');
        $this->load->model('M_check_user');
        $this->load->model('M_menu');
        $this->load->helper('form');
        $this->load->model('M_contract');
        $this->load->model('M_common');
        $this->load->model('M_house');
        $this->load->model('M_sell');
        $this->load->model('M_sale_payment');
        $this->load->model('M_commission');
        $this->load->model('M_commission_setting');
        $this->load->model('M_staff');
        $this->load->model('M_installment');
        
    }
    
    
    
    public function index(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $dataMenu['menu_active'] = "InstallmentPayment";
        $data['header'] = $this->load->view('v_header', $dataMenu, TRUE);
        $data['footer'] = $this->load->view('v_footer', NULL, TRUE);
        $data['iframe'] = $this->load->view('v_iframe', NULL, TRUE);
        
        $this->load->view('v_installment_payment',$data);
    }
	public function getPaymentMethod(){
		$data["OUT_REC"] = $this->M_common->selectPaymentMethod();
        echo json_encode($data);
	}
	public function getSellDetail(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	   
	    $dataSrch = array(
	        'sell_id'        => $this->input->post('sellId'),
	    );
	    
	    $data["OUT_REC"] = $this->M_sell->selectSellDataDetail($dataSrch);
	    echo json_encode($data);
	}
	
	public function getContractType(){
	    if(!$this->M_check_user->check()){
	        redirect('/Login');
	    }
	    $data["OUT_REC"] = $this->M_contract->selectContractType();
	    echo json_encode($data);
	}
	
    public function getInstallment(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        $startDate = $this->input->post('txtSrchContSD');
        $endDate   = $this->input->post('txtSrchContED');
        
        if($startDate != null || $startDate != ""){
            $startDate = date('Y-m-d H:i:s',strtotime($startDate));
        }

        if($endDate != null || $endDate != ""){
            $endDate = date('Y-m-d H:i:s',strtotime($endDate));
        }
        

        $dataSrch = array(
            'limit'         => $this->input->post('perPage'),
            'offset'        => $this->input->post('offset'),
            'inst_id'        => $this->input->post('instId'),
            'sell_code'        => $this->input->post('txtSrchContCode'),
            'inst_start_dt'  => $startDate,
            'inst_end_dt'    => $endDate,
        	'srch_all'		=> $this->input->post('srchAll'),
            'pro_code'		=> $this->input->post('txtSrchProCode')
        );

        $data["OUT_REC"] = $this->M_installment->selectInstallmentData($dataSrch);
        $data["OUT_REC_CNT"] = $this->M_installment->countInstallmentData($dataSrch);
        echo json_encode($data);
    }

    public function saveSell(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $productArr = explode(",",$this->input->post('productArr'));
        $proPriceArr = explode(",",$this->input->post('proPriceArr'));
        
        
        $dataSell = array(
            'cus_id'        	=> $this->input->post('txtCusId'),
            'sell_total_price' => $proPriceArr[0],
            'sell_date'  	=> date('Y-m-d H:i:s',strtotime($this->input->post('txtContSD'))),
            'sell_des' 		=> $this->input->post('txtDesc'),      
        	'seller_id'        => $this->input->post('cboSeller'),
        	'rec_id'        => $this->input->post('cboReceiver'),
            'con_id'        => $this->input->post('txtContID'),
        	'con_type_id'        => $this->input->post('cboConType'),
            'sell_inst_yn'        => $this->input->post('txt_com_inst_yn'),
            //'sell_price_before_dis'        => $proPriceArr[0],
            //'sell_dis_amt'        => $this->input->post('txtDisCash'),
            //'sell_dis_per'        => $this->input->post('txtDisPer'),
        );
        
        $sell_id_save=0;

        //insert data
        $dataSell['useYn']  = 'Y';
        $dataSell['com_id'] = $_SESSION['comId'];
        $dataSell['regUsr'] = $_SESSION['usrId'];
        $dataSell['regDt']  = date('Y-m-d H:i:s');
     
        $sell_id = $this->M_sell->insert($dataSell);
        $old_sell_id = $sell_id;
        $sell_id_save =$sell_id;
        $max_id = (string)$sell_id;
        $zero   = '';
        for($i = strlen($max_id); $i <= 5; $i++){
            $zero = '0'.$zero;
        }
        $sell_id = $zero.$max_id;
        
        $dataUpdate = array(
        	'sell_code' => $sell_id,
        	'sell_id' => $old_sell_id,
        );
        $this->M_sell->update($dataUpdate);
        
       
        for($j=0; $j<sizeof($productArr);$j++){
        	$dataDetial = array();
        	
        	$dataDetial['sell_id']  = $old_sell_id;
        	$dataDetial['pro_id']  = $productArr[$j];
        	$dataDetial['pro_sell_price'] = floatval($proPriceArr[$j]);
        	$dataDetial['useYn']  = 'Y';
            $dataDetial['com_id'] = $_SESSION['comId'];
            $dataDetial['regUsr'] = $_SESSION['usrId'];
            $dataDetial['regDt']  = date('Y-m-d H:i:s');
            $this->M_sell->insertDetial($dataDetial);
        	
            $dataHouse = array();
            $dataHouse['pro_status'] = 'S';
            $dataHouse['pro_sale_price'] = 'S';
            $dataHouse['pro_id'] = $productArr[$j];
            $dataHouse['upUsr']  = $_SESSION['usrId'];
            $dataHouse['upDt']   = date('Y-m-d H:i:s');
       		
        	$this->M_house->update($dataHouse);
        	
        }
        /* 
        $sale_pay_code="";
        if($this->input->post('txtContID') != null && $this->input->post('txtContID') != ""){
            $sale_pay_code = "000002";
        }else{
            $sale_pay_code = "000001";
        }
        $dataSalePayment=array(
            'sell_id'        	=> $old_sell_id,
            'sale_pay_date'  	=> date('Y-m-d H:i:s',strtotime($this->input->post('txtContSD'))),
            'sale_pay_amt_per' => $this->input->post('txtPayPer'),
            'sale_pay_amt_cash' => $this->input->post('txtPayCash'),
            'sale_pay_tran_id' 		=> $this->input->post('txtTran'),
            'sale_pay_real_amount' 		=> $this->input->post('txtRealPayAmt'),
            'sale_pay_met_id'        => $this->input->post('cboPaymentMet'),
            'rec_id'        => $this->input->post('cboReceiver'),
            //'con_type_id'        => $this->input->post('cboConType'),
            'sale_pay_code'        => $sale_pay_code,
            'sale_pay_dis_per' => $this->input->post('txtDisPer'),
            'sale_pay_dis_cash' => $this->input->post('txtDisCash'),
        );
        $dataSalePayment['useYn']  = 'Y';
        $dataSalePayment['com_id'] = $_SESSION['comId'];
        $dataSalePayment['regUsr'] = $_SESSION['usrId'];
        $dataSalePayment['regDt']  = date('Y-m-d H:i:s');
        
        $pay_id = $this->M_sale_payment->insert($dataSalePayment);
         */
        
        //
        $dataSrchPos = array(
            'sta_id' 		=> $this->input->post('cboSeller'),
        );
        $dataSrchPro = array(
            'pro_id' 		=> $productArr[0],
        );
	    $dataPosition = $this->M_staff->selectStaffPosition($dataSrchPos);
	    $dataCategory = $this->M_staff->selectProductCategory($dataSrchPro);
	    
	    $dataSrchCommSet = array(
            'pos_id' 		=> $dataPosition[0]->pos_id,
	    	'cat_id' 		=> $dataCategory[0]->cat_id
        );
	    $dataCommSet = $this->M_commission_setting->selectCommissionSettingFormular($dataSrchCommSet);
	    if( floatval($dataCommSet[0]->comset_amt) > 0){
	    	$commi_amt=0;
	    	$commi_amt_ex=0;
	    	if($dataCommSet[0]->comset_type == "M"){
	    		$commi_amt = floatval($dataCommSet[0]->comset_amt);
	    	}else{
	    		$commi_amt = floatval($proPriceArr[$j]) * floatval($dataCommSet[0]->comset_amt)/100;
	    	}
	    	
	    	if($dataCommSet[0]->comset_type_ex == "M"){
	    		$commi_amt_ex = floatval($dataCommSet[0]->comset_amt_ex);
	    	}else{
	    		$commi_amt_ex = $commi_amt * floatval($dataCommSet[0]->comset_amt_ex)/100;
	    	}
	    	$datacommi=array(
	            'sell_id'        	=> $old_sell_id,
	    		'commi_amt'        	=> $commi_amt,
	    	    'commi_type'        	=> "S",
	        );
	        $datacommi['useYn']  = 'Y';
	        $datacommi['com_id'] = $_SESSION['comId'];
	        $datacommi['regUsr'] = $_SESSION['usrId'];
	        $datacommi['regDt']  = date('Y-m-d H:i:s');
	        $this->M_commission->insert($datacommi);
	        
	        $datacommex=array(
	            'sell_id'        	=> $old_sell_id,
	    		'commi_amt'        	=> $commi_amt_ex,
	            'commi_type'        	=> "A",
	            
	        );
	        $datacommex['useYn']  = 'Y';
	        $datacommex['com_id'] = $_SESSION['comId'];
	        $datacommex['regUsr'] = $_SESSION['usrId'];
	        $datacommex['regDt']  = date('Y-m-d H:i:s');
	        $this->M_commission->insert($datacommex);
	    }
	    
	    
	    
	    echo $sell_id_save;
    }
    
	public function savePayment(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        $data=array(
            'sell_id'        	=> $this->input->post('sellId')
        );
        $max_code_obj = $this->M_sale_payment->selectPaymentCode($data);
        $max_id_int = intval($max_code_obj[0]->sale_pay_code);
        $max_id = (string)$max_id_int;
        $zero   = '';
        for($i = strlen($max_id); $i <= 5; $i++){
            $zero = '0'.$zero;
        }
        $sale_pay_code = $zero.$max_id;
        
        $dataSalePayment=array(
            'sell_id'        	=> $this->input->post('sellId'),
            'sale_pay_date'  	=> date('Y-m-d H:i:s',strtotime($this->input->post('txtContSD'))),
            'sale_pay_amt_per' => $this->input->post('txtPayPer'),
            'sale_pay_amt_cash' => $this->input->post('txtPayCash'),
            'sale_pay_tran_id' 		=> $this->input->post('txtTran'),
            'sale_pay_met_id'        => $this->input->post('cboPaymentMet'),
            'rec_id'        => $this->input->post('cboReceiver'),
            'sale_pay_real_amount' 		=> $this->input->post('txtRealPayAmt'),
            'sale_pay_penalty'        => $this->input->post('txtPayPenalty'),
            'sale_pay_code'        => $sale_pay_code,
        );
        $dataSalePayment['useYn']  = 'Y';
        $dataSalePayment['com_id'] = $_SESSION['comId'];
        $dataSalePayment['regUsr'] = $_SESSION['usrId'];
        $dataSalePayment['regDt']  = date('Y-m-d H:i:s');
        
        $sell_id_save = $this->M_sale_payment->insert($dataSalePayment);

        echo $sell_id_save;
    }
    
    public function saveInstallment(){
     	
        $instObj = $this->input->post('instObj');
       
        $dataUpdate = array(
            'sell_id'    => $instObj[0]['sell_id'],
            'useYn'     => "N",
            'com_id'    => $_SESSION['comId'],
            'upDt'      => date('Y-m-d H:i:s'),
            'upUsr'     => $_SESSION['usrId']
        );
        $this->M_installment->updateBySell($dataUpdate);
        
        $cntInsert = 0;
        for($i = 0; $i<sizeof($instObj); $i++){
            $data = array(
                    'sell_id'    =>  $instObj[0]['sell_id'],
                    'inst_num'    => $instObj[$i]['inst_num'],
            		'inst_type'    => $instObj[$i]['inst_type'],
		            'inst_date'    => date('Y-m-d H:i:s',strtotime($instObj[$i]['inst_date'])),
		            'inst_amt_principle'    => $instObj[$i]['inst_amt_principle'],
		            'inst_amt_interest'    => $instObj[$i]['inst_amt_interest'],
            		'inst_amt_balance'    => $instObj[$i]['inst_amt_balance'],
		            'inst_amt_pay'    => $instObj[$i]['inst_amt_pay'],
		            'inst_loan_amount'    => $instObj[$i]['loan_amount'],
		            'inst_first_installment_date'    => date('Y-m-d H:i:s',strtotime($instObj[$i]['first_inst_date'])),
		            'inst_period_month'    => $instObj[$i]['inst_period'],
            		'inst_interest_rate'    => $instObj[$i]['interest_rate'],
                    'inst_pay_per'    => $instObj[$i]['inst_pay_per'],
                    'inst_dis_amt'    => $instObj[$i]['inst_dis_amt'],
                    'inst_dis_per'    => $instObj[$i]['inst_dis_per'],
                    'useYn'     => "Y",
                    'com_id'    => $_SESSION['comId'],
                    'regDt'      => date('Y-m-d H:i:s'),
                    'regUsr'     => $_SESSION['usrId']
            );
            $this->M_installment->insert($data);
            $cntInsert += 1;
        }
        echo $cntInsert;
    }

    public function udpateStatus(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }

        $cntDel = 0;
        if($this->input->post('contId') != null && $this->input->post('contId') != ""){
            //update data
            $data['con_id'] = $this->input->post('contId');
            $data['con_sta']   = $this->input->post('statusID');
            $data['upUsr']  = $_SESSION['usrId'];
            $data['upDt']   = date('Y-m-d H:i:s');
            $data['com_id'] = $_SESSION['comId'];
            $this->M_contract->update($data);
            $cntDel = 1;
        }

        echo $cntDel;
    }

    public function delete(){
        if(!$this->M_check_user->check()){
            redirect('/Login');
        }
        
        $delObj = $this->input->post('delObj');
        $cntDel = 0;
        for($i = 0; $i<sizeof($delObj); $i++){
            $data = array(
                    'con_id'    => $delObj[$i]['contId'],
                    'useYn'     => "N",
                    'com_id'    => $_SESSION['comId'],
                    'upDt'      => date('Y-m-d H:i:s'),
                    'upUsr'     => $_SESSION['usrId']
            );
            $this->M_contract->update($data);
            $cntDel += 1;
        }
        echo $cntDel;
    }

    

    function commaAmt($str){
        $str = (int)$str;
        return number_format($str);
    }

    function showPeriod($y,$m){
        $strPer = '';
        if(($y != null && $y != 0) && ($m != null && $m != 0)){
            $strPer = $this->showYear($y) . $this->showMonth($m);
        }else if($y != null && $y != 0){
            $strPer = $this->showYear($y);
        }else if($m != null && $m != 0){
            $strPer = $this->showMonth($m);
        }else{
            $strPer = '';
        }
        return $strPer;
    }

    function showYear($y){
        $year = '';
        if($y > 1){
            $year = $y." Years ";
        }else{
            $year = $y." Year ";
        }
        return $year;
    }

    function showMonth($m){
        $month = '';
        if($m > 1){
            $month = $m." Months";
        }else{
            $month = $m." Month";
        }
        return $month;
    }

}

?>
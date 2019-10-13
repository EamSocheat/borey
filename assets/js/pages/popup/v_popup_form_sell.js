var _btnId;
var _this;
var _amountLeft;
var _amountPay;
var _loanAmount;
var _firstInstDate;
var _instPeriod;
var _interestRate;
var _winPrintPaySch;
$(document).ready(function() {
	_thisPage.init();
});

var _thisPage = {
		init : function(){
			_this = this;
			_this.onload();
			_this.event();
		},
		onload : function(){
			parent.$("#loading").hide();
			//
			getStaff();
			getPaymentMethod();
			stock.comm.inputCurrency("txtPayPer");
			stock.comm.inputCurrency("txtPayCash");
			stock.comm.inputCurrency("txtDisPer");
			stock.comm.inputCurrency("txtDisCash");
			stock.comm.inputCurrency("txtPayPenalty");
			stock.comm.inputCurrency("txtInterstRate");
			stock.comm.inputNumber("txtPeriod");
			stock.comm.inputNumber("txtPayTime");
			stock.comm.inputNumber("pro_time_build");
			
			getContractType();
			//stock.comm.inputCurrency("lAmt");
			
			//
			$('#txtContSD').datepicker({
				language: "kh",
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
		    });
			$("#txtContSD").inputmask();
			
			//
			//
			$('#txtStartInstDate').datepicker({
				language: "kh",
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
		    });
			$("#txtStartInstDate").inputmask();
			
			//
			stock.comm.todayDate("#txtContSD","-");
			if($("#frmAct").val() == "U"){
			    getDataEdit($("#sellId").val());
			    $("#lAmt").attr("readonly","readonly");
			    $("#popupTitle").html("<i class='fa fa-shopping-cart'></i> "+$.i18n.prop("btn_edit")+" ការលក់");
			    getInstallmentData();
			}else{
			    $("#btnSaveNew").show();			    
			    $("#popupTitle").html("<i class='fa fa-shopping-cart'></i> "+$.i18n.prop("btn_add_new")+" ការល​ក់" );
			    /*
			    $( "#cboInstYn" ).trigger( "click" );
			    $(".div_installment").show();*/
			}
			
			//stock.comm.todayDate("#txtStartInstDate","-");
			$("#frmSell").show();
			$("#braNm").focus();						
			stock.comm.inputPhoneKhmer("txtPhone1");
			stock.comm.inputPhoneKhmer("txtPhone2");
			
			
			
		},
		event : function(){
			//
			$("#btnClose,#btnExit").click(function(e){
				//parent.$("#modalMd").modal('hide');
				parent.stock.comm.closePopUpForm("PopupFormSell",parent.popupContractCallback);
				parent.$("#msgErr").hide();
			});
			//
			$("#frmSell").submit(function(e){
				e.preventDefault();
				if(_btnId == "btnSave"){
			    	saveData();
				}else if(_btnId == "btnAddPayment" ){
					savePaymentData();
				}else{
			    	saveData("new");
				}
			
			});
			//
			$("#btnAddPayment").click(function(e){
				_btnId = $(this).attr("id");
				
			});
			//
			$("#btnSave").click(function(e){
				_btnId = $(this).attr("id");
				
			});
			//
			$("#btnSaveNew").click(function(e){
				_btnId = $(this).attr("id");
				
			});
			//
			$("#btnSelectPhoto").click(function(e){
				$("#fileContPhoto").trigger( "click" );
				
			});
			//
			$("#fileContPhoto").change(function(){
			    readURL(this);
			});
			//
			//
			$("#btnPopupCusch").click(function(e){
				var data="parentId=ifameStockForm";
				data+="&dataSrch="+$("#txtCusNm").val();
				var controllerNm = "PopupSelectCustomer";
				var option={};
				option["height"] = "445px";
			    stock.comm.openPopUpSelect(controllerNm,option, data,"modal-md");
			});
			//
			$("#btnPopupPosition").click(function(e){
				var data = "parentId=ifameStockForm";
				data+="&dataSrch="+$("#txtPosNm").val();
				var controllerNm = "PopupSelectPosition";
				var option = {};
				option["height"] = "445px";
			    stock.comm.openPopUpSelect(controllerNm,option, data,"modal-md");
			});
			//
			$("#btnCal").click(function(e){
				//resetEmi();
				calculateEMI();
			});
			//
			$("#btnReset").click(function(e){
				resetEmi();
			});
			//
			$("#txtContSDIcon").click(function(e){
				$(this).next().focus();
			});
			//
			$("#btnStatusActive, #btnStatusClose").click(function(e){
				var statusID = $("#statusID").val();
				if(statusID == "0" || statusID == 0){
					top.stock.comm.confirmMsg($.i18n.prop("msg_sure_close"));
				}else{
					top.stock.comm.confirmMsg($.i18n.prop("msg_sure_active"));
				}
				
				top.$("#btnConfirmOk").unbind().click(function(e){
					top.$("#mdlConfirm").modal('hide');
					updateContractStatus(statusID);
				});
			});

			$("input").focus(function(){
				$("#lRate").css("border","1px solid #d2d6de");
			});
			
			//
			$("#btnSelectPro").click(function(e){
				var data="parentId=ifameStockForm";
				//data+="&dataSrch="+$("#txtCusNm").val();
				var controllerNm = "PopupSelectProduct";
				var option={};
				option["height"] = "460px";
			    stock.comm.openPopUpSelect(controllerNm,option, data,"modal-md");
			});
			
			
			$("#btnReturn").click(function(e){
				top.stock.comm.confirmMsg("តើអ្នកប្រាកដថា ត្រលប់ប្រាក់ ទៅអតិថិជនមែនទេ ?");
				
				top.$("#btnConfirmOk").unbind().click(function(e){
					top.$("#mdlConfirm").modal('hide');
					updateContractStatus("C");
				});
			});
			
			
			$("#btnExp").click(function(e){
				top.stock.comm.confirmMsg("តើអ្នកប្រាកដថា ផុតកំណត់មែនទេ ?");
				
				top.$("#btnConfirmOk").unbind().click(function(e){
					top.$("#mdlConfirm").modal('hide');
					updateContractStatus("E");
				});
			});
			
			$("#btnOpen").click(function(e){
				top.stock.comm.confirmMsg("តើអ្នកប្រាកដថា បានកក់មែនទេ ?");
				
				top.$("#btnConfirmOk").unbind().click(function(e){
					top.$("#mdlConfirm").modal('hide');
					updateContractStatus("F");
				});
			});
			
			//
			$("#btnPrint").click(function(e){
				printPaymentShedule($("#sellId").val());
				printContractBuy($("#sellId").val());
			});
			
			//
			$("#btnContractSrch").click(function(e){
				getContractInfo($("#txtContract").val());
			});
			
			//
			$("#txtDisPer").keyup(function(e){
				calDiscount("P");
				if($(this).val() =="" || $(this).val() ==null){
					$("#txtDisCash").val("");
				}
			});
			
			//
			$("#txtDisCash").keyup(function(e){
				calDiscount("C");
				if($(this).val() =="" || $(this).val() ==null){
					$("#txtDisPer").val("");
				}
			});
			
			//
			$("#txtPayPer").keyup(function(e){
				calPay("P");
				if($(this).val() =="" || $(this).val() ==null){
					$("#txtPayCash").val("");
				}
			});
			
			//
			$("#txtPayCash").keyup(function(e){
				calPay("C");
				if($(this).val() =="" || $(this).val() ==null){
					$("#txtPayPer").val("");
				}
			});
			
			//
			$("#txtPayPenalty").keyup(function(e){
				var newTotal=0
				if($(this).val().replace(/,/g,"") !=""){
					newTotal=_amountPay+parseFloat($(this).val().replace(/,/g,""));
				}else{
					newTotal = _amountPay;
				}
				$("#txtRealPayAmt").val(stock.comm.formatCurrency(newTotal.toFixed(2)));
			});
			//
			$("#btnCalInst").click(function(e){
				calculatePaySchedule();
				if ($("#cboInstYn").prop("checked")) {
					$("#txt_com_inst_yn").val("Y");
			    }else{
			    	$("#txt_com_inst_yn").val("N");
			    }
			});
			//
			$("#txtInterstRate").keyup(function(e){
				parent.$("#msgErr").hide();
			});
			//
			$("#txtPeriod").keyup(function(e){
				parent.$("#msgErr").hide();
			});
			//
			$("#txtStartInstDate").change(function(e){
				parent.$("#msgErr").hide();
			});
			//
			$("#btnSaveInstallment").click(function(e){
				saveInstallment();
			});
			//
			$("#btnUpdateInstallment").click(function(e){
				
				parent.stock.comm.confirmMsg("តើអ្នកប្រាកដជាចង់កែប្រែ មែនឫទេ ?");
				parent.$("#btnConfirmOk").unbind().click(function(e){
					parent.$("#mdlConfirm").modal('hide');
					saveInstallment();
				});
			});
			
			//
			/*$("#cboInstYn").change(function(e){
				
				//calculatePaySchedule();
				if ($(this).prop("checked")) {
					$(".div_installment").show();
			    }else{
			    	$(".div_installment").hide();
			    	parent.$("#msgErr").hide();
			    }
			});
			*/
			//
			$("#txtPayPer").keyup(function(e){
				parent.$("#msgErr").hide();
			});
			//
			$("#txtPayCash").keyup(function(e){
				parent.$("#msgErr").hide();
			});
			//
			$("#txtPayTime").change(function(e){
				parent.$("#msgErr").hide();
			});
			
			//
			$("#cboConType").change(function(e){
				if($("#cboConType option:selected").attr("data-inst-com") =="Y"){
					$( "#cboInstYn" ).prop("checked",true);
					$("#txt_com_inst_yn").val("Y");
				    $(".div_installment").show();
				}else{
					$( "#cboInstYn" ).prop("checked",false);
				    $(".div_installment").hide();
				    $("#txt_com_inst_yn").val("N");
				}
			});
			
		}
};


function getContractInfo(cont_code){
	if(cont_code == "" || cont_code == null){
		$("#txtContract").focus();
		return;
	}
	parent.$("#loading").hide();
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Contract/getContractDetail",
		data: {"proCode":cont_code,"conSta":"B"},
		dataType: "json",
		async: false,
		success: function(res) {
			
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				var status = res.OUT_REC[0]["con_sta"];
				$("#txtContID").val(res.OUT_REC[0]["con_id"]);
				$("#txtBookDate").val(moment(res.OUT_REC[0]["con_date"], "YYYY-MM-DD").format("DD-MM-YYYY"));
				$("#txtBookingAmt").val(stock.comm.formatCurrency(res.OUT_REC[0]["con_total_price"]));
				
			    $("#txtCusNm").val(res.OUT_REC[0]["cus_nm_kh"]);
			    $("#txtCusId").val(res.OUT_REC[0]["cus_id"]);
			    $("#txtCusPhone").val(res.OUT_REC[0]["cus_phone1"]);
			    
			    $("#cboSeller").val(res.OUT_REC[0]["seller_id"]);
			   //$("#cboReceiver").val(res.OUT_REC[0]["rec_id"]);
			    //$("#txtTran").val(res.OUT_REC[0]["con_tran_id"]);
			    $("#txtDesc").val(res.OUT_REC[0]["con_des"]);
			    //$("#cboPaymentMet").val(res.OUT_REC[0]["con_pay_met"]);
			   $("#txtAmtBooking").val(stock.comm.formatCurrency(res.OUT_REC[0]["con_total_price"]));
		    	$("#cboConType").val(res.OUT_REC[0]["con_type_id"]);
		    	
			    $("#btnSelectPro").hide();
		    	
			    $("#divEnd1").show();
		    	$("#divEnd2").show();
			    $("#divEnd3").show();
			 
			    $("#tblProduct tbody").html("");
			    var totalAmount = 0;
			    for(var i=0;i<res.OUT_REC.length; i++){
			    	
					var rec = res.OUT_REC[i];
					var html = "<tr data-id='"+rec["pro_id"]+"'>";
			        html += "<td class='pro_code cur-pointer'>"+rec["pro_code"]+"</td>";
			        html += "<td class='cat_nm cur-pointer'>"+rec["cat_nm"]+"</td>";
			        html += "<td class='bra_nm cur-pointer'>"+rec["bra_nm"]+"</td>";
			        html += "<td class='pro_time_build cur-pointer'><input id='pro_time_build' class='form-control input-sm' style='height: 25px;' value='' required='required'></td>";
			        html += "<td class='pro_price_desc cur-pointer'><input class='text-right'style='border: none;background-color: #ffffff;' value='"+rec["pro_book_price_desc"]+"' required='required'></td>";
			        html += "<td class='pro_price cur-pointer text-right'> <input class='text-right' id='pro_price' style='border: none;background-color: #ffffff;' value='"+stock.comm.formatCurrency(rec["pro_book_price"])+"' required='required'></td>";
			        html += "</tr>";
			        
			        $("#tblProduct tbody").append(html);
			        totalAmount+= parseFloat(rec["pro_book_price"]);
			    }
			    
			    var amtLeft = totalAmount - parseFloat(res.OUT_REC[0]["con_total_price"]);
			    $("#txtLeftAmount").val(stock.comm.formatCurrency(amtLeft));
			    //$("#tblProduct tbody").append("<tr><td class='text-right' colspan='3'><b>ប្រាក់ដើមនៅសល់៖</b></td><td class='text-right'>"+ stock.comm.formatCurrency(amtLeft) +"</td></tr>");
			    
			    //$("#txtRealPayAmt").val(stock.comm.formatCurrency(totalAmount));
				$("#txtTotalLeft").val(stock.comm.formatCurrency(amtLeft));
				
			    $("#frmSell input,#frmSell textarea,#frmSell select").prop("disabled",true);
			    $("#pro_time_build,#txtPayCashDesc,#txtTotalLeftInstDesc,#cboConType,#txtDesc,#txtDisCash,#txtDisPer,#txtContSD,#cboReceiver,#txtPayPer,#txtPayCash,#txtContID,#cboPaymentMet,#txtTran,#txtPayTime,#cboInstYn,#txtInterstRate,#txtPeriod,#txtStartInstDate").prop("disabled",false);
			    
			    
			    if(res.OUT_REC[0]["con_type_inst_com_yn"] =="Y"){
					$( "#cboInstYn" ).prop("checked",true);
					$("#txt_com_inst_yn").val("Y");
				    $(".div_installment").show();
				}else{
					$( "#cboInstYn" ).prop("checked",false);
				    $(".div_installment").hide();
				    $("#txt_com_inst_yn").val("N");
				}
			    
			    //calDiscount("P");
			    calPay("P");
			    stock.comm.inputNumber("pro_time_build");
			    $("#pro_time_build").focus();
			}else{
			   parent.stock.comm.alertMsg("មិនមានការកក់ប្រាក់នេះ  ឫបានលក់ហើយ!!!");
			}
			parent.$("#loading").hide();
		},
		error : function(data) {
		    console.log(data);
		    stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}

function saveData(str){
	$("#sellId").appendTo("#frmSell");    
    
    var isCusomterEmpty = $("#txtCusNm").val().trim();
   if(stock.comm.isNull(isCusomterEmpty) || stock.comm.isEmpty(isCusomterEmpty)){
	   showCustomerErr();
	   return;
    }
       
    var productChk=$("#tblProduct tbody tr");
    if(productChk.length < 1){
    	showProductErr();
    	return;
    }
   	var productArr=[];
   	var productPriceArr=[];
	var productPriceDescArr=[];
	var productTimeBuildArr=[];
   	productChk.each(function(i){
   		productArr.push(parseInt($(this).attr("data-id")));
   		productPriceArr.push($("#pro_price").val().replace(/,/g,''));
   		productPriceDescArr.push($(this).find("td.pro_price_desc input").val());
   		productTimeBuildArr.push($(this).find("td.pro_time_build input").val());
   	});
   	var instRecord = $('#tblInstallment tbody tr');
	if(instRecord == null || instRecord == undefined || instRecord.length <=0 ){
		parent.stock.comm.alertMsg("សូមគណនាជាមុនសិន រួចព្យាយាមម្តងទៀត");
		return;
	}
	
	//
	$("#txtPayCash").val($("#txtPayCash").val().replace(/,/g,''));
	//$("#txtRealPayAmt").val($("#txtRealPayAmt").val().replace(/,/g,''));
	//$("#txtPayPenalty").val($("#txtPayPenalty").val().replace(/,/g,''));
	
	//$("#txtDisPer").val($("#txtDisPer").val().replace(/,/g,''));
	//$("#txtDisCash").val($("#txtDisCash").val().replace(/,/g,''));
	$("#txtTotalLeftInst").val($("#txtTotalLeftInst").val().replace(/,/g,''));
	
	$("#txtCusNm").css("border-color","#ced4da");
	$("#btnSelectPro").css("border-color","#ced4da");
	$("#frmSell input,#frmSell textarea,#frmSell select").prop("disabled",false);
	
	parent.$("#msgErr").hide();
	
	$.ajax({
		type : "POST",
		url  : $("#base_url").val() +"Sell/saveSell",
		data: $("#frmSell").serialize()+"&productArr="+productArr+"&proPriceArr="+productPriceArr+"&productPriceDescArr="+productPriceDescArr+"&productTimeBuildArr="+productTimeBuildArr,
		success: function(res) {
		    parent.$("#loading").hide();
			if(res !=""){
				saveInstallment(res,str);
				
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}



function savePaymentData(str){
	$("#sellId").appendTo("#frmSell");    
    
    var isCusomterEmpty = $("#txtCusNm").val().trim();
   if(stock.comm.isNull(isCusomterEmpty) || stock.comm.isEmpty(isCusomterEmpty)){
	   showCustomerErr();
	   return;
    }
       
    var productChk=$("#tblProduct tbody tr");
    if(productChk.length < 1){
    	showProductErr();
    	return;
    }
   	var productArr=[];
   	var productPriceArr=[];
   	productChk.each(function(i){
   		productArr.push(parseInt($(this).attr("data-id")));
   		productPriceArr.push($("#pro_price").val().replace(/,/g,''));
   	});
   	
	//
	$("#txtPayCash").val($("#txtPayCash").val().replace(/,/g,''));
	$("#txtRealPayAmt").val($("#txtRealPayAmt").val().replace(/,/g,''));
	
	$("#txtDisPer").val($("#txtDisPer").val().replace(/,/g,''));
	$("#txtDisCash").val($("#txtDisCash").val().replace(/,/g,''));
	
	$("#txtCusNm").css("border-color","#ced4da");
	$("#btnSelectPro").css("border-color","#ced4da");
	$("#frmSell input,#frmSell textarea,#frmSell select").prop("disabled",false);
	
	parent.$("#msgErr").hide();
	
	$.ajax({
		type : "POST",
		url  : $("#base_url").val() +"Sell/savePayment",
		data: $("#frmSell").serialize()+"&productArr="+productArr+"&proPriceArr="+productPriceArr ,
		success: function(res) {
		    parent.$("#loading").hide();
			if(res !=""){
				//parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"braNm");
				parent.stock.comm.confirmMsg($.i18n.prop("msg_save_com")+" \nតើអ្នកចង់បោះពុម្ពដែរឫទេ ?");
				parent.$("#btnConfirmOk").unbind().click(function(e){
					parent.$("#mdlConfirm").modal('hide');
					printInv($("#sellId").val(),res);
				});
								
				parent.stock.comm.closePopUpForm("PopupFormSell",parent.popupContractCallback);
				parent.$("#msgErr").hide();
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}


function updateContractStatus(status){
	var input = {};
	input["sellId"] = $("#sellId").val();
	input["statusID"] = status;
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Contract/udpateStatus",
		data: input,
		dataType: "json",
		success: function(res) {
			
		    if(res > 0){
		    	
		    	parent.stock.comm.alertMsg("ការកំណត់បាន ជោគជ័យ");
				parent.stock.comm.closePopUpForm("PopupFormSell",parent.popupContractCallback);
			}else{
				stock.comm.alertMsg($.i18n.prop("msg_err_del"));
		        return;
			}
		    $("#loading").hide();
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}

function getDataEdit(cont_id){
	$("#btnSave").remove();
    //
    $("#loading").show();
    $.ajax({
		type: "POST",
		url : $("#base_url").val() +"Sell/getSellDetail",
		data: {"sellId":cont_id},
		dataType: "json",
		async: false,
		success: function(res) {
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#btnContractSrch").remove();
				//$("#txtContract").css("width","260px");
				$("#txtContract").css("border-radius","5px");
				$("#btnPrint").show();
				$("#btnCalInst").remove();
				//$("#balanceLeft").text( $.i18n.prop("lb_pay_balance") +" : "+ stock.comm.formatCurrency(res.OUT_REC[0]["loan_amount_left"])+res.OUT_REC[0]["cur_syn"]);	
				$("#contractNo").text( "លេខសម្គាល់ការលក់" +" : "+ res.OUT_REC[0]["sell_code"]);		
				
			    $("#txtCusNm").val(res.OUT_REC[0]["cus_nm_kh"]);
			    $("#txtCusId").val(res.OUT_REC[0]["cus_id"]);
			    $("#txtCusPhone").val(res.OUT_REC[0]["cus_phone1"]);
			    $("#txtBookDate").val(res.OUT_REC[0]["con_date"] == null ? "" : moment(res.OUT_REC[0]["con_date"], "YYYY-MM-DD").format("DD-MM-YYYY"));
			    $("#cboSeller").val(res.OUT_REC[0]["seller_id"]);
			    //$("#cboReceiver").val(res.OUT_REC[0]["rec_id"]);
			    $("#txtDesc").val(res.OUT_REC[0]["sell_des"]);
			    $("#txtBookingAmt").val(stock.comm.formatCurrency(res.OUT_REC[0]["con_total_price"]));
			    if($("#txtBookingAmt").val() != ""){
			    	$("#txtContract").val(res.OUT_REC[0]["pro_code"]);
			    }else{
			    	$("#txtContract").val(" ");
			    	//$("#conDivInfo2").css("margin-top","0px");
			    }
			    
		    	$("#cboConType").val(res.OUT_REC[0]["sell_con_type_id"]);
		    	
		    	$("#txtContSD").val(res.OUT_REC[0]["sell_date"] == null ? "" : moment(res.OUT_REC[0]["sell_date"], "YYYY-MM-DD").format("DD-MM-YYYY"));
			    $("#btnSelectPro").hide();
			    $("#txtPayCashDesc").val(res.OUT_REC[0]["pro_sell_adv_price_desc"]);
			    $("#txtTotalLeftInstDesc").val(res.OUT_REC[0]["pro_sell_balance_price_desc"]);
			    
			    /*
			    $("#txtRealPayAmt").val(stock.comm.formatCurrency(res.OUT_REC[0]["sell_total_price"]));
			    $("#txtDisPer").val(res.OUT_REC[0]["sell_dis_per"]);
			    $("#txtDisCash").val(stock.comm.formatCurrency(res.OUT_REC[0]["sell_dis_amt"]))
		    	*/
			    
			    $("#divEnd1").show();
		    	$("#divEnd2").show();
			    $("#divEnd3").show();
			 
			    $("#tblProduct tbody").html("");
			   	var rec = res.OUT_REC[0];
				var html = "<tr data-id='"+rec["pro_id"]+"'>";
		        html += "<td class='pro_code cur-pointer'>"+rec["pro_code"]+"</td>";
		        html += "<td class='cat_nm cur-pointer'>"+rec["cat_nm_kh"]+"</td>";
		        html += "<td class='bra_nm cur-pointer'>"+rec["bra_nm_kh"]+"</td>";
		        html += "<td class='pro_time_build cur-pointer'><input id='pro_time_build' style='border: none;background-color: #ffffff;' value='"+rec["pro_sell_time_build"]+"'></td>";
		        html += "<td class='pro_price_desc cur-pointer'>"+rec["pro_sell_price_desc"]+"</td>";
		        html += "<td class='pro_price cur-pointer text-right' style='    padding-right: 25px;'><input class='text-right' id='pro_price' style='border: none;background-color: #ffffff;' value='"+stock.comm.formatCurrency(rec["sell_total_price"])+"'/></td>";
		        html += "</tr>";
		        $("#tblProduct tbody").append(html);
		        
		        if(res.OUT_REC[0]["sell_inst_yn"] =="Y"){
		        	$(".div_installment").show();
		        	$("#cboInstYn").prop("checked",true);
		        }
			    $("#frmSell input,#frmSell textarea,#frmSell select").prop("disabled",true);
			    $("#txtPayCashDesc,#txtTotalLeftInstDesc,#txtContSD,#cboReceiver,#txtPayPer,#txtPayCash,#cboPaymentMet,#txtTran,#txtDisPer,#txtDisCash,#txtPayPenalty,#txtInterstRate,#txtPeriod,#txtStartInstDate,#txtPayTime").prop("disabled",false);
			}else{
			    console.log(res);
			    stock.comm.alertMsg($.i18n.prop("msg_err"));
			}
			$("#loading").hide();
		},
		error : function(data) {
		    console.log(data);
		    stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});

}

function clearForm(){
    $("#frmSell input").val("");
    $("#frmSell textarea").val("");
    $("#staImgView").attr("src",$("#base_url").val()+"assets/image/default-staff-photo.png");
    $("#txtContractNm").focus();
    $("#tblProduct tbody").html("");
}

function selectCustomerCallback(data){
	
	$("#txtCusNm").val(data["cus_nm"].replace(/amp;/g,''));		
	
	$("#txtCusId").val(data["cus_id"]);
	$("#txtCusPhone").val(data["cus_phone1"]);
	
	$("#txtCusNm").css("border-color","#ced4da");
	parent.$("#msgErr").hide();
	
}

function selectPositionCallback(data){
	$("#txtPosNm").val(data["pos_nm"]);
	$("#txtPosId").val(data["pos_id"]);
	
}

function selectProductCallback(data){
	$("#tblProduct tbody").html("");
	if(data["data"] != null && data["data"] != undefined  && data["data"].length >0){
		for(var i=0; i<data["data"].length;i++){
			var rec = data["data"][i];
			var html = "<tr data-id='"+rec["pro_id"]+"'>";
	        html += "<td class='pro_code cur-pointer'>"+rec["pro_code"]+"</td>";
	        html += "<td class='cat_nm cur-pointer'>"+rec["cat_nm"]+"</td>";
	        html += "<td class='bra_nm cur-pointer'>"+rec["bra_nm"]+"</td>";
	        html += "<td class='pro_time_build cur-pointer'><input id='pro_time_build' class='form-control input-sm' value='' required='required'></td>";
	        html += "<td class='pro_price_desc cur-pointer'><input id='pro_price_desc' class='form-control input-sm text-right' type='text' required='required'></td>";
	        html += "<td class=' cur-pointer'><input id='pro_price' class='form-control text-right pro_price input-sm' type='text' value ='"+rec["pro_price"]+"' required='required'></td>";
	        html += "</tr>";
	        
	        $("#tblProduct tbody").append(html);
		}
		stock.comm.inputCurrency("pro_price");
		stock.comm.inputNumber("pro_time_build");
		$("#pro_time_build").focus();
	}
	
	$("#btnSelectPro").css("border-color","#ced4da");
	//calDiscount("P");
	parent.$("#msgErr").hide();
	
}



/**
 * 
 * @returns
 */
function getStaff(){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Staff/getStaff",
		dataType: 'json',
		async: false,
		success: function(res) {
			if(res.OUT_REC.length > 0){
				$("#cboSeller option").remove();
				$("#cboSeller").append("<option value=''>សូមជ្រើសរើសបុគ្គលិក</option>");
				
				for(var i=0; i<res.OUT_REC.length; i++){
					var braNm = res.OUT_REC[i]["sta_nm_kh"];
					$("#cboSeller").append("<option value='"+res.OUT_REC[i]["sta_id"]+"'>"+braNm+"</option>");
					
				}
				
			}else{
				console.log(res);
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
}

/**
 * 
 * @returns
 */
function getPaymentMethod(){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Contract/getPaymentMethod",
		dataType: 'json',
		async: false,
		success: function(res) {
			if(res.OUT_REC.length > 0){
				$("#cboPaymentMet option").remove();
				$("#cboPaymentMet").append("<option value=''>សូមជ្រើសរើសវីធីបង់ប្រាក់</option>");
				
				for(var i=0; i<res.OUT_REC.length; i++){
					var braNm = res.OUT_REC[i]["met_nm_kh"];
					$("#cboPaymentMet").append("<option value='"+res.OUT_REC[i]["met_id"]+"'>"+braNm+"</option>");
				}
				
			}else{
				console.log(res);
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
}

function getContractType(){
	
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Contract/getContractType",
		dataType: 'json',
		async: false,
		success: function(res) {
			if(res.OUT_REC.length > 0){
				$("#cboConType option").remove();
				$("#cboConType").append("<option value=''>សូមជ្រើសប្រភេទកិច្ចសន្យា</option>");
				
				for(var i=0; i<res.OUT_REC.length; i++){
					var braNm = res.OUT_REC[i]["con_type_nm_kh"];
					$("#cboConType").append("<option data-inst-com='"+res.OUT_REC[i]["con_type_inst_com_yn"]+"' value='"+res.OUT_REC[i]["con_type_id"]+"'>"+braNm+"</option>");
				}
				
			}else{
				console.log(res);
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
}

/**
 * 
 * @returns
 */
function getInstallmentData(){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Sell/getInstallment",
		dataType: 'json',
		data : {sellId:$("#sellId").val()},
		async: false,
		success: function(res) {
			if(res.OUT_REC.length > 0){
				//$("#btnUpdateInstallment").show();
				$("#btnSaveInstallment").remove();
				//$("#txtTotalLeftInst").val(stock.comm.formatCurrency(res.OUT_REC[0]["inst_loan_amount"]));
				//$("#txtPeriod").val(res.OUT_REC[0]["inst_period_month"]);
				//$("#txtInterstRate").val(res.OUT_REC[0]["inst_interest_rate"]);
				$("#txtStartInstDate").val(moment(res.OUT_REC[0]["inst_first_installment_date"], "YYYY-MM-DD").format("DD-MM-YYYY"));
				
				
				$("#tblInstallment tbody").html("");
				$("#tblInstallment thead tr").append("<th class='text-right' style='padding-right: 15px;'>បង់ប្រាក់</td>");
				var totalPayInterest = 0;
				var totalPayInstallment = 0;
				var checkPay="";
				var advPerPay=0;
				var advTimePay=0;
				var instLoanAmount =0;
				var checkBooked="";
				for(var i=0; i<res.OUT_REC.length; i++){
					if(res.OUT_REC[i]["inst_type"] =="ADV"){
						$("#txtPayCash").val(stock.comm.formatCurrency(res.OUT_REC[i]["inst_loan_amount"]));
						advPerPay += parseFloat(res.OUT_REC[i]["inst_pay_per"]);
						advTimePay+=1;
						$("#txtDisPer").val(res.OUT_REC[i]["inst_dis_per"] == 0? "" : res.OUT_REC[i]["inst_dis_per"]);
						$("#txtDisCash").val(res.OUT_REC[i]["inst_dis_amt"] == 0 ? "" : stock.comm.formatCurrency(res.OUT_REC[i]["inst_dis_amt"]));
					}
					
					if(res.OUT_REC[i]["inst_type"] =="LOAN"){
						$("#txtTotalLeftInst").val(stock.comm.formatCurrency(res.OUT_REC[i]["inst_loan_amount"]));
						$("#txtInterstRate").val(res.OUT_REC[i]["inst_interest_rate"]);
						$("#txtPeriod").val(res.OUT_REC[i]["inst_period_month"]);
						$("#monthlyPay").html("$ "+stock.comm.formatCurrency(res.OUT_REC[i]["inst_amt_pay"]));
						
						totalPayInterest += parseFloat(res.OUT_REC[i]["inst_amt_interest"]);
				        totalPayInstallment += parseFloat(res.OUT_REC[i]["inst_amt_interest"]);
				        instLoanAmount = parseFloat(res.OUT_REC[i]["inst_loan_amount"]);
					}
					if(res.OUT_REC[i]["inst_type"] =="LEFT"){
						$("#txtTotalLeftInst").val(stock.comm.formatCurrency(res.OUT_REC[i]["inst_loan_amount"]));
						
					}
					var statusPay="";
					if(res.OUT_REC[i]["inst_paid_yn"] == "Y"){
						statusPay='<span class="label label-primary">រួចរាល់</span>';
						checkPay="1";
					}else{
						statusPay=' - ​';
					}
					var percentPay=res.OUT_REC[i]["inst_pay_per"]+"%";
					
					if(res.OUT_REC[i]["inst_type"] =="BOOK"){
						percentPay="កក់ប្រាក់";
						checkBooked="បង្គ្រប់";
					}else if(res.OUT_REC[i]["inst_type"] =="LOAN"){
						percentPay="រំលស់";
					}else if(res.OUT_REC[i]["inst_type"] =="ADV"){
						percentPay=checkBooked+res.OUT_REC[i]["inst_pay_per"]+"%";
						checkBooked="";
					}else if(res.OUT_REC[i]["inst_type"] =="LEFT"){
						percentPay ="រំលស់ជាមួយធនាគារ"+res.OUT_REC[i]["inst_pay_per"]+"%";
					}
					var html = "<tr>";
					html += "<td class='inst_num cur-pointer '>"+res.OUT_REC[i]["inst_num"]+"</td>";
					html += "<td class='inst_date cur-pointer text-center'>"+moment(res.OUT_REC[i]["inst_date"], "YYYY-MM-DD").format("DD-MM-YYYY");+"</td>";
					html += "<td class='inst_pay_per cur-pointer text-center'>"+percentPay+"</td>";
					html += "<td class='inst_dis_amt cur-pointer text-right'>"+stock.comm.formatCurrency(res.OUT_REC[i]["inst_dis_amt"])+"$</td>";
					html += "<td class='inst_amt_principle cur-pointer text-right' >"+stock.comm.formatCurrency(res.OUT_REC[i]["inst_amt_principle"])+"$</td>";
			        html += "<td class='inst_amt_interest cur-pointer text-right'>"+stock.comm.formatCurrency(res.OUT_REC[i]["inst_amt_interest"])+"$</td>";
			        html += "<td class='inst_amt_pay​ cur-pointer text-right' >"+stock.comm.formatCurrency(res.OUT_REC[i]["inst_amt_pay"])+"$</td>";
			        html += "<td class='inst_amt_balance cur-pointer text-right' style='padding-right: 25px;'>"+stock.comm.formatCurrency(res.OUT_REC[i]["inst_amt_balance"])+"$</td>";
			        html += "<td class=' cur-pointer text-right'  style='padding-right: 15px;' >"+statusPay+"</td>";
			        html += "</tr>";
			        $("#tblInstallment tbody").append(html);
			        
				}
				$("#txtPayPer").val(stock.comm.formatCurrency(advPerPay));
				$("#txtPayTime").val(stock.comm.formatCurrency(advTimePay));
				$("#totalPayInterest").html("$ "+stock.comm.formatCurrency(totalPayInterest.toFixed(2)));
				$("#totalPayInstallment").html("$ "+stock.comm.formatCurrency( (totalPayInstallment+instLoanAmount).toFixed(2)));
				/*
				totalPayInstallment = parseFloat(res.OUT_REC[0]["inst_loan_amount"]) + totalPayInterest;
				$("#monthlyPay").html("$ "+stock.comm.formatCurrency(res.OUT_REC[0]["inst_amt_pay"]));
				
				
				if(checkPay == "1"){
					$("#btnCalInst").remove();
					$("#btnUpdateInstallment").remove();
				}
				
				_loanAmount = res.OUT_REC[0]["inst_loan_amount"];
				_firstInstDate = moment(res.OUT_REC[0]["inst_first_installment_date"], "YYYY-MM-DD").format("DD-MM-YYYY");
				_instPeriod = res.OUT_REC[0]["inst_period_month"];
				_interestRate=res.OUT_REC[0]["inst_interest_rate"];
				*/
				
			}else{
				console.log(res);
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
}

function printPaymentShedule(sell_id){
	var data = {};
	var dataArr = [];
	data["base_url"] = $("#base_url").val();
	data["sell_id"] = sell_id ;
	dataArr.push(data);
	var datObj={};
	datObj["printData"] = dataArr;
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"PrintInv/printInvPaymentShedule",
		data: datObj,
		async: false,
		success: function(res) {
			if(res != "" && res != null){
				var newWin=parent.window.open('','Print-Window');
				_winPrintPaySch = newWin;
				newWin.document.open();
				newWin.document.write(res);
				newWin.document.close();
				newWin.focus();
				//newWin.print();
				setTimeout(function(){ newWin.print();newWin.close();}, 50);
				//printContractBuy(sell_id);
				//parent.stock.comm.closePopUpForm("PopupFormSell",parent.popupContractCallback);
			}
			
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
	
	
}


function printContractBuy(sell_id){
	var data = {};
	var dataArr = [];
	data["base_url"] = $("#base_url").val();
	data["sell_id"] = sell_id ;
	dataArr.push(data);
	var datObj={};
	datObj["printData"] = dataArr;
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"PrintInv/printContractBuy",
		data: datObj,
		async: false,
		success: function(res) {
			if(res != "" && res != null){
				var newWin=parent.window.open('','Print-Window2');
				newWin.document.open();
				newWin.document.write(res);
				newWin.document.close();
				newWin.focus();
				 newWin.print();newWin.close();
				//setTimeout(function(){ newWin.print();newWin.close();}, 200);
				_winPrintPaySch.focus();
			}
			
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
	
	
}

function showCustomerErr(){
	$("#txtCusNm").css("border-color","red");
	parent.$("#msgShw").html("សូមជ្រើសរើស អតិថិជន!!!");
	parent.$("#msgErr").show();
	
}

function showProductErr(){
	$("#btnSelectPro").css("border-color","red");
	parent.$("#msgShw").html(" សូមជ្រើសរើស អចលនទ្រព្យ!!!");
	parent.$("#msgErr").show();
	
}



function calDiscount(id_act){
	if($("#txtPayCash").val() != "" && $("#txtPayCash").val() != null && $("#txtPayCash").val() != undefined && !isNaN($("#txtPayCash").val().replace(/,/g,''))){
		var payPrice = parseFloat($("#txtPayCash").val().replace(/,/g,''));
		/*if($("#txtBookingAmt").val() != "" && $("#txtBookingAmt").val() != null && $("#txtBookingAmt").val() != undefined){
			payPrice += parseFloat($("#txtBookingAmt").val().replace(/,/g,''));
		}*/
		var proPrice = parseFloat($("#pro_price").val().replace(/,/g,''));
		var amountAftDis=0;
		var amtLeft=0;
		if(id_act == "C" && $("#txtDisCash").val().replace(/,/g,'') !=""){
			var disCash=0;
			var disPer=0;
			if($("#txtDisCash").val().replace(/,/g,'') ==""){
				disCash=0;
			}else{
				disCash = parseFloat($("#txtDisCash").val().replace(/,/g,''));
			}
			amountAftDis = payPrice - disCash;
			disPer = (disCash *100) / payPrice;
			$("#txtDisPer").val(disPer.toFixed(2));
		}else if($("#txtDisPer").val() != "" && $("#txtDisPer").val() != null && $("#txtDisPer").val() != undefined && !isNaN($("#txtDisPer").val().replace(/,/g,''))){
			var disPer=0;
			var disCash=0;
			if($("#txtDisPer").val().replace(/,/g,'') == ""){
				disPer=0;
			}else{
				disPer=parseFloat($("#txtDisPer").val().replace(/,/g,''));
			}
			disCash = (disPer/100) * payPrice;
			
			$("#txtDisCash").val(stock.comm.formatCurrency(disCash.toFixed(2)));
		}
		if($("#txtDisCash").val().replace(/,/g,'') =="" || $("#txtDisCash").val().replace(/,/g,'') ==null || $("#txtDisPer").val() == "" || $("#txtDisPer").val() == null){
			disCash=0;
		}
		
		if(amountAftDis > 0 && $("#txtBookingAmt").val() != "" && $("#txtBookingAmt").val() != null && $("#txtBookingAmt").val() != undefined && !isNaN($("#txtBookingAmt").val().replace(/,/g,''))){
			amtLeft = amountAftDis - parseFloat($("#txtBookingAmt").val().replace(/,/g,''));
		}else{
			amtLeft = amountAftDis;
		}
		
		if(amtLeft != 0 && amountAftDis != 0 ){
			$("#txtRealPayAmt").val(stock.comm.formatCurrency(amountAftDis.toFixed(2)));
			$("#txtTotalLeft").val(stock.comm.formatCurrency(amtLeft.toFixed(2)));
		}
		if($("#txtBookingAmt").val() != "" && $("#txtBookingAmt").val() != null && $("#txtBookingAmt").val() != undefined && $("#frmAct").val() !="U"){
			disCash += parseFloat($("#txtBookingAmt").val().replace(/,/g,''));
		}
		amountAftDis = payPrice - disCash;
		_amountPay = amountAftDis;
		$("#txtRealPayAmt").val(stock.comm.formatCurrency(amountAftDis.toFixed(2)));
		
	}
}



function calPay(id_act){
	if($("#pro_price").val() != "" && $("#pro_price").val() != null && $("#pro_price").val() != undefined && !isNaN($("#pro_price").val().replace(/,/g,''))){
		var proPrice = 0;
		/*if($("#frmAct").val() =="U"){
			//add more pay
			proPrice=parseFloat(_amountLeft);
		}else{*/
		proPrice=parseFloat($("#pro_price").val().replace(/,/g,''));
		//}
		var amountAftDis=0;
		var amtLeft=0;
		var pay=0;
		if(id_act == "C" && $("#txtPayCash").val().replace(/,/g,'') !=""){
			var disCash=0;
			var disPer=0;
			if($("#txtPayCash").val().replace(/,/g,'') ==""){
				disCash=0;
			}else{
				disCash = parseFloat($("#txtPayCash").val().replace(/,/g,''));
				/*if($("#txtBookingAmt").val().replace(/,/g,'') !="" && $("#frmAct").val() !="U"){
					disCash+=parseFloat($("#txtBookingAmt").val().replace(/,/g,''));
				}*/
			}
			amountAftDis = proPrice - disCash;
			disPer = (disCash *100) / proPrice;
			$("#txtPayPer").val(disPer.toFixed(2));
			$("#txtPayCash").css("border-color","#ced4da");
			$("#txtPayPer").css("border-color","#ced4da");
			parent.$("#msgShw").hide();
			pay = parseFloat($("#txtPayCash").val().replace(/,/g,''));
		}else if($("#txtPayPer").val() != "" && $("#txtPayPer").val() != null && $("#txtPayPer").val() != undefined && !isNaN($("#txtPayPer").val().replace(/,/g,''))){
			var disPer=0;
			var disCash=0;
			if($("#txtPayPer").val().replace(/,/g,'') == ""){
				disPer=0;
			}else{
				disPer=parseFloat($("#txtPayPer").val().replace(/,/g,''));
			}
			disCash = (disPer/100) * proPrice;
			/*if($("#txtBookingAmt").val().replace(/,/g,'') != null && $("#txtBookingAmt").val().replace(/,/g,'') != "" && $("#frmAct").val() !="U"){
				disCash = disCash - parseFloat($("#txtBookingAmt").val().replace(/,/g,''));
			}*/
			if(disCash <= parseFloat($("#txtBookingAmt").val().replace(/,/g,'')) && $("#frmAct").val() !="U"){
				$("#txtPayCash").val("");
				$("#txtPayCash").css("border-color","red");
				$("#txtPayPer").css("border-color","red");
				parent.$("#msgErr").html("ប្រាក់បង់ មិនត្រឹមត្រូវទេ!!!");
				parent.$("#msgErr").show();
			}else{
				$("#txtPayCash").val(stock.comm.formatCurrency(disCash.toFixed(2)));
				$("#txtPayCash").css("border-color","#ced4da");
				$("#txtPayPer").css("border-color","#ced4da");
				parent.$("#msgErr").hide();
			}
			pay = parseFloat($("#txtPayCash").val().replace(/,/g,''));
		}
		var leftAfterPay =  proPrice- pay;
		$("#txtTotalLeftInst").val(stock.comm.formatCurrency(leftAfterPay));
	
	}
	calDiscount("P");
	
	
}

function stringDate(str){
	if(str == '') return '';

	return str = str.substr(8,10) +'-'+ str.substr(5,2) +'-'+ str.substr(0,4);
}

function calculatePaySchedule(){	
	if($("#txtPayPer").val()=="" || $("#txtPayPer").val().replace(/,/g,'') > 100){
		parent.$("#msgErr").html("សូមបញ្ចូល  ប្រាក់ទូទាត់​ជាមុន %!!!");
		parent.$("#msgErr").show();
		$("#txtPayPer").focus();
		return;
	}
	
	if($("#txtPayCash").val()==""){
		parent.$("#msgErr").html("សូមបញ្ចូល ប្រាក់ទូទាត់​ជាមុន $!!!");
		parent.$("#msgErr").show();
		$("#txtPayCash").focus();
		return;
	}
	
	if($("#txtPayTime").val()==""){
		parent.$("#msgErr").html("សូមបញ្ចូល ចំនួនលើកទូទាត់​ជាមុន!!!");
		parent.$("#msgErr").show();
		$("#txtPayTime").focus();
		return;
	}
	if($("#txtStartInstDate").val()=="" || $("#txtStartInstDate").val().replace(/[^0-9]/gi, '').length !=8){
		parent.$("#msgErr").html("សូមបញ្ចូល ថ្ងៃចាប់ផ្តើមបង់ដំបូង!!!");
		parent.$("#msgErr").show();
		$("#txtStartInstDate").focus();
		return;
	}
	
	if(parseInt($("#txtStartInstDate").val().replace(/[^0-9]/gi, '').substring(0,2)) >28){
		parent.$("#msgErr").html("សូមបញ្ចូល ថ្ងៃចាប់ផ្តើមបង់ដំបូងមិនលើសថ្ងៃ២៨ !!!");
		parent.$("#msgErr").show();
		$("#txtStartInstDate").focus();
		return;
	}
	
	if(parseInt($("#txtDisCash").val().replace(/,/g,'')) > 0 && parseInt($("#txtPayTime").val().replace(/,/g,'')) > 1){
		parent.$("#msgErr").html("សូមបញ្ចូល  ចំនួនលើកតែមួយលើក ចំពោះករណីបញ្ចុះតំលៃ!!");
		parent.$("#msgErr").show();
		$("#txtPayTime").focus();
		return;
	}
	
	if($("#cboInstYn").prop("checked") && $("#txtInterstRate").val()==""){
		parent.$("#msgErr").html("សូមបញ្ចូល អត្រាការប្រាក់ %!!!");
		parent.$("#msgErr").show();
		$("#txtInterstRate").focus();
		return;
	}
	
	if($("#cboInstYn").prop("checked") && $("#txtPeriod").val()==""){
		parent.$("#msgErr").html("សូមបញ្ចូល រយៈពេលរំលស់!!!");
		parent.$("#msgErr").show();
		$("#txtPeriod").focus();
		return;
	}
	
	$("#tblInstallment tbody").html("");
	var noTbl=1;
	var bookingAmt=0;
	var checkBooked="";
	var leftAmountToPay=parseFloat($("#pro_price").val().replace(/,/g,''));
	if($("#txtBookingAmt").val() !="" && $("#txtBookingAmt").val() !=null){
		leftAmountToPay = parseFloat($("#pro_price").val().replace(/,/g,'')) - parseFloat($("#txtBookingAmt").val().replace(/,/g,""));
		var htmlBooked = "<tr data-inst-type='BOOK' data-inst-dis-per='0' data-inst-dis-pay='0' data-inst-per-pay='0' data-loan-amount-per='0' data-loan-amount='"+$("#txtBookingAmt").val().replace(/,/g,"")+"' data-interest-rate='0' data-peroid='1' data-first-inst-date='"+$("#txtStartInstDate").val()+"'>";
		htmlBooked += "<td class='inst_num cur-pointer '>"+noTbl+"</td>";
		htmlBooked += "<td class='inst_date cur-pointer text-center'>"+$("#txtBookDate").val()+"</td>";
		htmlBooked += "<td class='inst_pay_per cur-pointer text-center'>កក់ប្រាក់</td>";
		htmlBooked += "<td class='inst_dis_amt cur-pointer text-right'>0$</td>";
		htmlBooked += "<td class='inst_amt_principle cur-pointer text-right'>"+stock.comm.formatCurrency(parseFloat($("#txtBookingAmt").val().replace(/,/g,'')).toFixed(2))+"$</td>";
		htmlBooked += "<td class='inst_amt_interest cur-pointer text-right'>0$</td>";
		htmlBooked += "<td class='inst_amt_pay​ cur-pointer text-right' >"+stock.comm.formatCurrency(parseFloat($("#txtBookingAmt").val().replace(/,/g,'')).toFixed(2))+"$</td>";
		htmlBooked += "<td class='inst_amt_balance cur-pointer text-right' style='padding-right: 25px;'>"+ stock.comm.formatCurrency(leftAmountToPay)+"$</td>";
		htmlBooked += "</tr>";
        
		$("#tblInstallment tbody").append(htmlBooked);
		bookingAmt = parseFloat($("#txtBookingAmt").val().replace(/,/g,""));
		checkBooked ="បង្គ្រប់";
	}else{
		noTbl=0;
	}
	var totalSch = 0;
	var newDate="";
	var firstInstallmentDate= $("#txtStartInstDate").val().replace(/[^0-9]/gi, '');
	var dd = firstInstallmentDate.substring(0,2);
	var mm = firstInstallmentDate.substring(2,4);
	var yyyy = firstInstallmentDate.substring(4,8);
	var newDay= dd;
	var newMonth=parseInt(mm);
	var newYear = parseInt(yyyy);
	
	for (var j=0;j<parseInt($("#txtPayTime").val());j++){
		noTbl +=1;
		var principleAmount = parseFloat($("#txtPayCash").val().replace(/,/g,''))/parseInt($("#txtPayTime").val());
		var principlePer = parseFloat($("#txtPayPer").val().replace(/,/g,''))/parseInt($("#txtPayTime").val());
		totalSch += principleAmount;
		var leftAmountToPay2 = (leftAmountToPay+bookingAmt) - totalSch;
		var disCountCash=0;
		var disCountPer=0;
		
		if(j<1){
			newDate= $("#txtContSD").val();
			if($("#txtBookingAmt").val() !="" && $("#txtBookingAmt").val() !=null){
				principleAmount = principleAmount - parseFloat($("#txtBookingAmt").val().replace(/,/g,""));
			}
			if($("#txtDisCash").val().replace(/,/g,'') !="" && $("#txtDisCash").val().replace(/,/g,'') != null){
				principleAmount = principleAmount - parseFloat($("#txtDisCash").val().replace(/,/g,''));
			}
			if($("#txtDisPer").val().replace(/,/g,'') !="" && parseInt($("#txtDisPer").val()) >0){
				disCountCash =  parseFloat($("#txtDisCash").val().replace(/,/g,''));
				disCountPer =  $("#txtDisPer").val();
			}
			
		}else{
			
			if(newMonth > 12){
				newMonth=1;
				newYear+=1;
			}
			newM = newMonth < 10 ? "0"+newMonth : newMonth; 
			newDate= newDay +"-"+newM +"-"+newYear;
			newMonth +=1;
		}
		
		
		var html = "<tr data-inst-type='ADV' data-inst-dis-per='"+disCountPer+"' data-inst-dis-pay='"+disCountCash+"' data-inst-per-pay='"+principlePer+"' data-loan-amount-per='"+$("#txtPayPer").val()+"' data-loan-amount='"+$("#txtPayCash").val().replace(/,/g,'')+"' data-interest-rate='0' data-peroid='"+$("#txtPayTime").val()+"' data-first-inst-date='"+$("#txtStartInstDate").val()+"'>";
		html += "<td class='inst_num cur-pointer '>"+noTbl+"</td>";
		html += "<td class='inst_date cur-pointer text-center'>"+newDate+"</td>";
		html += "<td class='inst_pay_per cur-pointer text-center'>"+checkBooked+principlePer+"%</td>";
		html += "<td class='inst_dis_amt cur-pointer text-right'>"+(disCountCash==0 ? disCountCash : stock.comm.formatCurrency(disCountCash))+"$</td>";
        html += "<td class='inst_amt_principle cur-pointer text-right'>"+stock.comm.formatCurrency(principleAmount.toFixed(2))+"$</td>";
        html += "<td class='inst_amt_interest cur-pointer text-right'>0$</td>";
        html += "<td class='inst_amt_pay​ cur-pointer text-right' >"+stock.comm.formatCurrency(principleAmount.toFixed(2))+"$</td>";
        html += "<td class='inst_amt_balance cur-pointer text-right' style='padding-right: 25px;'>"+stock.comm.formatCurrency(leftAmountToPay2.toFixed(2))+"$</td>";
        html += "</tr>";
        $("#tblInstallment tbody").append(html);
		//
        checkBooked="";
        if(j==(parseInt($("#txtPayTime").val())-1)){
        	if(newMonth > 12){
				newMonth=1;
				newYear+=1;
			}
			newM = newMonth < 10 ? "0"+newMonth : newMonth; 
			newDate= newDay +"-"+newM +"-"+newYear;
			newMonth +=1;
			
			//
			if ($("#cboInstYn").prop("checked")) {
				calculateInstallment(newDate,noTbl);
		    }else{
		    	if(parseInt($("#txtPayPer").val()) != 100 ){
		    		noTbl+=1;
		    		var htmlLeft = "<tr data-inst-type='LEFT' data-inst-dis-per='0' data-inst-dis-pay='0' data-inst-per-pay='"+(100-parseInt($("#txtPayPer").val()))+"' data-loan-amount='"+leftAmountToPay2.toFixed(2)+"' data-interest-rate='0' data-peroid='1' data-first-inst-date='"+$("#txtStartInstDate").val()+"'>";
		    		htmlLeft += "<td class='inst_num cur-pointer '>"+noTbl+"</td>";
		    		htmlLeft += "<td class='inst_date cur-pointer text-center'>"+newDate+"</td>";
		    		htmlLeft += "<td class='inst_pay_per cur-pointer text-center'>"+$("#cboConType option:selected").text()+(100-parseInt($("#txtPayPer").val()))+"%</td>";
		    		htmlLeft += "<td class='inst_dis_amt cur-pointer text-right'>0$</td>";
		    		htmlLeft += "<td class='inst_amt_principle cur-pointer text-right'>"+stock.comm.formatCurrency(leftAmountToPay2.toFixed(2))+"$</td>";
		    		htmlLeft += "<td class='inst_amt_interest cur-pointer text-right'>0$</td>";
		    		htmlLeft += "<td class='inst_amt_pay​ cur-pointer text-right' >"+stock.comm.formatCurrency(leftAmountToPay2.toFixed(2))+"$</td>";
		    		htmlLeft += "<td class='inst_amt_balance cur-pointer text-right' style='padding-right: 25px;'>0$</td>";
		    		
		    		htmlLeft += "</tr>";
		            $("#tblInstallment tbody").append(htmlLeft);
		    	}
		    }
        }
	}
	
	
	
	
}

function calculateInstallment(newDate,noTbl){	
	if($("#txtTotalLeftInst").val()=="" || $("#txtTotalLeftInst").val()==null){
		return;
	}
	if($("#txtInterstRate").val()==""){
		parent.$("#msgErr").html("សូមបញ្ចូល អត្រាការប្រាក់ %!!!");
		parent.$("#msgErr").show();
		$("#txtInterstRate").focus();
		return;
	}
	
	if($("#txtPeriod").val()==""){
		parent.$("#msgErr").html("សូមបញ្ចូល រយៈពេលរំលស់!!!");
		parent.$("#msgErr").show();
		$("#txtPeriod").focus();
		return;
	}
	
	if($("#txtTotalLeftInstDesc").val()==""){
		parent.$("#msgErr").html("សូមបញ្ចូល ប្រាក់ដើមនៅសល់ជាអក្សរ!!!");
		parent.$("#msgErr").show();
		$("#txtTotalLeftInstDesc").focus();
		return;
	}
	
	
	
	var loanAmount = parseFloat($("#txtTotalLeftInst").val().replace(/,/g,""));
	var numberOfMonths = parseInt($("#txtPeriod").val());
	var rateOfInterest = parseFloat($("#txtInterstRate").val());
	var monthlyInterestRatio = (rateOfInterest/100)/12;
	
	if(rateOfInterest <=0){
		var top = 0;
		var bottom = 0;
		var sp = 0;
		var emi = loanAmount /numberOfMonths;
		var totalPayInstallment = parseInt(loanAmount);
		var totalPayInterest = 0;
		var int_pge =  (totalPayInterest / totalPayInstallment) * 100;
		//$("#tbl_int_pge").val(int_pge.toFixed(2)+" %");
		
	}else{
		var top = Math.pow((1+monthlyInterestRatio),numberOfMonths);
		var bottom = top -1;
		var sp = top / bottom;
		var emi = ((loanAmount * monthlyInterestRatio) * sp);
		var totalPayInstallment = numberOfMonths * emi;
		var totalPayInterest = totalPayInstallment - loanAmount;
		var int_pge =  (totalPayInterest / totalPayInstallment) * 100;
		//$("#tbl_int_pge").val(int_pge.toFixed(2)+" %");
	}
	/*
	var top = Math.pow((1+monthlyInterestRatio),numberOfMonths);
	var bottom = top -1;
	var sp = top / bottom;
	var emi = ((loanAmount * monthlyInterestRatio) * sp);
	var totalPayInstallment = numberOfMonths * emi; //full
	var totalPayInterest = totalPayInstallment - loanAmount;//interest
	var int_pge =  (totalPayInterest / totalPayInstallment) * 100;
	*/
	$("#monthlyPay").html("$ "+stock.comm.formatCurrency(emi.toFixed(2)));
	$("#totalPayInterest").html("$ "+stock.comm.formatCurrency(totalPayInterest.toFixed(2)));
	$("#totalPayInstallment").html("$ "+stock.comm.formatCurrency(totalPayInstallment.toFixed(2)));
	
	var loanAmountInst=loanAmount;
	var interestAmount =0;var principleAmount=0;var balanceAmount=0;
	//var firstInstallmentDate= $("#txtStartInstDate").val().replace(/[^0-9]/gi, '');
	var firstInstallmentDate = newDate.replace(/[^0-9]/gi, '');
	var dd = firstInstallmentDate.substring(0,2);
	var mm = firstInstallmentDate.substring(2,4);
	var yyyy = firstInstallmentDate.substring(4,8);
	
	_loanAmount = loanAmount;
	_firstInstDate = $("#txtStartInstDate").val();
	_instPeriod = numberOfMonths;
	_interestRate=rateOfInterest;

	var newDay= dd;
	var newMonth=parseInt(mm);
	var newYear = parseInt(yyyy);
	//$("#tblInstallment tbody").html("");
	for (var j=1;j<=numberOfMonths;j++){
		noTbl +=1;
		if(newMonth > 12){
			newMonth=1;
			newYear+=1;
		}
		newM = newMonth < 10 ? "0"+newMonth : newMonth; 
		newDate= newDay +"-"+newM +"-"+newYear;
		newMonth +=1;
		//
		
		interestAmount = loanAmountInst * ((rateOfInterest/100)/12) ;
		principleAmount = emi.toFixed(2) - interestAmount.toFixed(2);
		balanceAmount = loanAmountInst - principleAmount.toFixed(2) ;
		if(balanceAmount <0){
			balanceAmount=0;
		}
		if(j==numberOfMonths){
			balanceAmount=0;
		}
		
		var html = "<tr data-inst-type='LOAN' data-inst-dis-per='0' data-inst-dis-pay='0' data-inst-per-pay='0' data-loan-amount-per='"+(100-parseInt($("#txtPayPer").val()))+"' data-loan-amount='"+_loanAmount+"' data-interest-rate='"+_interestRate+"' data-peroid='"+_instPeriod+"' data-first-inst-date='"+_firstInstDate+"'>";
		html += "<td class='inst_num cur-pointer'>"+noTbl+"</td>";
		html += "<td class='inst_date cur-pointer text-center'>"+newDate+"</td>";
		html += "<td class='inst_pay_per cur-pointer text-center'>-</td>";
		html += "<td class='inst_dis_amt cur-pointer text-right'>0$</td>";
        html += "<td class='inst_amt_principle cur-pointer text-right'>"+stock.comm.formatCurrency(principleAmount.toFixed(2))+"$</td>";
        html += "<td class='inst_amt_interest cur-pointer text-right'>"+stock.comm.formatCurrency(interestAmount.toFixed(2))+"$</td>";
        html += "<td class='inst_amt_pay​ cur-pointer text-right' >"+stock.comm.formatCurrency(emi.toFixed(2))+"$</td>";
        html += "<td class='inst_amt_balance cur-pointer text-right' style='padding-right: 25px;'>"+stock.comm.formatCurrency(balanceAmount.toFixed(2))+"$</td>";
        html += "</tr>";
        $("#tblInstallment tbody").append(html);
		//
        loanAmountInst = loanAmountInst - principleAmount.toFixed(2);
	}
	
}


function saveInstallment(sell_id,str){
	
	var instArr = [];
	var instObj = {};
	var instRecord = $('#tblInstallment tbody tr');
	instRecord.each(function(i){
		var instData = {};
		var tblTr   = $(this);
		var inst_num  = tblTr.find("td.inst_num").html();
		var inst_date  = tblTr.find("td.inst_date").html();
		var inst_amt_principle  = tblTr.find("td.inst_amt_principle").html().replace(/,/g,"");
		var inst_amt_interest  = tblTr.find("td.inst_amt_interest").html().replace(/,/g,"");
		var inst_amt_balance = tblTr.find("td.inst_amt_balance").html().replace(/,/g,"");
		var inst_amt_pay = tblTr.find("td.inst_amt_pay​").html().replace(/,/g,"");
		var loan_amount  = $(this).attr("data-loan-amount");
		var first_inst_date  = $(this).attr("data-first-inst-date");
		var inst_period  = $(this).attr("data-peroid");
		var interest_rate  = $(this).attr("data-interest-rate");
		var instType  = $(this).attr("data-inst-type");
		var instPayPer  = $(this).attr("data-inst-per-pay");
		var instDisPer  = $(this).attr("data-inst-dis-per");
		var instDisPay  = $(this).attr("data-inst-dis-pay");
		
		instData["inst_type"] 			= instType;
		instData["inst_num"] 			= inst_num;
		instData["inst_date"] 			= inst_date;
		instData["inst_amt_principle"] 	= inst_amt_principle.replace("$", "");
		instData["inst_amt_interest"] 	= inst_amt_interest.replace("$", "");
		instData["inst_amt_balance"] 	= inst_amt_balance.replace("$", "");
		instData["inst_amt_pay"] 		= inst_amt_pay.replace("$", "");
		instData["loan_amount"] 			= loan_amount;
		instData["first_inst_date"] 		= first_inst_date;
		instData["inst_period"] 			= inst_period;
		instData["interest_rate"] 			= interest_rate;
		instData["sell_id"] 				= sell_id;
		instData["inst_pay_per"] 			= instPayPer;
		instData["inst_dis_amt"] 			= instDisPay;
		instData["inst_dis_per"] 			= instDisPer;
		instData["con_id"] 			= $("#txtContID").val();
		instArr.push(instData);
	});
	
	instObj["instObj"] = instArr;
    //console.log(instObj);
	//return;
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Sell/saveInstallment",
		data: instObj,		
		success: function(res) {
		    if(res != ""){
		    	//parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"braNm");
				parent.stock.comm.confirmMsg($.i18n.prop("msg_save_com")+" \nតើអ្នកចង់បោះពុម្ពដែរឫទេ ?");
				parent.$("#btnConfirmOk").unbind().click(function(e){
					parent.$("#mdlConfirm").modal('hide');
					printPaymentShedule(sell_id);
					printContractBuy(sell_id);
				});
				
				if(str == "new"){
					clearForm();
					$("#txtBookingAmt,#txtBookDate,#txtCusNm,#txtCusPhone,#txtRealPayAmt,#txtTotalLeft,#txtTotalLeftInst").prop("disabled",true);
					parent.$("#msgErr").hide();
				}else{					
				    parent.stock.comm.closePopUpForm("PopupFormSell",parent.popupContractCallback);
				    parent.$("#msgErr").hide();
				}
				
		    }else{
		    	parent.stock.comm.alertMsg("បង្កើតទិន្ន័យមិនបានសំរេច សូមព្យាយាមម្តងទៀត");
		        return;
		    }
		    $("#loading").hide();
		},
		error : function(data) {
			console.log(data);
			parent.stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}
var _btnId;
var _this;
var _amountLeft;
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

			if($("#frmAct").val() == "U"){
			    getDataEdit($("#sellId").val());
			    $("#lAmt").attr("readonly","readonly");
			    $("#popupTitle").html("<i class='fa fa-shopping-cart'></i> "+$.i18n.prop("btn_edit")+" ការលក់");
			}else{
			    $("#btnSaveNew").show();			    
			    $("#popupTitle").html("<i class='fa fa-shopping-cart'></i> "+$.i18n.prop("btn_add_new")+" ការល​ក់" );
			}
			stock.comm.todayDate("#txtContSD","-");
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
				printInv($("#sellId").val());
			});
			
			//
			$("#btnContractSrch").click(function(e){
				getContractInfo($("#txtContract").val());
			});
			
			//
			$("#txtDisPer").keyup(function(e){
				calDiscount("P");
			});
			
			//
			$("#txtDisCash").keyup(function(e){
				calDiscount("C");
			});
			
			//
			$("#txtPayPer").keyup(function(e){
				calPay("P");
			});
			
			//
			$("#txtPayCash").keyup(function(e){
				calPay("C");
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
		data: {"conCode":cont_code,"conSta":"B"},
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
			        html += "<td class='pro_price cur-pointer text-right'> <input class='text-right' id='pro_price' style='border: none;background-color: #ffffff;' value='"+stock.comm.formatCurrency(rec["pro_book_price"])+"'></td>";
			        html += "</tr>";
			        
			        $("#tblProduct tbody").append(html);
			        totalAmount+= parseFloat(rec["pro_book_price"]);
			    }
			    
			    var amtLeft = totalAmount - parseFloat(res.OUT_REC[0]["con_total_price"]);
			    //$("#tblProduct tbody").append("<tr><td class='text-right' colspan='3'><b>ប្រាក់ដើមនៅសល់៖</b></td><td class='text-right'>"+ stock.comm.formatCurrency(amtLeft) +"</td></tr>");
			    
			    $("#txtPrinciple").val(stock.comm.formatCurrency(totalAmount));
				$("#txtTotalLeft").val(stock.comm.formatCurrency(amtLeft));
			    $("#frmSell input,#frmSell textarea,#frmSell select").prop("disabled",true);
			    $("#txtDisCash,#txtDisPer,#txtContSD,#cboReceiver,#txtPayPer,#txtPayCash,#txtContID,#cboPaymentMet,#txtTran").prop("disabled",false);
			    
			    //calDiscount("P");
			    calPay("P");
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
   	productChk.each(function(i){
   		productArr.push(parseInt($(this).attr("data-id")));
   		productPriceArr.push($("#pro_price").val().replace(/,/g,''));
   	});
   	
	//
	$("#txtPayCash").val($("#txtPayCash").val().replace(/,/g,''));
	$("#txtPrinciple").val($("#txtPrinciple").val().replace(/,/g,''));
	
	$("#txtDisPer").val($("#txtDisPer").val().replace(/,/g,''));
	$("#txtDisCash").val($("#txtDisCash").val().replace(/,/g,''));
	
	$("#txtCusNm").css("border-color","#ced4da");
	$("#btnSelectPro").css("border-color","#ced4da");
	$("#frmSell input,#frmSell textarea,#frmSell select").prop("disabled",false);
	
	parent.$("#msgErr").hide();
	
	$.ajax({
		type : "POST",
		url  : $("#base_url").val() +"Sell/saveSell",
		data: $("#frmSell").serialize()+"&productArr="+productArr+"&proPriceArr="+productPriceArr ,
		success: function(res) {
		    parent.$("#loading").hide();
			if(res !=""){
				//parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"braNm");
				parent.stock.comm.confirmMsg($.i18n.prop("msg_save_com")+" \nតើអ្នកចង់បោះពុម្ពដែរឫទេ ?");
				parent.$("#btnConfirmOk").unbind().click(function(e){
					parent.$("#mdlConfirm").modal('hide');
					printInv(res);
				});
				
				if(str == "new"){
					clearForm();
					$("#txtBookingAmt,#txtBookDate,#txtCusNm,#txtCusPhone,#txtPrinciple,#txtTotalLeft").prop("disabled",true);
				}else{					
				    parent.stock.comm.closePopUpForm("PopupFormSell",parent.popupContractCallback);
				}
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
	$("#txtPrinciple").val($("#txtPrinciple").val().replace(/,/g,''));
	
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
					printInv(res);
				});
								
				parent.stock.comm.closePopUpForm("PopupFormSell",parent.popupContractCallback);
				
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
			//$("#btnSave").hide();
			console.log(res.OUT_REC);
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#btnContractSrch").remove();
				$("#txtContract").css("width","260px");
				$("#txtContract").css("border-radius","5px");
				$("#btnAddPayment").show();
				//$("#balanceLeft").text( $.i18n.prop("lb_pay_balance") +" : "+ stock.comm.formatCurrency(res.OUT_REC[0]["loan_amount_left"])+res.OUT_REC[0]["cur_syn"]);	
				$("#contractNo").text( "លេខសម្គាល់ការលក់" +" : "+ res.OUT_REC[0]["sell_code"]);		
				
			    $("#txtCusNm").val(res.OUT_REC[0]["cus_nm_kh"]);
			    $("#txtCusId").val(res.OUT_REC[0]["cus_id"]);
			    $("#txtCusPhone").val(res.OUT_REC[0]["cus_phone1"]);
			    $("#txtBookDate").val(res.OUT_REC[0]["con_date"] == null ? "" : moment(res.OUT_REC[0]["con_date"], "YYYY-MM-DD").format("DD-MM-YYYY"));
			    $("#cboSeller").val(res.OUT_REC[0]["sell_seller_id"]);
			    //$("#cboReceiver").val(res.OUT_REC[0]["rec_id"]);
			    $("#txtDesc").val(res.OUT_REC[0]["sell_des"]);
			    $("#txtBookingAmt").val(stock.comm.formatCurrency(res.OUT_REC[0]["con_total_price"]));
			    $("#txtContract").val(res.OUT_REC[0]["con_code"]);
		    	$("#cboConType").val(res.OUT_REC[0]["sell_con_type_id"]);
		    	
			    $("#btnSelectPro").hide();
			    
			    $("#txtPrinciple").val(stock.comm.formatCurrency(res.OUT_REC[0]["sell_total_price"]));
			    $("#txtDisPer").val(res.OUT_REC[0]["sell_dis_per"]);
			    $("#txtDisCash").val(stock.comm.formatCurrency(res.OUT_REC[0]["sell_dis_amt"]))
		    	
			    
			    $("#divEnd1").show();
		    	$("#divEnd2").show();
			    $("#divEnd3").show();
			 
			    $("#tblProduct tbody").html("");
			   	var rec = res.OUT_REC[0];
				var html = "<tr data-id='"+rec["pro_id"]+"'>";
		        html += "<td class='pro_code cur-pointer'>"+rec["pro_code"]+"</td>";
		        html += "<td class='cat_nm cur-pointer'>"+rec["cat_nm_kh"]+"</td>";
		        html += "<td class='bra_nm cur-pointer'>"+rec["bra_nm_kh"]+"</td>";
		        html += "<td class='pro_price cur-pointer text-right' style='    padding-right: 25px;'><input class='text-right' id='pro_price' style='border: none;background-color: #ffffff;' value='"+stock.comm.formatCurrency(rec["sell_price_before_dis"])+"'/></td>";
		        html += "</tr>";
		        $("#tblProduct tbody").append(html);
					
			    //
		        $("#tblPayment tbody").html("");
		        var salePay=0;
		    	for(var i=0;i<res.OUT_REC.length; i++){
					var rec = res.OUT_REC[i];
					var htmlPayment = "<tr data-id='"+rec["sale_pay_id"]+"'>";
			        htmlPayment += "<td class='sale_pay_date cur-pointer'>"+stringDate(rec["sale_pay_date"].substr(0,10))+"</td>";
			        htmlPayment += "<td class='reciver cur-pointer'>"+rec["reciver"]+"</td>";
			        htmlPayment += "<td class='met_nm_kh cur-pointer'>"+rec["met_nm_kh"]+"</td>";
			        htmlPayment += "<td class='sale_pay_tran_id cur-pointer'>"+rec["sale_pay_tran_id"]+"</td>";
			        htmlPayment += "<td class='sale_pay_amt_per cur-pointer text-right'>"+rec["sale_pay_amt_per"]+" %</td>";
			        htmlPayment += "<td class='sale_pay_amt_cash cur-pointer text-right'  style='padding-right: 25px;'>"+stock.comm.formatCurrency(rec["sale_pay_amt_cash"])+" $</td>";
			        htmlPayment += "</tr>";
			        
			        $("#tblPayment tbody").append(htmlPayment);
			        salePay += parseFloat(rec["sale_pay_amt_cash"]);
			    }
		    	$("#txtTotalPaid").val(stock.comm.formatCurrency(salePay));
		    	$("#totalPaidDiv").show();
		    	var contractPay = res.OUT_REC[0]["con_total_price"] == null ? 0 : parseFloat(res.OUT_REC[0]["con_total_price"]);
			    var amountLeft =0;
			    amountLeft = parseFloat(res.OUT_REC[0]["sell_total_price"]) - (contractPay+salePay);
			    $("#txtTotalLeft").val(stock.comm.formatCurrency(amountLeft));
			    _amountLeft = amountLeft;
			    $("#frmSell input,#frmSell textarea,#frmSell select").prop("disabled",true);
			    $("#txtContSD,#cboReceiver,#txtPayPer,#txtPayCash,#cboPaymentMet,#txtTran").prop("disabled",false);
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
	if(data["cus_nm"] == "" || data["cus_nm"] == null || stock.comm.isEmpty(data["cus_nm"])){
		$("#txtCusNm").val(data["cus_nm_kh"]);
	}else{
		$("#txtCusNm").val(data["cus_nm"]);		
	}
	
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
	        html += "<td class='cat_nm cur-pointer'>"+rec["cat_nm_kh"]+"</td>";
	        html += "<td class='bra_nm cur-pointer'>"+rec["bra_nm_kh"]+"</td>";
	        html += "<td class=' cur-pointer'><input id='pro_price' class='form-control text-right pro_price' type='text' value ='"+rec["pro_price"]+"'></td>";
	        html += "</tr>";
	        
	        $("#tblProduct tbody").append(html);
		}
	}
	
	$("#btnSelectPro").css("border-color","#ced4da");
	calDiscount("P");
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
				$("#cboReceiver option").remove();
				$("#cboReceiver").append("<option value=''>សូមជ្រើសរើសបុគ្គលិក</option>");
				
				for(var i=0; i<res.OUT_REC.length; i++){
					var braNm = res.OUT_REC[i]["sta_nm_kh"];
					$("#cboSeller").append("<option value='"+res.OUT_REC[i]["sta_id"]+"'>"+braNm+"</option>");
					$("#cboReceiver").append("<option value='"+res.OUT_REC[i]["sta_id"]+"'>"+braNm+"</option>");
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
					$("#cboConType").append("<option value='"+res.OUT_REC[i]["con_type_id"]+"'>"+braNm+"</option>");
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


function printInv(con_id){
	var data = {};
	var dataArr = [];
	data["base_url"] = $("#base_url").val();
	data["con_id"] = con_id ;
	dataArr.push(data);
	var datObj={};
	datObj["printData"] = dataArr;
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"PrintInv/printInvBooking",
		data: datObj,
		async: false,
		success: function(res) {
			if(res != "" && res != null){
				var newWin=parent.window.open('','Print-Window');
				newWin.document.open();
				newWin.document.write(res);
				newWin.document.close();
				newWin.focus();
				//newWin.print();
				setTimeout(function(){ newWin.print();newWin.close();}, 200);
				parent.stock.comm.closePopUpForm("PopupFormSell",parent.popupContractCallback);
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
			amountAftDis = proPrice - disCash;
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
			amountAftDis = proPrice - disCash;
			$("#txtDisCash").val(stock.comm.formatCurrency(disCash.toFixed(2)));
		}
	
		if(amountAftDis > 0 && $("#txtBookingAmt").val() != "" && $("#txtBookingAmt").val() != null && $("#txtBookingAmt").val() != undefined && !isNaN($("#txtBookingAmt").val().replace(/,/g,''))){
			amtLeft = amountAftDis - parseFloat($("#txtBookingAmt").val().replace(/,/g,''));
		}else{
			amtLeft = amountAftDis;
		}
	
		if(amtLeft != 0 && amountAftDis != 0 && $("#frmAct").val() !="U"){
			$("#txtPrinciple").val(stock.comm.formatCurrency(amountAftDis.toFixed(2)));
			$("#txtTotalLeft").val(stock.comm.formatCurrency(amtLeft.toFixed(2)));
		}
		
	}/*else{
		$("#txtPrinciple").val("");
		$("#txtTotalLeft").val("");
	}*/
	
	//calPay("P");
}



function calPay(id_act){
	if($("#pro_price").val() != "" && $("#pro_price").val() != null && $("#pro_price").val() != undefined && !isNaN($("#pro_price").val().replace(/,/g,''))){
		var proPrice = 0;
		if($("#frmAct").val() =="U"){
			//add more pay
			proPrice=parseFloat(_amountLeft);
		}else{
			if($("#txtPrinciple").val().replace(/,/g,'') > 0 && $("#txtPrinciple").val() != "" && $("#txtPrinciple").val() != null && $("#txtPrinciple").val() != undefined && !isNaN($("#txtPrinciple").val().replace(/,/g,''))){
				proPrice = parseFloat($("#txtPrinciple").val().replace(/,/g,''));
			}else{
				proPrice=parseFloat($("#pro_price").val().replace(/,/g,''));
			}
		}
		
		var amountAftDis=0;
		var amtLeft=0;
		if(id_act == "C" && $("#txtPayCash").val().replace(/,/g,'') !=""){
			var disCash=0;
			var disPer=0;
			if($("#txtPayCash").val().replace(/,/g,'') ==""){
				disCash=0;
			}else{
				disCash = parseFloat($("#txtPayCash").val().replace(/,/g,''));
				if($("#txtBookingAmt").val().replace(/,/g,'') !="" && $("#frmAct").val() !="U"){
					disCash+=parseFloat($("#txtBookingAmt").val().replace(/,/g,''));
				}
			}
			amountAftDis = proPrice - disCash;
			disPer = (disCash *100) / proPrice;
			$("#txtPayPer").val(disPer.toFixed(2));
			$("#txtPayCash").css("border-color","#ced4da");
			$("#txtPayPer").css("border-color","#ced4da");
			parent.$("#msgShw").hide();
			
		}else if($("#txtPayPer").val() != "" && $("#txtPayPer").val() != null && $("#txtPayPer").val() != undefined && !isNaN($("#txtPayPer").val().replace(/,/g,''))){
			var disPer=0;
			var disCash=0;
			if($("#txtPayPer").val().replace(/,/g,'') == ""){
				disPer=0;
			}else{
				disPer=parseFloat($("#txtPayPer").val().replace(/,/g,''));
			}
			disCash = (disPer/100) * proPrice;
			if($("#txtBookingAmt").val().replace(/,/g,'') != null && $("#txtBookingAmt").val().replace(/,/g,'') != "" && $("#frmAct").val() !="U"){
				disCash = disCash - parseFloat($("#txtBookingAmt").val().replace(/,/g,''));
			}
			if(disCash <= parseFloat($("#txtBookingAmt").val().replace(/,/g,'')) && $("#frmAct").val() !="U"){
				$("#txtPayCash").val("");
				$("#txtPayCash").css("border-color","red");
				$("#txtPayPer").css("border-color","red");
				parent.$("#msgShw").html("ប្រាក់បង់ មិនត្រឹមត្រូវទេ!!!");
				parent.$("#msgErr").show();
			}else{
				$("#txtPayCash").val(stock.comm.formatCurrency(disCash.toFixed(2)));
				$("#txtPayCash").css("border-color","#ced4da");
				$("#txtPayPer").css("border-color","#ced4da");
				parent.$("#msgErr").hide();
			}
		}
	
	}
	if($("#frmAct").val() !="U"){
		calDiscount("P");
	}
	
}

function stringDate(str){
	if(str == '') return '';

	return str = str.substr(8,10) +'-'+ str.substr(5,2) +'-'+ str.substr(0,4);
}

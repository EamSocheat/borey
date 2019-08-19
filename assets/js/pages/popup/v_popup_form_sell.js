var _btnId;
var _this;
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
			getPaymentMethod()
			stock.comm.inputCurrency("txtAmtBooking");
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
			    getDataEdit($("#contId").val());
			    $("#lAmt").attr("readonly","readonly");
			    $("#popupTitle").html("<i class='fa fa-handshake-o'></i> "+$.i18n.prop("btn_edit")+" "+ $.i18n.prop("lb_contract"));
			}else{
				stock.comm.todayDate("#txtContSD","-");
			    $("#btnSaveNew").show();			    
			    $("#popupTitle").html("<i class='fa fa-handshake-o'></i> "+$.i18n.prop("btn_add_new")+" "+ $.i18n.prop("lb_contract"));
			}
			$("#frmContract").show();
			$("#braNm").focus();						
			stock.comm.inputPhoneKhmer("txtPhone1");
			stock.comm.inputPhoneKhmer("txtPhone2");
			
			settingEndDate();
			
		},
		event : function(){
			//
			$("#btnClose,#btnExit").click(function(e){
				//parent.$("#modalMd").modal('hide');
				parent.stock.comm.closePopUpForm("PopupFormSell",parent.popupContractCallback);
			});
			//
			$("#frmContract").submit(function(e){
				e.preventDefault();
				if(_btnId == "btnSave"){
			    	saveData();
				}else{
			    	saveData("new");
				}
			
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
			
			$("#btnPrint").click(function(e){
				printInv($("#contId").val());
			});
			
			
			$("#btnContractSrch").click(function(e){
				getContractInfo($("#txtContract").val());
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
			console.log(res);
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				var status = res.OUT_REC[0]["con_sta"];
				
				$("#txtBookDate").val(moment(res.OUT_REC[0]["con_date"], "YYYY-MM-DD").format("DD-MM-YYYY"));
				$("#txtBookingAmt").val(stock.comm.formatCurrency(res.OUT_REC[0]["con_total_price"]));
				
			    $("#txtCusNm").val(res.OUT_REC[0]["cus_nm_kh"]);
			    $("#txtCusId").val(res.OUT_REC[0]["cus_id"]);
			    $("#txtCusPhone").val(res.OUT_REC[0]["cus_phone1"]);
			    
			    $("#cboSeller").val(res.OUT_REC[0]["seller_id"]);
			    $("#cboReceiver").val(res.OUT_REC[0]["rec_id"]);
			    $("#txtTran").val(res.OUT_REC[0]["con_tran_id"]);
			    $("#txtDesc").val(res.OUT_REC[0]["con_des"]);
			    $("#cboPaymentMet").val(res.OUT_REC[0]["con_pay_met"]);
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
			        html += "<td class='pro_price cur-pointer text-right'>"+stock.comm.formatCurrency(rec["pro_book_price"])+"</td>";
			        html += "</tr>";
			        
			        $("#tblProduct tbody").append(html);
			        totalAmount+= parseFloat(rec["pro_book_price"]);
			    }
			    
			    var amtLeft = totalAmount - parseFloat(res.OUT_REC[0]["con_total_price"]);
			    $("#tblProduct tbody").append("<tr><td class='text-right' colspan='3'><b>ប្រាក់ដើមនៅសល់៖</b></td><td class='text-right'>"+ stock.comm.formatCurrency(amtLeft) +"</td></tr>");
			    
			    $("#frmContract input,#frmContract textarea,#frmContract select").prop("disabled",true);
			    $("#txtDisCash,#txtDisPer").prop("disabled",false);
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
	$("#contId").appendTo("#frmContract");    
    
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
   		productPriceArr.push($(this).find("td.pro_price input").val().replace(/,/g,''));
   		
   	});
   	
	//
	$("#txtAmtBooking").val($("#txtAmtBooking").val().replace(/,/g,''));
	$("#txtCusNm").css("border-color","#ced4da");
	$("#btnSelectPro").css("border-color","#ced4da");
	parent.$("#msgErr").hide();
	//
	
	$.ajax({
		type : "POST",
		url  : $("#base_url").val() +"Contract/saveContract",
		data: $("#frmContract").serialize()+"&productArr="+productArr+"&proPriceArr="+productPriceArr ,
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

function updateContractStatus(status){
	var input = {};
	input["contId"] = $("#contId").val();
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
		url : $("#base_url").val() +"Contract/getContractDetail",
		data: {"conId":cont_id},
		dataType: "json",
		async: false,
		success: function(res) {
			//$("#btnSave").hide();
			console.log(res.OUT_REC);
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				var status = res.OUT_REC[0]["con_sta"];
				if(status != "S"){
					if(status =="E"){
						$("#btnExp").hide();
					}else if(status =="C"){
						$("#btnReturn").hide();
					}else{
						$("#btnOpen").hide();
					}
					$("#btnEditDiv").show();
				}
				
				
				$("#btnPrint").show();
				
				
				//$("#balanceLeft").text( $.i18n.prop("lb_pay_balance") +" : "+ stock.comm.formatCurrency(res.OUT_REC[0]["loan_amount_left"])+res.OUT_REC[0]["cur_syn"]);	
				$("#contractNo").text( $.i18n.prop("lb_contract_no") +" : "+ res.OUT_REC[0]["con_code"]);		
				
			    $("#txtCusNm").val(res.OUT_REC[0]["cus_nm_kh"]);
			    $("#txtCusId").val(res.OUT_REC[0]["cus_id"]);
			    $("#txtCusPhone").val(res.OUT_REC[0]["cus_phone1"]);
			    $("#txtContSD").val(moment(res.OUT_REC[0]["con_date"], "YYYY-MM-DD").format("DD-MM-YYYY"));
			    $("#lAmt").val(stock.comm.formatCurrency(res.OUT_REC[0]["con_principle"]));
			    $("#cboSeller").val(res.OUT_REC[0]["seller_id"]);
			    $("#cboReceiver").val(res.OUT_REC[0]["rec_id"]);
			    $("#txtTran").val(res.OUT_REC[0]["con_tran_id"]);
			    $("#txtDesc").val(res.OUT_REC[0]["con_des"]);
			    $("#cboPaymentMet").val(res.OUT_REC[0]["con_pay_met"]);
			    $("#txtContED").val(moment(res.OUT_REC[0]["con_date_exp"], "YYYY-MM-DD").format("DD-MM-YYYY"));
		    	$("#txtAmtBooking").val(stock.comm.formatCurrency(res.OUT_REC[0]["con_total_price"]));
		    	$("#cboConType").val(res.OUT_REC[0]["con_type_id"]);
		    	
			    $("#btnSelectPro").hide();
		    	
			    $("#divEnd1").show();
		    	$("#divEnd2").show();
			    $("#divEnd3").show();
			 
			    $("#tblProduct tbody").html("");
			    for(var i=0;i<res.OUT_REC.length; i++){
			    	
					var rec = res.OUT_REC[i];
					var html = "<tr data-id='"+rec["pro_id"]+"'>";
			        html += "<td class='pro_code cur-pointer'>"+rec["pro_code"]+"</td>";
			        html += "<td class='cat_nm cur-pointer'>"+rec["cat_nm"]+"</td>";
			        html += "<td class='bra_nm cur-pointer'>"+rec["bra_nm"]+"</td>";
			        html += "<td class='pro_price cur-pointer'>"+stock.comm.formatCurrency(rec["pro_book_price"])+"</td>";
			        html += "</tr>";
			        
			        $("#tblProduct tbody").append(html);
					
			    }

			    $("#frmContract input,#frmContract textarea,#frmContract select").prop("disabled",true);
			    
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
    $("#frmContract input").val("");
    $("#frmContract textarea").val("");
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
	        html += "<td class='cat_nm cur-pointer'>"+rec["cat_nm"]+"</td>";
	        html += "<td class='bra_nm cur-pointer'>"+rec["bra_nm"]+"</td>";
	        html += "<td class='pro_price cur-pointer'><input class='form-control input-sm text-right' type='text' value ='"+rec["pro_price"]+"'></td>";
	        html += "</tr>";
	        
	        $("#tblProduct tbody").append(html);
		}
	}
	
	$("#btnSelectPro").css("border-color","#ced4da");
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

function settingEndDate(){

	/*var newDate = "";
	var newDay = $("#txtContSD").val().substring(0,2);
	var newMonth = $("#txtContSD").val().substring(3,5);
	var newYear = $("#txtContSD").val().substring(6,10);
	newDate = newYear+"-"+newMonth+"-"+newDay;
	console.log(newDate);
	var myDate = moment(newDate, 'dd-mm-yyyy').toDate();
	console.log(myDate);*/
	//
	$('#txtContED').datepicker({
		language: "kh" ,
		weekStart: true,
        todayBtn:  true,
		autoclose: true,
		todayHighlight: 1,
		forceParse: 0,
		sideBySide: true,
		format: "dd-mm-yyyy"
    });
	$("#txtContED").inputmask();
}

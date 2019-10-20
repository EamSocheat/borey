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
			stock.comm.inputCurrency("txtPenaltyAmt");
			getContractType();
			//stock.comm.inputCurrency("lAmt");
			
			//
			$('#txtPayDate').datepicker({
				language: "kh",
				weekStart: true,
		        //todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				minView: 2,
				//forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
		    });
			$("#txtPayDate").inputmask();
			
			//

			
			getDataEdit($("#instId").val());
			$("#popupTitle").html("<i class='fa fa-line-chart'></i> ពត៌មានបង់ប្រាក់")
			stock.comm.todayDate("#txtPayDate","-");
			$("#frmPayment").show();
			$("#braNm").focus();						
			stock.comm.inputPhoneKhmer("txtPhone1");
			stock.comm.inputPhoneKhmer("txtPhone2");
			
		},
		event : function(){
			
			
			//
			$("#btnClose,#btnExit").click(function(e){
				//parent.$("#modalMd").modal('hide');
				parent.stock.comm.closePopUpForm("PopupFormInstallmentPayment",parent.popupInstallmentPaymentCallback);
			});
			//
			$("#frmPayment").submit(function(e){
				e.preventDefault();
				if(_btnId == "btnPay"){
			    	saveData();
				}else{
			    	saveData("new");
				}
			
			});
			//
			$("#btnPay").click(function(e){
				_btnId = $(this).attr("id");
				
			});
			//
			$("#btnPayNew").click(function(e){
				_btnId = $(this).attr("id");
				
			});
			
			//
			$("#txtPenaltyAmt").keyup(function(e){
				if($(this).val().replace(/,/g,"") !=""){
					var totalPayment = parseFloat($(this).val().replace(/,/g,"")) + parseFloat($("#txtInstPayAmt").val().replace(/,/g,""));
					$("#txtTotalPayAmt").val(stock.comm.formatCurrency(totalPayment));
				}else{
					$("#txtTotalPayAmt").val($("#txtInstPayAmt").val());
				}
				
			});
			
		}
};


function saveData(str){
	$("#instId").appendTo("#frmPayment");    
    
	//
	$("#txtInstPayAmt").val($("#txtInstPayAmt").val().replace(/,/g,''));
	$("#txtInstPayAmt").prop("disabled",false);
	$("#txtPenaltyAmt").val($("#txtPenaltyAmt").val().replace(/,/g,''));
	parent.$("#msgErr").hide();
	//
	
	$.ajax({
		type : "POST",
		url  : $("#base_url").val() +"InstallmentPayment/savePayment",
		data: $("#frmPayment").serialize(),
		success: function(res) {
			
		    parent.$("#loading").hide();
			if(res !="" && res !="ERR"){
				//parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"braNm");
				parent.stock.comm.confirmMsg($.i18n.prop("msg_save_com")+" \nតើអ្នកចង់បោះពុម្ពដែរឫទេ ?");
				parent.$("#btnConfirmOk").unbind().click(function(e){
					parent.$("#mdlConfirm").modal('hide');
					printInv(res);
				});
				
				if(str == "new"){
				    clearForm();
				}else{					
				    parent.stock.comm.closePopUpForm("PopupFormInstallmentPayment",parent.popupInstallmentPaymentCallback);
				}
			}else if(res =="ERR"){
				parent.stock.comm.alertMsg("ការបង់ប្រាក់មិនត្រឹមត្រូវ សូមបង់ប្រាក់មានលេខរៀងពីតូចទៅធំ");
				return;
			}
		},
		error : function(data) {
			console.log(data);
			parent.stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}



function getDataEdit(cont_id){
	
    //
    $("#loading").show();
    $.ajax({
		type: "POST",
		url : $("#base_url").val() +"InstallmentPayment/getInstallment",
		data: {"instId":cont_id},
		dataType: "json",
		async: false,
		success: function(res) {
			
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				//$("#balanceLeft").text( $.i18n.prop("lb_pay_balance") +" : "+ stock.comm.formatCurrency(res.OUT_REC[0]["loan_amount_left"])+res.OUT_REC[0]["cur_syn"]);	
				var i=0;
				var cusNm =res.OUT_REC[i]["cus_nm_kh"];
		    	if(res.OUT_REC[i]["cus_nm_kh2"] != "" && res.OUT_REC[i]["cus_nm_kh2"] != null){
		    		cusNm += " & "+res.OUT_REC[i]["cus_nm_kh2"];
		    	}
		    	if(res.OUT_REC[i]["cus_nm_kh3"] != "" && res.OUT_REC[i]["cus_nm_kh3"] != null){
		    		cusNm += " & "+res.OUT_REC[i]["cus_nm_kh3"];
		    	}
		    	
			    $("#txtCusNm").val(cusNm);
			    $("#txtCusId").val(res.OUT_REC[0]["cus_id"]);
			    $("#txtCusPhone").val(res.OUT_REC[0]["cus_phone1"]);
			    $("#txtProCode").val(res.OUT_REC[0]["pro_code"]);
			    $("#txtInstPayAmt").val(stock.comm.formatCurrency(res.OUT_REC[0]["inst_amt_pay"]));
			    $("#txtTotalPayAmt").val(stock.comm.formatCurrency(res.OUT_REC[0]["inst_amt_pay"]));
			    
			    $("#txtInstType").val(res.OUT_REC[0]["inst_type"]);
			    $("#txtInstNum").val(res.OUT_REC[0]["inst_num"]);
			    $("#txtSellId").val(res.OUT_REC[0]["sell_id"]);
			    
			    //$("#frmPayment input,#frmPayment textarea,#frmPayment select").prop("disabled",true);
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
    $("#frmPayment input").val("");
    $("#frmPayment textarea").val("");
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
	        html += "<td class='pro_price cur-pointer'><input class='form-control input-sm' type='text' value ='"+rec["pro_price"]+"'></td>";
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
	data["inst_paid_id"] = con_id ;
	dataArr.push(data);
	var datObj={};
	datObj["printData"] = dataArr;
	//console.log(datObj);
	//return;
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"PrintInv/printInvPayment",
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
				parent.stock.comm.closePopUpForm("PopupFormInstallmentPayment",parent.popupInstallmentPaymentCallback);
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
	$('#txtPayDate').datepicker({
		language: "kh" ,
		weekStart: true,
        todayBtn:  true,
		autoclose: true,
		todayHighlight: 1,
		forceParse: 0,
		sideBySide: true,
		format: "dd-mm-yyyy"
    });
	$("#txtPayDate").inputmask();
}

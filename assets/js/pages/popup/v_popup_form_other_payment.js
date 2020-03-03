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
			stock.comm.inputCurrency("txtPayAmt");
			getDataSell();
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
			//getDataEdit($("#instId").val());
			
			if($("#frmAct").val() == "U"){
			    getDataEdit($("#salId").val());
			    $("#popupTitle").html("<i class='fa fa-money'></i> បង់ប្រាក់ សេវាបន្ថែម");
			}else{
			    $("#btnSaveNew").show();
			    $("#popupTitle").html("<i class='fa fa-money'></i> បង់ប្រាក់ សេវាបន្ថែម");
			}
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
				parent.stock.comm.closePopUpForm("PopupFormOtherPayment",parent.popupInstallmentPaymentCallback);
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
			$("#cboProCode").change(function(e){
				if($(this).val() ==""){
					$("#txtCusNm").val("");
				}else{
					$("#txtCusNm").val($("#cboProCode option:selected").attr("data-cus"));
				}
			});
			
		}
};


function saveData(str){
	$("#instId").appendTo("#frmPayment");    
    
	//
	$("#txtPayAmt").val($("#txtPayAmt").val().replace(/,/g,''));
	parent.$("#msgErr").hide();
	//
	
	$.ajax({
		type : "POST",
		url  : $("#base_url").val() +"OtherPayment/saveOtherPayment",
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
				    parent.stock.comm.closePopUpForm("PopupFormOtherPayment",parent.popupInstallmentPaymentCallback);
				}
			}
		},
		error : function(data) {
			console.log(data);
			parent.stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}




function getDataSell(){
	
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Sell/getSell",
		//data: dat,
		dataType: "json",
		async: false,
		success: function(res) {
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#cboProCode option").remove();
				$("#cboProCode").append("<option value=''>សូមជ្រើសរើសលេខកូដផ្ទះ</option>");
				
			    for(var i=0; i<res.OUT_REC.length;i++){
			    	var cusNm =res.OUT_REC[i]["cus_nm_kh"];
			    	if(res.OUT_REC[i]["cus_nm_kh2"] != "" && res.OUT_REC[i]["cus_nm_kh2"] != null){
			    		cusNm += " & "+res.OUT_REC[i]["cus_nm_kh2"];
			    	}
			    	if(res.OUT_REC[i]["cus_nm_kh3"] != "" && res.OUT_REC[i]["cus_nm_kh3"] != null){
			    		cusNm += " & "+res.OUT_REC[i]["cus_nm_kh3"];
			    	}
			    	$("#cboProCode").append("<option data-cus='"+cusNm+"' value='"+res.OUT_REC[i]["sell_id"]+"'>"+res.OUT_REC[i]["pro_code"]+"</option>")
			    	
			    }
			}
		},
		error : function(data) {
		    console.log(data);
            stock.comm.alertMsg($.i18n.prop("msg_err"));
            $("#loading").hide();
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
				parent.stock.comm.closePopUpForm("PopupFormOtherPayment",parent.popupInstallmentPaymentCallback);
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

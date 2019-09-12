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
			$("#frmSalary").show();
			clearForm();
			filtStaffCombo();

			if($("#frmAct").val() == "U"){
			    getDataEdit($("#salId").val());
			    $("#popupTitle").html("<i class='fa fa-university'></i> "+$.i18n.prop("btn_edit")+" "+ $.i18n.prop("lb_salary"));
			}else{
			    $("#btnSaveNew").show();
			    $("#popupTitle").html("<i class='fa fa-university'></i> "+$.i18n.prop("btn_add_new")+" "+ $.i18n.prop("lb_salary"));
			}

			$('#txtSalMonth').datepicker({
				language	: (getCookie("lang") == "kh" ? "kh" : "en"),
				format		: "mm-yyyy",
				viewMode	: "months",
				autoclose	: true,
				minViewMode	: "months"
			});
			$("#txtSalMonth").inputmask();

			$("#txtSalSDate").datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
			});
			$("#txtSalSDate").inputmask();

			$("#txtSalEDate").datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				weekStart: true,
				todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
			});
			$("#txtSalEDate").inputmask();

			stock.comm.inputCurrency("txtSalAmt");
			stock.comm.inputCurrency("txtSalComm");
			stock.comm.inputCurrency("txtSalOT");
		},
		event : function(){
			$("#btnClose,#btnExit").click(function(e){
				//parent.$("#modalMd").modal('hide');
				parent.stock.comm.closePopUpForm("PopupFormSalary",parent.popupSalaryCallback);
			});
			$("#frmSalary").submit(function(e){
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
			$("#salStatus").change(function(e){
				var formAction = $("#frmAct").val();
				var statValue  = $(this).find("option:selected").val();
				if(formAction == "U"){
					updateSalaryStatus(statValue);
				}
			});
			//
			$("#salMonthIcon, #salSDateIcon, #salEDateIcon").click(function(){
				$(this).next().focus();
			});
			//
			$("#txtSalAmt, #txtSalComm, #txtSalOT").on("keyup", function(){
				var salAmtVal	  = $("#txtSalAmt").val().replace(/,/g,"");
				var salCommAmtVal = $("#txtSalComm").val().replace(/,/g,"");
				var salOTAmtVal	  = $("#txtSalOT").val().replace(/,/g,"");
				var salTotalAmt   = 0;

				salTotalAmt = Number(salAmtVal) + Number(salCommAmtVal) + Number(salOTAmtVal);
				$("#salTotalAmt").val(stock.comm.formatCurrency(salTotalAmt.toString()));
			});
		}
};


function saveData(str){
	$("#salId").appendTo("#frmSalary");
    parent.$("#loading").show();
    if($("#txtStaffNm option:selected").val() == null || $("#txtStaffNm option:selected").val() == ""){
		top.stock.comm.alertMsg($.i18n.prop("msg_choose_staff"));
		parent.$("#loading").hide();
		return;
	}
    $("#txtStaffNm").prop("disabled",false);
	$.ajax({
		type : "POST",
		url  : $("#base_url").val() +"Salary/save",
		data : new FormData($("#frmSalary")[0]),
		cache: false,
        contentType: false,
        processData: false,
		success: function(res) {
		    parent.$("#loading").hide();
			if(res =="OK"){
				parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"addNewExpend");
				if(str == "new"){
				    clearForm();
				}else{
					//close popup
					var parentFrame = "";
					var callbackFunction = null;
					if($("#parentId").val() != "" && $("#parentId").val() != null){
						parentFrame = $("#parentId").val();
						callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.popupSalaryCallback;
					}else{
						callbackFunction = parent.popupSalaryCallback;
					}

				    parent.stock.comm.closePopUpForm("PopupFormSalary", callbackFunction);
				}
			}else if(res == "DUPLICATE"){
				top.stock.comm.alertMsg($.i18n.prop("msg_err_dup_month"));
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}

function updateSalaryStatus(statusValue){
	$("#loading").show();
	var input = {};
	input["salId"] 		= $("#salId").val();
	input["salStatus"]  = statusValue;

	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Salary/updateSalaryStatus",
		data: input,
		async	: false,
		success	: function(res) {
			if(res =="OK"){
				parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"addNewExpend");
			}
			$("#loading").hide();
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
		}
	});
}

function getDataEdit(sal_id){
    $("#loading").show();
    $.ajax({
		type: "POST",
		url : $("#base_url").val() +"Salary/getSalary",
		data: {"salId":sal_id},
		dataType: "json",
		async	: false,
		success	: function(res) {
			var salTotalAmt = 0;
			if(res.OUT_REC != null && res.OUT_REC.length > 0){
				salTotalAmt = parseFloat(res.OUT_REC[0]["sal_amt"]) + parseFloat(res.OUT_REC[0]["sal_comm"]) + parseFloat(res.OUT_REC[0]["sal_overtime"])
				$("#txtStaffNm option[value='"+res.OUT_REC[0]["sta_id"]+"']").attr("selected","selected");
				$("#txtSalMonth").val(stock.comm.formatDateWithoutTime(res.OUT_REC[0]["sal_month"]).substr(3,10));
				$("#txtOldSalMonth").val(stock.comm.formatDateWithoutTime(res.OUT_REC[0]["sal_month"]).substr(3,10));
				
				$("#txtSalSDate").val(stock.comm.formatDateWithoutTime(res.OUT_REC[0]["sal_start_dt"]));
				$("#txtSalEDate").val(stock.comm.formatDateWithoutTime(res.OUT_REC[0]["sal_end_dt"]));
			    $("#txtSalAmt").val(stock.comm.formatCurrency(res.OUT_REC[0]["sal_amt"]));
			    $("#txtSalComm").val(stock.comm.formatCurrency(res.OUT_REC[0]["sal_comm"]));
			    $("#txtSalOT").val(stock.comm.formatCurrency(res.OUT_REC[0]["sal_overtime"]));
			    $("#salTotalAmt").val(stock.comm.formatCurrency(salTotalAmt));
				$("#salStatus option[value='"+res.OUT_REC[0]["sal_status"]+"']").attr("selected","selected");
				
				$("#txtStaffNm").prop("disabled",true);
			}else{
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
    $("#frmSalary input").val("");
    $("#frmSalary textarea").val("");
	$("#txtStaffNm option:eq(0)").attr("selected", true);
}

function selectSupplierCallback(data){
	$("#txtSuppIdVal").val(data["sup_id"]);

	if(data["sup_nm_kh"] != "" && data["sup_nm_kh"] != null){
		$("#txtSuppNm").val(data["sup_nm_kh"]);
		$("#txtSuppNmVal").val(data["sup_nm_kh"]);
	}else{
		$("#txtSuppNm").val(data["sup_nm"]);
		$("#txtSuppNmVal").val(data["sup_nm"]);
	}
	$("#txtSuppPhone").val(data["sup_phone"]);
	$("#txtSuppPhoneVal").val(data["sup_phone"]);
}


function filtStaffCombo(){
	var Staff_REC = stock.comm.callDataCombo("Staff","getStaff");

	if(!stock.comm.isEmpty(Staff_REC)){
		var strHtml  = '<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>';
		strHtml += '<option value="0" data-i18ncd="lb_staff_admin">Admin</option>';
		var staffStr = "";
		$("#txtStaffNm").empty();
		for(var i = 0; i < Staff_REC.length; i++){
			if(Staff_REC[i]["sta_nm_kh"] != "" && Staff_REC[i]["sta_nm_kh"] != null){
				staffStr = Staff_REC[i]["sta_nm_kh"];
			}else{
				staffStr = Staff_REC[i]["sta_nm"];
			}
			strHtml += '<option value="'+Staff_REC[i]["sta_id"]+'">'+staffStr+'</option>';
		}
		$("#txtStaffNm").html(strHtml);
	}
}

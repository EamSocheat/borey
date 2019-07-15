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
			clearForm();
			filtProjectCombo();
			filtStaffCombo();
			
			if($("#frmAct").val() == "U"){
			    getDataEdit($("#expId").val());
			    $("#popupTitle").html("<i class='fa fa-users'></i> "+$.i18n.prop("btn_edit")+" "+ $.i18n.prop("lb_expend"));
			}else{
			    $("#btnSaveNew").show();
			    $("#popupTitle").html("<i class='fa fa-users'></i> "+$.i18n.prop("btn_add_new")+" "+ $.i18n.prop("lb_expend"));
			}

			$("#frmExpend").show();
			
			$("#txtExpendDate").datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd/mm/yyyy",
			});
			$("#txtExpendDate").inputmask();
			stock.comm.inputCurrency("txtTotalExp");
		},
		event : function(){
			$("#btnClose,#btnExit").click(function(e){
				//parent.$("#modalMd").modal('hide');
				parent.stock.comm.closePopUpForm("PopupFormExpend",parent.popupExpendCallback);
			});
			$("#frmExpend").submit(function(e){
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
			$("#expendImgView, #btnSelectPhoto").click(function(e){
				$("#fileExpPhoto").trigger( "click" );
			});
			//
			$("#fileExpPhoto").change(function(){
			    readURL(this);
			});
			//
			$("#btnPopupSupplier").click(function(e){
				var data  = "parentId=ifameStockForm";
					data += "&dataSrch="+$("#txtSuppNm").val();
				var controllerNm = "PopupSelectSupplier";
				var option = {};
				option["height"] = "450px";
			    stock.comm.openPopUpSelect(controllerNm, option, data, "modal-md");
			});
			//
			$("#dobIcon").click(function(){
				$(this).next().focus();
			});
		}
};


function saveData(str){
	$("#expId").appendTo("#frmExpend");
    parent.$("#loading").show();

	$.ajax({
		type : "POST",
		url  : $("#base_url").val() +"Expend/save",
		data : new FormData($("#frmExpend")[0]),
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
						callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.popupExpendCallback
					}else{
						callbackFunction = parent.popupExpendCallback;
					}

				    parent.stock.comm.closePopUpForm("PopupFormExpend", callbackFunction);
				}
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}

function getDataEdit(exp_id){
    $("#loading").show();
    $.ajax({
		type: "POST",
		url : $("#base_url").val() +"Expend/getExpend",
		data: {"expId":exp_id},
		dataType: "json",
		async	: false,
		success	: function(res) {
			if(res.OUT_REC != null && res.OUT_REC.length > 0){
			    $("#txtSuppNm").val(res.OUT_REC[0]["sup_nm"]);
			    $("#txtSuppNmVal").val(res.OUT_REC[0]["sup_nm"]);
			    $("#txtSuppPhone").val(res.OUT_REC[0]["sup_phone"]);
			    $("#txtSuppPhoneVal").val(res.OUT_REC[0]["sup_phone"]);
				$("#projectNm option[value='"+res.OUT_REC[0]["bra_id"]+"']").attr("selected","selected");
				$("#txtExpendDate").val(stock.comm.formatDateWithoutTime(res.OUT_REC[0]["exp_date"]));
				$("#cboStaffPay option[value='"+res.OUT_REC[0]["sta_id"]+"']").attr("selected",true);
			    $("#txtTotalExp").val(stock.comm.formatCurrency(res.OUT_REC[0]["exp_total_price"]));
				$("#txtDesc").val(res.OUT_REC[0]["exp_des"]);
			    if(res.OUT_REC[0]["exp_image"] != null && res.OUT_REC[0]["exp_image"] != ""){
			    	$("#expendImgView").attr("src", $("#base_url").val()+"upload"+res.OUT_REC[0]["exp_image"]);
			    	$("#expImgPath").val(res.OUT_REC[0]["exp_image"]);
			    }
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

function filtProjectCombo(){
	var PROJECT_REC = stock.comm.callDataCombo("Branch","getBranch");

	if(!stock.comm.isEmpty(PROJECT_REC)){
		var strHtml = '<option value="0" data-i18ncd="lb_project_choose">ជ្រើសរើស</option>';
		$("#projectNm").empty();
		for(var i = 0; i < PROJECT_REC.length; i++){
			strHtml += '<option value="'+PROJECT_REC[i]["bra_id"]+'">'+PROJECT_REC[i]["bra_nm"]+'</option>';
		}
		$("#projectNm").html(strHtml);
	}
}

function filtStaffCombo(){
	var Staff_REC = stock.comm.callDataCombo("Staff","getStaff");

	if(!stock.comm.isEmpty(Staff_REC)){
		var strHtml = '<option value="0" data-i18ncd="lb_staff_admin">Admin</option>';
		$("#cboStaffPay").empty();
		for(var i = 0; i < Staff_REC.length; i++){
			strHtml += '<option value="'+Staff_REC[i]["sta_id"]+'">'+Staff_REC[i]["sta_nm"]+'</option>';
		}
		$("#cboStaffPay").html(strHtml);
	}
}

function clearForm(){
    $("#frmExpend input").val("");
    $("#frmExpend textarea").val("");
    $("#projectNm option:eq(0)").attr("selected",true);
    $("#cboStaffPay option:eq(0)").attr("selected",true);

    $("#expendImgView").attr("src",$("#base_url").val()+"assets/image/default-image.jpg");
}

function selectSupplierCallback(data){
	$("#txtSuppIdVal").val(data["sup_id"]);

	$("#txtSuppNm").val(data["sup_nm"]);
	$("#txtSuppNmVal").val(data["sup_nm"]);
	$("#txtSuppPhone").val(data["sup_phone"]);
	$("#txtSuppPhoneVal").val(data["sup_phone"]);
}

/**
 * 
 */
//
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	$("#expendImgView").attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}


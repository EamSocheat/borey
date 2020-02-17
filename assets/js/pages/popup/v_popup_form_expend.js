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
			    $("#popupTitle").html("<i class='fa fa-bar-chart'></i> "+$.i18n.prop("btn_edit")+" "+ $.i18n.prop("lb_expend"));
			    $("#btnSave").remove();
			}else{
			    $("#btnSaveNew").show();
			    $("#popupTitle").html("<i class='fa fa-bar-chart'></i> "+$.i18n.prop("btn_add_new")+" "+ $.i18n.prop("lb_expend"));
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
				format: "dd-mm-yyyy",
			});
			$("#txtExpendDate").inputmask();
			
			$("#txtRequestDate").datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
			});
			$("#txtRequestDate").inputmask();
			
			
			stock.comm.inputCurrency("txtTotalExp");
			
			stock.comm.inputCurrencyByClass("#tblExpendItem",".input-sm-num");
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
				$("#txtSuppNm").val("");
				$("#txtSuppPhone").val("");
				$("#cboSupYn").prop("checked",false);
				
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
			
			//
			//
			$("#btnPlus").click(function(){
				var html="";
				html+="<tr>";
					html+="	<td class='text-center chk-box'><input type='checkbox' /></td>";
					html+="	<td class='text-center exp-no'>"+($("#tblExpendItem tbody tr").length+1)+"</td>";
					html+="	<td class='text-center exp-des'><input type='text' style='width:100%;' class='form-control input-sm' autocomplete='off'/> </td>";
					html+="	<td class='text-center exp-qty-khr'><input type='text' style='width:100%;' class='form-control input-sm input-sm-num' autocomplete='off'/></td>";
					html+="	<td class='text-center exp-unit-price-khr'><input type='text' style='width:100%;' class='form-control text-right input-sm input-sm-num' autocomplete='off'/> </td>";
					html+="	<td class='text-center exp-total-price-khr'></td>";
					html+="	<td class='text-center exp-qty'><input type='text' style='width:100%;' class='form-control input-sm input-sm-num' autocomplete='off'/> </td>";
					html+="	<td class='text-center exp-unit-price'><input type='text' style='width:100%;' class='form-control text-right input-sm input-sm-num' autocomplete='off'/> </td>";
					html+="	<td class='text-center exp-total-price'></td>";
				html+="</tr>";
				$("#tblExpendItem tbody").append(html);
				stock.comm.inputCurrencyByClass("#tblExpendItem",".input-sm-num");
			});
			
			
			$("#btnMinus").click(function(){
				var html="";
				var chkVal = $('#tblExpendItem tbody tr td.chk-box input[type="checkbox"]:checked');

				if(chkVal.length <= 0){
					parent.stock.comm.alertMsg($.i18n.prop("msg_con_del"));
					return;
				}
				parent.stock.comm.confirmMsg($.i18n.prop("msg_sure_del"));
				parent.$("#btnConfirmOk").unbind().click(function(e){
					parent.$("#mdlConfirm").modal('hide');
					chkVal.closest("tr").remove();
					var itemNo = parseInt(chkVal.closest("tr").find("td.exp-no").html());
					for(var i=(itemNo-1);i<$("#tblExpendItem tbody tr").length;i++){
						$("#tblExpendItem tbody tr:eq("+i+")").find("td.exp-no").html(itemNo);
						itemNo+=1;
					}
				});
				//$("#tblExpendItem tbody").append(html);
			});
			
			
			//
			$("#tblExpendItem").on('keyup', "td.exp-qty-khr input", function (e) {
				var totalAmount= calculateTotalAmount($(this).val(),$(this).closest("tr").find("td.exp-unit-price-khr input").val());
				$(this).closest("tr").find("td.exp-total-price-khr").html(stock.comm.formatCurrency(totalAmount)+" ៛");
				$(this).closest("tr").find(" td input").css("border","1px solid #d2d6de");
				
				//
				if(!stock.comm.isEmpty($(this).val())){
					$(this).closest("tr").find("td.exp-qty input").attr("disabled","disabled");
					$(this).closest("tr").find("td.exp-unit-price input").attr("disabled","disabled");
				}else if(stock.comm.isEmpty($(this).val()) && stock.comm.isEmpty($(this).closest("tr").find("td.exp-unit-price-khr input").val())){
					$(this).closest("tr").find("td.exp-qty input").attr("disabled",false);
					$(this).closest("tr").find("td.exp-unit-price input").attr("disabled",false);
				}
				//
			});
			//
			$("#tblExpendItem").on('keyup', "td.exp-unit-price-khr input", function (e) {
				var totalAmount= calculateTotalAmount($(this).val(),$(this).closest("tr").find("td.exp-qty-khr input").val());
				$(this).closest("tr").find("td.exp-total-price-khr").html(stock.comm.formatCurrency(totalAmount)+" ៛");
				$(this).closest("tr").find(" td input").css("border","1px solid #d2d6de");
				
				//
				if(!stock.comm.isEmpty($(this).val())){
					$(this).closest("tr").find("td.exp-qty input").attr("disabled","disabled");
					$(this).closest("tr").find("td.exp-unit-price input").attr("disabled","disabled");
				}else if(stock.comm.isEmpty($(this).val()) && stock.comm.isEmpty($(this).closest("tr").find("td.exp-qty-khr input").val())){
					$(this).closest("tr").find("td.exp-qty input").attr("disabled",false);
					$(this).closest("tr").find("td.exp-unit-price input").attr("disabled",false);
				}
				//
			});
			
			//
			$("#tblExpendItem").on('keyup', "td.exp-qty input", function (e) {
				var totalAmount= calculateTotalAmount($(this).val(),$(this).closest("tr").find("td.exp-unit-price input").val());
				$(this).closest("tr").find("td.exp-total-price").html(stock.comm.formatCurrency(totalAmount)+" $");
				$(this).closest("tr").find(" td input").css("border","1px solid #d2d6de");
				
				//
				if(!stock.comm.isEmpty($(this).val())){
					$(this).closest("tr").find("td.exp-qty-khr input").attr("disabled","disabled");
					$(this).closest("tr").find("td.exp-unit-price-khr input").attr("disabled","disabled");
				}else if(stock.comm.isEmpty($(this).val()) && stock.comm.isEmpty($(this).closest("tr").find("td.exp-unit-price input").val())){
					$(this).closest("tr").find("td.exp-qty-khr input").attr("disabled",false);
					$(this).closest("tr").find("td.exp-unit-price-khr input").attr("disabled",false);
				}
				//
			});
			//
			$("#tblExpendItem").on('keyup', "td.exp-unit-price input", function (e) {
				var totalAmount= calculateTotalAmount($(this).val(),$(this).closest("tr").find("td.exp-qty input").val());
				$(this).closest("tr").find("td.exp-total-price").html(stock.comm.formatCurrency(totalAmount)+" $");
				$(this).closest("tr").find(" td input").css("border","1px solid #d2d6de");
				
				//
				if(!stock.comm.isEmpty($(this).val())){
					$(this).closest("tr").find("td.exp-qty-khr input").attr("disabled","disabled");
					$(this).closest("tr").find("td.exp-unit-price-khr input").attr("disabled","disabled");
				}else if(stock.comm.isEmpty($(this).val()) && stock.comm.isEmpty($(this).closest("tr").find("td.exp-qty input").val())){
					$(this).closest("tr").find("td.exp-qty-khr input").attr("disabled",false);
					$(this).closest("tr").find("td.exp-unit-price-khr input").attr("disabled",false);
				}
				//
			});
			
			//
			$("#tblExpendItem").on('keyup', "td.exp-des input", function (e) {
				parent.$("#msgErr").html("");
				parent.$("#msgErr").hide();
				$(this).closest("tr").find(" td input").css("border","1px solid #d2d6de");
			});
			
			//
			$("#cboSupYn").click(function(){
				if ($(this).is(':checked')) {
					$("#txtSuppNm").val("None");
					$("#txtSuppPhone").val("None");
				}else{
					$("#txtSuppNm").val("");
					$("#txtSuppPhone").val("");
				}
				
				$("#txtSuppIdVal").val("");
			});
			
			//
			$("#cboReqStaffYn").click(function(){
				if ($(this).is(':checked')) {
					$("#cboReqStaff").val("");
				}
			});
			
			//
			$("#cboReqStaff").change(function(){
				if ($(this).val() != "") {
					$("#cboReqStaffYn").prop("checked",false);
				}else{
					$("#cboReqStaffYn").prop("checked",true);
				}
			});
		}
};

function calculateTotalAmount(val1,val2){
	parent.$("#msgErr").html("");
	parent.$("#msgErr").hide();
	
	if(stock.comm.isEmpty(val1)){
		val1=0;
	}
	if(stock.comm.isEmpty(val2)){
		val2=0;
	}
	var totalAmount = parseFloat(val1)*parseFloat(val2);
	totalAmount = totalAmount.toFixed(2);
	return totalAmount;
}

function saveData(str){
	
	$("#expId").appendTo("#frmExpend");
    parent.$("#loading").show();
    if($("#txtSuppNm").val() == "" || $("#txtSuppIdVal").val() == ""){
    	if(!$("#cboSupYn").is(':checked')){
    		top.stock.comm.alertMsg($.i18n.prop("msg_choose_sup"));
    		parent.$("#loading").hide();
    		return;
    	}
	}
    if($("#cboReqStaff").val() == "" || $("cboReqStaff").val() == ""){
    	if(!$("#cboReqStaffYn").is(':checked')){
    		top.stock.comm.alertMsg("សូមជ្រើសរើស អ្នកស្នើសុំ!!!");
    		parent.$("#loading").hide();
    		return;
    	}
	}
    var requireCheck="";
    var eqRequire=0;
    var itemTableCheck=$("#tblExpendItem tbody tr");
    for(var i=0; i<itemTableCheck.length;i++){
    	if(stock.comm.isEmpty($("#tblExpendItem tbody tr:eq("+i+")").find("td.exp-des input").val())){
    		requireCheck = "true";
    		eqRequire=i;
    		break;
    	}
	}
    
    if(requireCheck == "true"){
    	$("#tblExpendItem tbody tr:eq("+eqRequire+") td input").css("border","1px solid red");
    	parent.$("#loading").hide();
    	
    	parent.$("#msgErr").html("សូមពិនិត្យទិន្ន័យអោយបានត្រឹមត្រូវ!!!");
		parent.$("#msgErr").show();
		
    	return;
    }
    
	$.ajax({
		type : "POST",
		url  : $("#base_url").val() +"Expend/uploadImageExpend",
		data : new FormData($("#frmExpend")[0]),
		cache: false,
        contentType: false,
        processData: false,
        async: false,
		success: function(res) {
			saveDataAfterUploadImage(res,str);
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}


function saveDataAfterUploadImage(image_path,str){
	var itemDescArr=[];
	var itemQtyKhrArr=[];
	var itemUnitPriceKhrArr=[];
	var itemTotalPriceKhrArr=[];
	var itemQtyArr=[];
	var itemUnitPriceArr=[];
	var itemTotalPriceArr=[];
	var itemNoArr=[];
	
	var itemTable=$("#tblExpendItem tbody tr");
	itemTable.each(function(i){
		itemDescArr.push($(this).find("td.exp-des input").val());
		itemQtyKhrArr.push($(this).find("td.exp-qty-khr input").val());
		itemUnitPriceKhrArr.push($(this).find("td.exp-unit-price-khr input").val());
		itemTotalPriceKhrArr.push($(this).find("td.exp-total-price-khr").html().replace(/,/g,""));
		itemQtyArr.push($(this).find("td.exp-qty input").val());
		itemUnitPriceArr.push($(this).find("td.exp-unit-price input").val());
		itemTotalPriceArr.push($(this).find("td.exp-total-price").html().replace(/,/g,""));
		itemNoArr.push($(this).find("td.exp-no").html().replace(/,/g,""));
	});
    
    $.ajax({
		type : "POST",
		url  : $("#base_url").val() +"Expend/save",
		data : $("#frmExpend").serialize()+"&itemDescArr="+itemDescArr+
										"&itemQtyKhrArr="+itemQtyKhrArr+
										"&itemUnitPriceKhrArr="+itemUnitPriceKhrArr+
										"&itemTotalPriceKhrArr="+itemTotalPriceKhrArr+
										"&itemQtyArr="+itemQtyArr+
										"&itemUnitPriceArr="+itemUnitPriceArr+
										"&itemTotalPriceArr="+itemTotalPriceArr+
										"&itemNoArr="+itemNoArr+
										"&expImage="+image_path,
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
			}else{
				console.log("Error::::::::::"+res);
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
			    $("#txtSuppIdVal").val(res.OUT_REC[0]["sup_id"]);

			    
				$("#txtSuppNm").val(res.OUT_REC[0]["sup_nm_kh"]);
				$("#txtSuppNmVal").val(res.OUT_REC[0]["sup_nm_kh"]);
			
			    $("#txtInvNo").val(res.OUT_REC[0]["exp_inv_no"]);
			    
			    $("#txtSuppPhone").val(res.OUT_REC[0]["sup_phone"]);
			    $("#txtSuppPhoneVal").val(res.OUT_REC[0]["sup_phone"]);
				$("#projectNm option[value='"+res.OUT_REC[0]["bra_id"]+"']").attr("selected","selected");
				$("#txtExpendDate").val(stock.comm.formatDateWithoutTime(res.OUT_REC[0]["exp_date"]));
				$("#txtRequestDate").val(stock.comm.formatDateWithoutTime(res.OUT_REC[0]["exp_req_date"]));
				$("#cboStaffPay option[value='"+res.OUT_REC[0]["sta_id"]+"']").attr("selected","selected");
			    //$("#txtTotalExp").val(stock.comm.formatCurrency(res.OUT_REC[0]["exp_total_price"]));
			    //$("#txtTotalExp").attr("readonly", true);
				$("#txtDesc").val(res.OUT_REC[0]["exp_des"]);
			    if(res.OUT_REC[0]["exp_image"] != null && res.OUT_REC[0]["exp_image"] != ""){
			    	$("#expendImgView").attr("src", $("#base_url").val()+"upload"+res.OUT_REC[0]["exp_image"]);
			    	$("#expImgPath").val(res.OUT_REC[0]["exp_image"]);
			    }
			    if(res.OUT_REC[0]["sup_nm_kh"] == "" || res.OUT_REC[0]["sup_nm_kh"] == null || res.OUT_REC[0]["sup_nm_kh"] == "null"){
			    	$("#cboSupYn").attr("checked","checked");
			    	$("#txtSuppNm").val("None");
					$("#txtSuppPhone").val("None");
				}
			    
			    $("#txtVoNo").val(res.OUT_REC[0]["exp_voucher_no"]);
			    if(res.OUT_REC[0]["exp_req_staff_id"] == "0" || res.OUT_REC[0]["exp_req_staff_id"] == "" || res.OUT_REC[0]["exp_req_staff_id"] == null || res.OUT_REC[0]["exp_req_staff_id"] == "null"){
			    	$("#cboReqStaffYn").attr("checked","checked");
			    	$("#cboReqStaff").text("");
			    
				}else{
					$("#cboReqStaff").val(res.OUT_REC[0]["exp_req_staff_id"]);
				}
			    
			    $("#btnMinus,#btnPlus").hide();
			    
			    $("#tblExpendItem tbody tr td input").remove();
			    
			    $("#tblExpendItem tbody tr:eq(0)").find("td.exp-no").html(res.OUT_REC[0]["exp_item_no"]);
			    $("#tblExpendItem tbody tr:eq(0)").find("td.exp-des").html(res.OUT_REC[0]["exp_des"]);
			    
			    if(res.OUT_REC[0]["exp_total_price_khr"] > 0){
			    	$("#tblExpendItem tbody tr:eq(0)").find("td.exp-qty-khr").html(res.OUT_REC[0]["exp_qty_khr"]);
				    $("#tblExpendItem tbody tr:eq(0)").find("td.exp-unit-price-khr").html(stock.comm.formatCurrency(res.OUT_REC[0]["exp_unit_price_khr"])+" ៛");
				    $("#tblExpendItem tbody tr:eq(0)").find("td.exp-total-price-khr").html(stock.comm.formatCurrency(res.OUT_REC[0]["exp_total_price_khr"])+" ៛");
					    
			    }else{
			    	$("#tblExpendItem tbody tr:eq(0)").find("td.exp-qty").html(res.OUT_REC[0]["exp_qty"]);
				    $("#tblExpendItem tbody tr:eq(0)").find("td.exp-unit-price").html(stock.comm.formatCurrency(res.OUT_REC[0]["exp_unit_price"])+" $");
				    $("#tblExpendItem tbody tr:eq(0)").find("td.exp-total-price").html(stock.comm.formatCurrency(res.OUT_REC[0]["exp_total_price"])+" $");
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
		var strHtml = '<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>';
		var proStr  = "";
		$("#projectNm").empty();
		for(var i = 0; i < PROJECT_REC.length; i++){
			if(PROJECT_REC[i]["bra_nm_kh"] != "" && PROJECT_REC[i]["bra_nm_kh"] != null){
				proStr = PROJECT_REC[i]["bra_nm_kh"];
			}else{
				proStr = PROJECT_REC[i]["bra_nm"];
			}
			strHtml += '<option value="'+PROJECT_REC[i]["bra_id"]+'">'+proStr+'</option>';
		}
		$("#projectNm").html(strHtml);
	}
}

function filtStaffCombo(){
	var Staff_REC = stock.comm.callDataCombo("Staff","getStaffData");

	if(!stock.comm.isEmpty(Staff_REC)){
		var strHtml  = '<option value="" data-i18ncd="lb_sta_choose" selected>សូមជ្រើសរើស</option>';
			//strHtml += '<option value="0" data-i18ncd="lb_staff_admin">Admin</option>';
		var staffStr = "";
		$("#cboStaffPay").empty();
		$("#cboReqStaff").empty();
		for(var i = 0; i < Staff_REC.length; i++){
			if(Staff_REC[i]["sta_nm_kh"] != "" && Staff_REC[i]["sta_nm_kh"] != null){
				staffStr = Staff_REC[i]["sta_nm_kh"];
			}else{
				staffStr = Staff_REC[i]["sta_nm"];
			}
			strHtml += '<option value="'+Staff_REC[i]["sta_id"]+'">'+staffStr+'</option>';
		}
		$("#cboStaffPay").html(strHtml);
		$("#cboReqStaff").html(strHtml);
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


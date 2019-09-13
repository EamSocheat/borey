var _pageNo = 1;
var _this;
$(document).ready(function(){
	_thisPage.init();
});

var _thisPage = {
	init : function(){
		_this = this;
		_this.onload();
		_this.event();
	},
	onload : function(){
		getData();
		stock.comm.checkAllTblChk("chkAllBox","tblCommission","chk_box");

		$('#txtSrchSaleSD').datepicker({
			language: (getCookie("lang") == "kh" ? "kh" : "en"),
			weekStart: true,
			todayBtn:  true,
			autoclose: true,
			todayHighlight: 1,
			forceParse: 0,
			sideBySide: true,
			format: "dd-mm-yyyy",
		});
		$("#txtSrchSaleSD").inputmask();
		$('#txtSrchSaleED').datepicker({
			language: (getCookie("lang") == "kh" ? "kh" : "en"),
			weekStart: true,
			todayBtn:  true,
			autoclose: true,
			todayHighlight: 1,
			forceParse: 0,
			sideBySide: true,
			format: "dd-mm-yyyy",
		});
		$("#txtSrchSaleED").inputmask();

		$('#txtSrchApproveSD').datepicker({
			language: (getCookie("lang") == "kh" ? "kh" : "en"),
			weekStart: true,
			todayBtn:  true,
			autoclose: true,
			todayHighlight: 1,
			forceParse: 0,
			sideBySide: true,
			format: "dd-mm-yyyy",
		});
		$("#txtSrchApproveSD").inputmask();
		$('#txtSrchApproveED').datepicker({
			language: (getCookie("lang") == "kh" ? "kh" : "en"),
			weekStart: true,
			todayBtn:  true,
			autoclose: true,
			todayHighlight: 1,
			forceParse: 0,
			sideBySide: true,
			format: "dd-mm-yyyy",
		});
		$("#txtSrchApproveED").inputmask();
		filtStaffCombo();
	},event : function(){
		$("#perPage").change(function(e){
			_pageNo = 1;
			getData();
		});

		$("#txtSrchSaleSDIcon, #txtSrchSaleEDIcon, #txtSrchApproveSDIcon, #txtSrchApproveEDIcon").click(function(e){
			$(this).next().focus();
		});

		//--pagination
		$("#paging").on("click", "li a", function(e) {
			var pageNo = $(this).html();
			_pageNo = pageNo;
			getData(pageNo);
		});

		$("#salMonthIcon").on("click", function(e) {
			$(this).next().focus();
		});

		$(".box-footer").on("click", "#btnGoToPage", function(e) {
			var pageNo = $("#txtGoToPage").val();
			getData(pageNo);
		});

		//
		$("#btnAddNew").click(function(){
			$("#loading").show();
			var controllerNm = "PopupFormSalary";
			var option = {};
			option["height"] = "455px";

			stock.comm.openPopUpForm(controllerNm, option, null, "modal-md");
		});

		//
		$("#btnEdit").click(function(){
			var chkVal = $('#tblCommission tbody tr td.chk_box input[type="checkbox"]:checked');
			if(chkVal.length != 1){
				stock.comm.alertMsg($.i18n.prop("msg_con_edit1"));
				return;
			}
			var tblTr = chkVal.parent().parent();
			var braId = tblTr.attr("data-id");
			editData(braId);
		});

		//
		$("#btnDelete").click(function(e){
			var chkVal = $('#tblCommission tbody tr td.chk_box input[type="checkbox"]:checked');

			if(chkVal.length <= 0){
				stock.comm.alertMsg($.i18n.prop("msg_con_del"));
				return;
			}

			stock.comm.confirmMsg($.i18n.prop("msg_sure_del"));
			$("#btnConfirmOk").unbind().click(function(e){
				$("#mdlConfirm").modal('hide');

				var delArr = [];
				var delObj = {};
				chkVal.each(function(i){
					var delData = {};
					var tblTr   = $(this).parent().parent().parent();
					var data_id = tblTr.attr("data-id");
					delData["commiId"] = data_id;
					delArr.push(delData);
				});

				delObj["delObj"] = delArr;
				console.log(delObj);
				deleteDataArr(delObj);
			});
		});

		//
		$("#btnReset").click(function(e){
			resetFormSearch();
		});

		$("#btnDownExcel").click(function(e){
			e.preventDefault();
			var chkVal = $('#tblCommission tbody tr td.chk_box input[type="checkbox"]:checked');

			if(chkVal.length <= 0){
				stock.comm.alertMsg($.i18n.prop("msg_down_excel"));
				return;
			}

			var objArr = [];
			chkVal.each(function(i){
				var tblTr   = $(this).parent();
				var data_id = tblTr.attr("data-id");
				objArr.push(Number(data_id));
			});

			$("#expId").val(objArr);
			$("#btnExcel").submit();
		});
	}
};

function getData(page_no){
	var pageNo = 1;
	if(page_no != "" && page_no != null && page_no != undefined){
		if(page_no <=0){
			page_no = 1;
		}
		pageNo = page_no;
	}
	var dat = {};
	//paging
	dat["perPage"] = $("#perPage").val();
	dat["offset"]  = parseInt($("#perPage").val())  * ( pageNo - 1);

	// search
	dat["sellCode"]		= $("#txtSellCode").val();
	dat["sellerId"]		= $("#cmboSeller option:selected").val();
	dat["saleSDate"]	= $("#txtSrchSaleSD").val();
	dat["saleEDate"]	= $("#txtSrchSaleED").val();
	dat["apprSDate"]	= $("#txtSrchApproveSD").val();
	dat["apprEDate"]	= $("#txtSrchApproveED").val();
	dat["cboStatus"]	= $("#cboStatus option:selected").val();
	dat["proCode"]		= $("#txtProCode").val();
	
	$("#loading").show();
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"CommissionReport/getCommissionData",
		data: dat,
		dataType: "json",
		success	: function(res) {
			$("#tblCommission tbody").html("");
			$("#chkAllBox").prop( "checked", false );
			
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#chkAllBox").show();
				var strHtml = "", strTotal = "";
				var totalCommissionAmt = 0, totalSalary = 0,totalCommissionAmtAppr=0;

				for(var i = 0; i < res.OUT_REC.length; i++){
					var approveAmt = "";
					if(res.OUT_REC[i]["commi_amt_approve"] != null && res.OUT_REC[i]["commi_amt_approve"] != ""){
						approveAmt =stock.comm.formatCurrency(res.OUT_REC[i]["commi_amt_approve"]);
						approveAmt+="$";
						totalCommissionAmtAppr+=parseFloat(res.OUT_REC[i]["commi_amt_approve"]);
					}
					strHtml += '<tr class="cur-pointer" data-id="'+res.OUT_REC[i]["commi_id"]+'">';
					strHtml += '	<td class="chk_box"><div class="" style="width: 10px;"><input type="checkbox"></div></td>';
					strHtml += '	<td><div class="">'+(res.OUT_REC[i]["commi_type"] == "A" ? "បុគ្គលិក" : "បុគ្គល")+'</div></td>';
					
					strHtml += '	<td><div class="" style="text-align: right">'+stock.comm.formatCurrency(res.OUT_REC[i]["commi_amt"])+'$</div></td>';
					strHtml += '	<td><div class="" style="text-align: right">'+approveAmt+'</div></td>';
					strHtml += '	<td><div class="" style="text-align: center">'+(renderStatus(res.OUT_REC[i]["commi_is_approve"]))+'</div></td>';
					strHtml += '	<td><div class="" style="">'+(stock.comm.isEmpty(res.OUT_REC[i]["commi_approve_date"]) ? "" : stock.comm.formatDateWithoutTime(res.OUT_REC[i]["commi_approve_date"]))+'</div></td>';
					strHtml += '	<td><div class="" style="">'+res.OUT_REC[i]["sta_nm_kh"]+'</div></td>';
					strHtml += '	<td><div class="" style="">'+stock.comm.formatDateWithoutTime(res.OUT_REC[i]["sell_date"])+'</div></td>';
					strHtml += '	<td><div class="" style="">'+res.OUT_REC[i]["sell_code"]+'</div></td>';
					strHtml += '	<td><div class="" style="">'+res.OUT_REC[i]["pro_code"]+'</div></td>';
					strHtml += '	<td><div class="" style="text-align: center">'+(res.OUT_REC[i]["user_piad_percent"] == null ? 0 :res.OUT_REC[i]["user_piad_percent"]) +'%</div></td>';
					
					strHtml += '	<td class="text-center">';
					strHtml += '		<button type="button" onclick="editData('+res.OUT_REC[i]["commi_id"]+')" class="btn btn-primary btn-xs"><i class="fa fa-check" aria-hidden="true"></i> អនុម័ត</button>';
					strHtml += '	</td>';
					strHtml += '</tr>';

					totalCommissionAmt += parseFloat(res.OUT_REC[i]["commi_amt"]);
				}

				strTotal += '<tr class="total">';
				strTotal += '	<td class="" colspan="2" style="text-align: right;font-weight: 600;">សរុបប្រាក់: </td>';
				strTotal += '	<td class="" colspan="" style="text-align: right;"><b>'+stock.comm.formatCurrency(totalCommissionAmt)+'$</b></td>';
				strTotal += '	<td class="" colspan="" style="text-align: right;"><b>'+stock.comm.formatCurrency(totalCommissionAmtAppr)+'$</b></td>';
				strTotal += '	<td colspan="9"></td>';
				strTotal += '</tr>';

				$("#tblCommission tbody").append(strHtml);
				$("#tblCommission tbody").append(strTotal);
				stock.comm.renderPaging("paging",$("#perPage").val(),res.OUT_REC_CNT[0]["total_rec"],pageNo);
			}else{
				$("#chkAllBox").hide();
				$("#tblCommission tbody").html("");
				$("#tblCommission tbody").append("<tr><td colspan='9' style='text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
				//--pagination
				stock.comm.renderPaging("paging",$("#perPage").val(),0,pageNo);
			}
			$("#loading").hide();
		},
		error : function(data) {
			console.log(data);
			$("#chkAllBox").hide();
			$("#loading").hide();
			$("#tblCommission tbody").append("<tr><td colspan='9' style='text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
			stock.comm.alertMsg($.i18n.prop("msg_err"));
		}
	});
}

function convertStatusToLetter(salStatus){
	if(!salStatus) salStatus = "";
	var statusLetter = "";
	if(salStatus == "P"){
		statusLetter = "ព្រាងទុក";
	}else if(salStatus == "G"){
		statusLetter = "បានប្រគល់";
	}
	return statusLetter;
}

function editData(sal_id){
	var data = "id="+sal_id;
	data += "&action=U";

	var controllerNm = "PopupFormCommissionReport";
	var option = {};
	option["height"] = "415px";
	stock.comm.openPopUpForm(controllerNm, option, data, "modal-md");
}

/**
 *
 */
function deleteDataArr(dataArr){
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"CommissionReport/delete",
		data: dataArr,
		dataType: 'json',
		success: function(res) {
			if(res > 0){
				stock.comm.alertMsg(res+$.i18n.prop("msg_del_com"));
				getData(_pageNo);
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


function filtStaffCombo(){
	var Staff_REC = stock.comm.callDataCombo("Staff","getStaff");

	if(!stock.comm.isEmpty(Staff_REC)){
		var strHtml  = '<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>';
		//strHtml += '<option value="0" data-i18ncd="lb_staff_admin">Admin</option>';
		var staffStr = "";
		$("#cmboSeller").empty();
		for(var i = 0; i < Staff_REC.length; i++){
			if(Staff_REC[i]["sta_nm_kh"] != "" && Staff_REC[i]["sta_nm_kh"] != null){
				staffStr = Staff_REC[i]["sta_nm_kh"];
			}else{
				staffStr = Staff_REC[i]["sta_nm"];
			}
			strHtml += '<option value="'+Staff_REC[i]["sta_id"]+'">'+staffStr+'</option>';
		}
		$("#cmboSeller").html(strHtml);
	}
}

/**
 *
 */
function resetFormSearch(){
	$("#cmboSeller option:eq(0)").attr("selected", true);
	$("#cboStatus option:eq(0)").attr("selected", true);
	$("#txtSrchSaleSD").val("");
	$("#txtSrchSaleED").val("");
	$("#txtSrchApproveSD").val("");
	$("#txtSrchApproveED").val("");
	$("#txtSellCode").val("");
}

/**
 *
 */
function popupCommissionReportCallback(){
	getData(_pageNo);
}

function renderStatus(val){
	var html="";
	if(val == "Y"){
		html='<span class="label label-success">រូចរាល់</span>';
	}else{
		html='<span class="label label-default">រង់ចាំ</span>';
	}
	return html;
}

var _pageNo=1;
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
		stock.comm.checkAllTblChk("chkAllBox","tblSalary","chk_box");

		$('#txtSalMonth').datepicker({
			language: (getCookie("lang") == "kh" ? "kh" : "en"),
			format: "mm-yyyy",
			viewMode: "months",
			autoclose: true,
			minViewMode: "months"
		});
		$("#txtSalMonth").inputmask();
		filtStaffCombo();
	},event : function(){
		$("#perPage").change(function(e){
			_pageNo = 1;
			getData();
		});

		$("#txtSrchHouseSDIcon, #txtSrchHouseEDIcon").click(function(e){
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
			var chkVal = $('#tblSalary tbody tr td.chk_box input[type="checkbox"]:checked');
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
			var chkVal = $('#tblSalary tbody tr td.chk_box input[type="checkbox"]:checked');

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
					delData["salId"] = data_id;
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
			var chkVal = $('#tblSalary tbody tr td.chk_box input[type="checkbox"]:checked');

			if(chkVal.length <= 0){
				stock.comm.alertMsg($.i18n.prop("msg_down_excel"));
				return;
			}

			var objArr = [];
			chkVal.each(function(i){
				var tblTr   = $(this).parent().parent();
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
	var salMonth = $("#txtSalMonth").val();
	//paging
	dat["perPage"] = $("#perPage").val();
	dat["offset"]  = parseInt($("#perPage").val())  * ( pageNo - 1);

	// search
	dat["staffId"]		= $("#staffNm option:selected").val();
	dat["salStatus"]	= $("#cboStatus option:selected").val();
	dat["salMonth"]		= (salMonth != "" ? salMonth.split("-")[1]+"-"+salMonth.split("-")[0] : "");

	$("#loading").show();
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Salary/getSalary",
		data: dat,
		dataType: "json",
		success	: function(res) {
			$("#tblSalary tbody").html("");
			$("#chkAllBox").prop( "checked", false );

			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#chkAllBox").show();
				var strHtml = "", strTotal = "";
				var totalSalaryAmt = 0, totalSalary = 0;

				for(var i = 0; i < res.OUT_REC.length; i++){
					totalSalary = parseFloat(res.OUT_REC[i]["sal_amt"]) + parseFloat(res.OUT_REC[i]["sal_comm"]) + parseFloat(res.OUT_REC[i]["sal_overtime"]);

					strHtml += '<tr data-id="'+res.OUT_REC[i]["sal_id"]+'" class="cur-pointer" ondblclick="editData('+res.OUT_REC[i]['sal_id']+')">';
					strHtml += '	<td class="chk_box"><div class="" style="width: 10px;"><input type="checkbox"></div></td>';
					strHtml += '	<td><div class="">'+stock.comm.formatDateWithoutTime(res.OUT_REC[i]["sal_month"]).substr(3,10)+'</div></td>';
					strHtml += '	<td><div class="" style="text-align: right">'+stock.comm.formatCurrency(res.OUT_REC[i]["sal_amt"])+'$</div></td>';
					strHtml += '	<td><div class="" style="text-align: right">'+stock.comm.formatCurrency(res.OUT_REC[i]["sal_comm"])+'$</div></td>';
					strHtml += '	<td><div class="" style="text-align: right">'+stock.comm.formatCurrency(res.OUT_REC[i]["sal_overtime"])+'$</div></td>';
					strHtml += '	<td><div class="" style="text-align: right">'+stock.comm.formatCurrency(totalSalary)+'$</div></td>';
					strHtml += '	<td><div class="" style="">'+convertStatusToLetter(res.OUT_REC[i]["sal_status"])+'</div></td>';
					strHtml += '	<td class="text-center">';
					strHtml += '		<button type="button" class="btn btn-primary btn-xs" onclick="editData('+res.OUT_REC[i]["sal_id"]+')">';
					strHtml += '			<i class="fa fa-pencil-square-o" aria-hidden="true"></i>';
					strHtml += '		</button>';
					strHtml += '	</td>';
					strHtml += '</tr>';

					totalSalaryAmt += parseFloat(totalSalary);
				}

				strTotal += '<tr class="total">';
				strTotal += '	<td class="" colspan="5" style="text-align: right;font-weight: 600;">សរុបប្រាក់ខែបុគ្គលិក: </td>';
				strTotal += '	<td class="" style="text-align: right;"><b>'+stock.comm.formatCurrency(totalSalaryAmt)+'$</b></td>';
				strTotal += '	<td class="" style="text-align: right;"></td>';
				strTotal += '	<td class="" style="text-align: right;"></td>';
				strTotal += '</tr>';

				$("#tblSalary tbody").append(strHtml);
				$("#tblSalary tbody").append(strTotal);
				stock.comm.renderPaging("paging",$("#perPage").val(),res.OUT_REC_CNT[0]["total_rec"],pageNo);
			}else{
				$("#chkAllBox").hide();
				$("#tblSalary tbody").html("");
				$("#tblSalary tbody").append("<tr><td colspan='9' style='text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
				//--pagination
				stock.comm.renderPaging("paging",$("#perPage").val(),0,pageNo);
			}
			$("#loading").hide();
		},
		error : function(data) {
			console.log(data);
			$("#chkAllBox").hide();
			$("#loading").hide();
			$("#tblSalary tbody").append("<tr><td colspan='9' style='text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
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

	var controllerNm = "PopupFormSalary";
	var option = {};
	option["height"] = "455px";
	stock.comm.openPopUpForm(controllerNm, option, data, "modal-md");
}

/**
 *
 */
function deleteDataArr(dataArr){
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Salary/delete",
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
		strHtml += '<option value="0" data-i18ncd="lb_staff_admin">Admin</option>';
		var staffStr = "";
		$("#staffNm").empty();
		for(var i = 0; i < Staff_REC.length; i++){
			if(Staff_REC[i]["sta_nm_kh"] != "" && Staff_REC[i]["sta_nm_kh"] != null){
				staffStr = Staff_REC[i]["sta_nm_kh"];
			}else{
				staffStr = Staff_REC[i]["sta_nm"];
			}
			strHtml += '<option value="'+Staff_REC[i]["sta_id"]+'">'+staffStr+'</option>';
		}
		$("#staffNm").html(strHtml);
	}
}

/**
 *
 */
function resetFormSearch(){
	$("#staffNm option:eq(0)").attr("selected", true);
	$("#cboStatus option:eq(0)").attr("selected", true);
	$("#txtSalMonth").val("");
}

/**
 *
 */
function popupSalaryCallback(){
	getData(_pageNo);
}

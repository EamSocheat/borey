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
		stock.comm.inputNumber("txtSrchBraPhone");
		stock.comm.checkAllTblChk("chkAllBox","tblExpend","chk_box");

		$('#txtSrchExpendSD').datepicker({
			language: (getCookie("lang") == "kh" ? "kh" : "en"),
			weekStart: true,
			todayBtn:  true,
			autoclose: true,
			todayHighlight: 1,
			forceParse: 0,
			sideBySide: true,
			format: "dd-mm-yyyy",
		});
		$("#txtSrchExpendSD").inputmask();

		$('#txtSrchExpendED').datepicker({
			language: (getCookie("lang") == "kh" ? "kh" : "en"),
			weekStart: true,
			todayBtn:  true,
			autoclose: true,
			todayHighlight: 1,
			forceParse: 0,
			sideBySide: true,
			format: "dd-mm-yyyy",
		});
		$("#txtSrchExpendED").inputmask();

		filtSupplierCombo();
		filtProjectCombo();
		filtStaffCombo();
	},event : function(){
		$("#perPage").change(function(e){
			_pageNo = 1;
			getData();
		});

		$("#txtSrchExpendSDIcon, #txtSrchExpendEDIcon").click(function(e){
			$(this).next().focus();
		});

		//--pagination
		$("#paging").on("click", "li a", function(e) {
			var pageNo = $(this).html();
			_pageNo = pageNo;
			getData(pageNo);
		});

		$(".box-footer").on("click", "#btnGoToPage", function(e) {
			var pageNo = $("#txtGoToPage").val();
			getData(pageNo);
		});

		//
		$("#btnAddNew").click(function(){
			$("#loading").show();
			var controllerNm = "PopupFormExpend";
			var option = {};
			option["height"] = "730px";

			stock.comm.openPopUpForm(controllerNm, option, null, "modal-lg");
		});

		//
		$("#btnEdit").click(function(){
			var chkVal = $('#tblExpend tbody tr td.chk_box input[type="checkbox"]:checked');
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
			var chkVal = $('#tblExpend tbody tr td.chk_box input[type="checkbox"]:checked');

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
					var tblTr   = $(this).parent().parent();
					var data_id = tblTr.attr("data-id");
					delData["expId"] = data_id;
					delArr.push(delData);
				});

				delObj["delObj"] = delArr;
				deleteDataArr(delObj);
			});
		});

		//
		$("#btnSearch").click(function(e){
			getData(1);
		});

		//
		$("#btnReset").click(function(e){
			resetFormSearch();
		});

		$("#btnDownExcel").click(function(e){
			e.preventDefault();
			var chkVal = $('#tblExpend tbody tr td.chk_box input[type="checkbox"]:checked');

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
	$("#chkAllBox").prop( "checked", false );
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
	//searching
	dat["suppNm"]	= $("#cboSupNm option:selected").val();
	dat["expPro"]	= $("#projectNm option:selected").val();
	dat["expSta"] 	= $("#cboStaffPay option:selected").val();
	dat["txtSrchExpendSD"]	= $("#txtSrchExpendSD").val();
	dat["txtSrchExpendED"]	= $("#txtSrchExpendED").val();

	$("#loading").show();
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Expend/getExpend",
		data: dat,
		dataType: "json",
		success	: function(res) {
			$("#tblExpend tbody").html("");
			var strHmtl	 = "";
			var strTotal = "";
			var totalAmt = 0,totalAmtKhr = 0;
			var supNmKh  = "";
			var staNmKh  = "";

			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#chkAllBox").show();

				for(var i = 0; i < res.OUT_REC.length; i++){
					var urlPhoto	= "";
					if(res.OUT_REC[i]["exp_image"] != null && res.OUT_REC[i]["exp_image"] != ""){
						urlPhoto = $("#base_url").val()+"/upload"+ res.OUT_REC[i]["exp_image"];
					}else{
						urlPhoto = $("#base_url").val()+"/assets/image/default-staff-photo.png";
					}

					if(res.OUT_REC[i]["sup_nm_kh"] != "" && res.OUT_REC[i]["sup_nm_kh"] != null){
						supNmKh = res.OUT_REC[i]["sup_nm_kh"];
					}else{
						supNmKh = res.OUT_REC[i]["sup_nm"];
					}

					if(res.OUT_REC[i]["sta_nm_kh"] != "" && res.OUT_REC[i]["sta_nm_kh"] != null){
						staNmKh = res.OUT_REC[i]["sta_nm_kh"];
					}else{
						staNmKh = res.OUT_REC[i]["sta_nm"];
					}

					strHmtl += '<tr data-id="'+res.OUT_REC[i]["exp_id"]+'" class="cur-pointer" ondblclick="editData('+res.OUT_REC[i]['exp_id']+')">';
					strHmtl += '	<td class="chk_box"><input type="checkbox" /></td>';
					strHmtl += '	<td><div>'+res.OUT_REC[i]["bra_nm_kh"]+'</div></td>';
					strHmtl += '	<td><div>'+nullToNone(supNmKh)+'</div></td>';
					strHmtl += '	<td><div>'+nullToNone(res.OUT_REC[i]["exp_inv_no"])+'</div></td>';
					strHmtl += '	<td><div>'+res.OUT_REC[i]["exp_des"]+'</div></td>';
					strHmtl += '	<td><div style="text-align: right">'+zeroToEmpty(res.OUT_REC[i]["exp_qty_khr"])+'</div></td>';
					strHmtl += '	<td><div style="text-align: right">'+zeroToEmpty(res.OUT_REC[i]["exp_unit_price_khr"])+'</div></td>';
					strHmtl += '	<td><div style="text-align: right">'+zeroToEmpty(res.OUT_REC[i]["exp_total_price_khr"])+'</div></td>';
					strHmtl += '	<td><div style="text-align: right">'+zeroToEmpty(res.OUT_REC[i]["exp_qty"])+'</div></td>';
					strHmtl += '	<td><div style="text-align: right">'+zeroToEmpty(res.OUT_REC[i]["exp_unit_price"])+'</div></td>';
					strHmtl += '	<td><div style="text-align: right">'+zeroToEmpty(res.OUT_REC[i]["exp_total_price"])+'</div></td>';
					strHmtl += '	<td><div style="text-align: center">'+stock.comm.formatDateWithoutTime(res.OUT_REC[i]["exp_req_date"])+'</div></td>';
					strHmtl += '	<td><div style="text-align: center">'+stock.comm.formatDateWithoutTime(res.OUT_REC[i]["exp_date"])+'</div></td>';
					strHmtl += '	<td><div>'+staNmKh+'</div></td>';
					strHmtl += '	<td class="text-center">';
					strHmtl += '		<button type="button" class="btn btn-primary btn-xs" onclick="editData('+res.OUT_REC[i]["exp_id"]+')">';
					strHmtl += '			<i class="fa fa-pencil-square-o" aria-hidden="true"></i>';
					strHmtl += '		</button>';
					strHmtl += '	</td>';
					strHmtl += '</tr>';

					totalAmt += parseFloat(res.OUT_REC[i]["exp_total_price"]);
					totalAmtKhr +=parseFloat(res.OUT_REC[i]["exp_total_price_khr"]);
				}

				strTotal +='<tr class="total">';
				strTotal +='	<td class="" colspan="2" style="text-align: right;"><b>ថ្លៃចំណាយសរុប:</b> </td>';
				strTotal +='	<td class="" colspan="3" style="text-align: right;"></td>';
				strTotal +='	<td class="" colspan="3"  style="text-align: right;"><b>(៛) '+stock.comm.formatCurrency(totalAmtKhr.toFixed(2))+'</b></td>';
				strTotal +='	<td class="" colspan="3" style="text-align: right;"><b>($) '+stock.comm.formatCurrency(totalAmt.toFixed(2))+'</b></td>';
				strTotal +='	<td class="" colspan="4" style="text-align: right;"></td>';
				strTotal +='</tr>';

				$("#tblExpend tbody").append(strHmtl);
				$("#tblExpend tbody").append(strTotal);
				stock.comm.renderPaging("paging",$("#perPage").val(),res.OUT_REC_CNT[0]["total_rec"],pageNo);
			}else{
				$("#chkAllBox").hide();
				$("#tblExpend tbody").html("");
				$("#tblExpend tbody").append("<tr><td colspan='15' style='    text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
				//--pagination
				stock.comm.renderPaging("paging",$("#perPage").val(),0,pageNo);
			}
			$("#loading").hide();
		},
		error : function(data) {
			console.log(data);
			$("#chkAllBox").hide();
			$("#loading").hide();
			$("#tblExpend tbody").append("<tr><td colspan='9' style='    text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
			stock.comm.alertMsg($.i18n.prop("msg_err"));
		}
	});
}

function nullToNone(val){
	if(val =="" || val=="null" || val == null){
		val="None";
	}
	return val;
}
function zeroToEmpty(val){
	if(val ==0 || val =="0" || val =="" || val=="null" || val == null){
		val="";
	}else{
		val = stock.comm.formatCurrency(val);
	}
	return val;
}

function editData(exp_id){
	var data = "id="+exp_id;
	data += "&action=U";

	var controllerNm = "PopupFormExpend";
	var option = {};
	option["height"] = "730px";
	stock.comm.openPopUpForm(controllerNm,option, data,"modal-lg");
}

/**
 *
 */
function deleteDataArr(dataArr){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Expend/delete",
		data: dataArr,
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

function filtSupplierCombo(){
	var SUPPLIER_REC = stock.comm.callDataCombo("Supplier","getSupplierData");

	if(!stock.comm.isEmpty(SUPPLIER_REC)){
		var strHtml = '<option value="" data-i18ncd="lb_sup_choose">សូមជ្រើសរើស</option>';
		var supStr  = "";
		$("#cboSupNm").empty();
		for(var i = 0; i < SUPPLIER_REC.length; i++){
			if(SUPPLIER_REC[i]["sup_nm_kh"] != "" && SUPPLIER_REC[i]["sup_nm_kh"] != null){
				supStr = SUPPLIER_REC[i]["sup_nm_kh"];
			}else{
				supStr = SUPPLIER_REC[i]["sup_nm"];
			}
			strHtml += '<option value="'+SUPPLIER_REC[i]["sup_id"]+'">'+supStr+'</option>';
		}
		$("#cboSupNm").html(strHtml);
	}
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
	var Staff_REC = stock.comm.callDataCombo("Staff","getStaff");

	if(!stock.comm.isEmpty(Staff_REC)){
		var strHtml  = '<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>';
		//strHtml += '<option value="0" data-i18ncd="lb_staff_admin">Admin</option>';
		var staffStr = "";
		$("#cboStaffPay").empty();
		for(var i = 0; i < Staff_REC.length; i++){
			if(Staff_REC[i]["sta_nm_kh"] != "" && Staff_REC[i]["sta_nm_kh"] != null){
				staffStr = Staff_REC[i]["sta_nm_kh"];
			}else{
				staffStr = Staff_REC[i]["sta_nm"];
			}
			strHtml += '<option value="'+Staff_REC[i]["sta_id"]+'">'+staffStr+'</option>';
		}
		$("#cboStaffPay").html(strHtml);
	}
}



function downloadExcel(dataRec){
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Expend/download_excel",
		data: dataRec,
		contentType: "application/vnd.ms-excel",
		dataType: "json",
		cache: false,
		success: function(res) {
			$("#loading").hide();
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
		}
	});
}

/**
 *
 */
function resetFormSearch(){
	$("#cboSupNm option:eq(0)").attr("selected", true);
	$("#projectNm option:eq(0)").attr("selected", true);
	$("#cboStaffPay option:eq(0)").attr("selected", true);
	$("#txtSrchExpendSD").val("");
	$("#txtSrchExpendED").val("");
}

/**
 *
 */
function popupExpendCallback(){
	getData(_pageNo);
}

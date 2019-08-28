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
		// getData();
		stock.comm.checkAllTblChk("chkAllBox","tblHouse","chk_box");

		$('#txtSalMonth').datepicker({
			language: (getCookie("lang") == "kh" ? "kh" : "en"),
			format: "mm-yyyy",
			viewMode: "months",
			minViewMode: "months",
			autoclose: true
			/*dateFormat: 'MM yy',
			changeMonth: true,
			changeYear: true,
			showButtonPanel: true,
			onClose: function(dateText, inst) {
				var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
				var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
				$(this).val($.datepicker.formatDate('MM yy', new Date(year, month, 1)));
			}*/
		});
		$("#txtSalMonth").inputmask();

		filtProjectCombo();
		filtCategoryCombo();
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

		$(".box-footer").on("click", "#btnGoToPage", function(e) {
			var pageNo = $("#txtGoToPage").val();
			getData(pageNo);
		});

		//
		$("#btnAddNew").click(function(){
			$("#loading").show();
			var controllerNm = "PopupFormHouse";
			var option = {};
			option["height"] = "570px";

			stock.comm.openPopUpForm(controllerNm, option, null, "modal-md");
		});

		//
		$("#btnEdit").click(function(){
			var chkVal = $('#tblHouse tbody tr td.chk_box input[type="checkbox"]:checked');
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
			var chkVal = $('#tblHouse tbody tr td.chk_box input[type="checkbox"]:checked');

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
		$("#btnReset").click(function(e){
			resetFormSearch();
		});

		$("#btnDownExcel").click(function(e){
			e.preventDefault();
			var chkVal = $('#tblHouse tbody tr td.chk_box input[type="checkbox"]:checked');

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
	// search
	dat["braNm"]	= $("#projectNm option:selected").val();
	dat["catNm"]	= $("#cboCatNm option:selected").val();
	dat["codePay"] 	= $("#txtCodePay").val();
	dat["proStat"]	= $("#cboStatusNm option:selected").val();
	dat["txtMinPrice"]	= $("#txtMinPrice").val();
	dat["txtMaxPrice"]	= $("#txtMaxPrice").val();
	console.log(dat)

	$("#loading").show();
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"House/getHouse",
		data: dat,
		dataType: "json",
		success	: function(res) {
			$("#tblHouse tbody").html("");
			var strHmtl	 = "";
			var strTotal = "";
			var totalAmt = 0;
			var supNmKh  = "";
			var staNmKh  = "";

			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#chkAllBox").show();

				for(var i = 0; i < res.OUT_REC.length; i++){
					var urlPhoto = "";
					if(res.OUT_REC[i]["pro_photo"] != null && res.OUT_REC[i]["pro_photo"] != ""){
						urlPhoto = $("#base_url").val()+"/upload"+ res.OUT_REC[i]["pro_photo"];
					}else{
						urlPhoto = $("#base_url").val()+"assets/image/default-house.jpg";
					}

					strHmtl += '<tr data-id="'+res.OUT_REC[i]["pro_id"]+'" class="cur-pointer" ondblclick="editData('+res.OUT_REC[i]['pro_id']+')">';
					strHmtl += '	<td class="chk_box"><input type="checkbox" /></td>';
					strHmtl += '	<td class="pro_image" style="padding: 0 8px;"><div style="width: 10px;">';
					strHmtl += '		<img style="width: 35px;height: 35px;" src="'+ urlPhoto +'" class="img-circle" />';
					strHmtl += '	</div></td>';
					strHmtl += '	<td><div>'+res.OUT_REC[i]["pro_code"]+'</div></td>';
					strHmtl += '	<td><div style="text-align: right">'+stock.comm.formatCurrency(res.OUT_REC[i]["pro_price"])+'</div></td>';
					strHmtl += '	<td><div>'+stock.comm.null2Void(res.OUT_REC[i]["pro_length"])+' ម៉ែត្រ</div></td>';
					strHmtl += '	<td><div>'+stock.comm.null2Void(res.OUT_REC[i]["pro_width"])+' ម៉ែត្រ</div></td>';
					strHmtl += '	<td><div>'+stock.comm.null2Void(res.OUT_REC[i]["pro_area"])+' ម៉ែត្រការ៉េ</div></td>';
					strHmtl += '	<td class="text-center">';
					strHmtl += '		<button type="button" class="btn btn-primary btn-xs" onclick="editData('+res.OUT_REC[i]["pro_id"]+')">';
					strHmtl += '			<i class="fa fa-pencil-square-o" aria-hidden="true"></i>';
					strHmtl += '		</button>';
					strHmtl += '	</td>';
					strHmtl += '</tr>';

					totalAmt += Number(res.OUT_REC[i]["pro_price"]);
				}

				strTotal +='<tr class="total">';
				strTotal +='	<td class="" colspan="3" style="text-align: right;">ថ្លៃទំនិញសរុប: </td>';
				strTotal +='	<td class="" style="text-align: right;"><b>'+stock.comm.formatCurrency(totalAmt)+'</b></td>';
				strTotal +='</tr>';

				$("#tblHouse tbody").append(strHmtl);
				$("#tblHouse tbody").append(strTotal);
				stock.comm.renderPaging("paging",$("#perPage").val(),res.OUT_REC_CNT[0]["total_rec"],pageNo);
			}else{
				$("#chkAllBox").hide();
				$("#tblHouse tbody").html("");
				$("#tblHouse tbody").append("<tr><td colspan='9' style='text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
				//--pagination
				stock.comm.renderPaging("paging",$("#perPage").val(),0,pageNo);
			}
			$("#loading").hide();
		},
		error : function(data) {
			console.log(data);
			$("#chkAllBox").hide();
			$("#loading").hide();
			$("#tblHouse tbody").append("<tr><td colspan='9' style='text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
			stock.comm.alertMsg($.i18n.prop("msg_err"));
		}
	});
}

function editData(pro_id){
	var data = "id="+pro_id;
	data += "&action=U";

	var controllerNm = "PopupFormHouse";
	var option = {};
	option["height"] = "570px";
	stock.comm.openPopUpForm(controllerNm,option, data,"modal-md");
}

/**
 *
 */
function deleteDataArr(dataArr){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"House/delete",
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

function filtCategoryCombo(){
	var CATEGORY_REC = stock.comm.callDataCombo("Category","getCategoryData");

	if(!stock.comm.isEmpty(CATEGORY_REC)){
		var strHtml = '<option value="" data-i18ncd="lb_sup_choose">សូមជ្រើសរើស</option>';
		var supStr  = "";
		$("#cboCatNm").empty();
		for(var i = 0; i < CATEGORY_REC.length; i++){
			if(CATEGORY_REC[i]["cat_nm_kh"] != "" && CATEGORY_REC[i]["cat_nm_kh"] != null){
				supStr = CATEGORY_REC[i]["cat_nm_kh"];
			}else{
				supStr = CATEGORY_REC[i]["cat_nm"];
			}
			strHtml += '<option value="'+CATEGORY_REC[i]["cat_id"]+'">'+supStr+'</option>';
		}
		$("#cboCatNm").html(strHtml);
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
		strHtml += '<option value="0" data-i18ncd="lb_staff_admin">Admin</option>';
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
		url : $("#base_url").val() +"House/download_excel",
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
	$("#projectNm option:eq(0)").attr("selected", true);
	$("#cboCatNm option:eq(0)").attr("selected", true);
	$("#cboStatusNm option:eq(0)").attr("selected", true);
	$("#txtCodePay").val("");
	$("#txtMinPrice").val("");
	$("#txtMaxPrice").val("");
}

/**
 *
 */
function popupHouseCallback(){
	getData(_pageNo);
}

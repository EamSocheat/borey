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
			option["height"] = "622px";

			stock.comm.openPopUpForm(controllerNm, option, null, "modal-md");
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

				delObj["delObj"]= delArr;
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
	dat["suppNm"]	= $("#txtSrchSuppNm").val().trim();
	dat["expPro"]	= $("#txtSrchProNm").val().trim();
	dat["expSta"] 	= $("#txtSrchStaffNm").val().trim();
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
			var strHmtl  	= "";

			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#chkAllBox").show();

				for(var i = 0; i < res.OUT_REC.length; i++){
					var urlPhoto	= "";
					if(res.OUT_REC[i]["exp_image"] != null && res.OUT_REC[i]["exp_image"] != ""){
						urlPhoto = $("#base_url").val()+"/upload"+ res.OUT_REC[i]["exp_image"];
					}else{
						urlPhoto = $("#base_url").val()+"/assets/image/default-staff-photo.png";
					}

					strHmtl += '<tr data-id="'+res.OUT_REC[i]["exp_id"]+'">';
					strHmtl += '	<td><input type="checkbox" /></td>';
					strHmtl += '	<td><div>'+res.OUT_REC[i]["sup_nm"]+'</div></td>';
					strHmtl += '	<td><div style="text-align: right">'+res.OUT_REC[i]["exp_total_price"]+'</div></td>';
					strHmtl += '	<td><div>'+res.OUT_REC[i]["bra_nm"]+'</div></td>';
					strHmtl += '	<td><div>'+res.OUT_REC[i]["exp_date"]+'</div></td>';
					strHmtl += '	<td><div>'+res.OUT_REC[i]["sta_nm"]+'</div></td>';
					strHmtl += '	<td class="text-center">';
					strHmtl += '		<button type="button" class="btn btn-primary btn-xs">';
					strHmtl += '			<i class="fa fa-pencil-square-o" aria-hidden="true"></i>';
					strHmtl += '		</button>';
					strHmtl += '	</td>';
					strHmtl += '</tr>';

				}

				$("#tblExpend tbody").append(strHmtl);
				stock.comm.renderPaging("paging",$("#perPage").val(),res.OUT_REC_CNT[0]["total_rec"],pageNo);
			}else{
				$("#chkAllBox").hide();
				$("#tblExpend tbody").append("<tr><td colspan='9' style='    text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
				//--pagination
				stock.comm.renderPaging("paging",$("#perPage").val(),0,pageNo);
			}
			$("#loading").hide();
		},
		error : function(data) {
			console.log(data);
			$("#chkAllBox").hide();
			$("#loading").hide();
			stock.comm.alertMsg($.i18n.prop("msg_err"));
		}
	});
}

function editData(cus_id){
	var data = "id="+cus_id;
	data += "&action=U";

	var controllerNm = "PopupFormExpend";
	var option = {};
	option["height"] = "622px";
	stock.comm.openPopUpForm(controllerNm,option, data,"modal-md");
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
	$("#txtSrchSuppNm").val("");
	$("#txtSrchProNm").val("");
	$("#txtSrchExpendSD").val("");
	$("#txtSrchExpendED").val("");
	$("#txtSrchStaffNm").val("");
}

/**
 *
 */
function popupExpendCallback(){
	getData(_pageNo);
}

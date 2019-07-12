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
		stock.comm.checkAllTblChk("chkAllBox","tblCustomer","chk_box");

	},event : function(){
		$("#perPage").change(function(e){
			_pageNo = 1;
			getData();
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
			var controllerNm = "PopupFormCustomer";
			var option = {};
			option["height"] = "620px";

			stock.comm.openPopUpForm(controllerNm, option, null, "modal-md");
		});

		//
		$("#btnEdit").click(function(){
			var chkVal = $('#tblCustomer tbody tr td.chk_box input[type="checkbox"]:checked');
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
			var chkVal = $('#tblCustomer tbody tr td.chk_box input[type="checkbox"]:checked');

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
					delData["cusId"] = data_id;
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
			var chkVal = $('#tblCustomer tbody tr td.chk_box input[type="checkbox"]:checked');

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

			$("#cusId").val(objArr);
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
	dat["cusNm"]	= $("#txtSrchCusNm").val().trim();
	dat["cusNmKh"]	= $("#txtSrchCusNmKh").val().trim();
	dat["cusPhone"] = $("#txtSrchCusPhone").val().trim();
	dat["cusIdentityNmKh"] = $("#txtSrchIdentityNmKh").val().trim();

	$("#loading").show();
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Customer/getCustomer",
		data: dat,
		dataType: "json",
		success: function(res) {
			$("#tblCustomer tbody").html("");

			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#chkAllBox").show();

				for(var i=0; i<res.OUT_REC.length;i++){
					var urlPhoto = "";
					if(res.OUT_REC[i]["cus_photo"] != null && res.OUT_REC[i]["cus_photo"] != ""){
						urlPhoto = $("#base_url").val()+"/upload"+ res.OUT_REC[i]["cus_photo"];
					}else{
						urlPhoto = $("#base_url").val()+"/assets/image/default-staff-photo.png";
					}

				var html  = "<tr class='cust-data' data-id='"+res.OUT_REC[i]["cus_id"]+"' ondblclick='editData("+res.OUT_REC[i]['cus_id']+")'>";
					html += "	<td class='chk_box'><input type='checkbox'></td>";
					html += "	<td class='cus_image' style='padding: 0 8px;'><img style='width: 35px;height: 35px;' src='"+ urlPhoto +"' class='img-circle' /></td>";
					html += "	<td class='cus_iden'><div>"+stock.comm.nullToEmpty(res.OUT_REC[i]["cus_idnt_num"])+"</div></td>";
					html += "	<td class='cus_nm_kh'><div title='"+res.OUT_REC[i]['cus_nm_kh']+"' class='txt-text-wrap'>"+res.OUT_REC[i]["cus_nm_kh"]+"</div></td>";
					html += "	<td class='cus_nm'><div title='"+res.OUT_REC[i]['cus_nm']+"' class='txt-text-wrap'>"+res.OUT_REC[i]["cus_nm"]+"</div></td>";
					html += "	<td class='cus_fb_name'><div title='"+res.OUT_REC[i]['cus_fb_name']+"' class='txt-text-wrap'>"+res.OUT_REC[i]["cus_fb_name"]+"</div></td>";
					html += "	<td class='cus_gender'><div>"+$.i18n.prop("lb_"+res.OUT_REC[i]["cus_gender"])+"</div></td>";
					html += "	<td class='cus_phone1'><div>"+res.OUT_REC[i]["cus_phone1"]+"</div></td>";
					html += "	<td class='act_btn text-center'>";
					html += "		<button onclick='editData("+res.OUT_REC[i]["cus_id"]+")' type='button' class='btn btn-primary btn-xs'>";
					html += "			<i class='fa fa-pencil-square-o' aria-hidden='true'></i>";
					html += "		</button>";
					html += "	</td>";
					html += "</tr>";

					$("#tblCustomer tbody").append(html);
				}

				stock.comm.renderPaging("paging",$("#perPage").val(),res.OUT_REC_CNT[0]["total_rec"],pageNo);
			}else{
				$("#chkAllBox").hide();
				$("#tblCustomer tbody").append("<tr><td colspan='9' style='    text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
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

	var controllerNm = "PopupFormCustomer";
	var option = {};
	option["height"] = "620px";
	stock.comm.openPopUpForm(controllerNm,option, data,"modal-md");
}

/**
 *
 */
function deleteDataArr(dataArr){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Customer/delete",
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
		url : $("#base_url").val() +"Customer/download_excel",
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
	$("#txtSrchCusNm").val("");
	$("#txtSrchCusNmKh").val("");
	$("#txtSrchCusPhone").val("");
	$("#cbxSrchBranch").val("");
	$("#cbxSrchPos").val("");
	$("#txtSrchIdentityNmKh").val("");
}

/**
 *
 */
function popupCustomerCallback(){
	getData(_pageNo);
}

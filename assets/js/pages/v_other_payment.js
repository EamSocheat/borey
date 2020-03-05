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
		getDataSell();
		
		$('#txtOtherPayDate').datepicker({
			language: "kh",
			weekStart: true,
			autoclose: true,
			todayHighlight: 1,
			minView: 2,
			sideBySide: true,
			format: "dd-mm-yyyy",
		});
		$("#txtOtherPayDate").inputmask();
		
		$('#txtOtherPayDateEnd').datepicker({
			language: "kh",
			weekStart: true,
			autoclose: true,
			todayHighlight: 1,
			minView: 2,
			sideBySide: true,
			format: "dd-mm-yyyy",
		});
		$("#txtOtherPayDateEnd").inputmask();
		
		
		
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
			var controllerNm = "PopupFormOtherPayment";
			var option = {};
			option["height"] = "510px";

			stock.comm.openPopUpForm(controllerNm, option, null, "modal-lg");
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
			printData(braId);
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
					delData["oth_pay_id"] = data_id;
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
	
	//paging
	dat["perPage"] = $("#perPage").val();
	dat["offset"]  = parseInt($("#perPage").val())  * ( pageNo - 1);

	// search
	dat["proCode"]		= $("#cboProCodeSrch option:selected").val();
	dat["payDate"]		= $("#txtOtherPayDate").val();
	dat["payDateEnd"]		= $("#txtOtherPayDateEnd").val();
	
	$("#loading").show();
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"OtherPayment/getOtherPayment",
		data: dat,
		dataType: "json",
		success	: function(res) {
			$("#tblSalary tbody").html("");
			$("#chkAllBox").prop( "checked", false );

			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#chkAllBox").show();
				var strHtml = "", strTotal = "";
				var totalSalaryAmt = 0;
				

				for(var i = 0; i < res.OUT_REC.length; i++){
				
					var cusNm =res.OUT_REC[i]["cus_nm_kh"];
			    	if(res.OUT_REC[i]["cus_nm_kh2"] != "" && res.OUT_REC[i]["cus_nm_kh2"] != null){
			    		cusNm += " & "+res.OUT_REC[i]["cus_nm_kh2"];
			    	}
			    	if(res.OUT_REC[i]["cus_nm_kh3"] != "" && res.OUT_REC[i]["cus_nm_kh3"] != null){
			    		cusNm += " & "+res.OUT_REC[i]["cus_nm_kh3"];
			    	}
					
					strHtml += '<tr data-id="'+res.OUT_REC[i]["oth_pay_id"]+'" class="cur-pointer" ondblclick="printData('+res.OUT_REC[i]['oth_pay_id']+')">';
					strHtml += '	<td class="chk_box"><div class="" style="width: 10px;"><input type="checkbox"></div></td>';
					strHtml += '	<td><div class="">'+res.OUT_REC[i]["oth_pay_inv_code"]+'</div></td>';
					strHtml += '	<td><div class="">'+res.OUT_REC[i]["pro_code"]+'</div></td>';
					strHtml += '	<td><div class="" >'+cusNm+'</div></td>';
					strHtml += '	<td><div class="" >'+moment(res.OUT_REC[i]["oth_pay_date"], "YYYY-MM-DD").format("DD-MM-YYYY")+'</div></td>';
					strHtml += '	<td><div class="" style="">'+res.OUT_REC[i]["sta_nm_kh"]+'</div></td>';
					strHtml += '	<td><div class="" style="text-align: right">'+stock.comm.formatCurrency(res.OUT_REC[i]["oth_pay_amt"])+' $</div></td>';
					strHtml += '	<td><div class="" >'+res.OUT_REC[i]["met_nm_kh"]+'</div></td>';
					strHtml += '	<td><div class="" >'+res.OUT_REC[i]["oth_pay_tran_id"]+'</div></td>';
					strHtml += '	<td><div class="" >'+res.OUT_REC[i]["oth_pay_des"]+'</div></td>';
					strHtml += '	<td class="text-center">';
					strHtml += '		<button type="button" class="btn btn-primary btn-xs" onclick="printData('+res.OUT_REC[i]["oth_pay_id"]+')">';
					strHtml += '			<i class="fa fa-print" aria-hidden="true"></i>';
					strHtml += '		</button>';
					strHtml += '	</td>';
					strHtml += '</tr>';

					totalSalaryAmt += parseFloat(res.OUT_REC[i]["oth_pay_amt"]);
				}

				strTotal += '<tr class="total">';
				strTotal += '	<td class="" colspan="6" style="text-align: right;font-weight: 600;">សរុបប្រាក់បានបង់: </td>';
				strTotal += '	<td class="" style="text-align: right;"><b>'+stock.comm.formatCurrency(totalSalaryAmt.toFixed(2))+'$</b></td>';
				strTotal += '	<td class="" style="text-align: right;"></td>';
				strTotal += '	<td class="" style="text-align: right;"></td>';
				strTotal += '	<td class="" style="text-align: right;"></td>';
				strTotal += '	<td class="" style="text-align: right;"></td>';
				strTotal += '</tr>';

				$("#tblSalary tbody").append(strHtml);
				$("#tblSalary tbody").append(strTotal);
				stock.comm.renderPaging("paging",$("#perPage").val(),res.OUT_REC_CNT[0]["total_rec"],pageNo);
			}else{
				$("#chkAllBox").hide();
				$("#tblSalary tbody").html("");
				$("#tblSalary tbody").append("<tr><td colspan='10' style='text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
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

function printData(oth_pay_id){
	var data = {};
	var dataArr = [];
	data["base_url"] = $("#base_url").val();
	data["oth_pay_id"] = oth_pay_id ;
	dataArr.push(data);
	var datObj={};
	datObj["printData"] = dataArr;
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"PrintInv/printInvOtherPayment",
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
 */
function deleteDataArr(dataArr){
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"OtherPayment/delete",
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




function getDataSell(){
	
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Sell/getSell",
		//data: dat,
		dataType: "json",
		async: false,
		success: function(res) {
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#cboProCodeSrch option").remove();
				$("#cboProCodeSrch").append("<option value=''></option>");
				
			    for(var i=0; i<res.OUT_REC.length;i++){
			    	var cusNm =res.OUT_REC[i]["cus_nm_kh"];
			    	if(res.OUT_REC[i]["cus_nm_kh2"] != "" && res.OUT_REC[i]["cus_nm_kh2"] != null){
			    		cusNm += " & "+res.OUT_REC[i]["cus_nm_kh2"];
			    	}
			    	if(res.OUT_REC[i]["cus_nm_kh3"] != "" && res.OUT_REC[i]["cus_nm_kh3"] != null){
			    		cusNm += " & "+res.OUT_REC[i]["cus_nm_kh3"];
			    	}
			    	$("#cboProCodeSrch").append("<option data-cus='"+cusNm+"' value='"+res.OUT_REC[i]["sell_id"]+"'>"+res.OUT_REC[i]["pro_code"]+"</option>")
			    	
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

/**
 *
 */
function resetFormSearch(){
	$("#cboProCodeSrch option:eq(0)").attr("selected", true);
	$("#txtOtherPayDate").val("");
	$("#txtOtherPayDateEnd").val("");
}

/**
 *
 */
function popupOtherPaymentCallback(){
	getData(_pageNo);
}

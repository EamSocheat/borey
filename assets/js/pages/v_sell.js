
var _pageNo = 1;
$(document).ready(function(){
	_thisPage.onload();
});

var _thisPage = {
		onload : function(){
			this.event();
			this.loadData();
			getSeller();
			stock.comm.checkAllTblChk("chkAllBox","tblSell","chk_box");

			$('#txtSrchContSD').datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
		    });
			$("#txtSrchContSD").inputmask();

			$('#txtSrchContED').datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
		    });
			$("#txtSrchContED").inputmask();
			
			$('#txtSrchContSDExp').datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
		    });
			$("#txtSrchContSDExp").inputmask();

			$('#txtSrchContEDExp').datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
		    });
			$("#txtSrchContEDExp").inputmask();
		}, loadData : function(page_no){
			$("#chkAllBox").prop( "checked", false );
		    var pageNo = 1;
		    if(page_no != "" && page_no != null && page_no != undefined){
		        if(page_no <= 0){
		            page_no = 1;
		        }
		        pageNo = page_no;
		    }
		    var dat = {};
		    //paging
		    dat["perPage"] = $("#perPage").val();
		    dat["offset"]  = parseInt($("#perPage").val())  * ( pageNo - 1);
		    dat["txtSrchContCode"]	= $("#txtSrchContCode").val();
		    dat["txtSrchContSD"]	= $("#txtSrchContSD").val();
		    dat["txtSrchContED"]	= $("#txtSrchContED").val();
		    dat["txtSrchCusNm"]		= $("#txtSrchCusNm").val();
		    dat["cboSeller"]		= $("#cboSeller").val();
		    dat["txtSrchProCode"]	= $("#txtSrchProCode").val();
		    
		    $("#loading").show();
		    $.ajax({
				type: "POST",
				url : $("#base_url").val() +"Sell/getSell",
				data: dat,
				dataType: "json",
				success: function(res) {
					console.log(res);
					var html = "", strTotal = "", totalDollar = 0, totalRiels = 0;
					var strTotalPaidInt="",strTotalPaidPrin="",totalPaidIntDollar = 0,totalPaidIntRiels = 0,totalPaidPrinDollar=0, totalPaidPrinRiels=0;
					$("#loading").hide();
					$("#tblSell tbody").html("");
					if(res.OUT_REC != null && res.OUT_REC.length >0){
						
					    for(var i=0; i<res.OUT_REC.length;i++){
					    	
					    	html += '<tr data-con-id='+res.OUT_REC[i]["con_id"]+' data-id='+res.OUT_REC[i]["sell_id"]+'>';
					        html += 	'<td class="chk_box"><input type="checkbox"></td>';
							html += 	'<td><div>'+stock.comm.nullToEmpty(res.OUT_REC[i]["sell_code"])+'</div></td>';
							html += 	'<td><div class="txt_c">'+stringDate(res.OUT_REC[i]["sell_date"].substr(0,10))+'</div></td>';
							html += 	'<td><div class="txt_c">'+res.OUT_REC[i]["bra_nm_kh"]+'</div></td>';
							html += 	'<td><div class="txt_c">'+res.OUT_REC[i]["pro_code"]+'</div></td>';
							html += 	'<td><div class="text-right">'+stock.comm.formatCurrency(res.OUT_REC[i]["sell_total_price"])+' $</div></td>';
							html += 	'<td><div class="text-right">'+res.OUT_REC[i]["cus_nm_kh"]+'</div></td>';
							html += 	'<td><div class="text-right">'+res.OUT_REC[i]["sta_nm_kh"] +'</div></td>';
							html += 	'<td class="text-center">';
							html +=			'<button onclick="editData('+res.OUT_REC[i]["sell_id"]+')" type="button" class="btn btn-primary btn-xs">';
							html += 		'<i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>';
							html += 	'</td>';
							html += '</tr>';
							
							totalDollar += parseFloat(res.OUT_REC[i]["sell_total_price"]);
					    }

					    strTotal += '<tr class="total" >';
						strTotal += '	<td colspan="5" ><b>សរុប​</b></td>';
						strTotal += '	<td style="text-align:right"><b style="margin-left: 10px;">'+stock.comm.formatCurrency(totalDollar)+' $ </b></td>';
						strTotal += '<td colspan="6"></td>';
						strTotal += '</tr>';
						
					    $("#tblSell tbody").html(html);
					    $("#tblSell tbody").append(strTotal);
					    stock.comm.renderPaging("paging",$("#perPage").val(),res.OUT_REC_CNT[0]["total_rec"],pageNo);
					}else{
						$("#chkAllBox").hide();
					    $("#tblSell tbody").append("<tr><td colspan='10' style='text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
					    stock.comm.renderPaging("paging",$("#perPage").val(),0,pageNo);
					}
				},
				error : function(data) {
				    console.log(data);
		            stock.comm.alertMsg($.i18n.prop("msg_err"));
		            $("#loading").hide();
		        }
			});
		}, editData : function(pos_id){
			
		}, addNewData : function(){
			
		}, deleteData : function(dataArr){
			
		}, event : function(){
			$("#txtSrchCusNm, #txtSrchContCode").on("keypress", function(e){
				if(e.which == 13){
					_thisPage.loadData(1);
				}
			});
			//
			$("#perPage").change(function(e){
				_pageNo = 1;
				_thisPage.loadData();
			});
			//--pagination
			$("#paging").on("click", "li a", function(e) {
				var pageNo = $(this).html();
				_pageNo = pageNo;
				_thisPage.loadData(pageNo);
			});
			$(".box-footer").on("click", "#btnGoToPage", function(e) {
				var pageNo = $("#txtGoToPage").val();
				_thisPage.loadData(pageNo);
			});
			//
			$("#btnAddNew").click(function(){
				$("#loading").show();
				var controllerNm = "PopupFormSell";
				var option = {};
				option["height"] = "910px";
				
				stock.comm.openPopUpForm(controllerNm, option, null, "modal-lg");
			});			
			//
			$("#btnEdit").click(function(){
				var chkVal = $('#tblSell tbody tr td.chk_box input[type="checkbox"]:checked');
				if(chkVal.length != 1){
					stock.comm.alertMsg($.i18n.prop("msg_con_edit1"));
					return;
				}
				
				var tblTr   = chkVal.parent().parent();
				var constId = tblTr.attr("data-id");
				editData(constId);
			});			
			//
			$("#btnDelete").click(function(e){
				var chkVal = $('#tblSell tbody tr td.chk_box input[type="checkbox"]:checked');
				
				if(chkVal.length <= 0){
					stock.comm.alertMsg($.i18n.prop("msg_con_del"));
					return;
				}
				if(chkVal.length > 1){
					stock.comm.alertMsg("សូមជ្រើសរើសទិន្នន័យ តែមួយ ដើម្បីលុប!");
					return;
				}
				
				/*var chkDeleteFail='';
				chkVal.each(function(i){
					var tblTr   = $(this).parent().parent();
					if(tblTr.find("td.con-status").attr("data-val") =="C" || tblTr.find("td.con-status").attr("data-val") == "E" || tblTr.find("td.con-status").attr("data-val") =="S" ){
						chkDeleteFail ='1';
					}
		
				});
				if(chkDeleteFail){
					stock.comm.alertMsg("សូមជ្រើសរើស តែទិន្ន័យបានកក់ ទើបលុបបាន!!!");
					return;
				}*/
				
				stock.comm.confirmMsg($.i18n.prop("msg_sure_del"));
				$("#btnConfirmOk").unbind().click(function(e){
					$("#mdlConfirm").modal('hide');
					
					var delArr = [];
					var delObj = {};
					chkVal.each(function(i){
						var delData = {};
						var tblTr   = $(this).parent().parent();
						var contId  = tblTr.attr("data-con-id");
						var sellId  = tblTr.attr("data-id");
						delData["sellId"] = sellId;
						delData["conId"] = contId;
						delArr.push(delData);
					});
					
					delObj["delObj"] = delArr;
					deleteDataArr(delObj);
				});
				
			});			
			//
			$("#btnSearch").click(function(e){
				_thisPage.loadData(1);
			});			
			//
			$("#btnReset").click(function(e){
				resetFormSearch();
			});			
			//
			$("#txtContSDIcon, #txtContEDIcon").click(function(e){
				$(this).next().focus();
			});
			// 
			$("#btnDownExcel").click(function(e){
				e.preventDefault();
				var chkVal = $('#tblSell tbody tr td.chk_box input[type="checkbox"]:checked');

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
				console.log(objArr);
				$("#contId").val(objArr);
				$("#btnExcel").submit();
			});
			
			//
			$("#btnShowRecord").click(function(e){
				$( "#tblSell tr:not(.total)" ).toggle( "fast", function() {
				    // Animation complete.
				});
			});	
		}
}

function popupContractCallback(){
    _thisPage.loadData(_pageNo);
}

function reverseString(str) {
	return (str === '') ? '' : reverseString(str.substr(1)) + str.charAt(0);
}

function stringDate(str){
	if(str == '') return '';

	return str = str.substr(8,10) +'-'+ str.substr(5,2) +'-'+ str.substr(0,4);
}

function deleteDataArr(dataArr){
	console.log(dataArr)
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Sell/delete",
		data: dataArr,		
		success: function(res) {
		    if(res > 0){
		        stock.comm.alertMsg(res+$.i18n.prop("msg_del_com"));
		        _thisPage.loadData(_pageNo);
		    }else{
		        stock.comm.alertMsg($.i18n.prop("msg_err_del") + "នៅមីនុយ ទិន្នន័យបង់ប្រាក់");
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

function editData(cont_id){	
    $("#loading").show();
	var controllerNm = "PopupFormSell";
	var option = {};
	var data   = "id="+cont_id+"&action=U";
	option["height"] = "930px";
	
	stock.comm.openPopUpForm(controllerNm, option, data, "modal-lg");
}


/**
 * 
 * @returns
 */
function getSeller(){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Staff/getStaff",
		dataType: 'json',
		async: false,
		success: function(res) {
			if(res.OUT_REC.length > 0){
				$("#cboSeller option").remove();
				$("#cboSeller").append("<option value=''>សូមជ្រើសរើសអ្នកលក់</option>");
				
				for(var i=0; i<res.OUT_REC.length; i++){
					var braNm = res.OUT_REC[i]["sta_nm_kh"];
					$("#cboSeller").append("<option value='"+res.OUT_REC[i]["sta_id"]+"'>"+braNm+"</option>");
				}
				
			}else{
				console.log(res);
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
}


function null2Zero(dat){
	if(dat == null || dat == undefined || dat == "null" || dat == "undefined" || dat == ""){
		return 0;
	}
	return dat;
}

function chkContStatus(s){
	var statusStr = '';
	if(s == "E"){
		statusStr = '<span class="label label-warning">ផុតកំណត់ <span>';
	}else if(s == "C"){
		statusStr = '<span class="label label-danger">ត្រលប់ប្រាក់ <span>';
	}else if(s == "S"){
		statusStr = '<span class="label label-info">លក់ <span>';
	}else{	
		statusStr = '<span class="label label-success">កក់ <span>';
	}
	return statusStr;
}

function calDayBetweenTwoDate(date1,date2,str){
	if(!date1 || !date2) return;
	date1 = String(date1).substr(0,10).split(str);
	date2 = String(date2).substr(0,10).split(str);

	var d1 = new Date(date1[0], date1[1]-1, date1[2]);
	var d2 = new Date(date2[0], date2[1]-1, date2[2]);

	var msDiff = d1 - d2;
	var daysDiff = msDiff / 1000 / 60 / 60 / 24;
	return daysDiff;
}

/**
 * 
 */
function resetFormSearch(){
	$("#txtSrchContCode").val("");
    $("#txtSrchContSD").val("");
    $("#txtSrchContED").val("");
    $("#txtSrchCusNm").val("");
    $("#cboStatus").val("");
    
    $("#txtSrchContSDExp").val("");
    $("#txtSrchContEDExp").val("");
    $("#cboSeller").val("");
    $("#txtSrchProCode").val("");
    
}


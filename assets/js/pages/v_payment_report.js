
var _pageNo = 1;
$(document).ready(function(){
	_thisPage.onload();
});

var _thisPage = {
		onload : function(){
			this.event();
			stock.comm.todayDate("#txtSrchContSD","-");
			stock.comm.todayDate("#txtSrchContED","-");
			/*
			var date = new Date(moment($("#txtSrchContSD").val(), "DD-MM-YYYY").format("MM-DD-YYYY"));
	        var days = 7;
	        if(!isNaN(date.getTime())){
	            date.setDate(date.getDate() + days);
	            $("#txtSrchContED").val(moment(date).format("DD-MM-YYYY"));
	        } 
	        */
			this.loadData();
			getSeller();
			stock.comm.checkAllTblChk("chkAllBox","tblInstallment","chk_box");
			
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
		    dat["txtSrchSellCode"]	= $("#txtSrchSellCode").val();
		    dat["txtSrchContSD"]	= $("#txtSrchContSD").val();
		    dat["txtSrchContED"]	= $("#txtSrchContED").val();
		    dat["txtSrchProCode"]	= $("#txtSrchProCode").val();
		    
		    $("#loading").show();
		    $.ajax({
				type: "POST",
				url : $("#base_url").val() +"InstallmentPayment/getPayment",
				data: dat,
				dataType: "json",
				success: function(res) {
					$("#loading").hide();
					//return;
					var html = "";
					var total_total_pay=0,total_penalty=0,total_inst_amt_pay=0,total_inst_amt_interest = 0,total_inst_amt_principle = 0,total_inst_dis_amt=0;
					var checkBooked="";
					$("#tblInstallment tbody").html("");
					if(res.OUT_REC != null && res.OUT_REC.length >0){
						var checkBooked="";
					    for(var i=0; i<res.OUT_REC.length;i++){
					    	
					    	
					    	var totalAmount = parseFloat(res.OUT_REC[i]["inst_paid_penalty"])+ parseFloat(res.OUT_REC[i]["inst_total_paid_amount"]);
					    	var percentPay=res.OUT_REC[i]["inst_pay_per"]+"%";
							
							if(res.OUT_REC[i]["inst_type"] =="BOOK"){
								percentPay="កក់ប្រាក់";
							}else if(res.OUT_REC[i]["inst_type"] =="LOAN"){
								percentPay="រំលស់";
							}else if(res.OUT_REC[i]["inst_type"] =="ADV"){
								percentPay=res.OUT_REC[i]["inst_pay_per"]+"%";
								//
								if(res.OUT_REC[i]["booked_yn"] =="BOOK" && checkBooked==""){
									percentPay="បង្រ្គប់"+percentPay;
									checkBooked="done";
								}
							}
							
							html += "<tr data-id="+res.OUT_REC[i]["inst_paid_id"]+">";
					    	html += 	'<td class="chk_box"><input type="checkbox"></td>';
					    	html += "<td class='sale_pay_date cur-pointer'><button type='button' class='btn btn-primary btn-xs' onclick='printInv("+res.OUT_REC[i]["inst_paid_id"]+")'><i class='fa fa-print' aria-hidden='true'></i> </button></td>";
					        
					    	html += "<td class='inst_paid_date cur-pointer text-center'>"+moment(res.OUT_REC[i]["inst_paid_date"], "YYYY-MM-DD").format("DD-MM-YYYY")+"</td>";
							html += "<td class='sta_nm_kh cur-pointer text-center'>"+res.OUT_REC[i]["sta_nm_kh"]+"</td>";
							html += "<td class='met_nm_kh cur-pointer text-center'>"+res.OUT_REC[i]["met_nm_kh"]+"</td>";
							html += "<td class='inst_paid_tran_id cur-pointer text-center'>"+(res.OUT_REC[i]["inst_paid_tran_id"] == null ? "" : res.OUT_REC[i]["inst_paid_tran_id"])+"</td>";
							html += "<td class='inst_paid_des cur-pointer text-center'>"+res.OUT_REC[i]["inst_paid_des"] +"</td>";
							html += "<td class='total_amount cur-pointer text-right'>"+stock.comm.formatCurrency(totalAmount)+"$</td>";
							html += "<td class='inst_paid_penalty cur-pointer text-right'>"+stock.comm.formatCurrency(res.OUT_REC[i]["inst_paid_penalty"])+"$</td>";
							
							html += "<td class='inst_num cur-pointer text-center'>"+res.OUT_REC[i]["pro_code"]+"</td>";
							html += "<td class='inst_num cur-pointer text-center'>"+res.OUT_REC[i]["sell_code"]+"</td>";
							html += "<td class='inst_num cur-pointer text-center'>"+res.OUT_REC[i]["cus_nm_kh"]+"</td>";
							html += "<td class='inst_num cur-pointer text-center'>"+res.OUT_REC[i]["inst_num"]+"</td>";
							html += "<td class='inst_date cur-pointer text-center'>"+moment(res.OUT_REC[i]["inst_date"], "YYYY-MM-DD").format("DD-MM-YYYY");+"</td>";
							html += "<td class='inst_pay_per cur-pointer text-center'>"+percentPay+"</td>";
							html += "<td class='inst_dis_amt cur-pointer text-right'>"+stock.comm.formatCurrency(res.OUT_REC[i]["inst_dis_amt"])+"$</td>";
							html += "<td class='inst_amt_principle cur-pointer text-right' >"+stock.comm.formatCurrency(res.OUT_REC[i]["inst_amt_principle"])+"$</td>";
					        html += "<td class='inst_amt_interest cur-pointer text-right'>"+stock.comm.formatCurrency(res.OUT_REC[i]["inst_amt_interest"])+"$</td>";
					        html += "<td class='inst_amt_pay​ cur-pointer text-right' >"+stock.comm.formatCurrency(res.OUT_REC[i]["inst_amt_pay"])+"$</td>";
					        html += "<td class='inst_amt_balance cur-pointer text-right' style='padding-right: 20px;' >"+stock.comm.formatCurrency(res.OUT_REC[i]["inst_amt_balance"])+"$</td>";
					       /* html += '<td class="text-center">';
							html +=		'<button onclick="editData('+res.OUT_REC[i]["inst_id"]+')" type="button" class="btn btn-primary btn-xs">';
							html += 	'<i class="fa fa-plus" aria-hidden="true"></i> បង់ប្រាក់</button>';
							html += '</td>';*/
					        html += "</tr>";
					        total_inst_dis_amt += parseFloat(res.OUT_REC[i]["inst_dis_amt"]);
					        total_inst_amt_principle += parseFloat(res.OUT_REC[i]["inst_amt_principle"]);
					        total_inst_amt_interest += parseFloat(res.OUT_REC[i]["inst_amt_interest"]);
					        total_inst_amt_pay += parseFloat(res.OUT_REC[i]["inst_amt_pay"]);
					        total_total_pay +=totalAmount;
					        total_penalty += parseFloat(res.OUT_REC[i]["inst_paid_penalty"]);
					    }

					    var strTotal = '<tr class="total" >';
					    strTotal += '	<td colspan="7" class="text-right"><b>សរុប​</b></td>';
					    strTotal += '	<td style="text-align:right"><b style="margin-left: 10px;">'+(total_total_pay ==0 ? "0" : stock.comm.formatCurrency(total_total_pay))+'$ </b></td>';
					    strTotal += '	<td style="text-align:right"><b style="margin-left: 10px;">'+(total_penalty ==0 ? "0" : stock.comm.formatCurrency(total_penalty))+'$ </b></td>';
						
						strTotal += '	<td colspan="6" class="text-right"></td>';
						strTotal += '	<td style="text-align:right"><b style="margin-left: 10px;">'+(total_inst_dis_amt ==0 ? "0" : stock.comm.formatCurrency(total_inst_dis_amt))+'$ </b></td>';
						strTotal += '	<td style="text-align:right"><b style="margin-left: 10px;">'+stock.comm.formatCurrency(total_inst_amt_principle)+'$ </b></td>';
						strTotal += '	<td style="text-align:right"><b style="margin-left: 10px;">'+(total_inst_amt_interest ==0 ? "0" : stock.comm.formatCurrency(total_inst_amt_interest))+'$ </b></td>';
						strTotal += '	<td style="text-align:right"><b style="margin-left: 10px;">'+stock.comm.formatCurrency(total_inst_amt_pay)+'$ </b></td>';
						
						strTotal += '	<td colspan="2" ></td>';
						strTotal += '</tr>';
						
					    $("#tblInstallment tbody").html(html);
					    $("#tblInstallment tbody").append(strTotal);
					    stock.comm.renderPaging("paging",$("#perPage").val(),res.OUT_REC_CNT[0]["total_rec"],pageNo);
					}else{
						$("#chkAllBox").hide();
					    $("#tblInstallment tbody").append("<tr><td colspan='12' style='text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
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
			$("#txtSrchCusNm, #txtSrchSellCode").on("keypress", function(e){
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
				var controllerNm = "PopupFormInstallmentPayment";
				var option = {};
				option["height"] = "910px";
				
				stock.comm.openPopUpForm(controllerNm, option, null, "modal-lg");
			});			
	
			//
			$("#btnDelete").click(function(e){
				var chkVal = $('#tblInstallment tbody tr td.chk_box input[type="checkbox"]:checked');
				
				if(chkVal.length <= 0){
					stock.comm.alertMsg($.i18n.prop("msg_con_del"));
					return;
				}
				var chkDeleteFail='';
				chkVal.each(function(i){
					var tblTr   = $(this).parent().parent();
					if(tblTr.find("td.con-status").attr("data-val") =="C" || tblTr.find("td.con-status").attr("data-val") == "E" || tblTr.find("td.con-status").attr("data-val") =="S" ){
						chkDeleteFail ='1';
					}
		
				});
				if(chkDeleteFail){
					stock.comm.alertMsg("សូមជ្រើសរើស តែទិន្ន័យបានកក់ ទើបលុបបាន!!!");
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
						var contId  = tblTr.attr("data-id");
						delData["contId"] = contId;
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
				var chkVal = $('#tblInstallment tbody tr td.chk_box input[type="checkbox"]:checked');

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
				$( "#tblInstallment tr:not(.total)" ).toggle( "fast", function() {
				    // Animation complete.
				});
			});	
		}
}

function popupInstallmentPaymentCallback(){
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
		url : $("#base_url").val() +"Contract/delete",
		data: dataArr,		
		success: function(res) {
		    if(res > 0){
		        stock.comm.alertMsg(res+$.i18n.prop("msg_del_com"));
		        _thisPage.loadData(_pageNo);
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

function editData(cont_id){	
    $("#loading").show();
	var controllerNm = "PopupFormInstallmentPayment";
	var option = {};
	var data   = "id="+cont_id+"&action=U";
	option["height"] = "510px";
	
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

function printInv(con_id){
	var data = {};
	var dataArr = [];
	data["base_url"] = $("#base_url").val();
	data["inst_paid_id"] = con_id ;
	dataArr.push(data);
	var datObj={};
	datObj["printData"] = dataArr;
	//console.log(datObj);
	//return;
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"PrintInv/printInvPayment",
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
				parent.stock.comm.closePopUpForm("PopupFormInstallmentPayment",parent.popupInstallmentPaymentCallback);
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
function resetFormSearch(){
	$("#txtSrchSellCode").val("");
    $("#txtSrchContSD").val("");
    $("#txtSrchContED").val("");
    $("#txtSrchCusNm").val("");
    $("#cboStatus").val("");
    
    $("#txtSrchContSDExp").val("");
    $("#txtSrchContEDExp").val("");
    $("#cboSeller").val("");
    $("#txtSrchProCode").val("");
    
}


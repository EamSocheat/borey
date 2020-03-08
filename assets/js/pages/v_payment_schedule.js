
var _pageNo = 1;
$(document).ready(function(){
	_thisPage.onload();
});

var _thisPage = {
		onload : function(){
			this.event();
			stock.comm.todayDate("#txtSrchContSD","-");
			stock.comm.todayDate("#txtSrchContED","-");
		
			this.loadData();
			stock.comm.checkAllTblChk("chkAllBox","tblInstallment","chk_box");
			
			var d  = new Date();
			var month = d.getMonth() + 1;
			var day   = d.getDate();
			var paymonth = (month<10 ? '0' : '') + month  + "-" + d.getFullYear();
			$('#txtPayMonth').val(paymonth);
			$('#txtPayMonth').datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				format: "mm-yyyy",
				viewMode: "months",
				autoclose: true,
				minViewMode: "months"
			});
			$("#txtPayMonth").inputmask();
			
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
			
		}, editData : function(pos_id){
			
		}, addNewData : function(){
			
		}, deleteData : function(dataArr){
			
		}, event : function(){
			//
			$("#btnGetPaymentSchByMonth").click(function(e){
				getDataPaymentByMonth();
			});			
			
		}
}


function getDataPaymentByMonth(){
	$("#loading").show();
	$("#btnExcelPaymentSchByMonth").submit();
	$("#loading").hide();
	/*var dat = {};
	//searching
	dat["payMonth"]	= $("#txtPayMonth").val();
	console.log($("#txtPayMonth").val());
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"PaymentSchedule/getPayment",
		data: dat,
		//dataType: "json",
		success	: function(res) {
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				console.log(res.OUT_REC);
				var objArr = [];
				for(var i = 0; i < res.OUT_REC.length; i++){
					objArr.push(Number(res.OUT_REC[i]['exp_id']));
				}
				$("#expId").val(objArr);
				$("#btnExcel").submit();
				
			}else{
				console.log(res);
				stock.comm.alertMsg($.i18n.prop("msg_err"));
			}
			$("#loading").hide();
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
		}
	});*/
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


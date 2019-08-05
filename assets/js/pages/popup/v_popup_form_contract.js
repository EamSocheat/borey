var _btnId;
var _this;
$(document).ready(function() {
	_thisPage.init();
});

var _thisPage = {
		init : function(){
			_this = this;
			_this.onload();
			_this.event();
		},
		onload : function(){
			parent.$("#loading").hide();
			//
			getStaff();
			stock.comm.inputCurrency("lRate");
			stock.comm.inputCurrency("lAmt");
			
			//
			$('#txtContSD').datepicker({
				language: "kh",
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
		    });
			$("#txtContSD").inputmask();
			
			//
			$('#txtContED').datepicker({
				language: "kh" ,
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd-mm-yyyy",
				minDate: new Date("2019-07-30")
		    });
			$("#txtContED").inputmask();
			//

			if($("#frmAct").val() == "U"){
			    getDataEdit($("#contId").val());
			    $("#lAmt").attr("readonly","readonly");
			    $("#popupTitle").html("<i class='fa fa-handshake-o'></i> "+$.i18n.prop("btn_edit")+" "+ $.i18n.prop("lb_contract"));
			}else{
				stock.comm.todayDate("#txtContSD","-");
			    $("#btnSaveNew").show();			    
			    $("#popupTitle").html("<i class='fa fa-handshake-o'></i> "+$.i18n.prop("btn_add_new")+" "+ $.i18n.prop("lb_contract"));
			}
			$("#frmContract").show();
			$("#braNm").focus();						
			stock.comm.inputPhoneKhmer("txtPhone1");
			stock.comm.inputPhoneKhmer("txtPhone2");
			
			
		},
		event : function(){
			//
			$("#btnClose,#btnExit").click(function(e){
				//parent.$("#modalMd").modal('hide');
				parent.stock.comm.closePopUpForm("PopupFormContract",parent.popupContractCallback);
			});
			//
			$("#frmContract").submit(function(e){
				e.preventDefault();
				if(_btnId == "btnSave"){
			    	saveData();
				}else{
			    	saveData("new");
				}
			
			});
			//
			$("#btnSave").click(function(e){
				_btnId = $(this).attr("id");
				
			});
			//
			$("#btnSaveNew").click(function(e){
				_btnId = $(this).attr("id");
				
			});
			//
			$("#btnSelectPhoto").click(function(e){
				$("#fileContPhoto").trigger( "click" );
				
			});
			//
			$("#fileContPhoto").change(function(){
			    readURL(this);
			});
			//
			//
			$("#btnPopupCusch").click(function(e){
				var data="parentId=ifameStockForm";
				data+="&dataSrch="+$("#txtCusNm").val();
				var controllerNm = "PopupSelectCustomer";
				var option={};
				option["height"] = "445px";
			    stock.comm.openPopUpSelect(controllerNm,option, data,"modal-md");
			});
			//
			$("#btnPopupPosition").click(function(e){
				var data = "parentId=ifameStockForm";
				data+="&dataSrch="+$("#txtPosNm").val();
				var controllerNm = "PopupSelectPosition";
				var option = {};
				option["height"] = "445px";
			    stock.comm.openPopUpSelect(controllerNm,option, data,"modal-md");
			});
			//
			$("#btnCal").click(function(e){
				//resetEmi();
				calculateEMI();
			});
			//
			$("#btnReset").click(function(e){
				resetEmi();
			});
			//
			$("#txtContSDIcon").click(function(e){
				$(this).next().focus();
			});
			//
			$("#btnStatusActive, #btnStatusClose").click(function(e){
				var statusID = $("#statusID").val();
				if(statusID == "0" || statusID == 0){
					top.stock.comm.confirmMsg($.i18n.prop("msg_sure_close"));
				}else{
					top.stock.comm.confirmMsg($.i18n.prop("msg_sure_active"));
				}
				
				top.$("#btnConfirmOk").unbind().click(function(e){
					top.$("#mdlConfirm").modal('hide');
					updateContractStatus(statusID);
				});
			});

			$("input").focus(function(){
				$("#lRate").css("border","1px solid #d2d6de");
			});
			
			//
			$("#btnSelectPro").click(function(e){
				var data="parentId=ifameStockForm";
				//data+="&dataSrch="+$("#txtCusNm").val();
				var controllerNm = "PopupSelectProduct";
				var option={};
				option["height"] = "460px";
			    stock.comm.openPopUpSelect(controllerNm,option, data,"modal-md");
			});
		}
};


function saveData(str){
	$("#contId").appendTo("#frmContract");    
    
    var isCusomterEmpty = $("#txtCusNm").val().trim();
       if(stock.comm.isNull(isCusomterEmpty) || stock.comm.isEmpty(isCusomterEmpty)){
    	
    	return;
    }
       
    var productChk=$("#tblProduct tbody tr");
   	var productArr=[];
   	productChk.each(function(i){
   		productArr.push(parseInt($(this).attr("data-id")));
   	});
   
	parent.$("#loading").show();
	$.ajax({
		type : "POST",
		url  : $("#base_url").val() +"Contract/saveContract",
		data: $("#frmContract").serialize()+"&menuArr="+menuArr ,
		success: function(res) {
		    parent.$("#loading").hide();
		    console.log(res)
			if(res =="OK"){
				parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"braNm");
				if(str == "new"){
				    clearForm();
				}else{					
				    parent.stock.comm.closePopUpForm("PopupFormContract",parent.popupContractCallback);
				}
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}

function updateContractStatus(status){
	var input = {};
	input["contId"] = $("#contId").val();
	input["statusID"] = $("#statusID").val();
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Contract/udpateStatus",
		data: input,
		dataType: "json",
		success: function(res) {
			console.log(res);
		    if(res > 0){
		    	if(status == "0"){
		    		parent.stock.comm.alertMsg($.i18n.prop("msg_close"),"braNm");
		    	}else{
		    		parent.stock.comm.alertMsg($.i18n.prop("msg_active"),"braNm");
		    	}
				
				parent.stock.comm.closePopUpForm("PopupFormContract",parent.popupContractCallback);
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

function getDataEdit(cont_id){
    //
    $("#loading").show();
    $.ajax({
		type: "POST",
		url : $("#base_url").val() +"Contract/getContract",
		data: {"conId":cont_id},
		dataType: "json",
		async: false,
		success: function(res) {
			//$("#btnSave").hide();
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				
				var status = res.OUT_REC[0]["con_status"];
				$("#balanceLeft").text( $.i18n.prop("lb_pay_balance") +" : "+ stock.comm.formatCurrency(res.OUT_REC[0]["loan_amount_left"])+res.OUT_REC[0]["cur_syn"]);	
				$("#contractNo").text( $.i18n.prop("lb_contract_no") +" : "+ res.OUT_REC[0]["con_no"]);		
				
			    $("#txtCusNm").val(res.OUT_REC[0]["cus_nm_kh"]);
			    $("#txtCusId").val(res.OUT_REC[0]["cus_id"]);
			    $("#txtCusPhone").val(res.OUT_REC[0]["cus_phone1"]);
			    $("#cboCurrency option[value='"+res.OUT_REC[0]["cur_id"]+"']").attr("selected",true);
			    //$("#cboCurrency").val(res.OUT_REC[0]["cur_id"]);
			    $("#txtContSD").val(moment(res.OUT_REC[0]["con_start_dt"], "YYYY-MM-DD").format("DD-MM-YYYY"));
			    $("#lAmt").val(stock.comm.formatCurrency(res.OUT_REC[0]["con_principle"]));
			    $("#lRate").val(res.OUT_REC[0]["con_interest"]);
				$("#cbointerestType option[value='"+res.OUT_REC[0]["con_interest_type"]+"']").attr("selected",true);
			    $("#lYear").val(res.OUT_REC[0]["con_per_year"]);
			    $("#lMonth").val(res.OUT_REC[0]["con_per_month"]);
			    
			    $("#txtContED").val(moment(res.OUT_REC[0]["con_end_dt"], "YYYY-MM-DD").format("DD-MM-YYYY"));
		    	$("#totalLAmt").val(stock.comm.formatCurrency(res.OUT_REC[0]["total_paid_amt"]));
		    	var totalPaidAmt = parseFloat(res.OUT_REC[0]["total_paid_int"]) + parseFloat(res.OUT_REC[0]["total_paid_prin"]);
		    	var totalIncome = totalPaidAmt - parseFloat(res.OUT_REC[0]["con_principle"]);
		    	if(totalIncome  < 0){
		    		totalIncome = 0;
				}
		    	if(res.OUT_REC[0]["cur_id"] == 1){
		    		$("#totalLRate").val(stock.comm.formatCurrency(calRielsCurrency(totalPaidAmt)) +"៛");
		    		$("#totalIncome").val(stock.comm.formatCurrency(calRielsCurrency(totalIncome)) +"៛");
		    	}else{
		    		$("#totalLRate").val(stock.comm.formatCurrency(totalPaidAmt)+"$");
		    		$("#totalIncome").val(stock.comm.formatCurrency(totalIncome)+"$");
		    	}
			    
			    
			    $("#divEnd1").show();
		    	$("#divEnd2").show();
			    $("#divEnd3").show();
			    
			    if(status == "0"){
			    	$("#btnStatusActive").show();
			    	$("#btnStatusClose").hide();
			    	$("#statusID").val("1");
			    	$("#btnSave").hide();

				    $("#divEnd1").show();
				   /* $("#divEnd2").show();
				    $("#divEnd3").show();*/
				    
			    	// $("#btnStatus").attr("data-i18ncd", "btn_status_closed");
			    }else{
			    	$("#divEnd1").hide();
			    	/*$("#divEnd2").hide();
				    $("#divEnd3").hide();*/
				    
			    	$("#btnStatusActive").hide();
			    	$("#btnStatusClose").show();
			    	$("#statusID").val("0");
			    	// $("#btnStatus").attr("data-i18ncd", "btn_status_active");
			    	$("#btnSave").show();
			    }

			    /*$("#txtAddr").val(res.OUT_REC[0]["cont_addr"]);
			    $("#txtPhone1").val(res.OUT_REC[0]["cont_phone1"]);
			    $("#txtPhone2").val(res.OUT_REC[0]["cont_phone2"]);
			    $("#txtEmail").val(res.OUT_REC[0]["cont_email"]);
			    $("#txtStartDate").val(moment(res.OUT_REC[0]["sta_start_dt"], "YYYY-MM-DD").format("DD-MM-YYYY"));
			    $("#txtEndDate").val(moment(res.OUT_REC[0]["sta_end_dt"], "YYYY-MM-DD").format("DD-MM-YYYY"));
			    $("#txtDes").val(res.OUT_REC[0]["sta_des"]);*/
			    
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
	});

}

function clearForm(){
    $("#frmContract input").val("");
    $("#frmContract textarea").val("");
    $("#staImgView").attr("src",$("#base_url").val()+"assets/image/default-staff-photo.png");
    $("#txtContractNm").focus();
}

function selectCustomerCallback(data){
	if(data["cus_nm"] == "" || data["cus_nm"] == null || stock.comm.isEmpty(data["cus_nm"])){
		$("#txtCusNm").val(data["cus_nm_kh"]);
	}else{
		$("#txtCusNm").val(data["cus_nm"]);		
	}
	
	$("#txtCusId").val(data["cus_id"]);
	$("#txtCusPhone").val(data["cus_phone1"]);
}

function selectPositionCallback(data){
	$("#txtPosNm").val(data["pos_nm"]);
	$("#txtPosId").val(data["pos_id"]);
}

function selectProductCallback(data){
	$("#tblProduct tbody").html("");
	if(data["data"] != null && data["data"] != undefined  && data["data"].length >0){
		for(var i=0; i<data["data"].length;i++){
			var rec = data["data"][i];
			var html = "<tr data-id='"+rec["pro_id"]+"'>";
	        html += "<td class='pro_code cur-pointer'>"+rec["pro_code"]+"</td>";
	        html += "<td class='cat_nm cur-pointer'>"+rec["cat_nm"]+"</td>";
	        html += "<td class='bra_nm cur-pointer'>"+rec["bra_nm"]+"</td>";
	        //html += "<td class='pro_price cur-pointer'>"+res.OUT_REC[i]["pro_price"]+"</td>";
	        html += "</tr>";
	        
	        $("#tblProduct tbody").append(html);
		}
	}
	
}



/**
 * 
 * @returns
 */
function getStaff(){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Staff/getStaff",
		dataType: 'json',
		async: false,
		success: function(res) {
			if(res.OUT_REC.length > 0){
				$("#cboSeller option").remove();
				$("#cboSeller").append("<option value=''>សូមជ្រើសរើសបុគ្គលិក</option>");
				$("#cboReceiver option").remove();
				$("#cboReceiver").append("<option value=''>សូមជ្រើសរើសបុគ្គលិក</option>");
				
				for(var i=0; i<res.OUT_REC.length; i++){
					var braNm = res.OUT_REC[i]["sta_nm_kh"];
					$("#cboSeller").append("<option value='"+res.OUT_REC[i]["sta_id"]+"'>"+braNm+"</option>");
					$("#cboReceiver").append("<option value='"+res.OUT_REC[i]["sta_id"]+"'>"+braNm+"</option>");
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

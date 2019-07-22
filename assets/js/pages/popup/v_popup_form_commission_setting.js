var _btnId;
var _this;
var menu_id_0;
var _chkSetting;
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
			
			listCategory();
			getPosition();
			getBranch();
			$("#txtEditYn").val("N");
			
			if($("#frmAct").val() == "U"){
			    getDataEdit($("#commsetId").val());
			    $("#popupTitle").html("<i class='fa fa-money'></i> "+$.i18n.prop("btn_edit")+" កំរៃជើងសារ ");
			}else{
			    $("#btnSaveNew").show();
			    $("#popupTitle").html("<i class='fa fa-money'></i> "+$.i18n.prop("btn_add_new")+" កំរៃជើងសារ ");
			}
			$("#frmCommSet").show();
			$("#braNm").focus();
			
		},
		event : function(){
			//
			$("#btnClose,#btnExit").click(function(e){
				//parent.$("#modalMd").modal('hide');
				parent.$("#msgErr").hide();
				parent.stock.comm.closePopUpForm("PopupFormCommissionSetting",parent.popupCommissionSettingCallback);
			});
			//
			$("#frmCommSet").submit(function(e){
				e.preventDefault();
				if(_btnId == "btnSave"){
			    	saveData();
				}else{
			    	saveData("new");
				}
			
			});
			//
			$("#btnSave").click(function(e){
				_btnId= $(this).attr("id");
				
			});
			//
			$("#btnSaveNew").click(function(e){
				_btnId= $(this).attr("id");
				
			});
			//
			$("#btnSelectPhoto").click(function(e){
				$("#fileStaPhoto").trigger( "click" );
				
			});
			//
			$("#fileStaPhoto").change(function(){
			    readURL(this);
			});
			//
			//
			$("#btnPopupBranch").click(function(e){
				var data="parentId=ifameStockForm";
				data+="&dataSrch="+$("#txtBraNm").val();
				var controllerNm = "PopupSelectBranch";
				var option={};
				option["height"] = "450px";
			    stock.comm.openPopUpSelect(controllerNm,option, data,"modal-md");
			});
			
			//
			$("#btnPopupPosition").click(function(e){
				var data="parentId=ifameStockForm";
				data+="&dataSrch="+$("#txtPosNm").val();
				var controllerNm = "PopupSelectPosition";
				var option={};
				option["height"] = "450px";
			    stock.comm.openPopUpSelect(controllerNm,option, data,"modal-md");
			});
			
			
			
			//
			$("#chkComiYn").click(function(e){
				if($(this).is(":checked")){
					$("#txtComiYn").val("Y");
				}else{
					$("#txtComiYn").val("N");
				}
			});
			
			//
			$("#chkSalaryYn").click(function(e){
				if($(this).is(":checked")){
					$("#txtSalaryYn").val("Y");
				}else{
					$("#txtSalaryYn").val("N");
				}
			});
			
			//
			$("#divMenuOth,#divMenuPro,#divMenuNav").on("click", ".menu-save", function(e) {
				parent.$("#msgErr").hide();
				$(".panel").css("border-color","#ced4da");
			});
			
			///
			$("#cboPosition,#cboBranch").change(function(e){
				checkSetting($("#cboPosition").val(),$("#cboBranch").val());	
			});
			
		}
};

function getDataEdit(usr_id){
    //
    $("#loading").show();
    $.ajax({
		type: "POST",
		url: $("#base_url").val() +"CommissionSetting/getCommissionSettingDetail",
		data: {"comsetId":usr_id},
		dataType: "json",
		async: false,
		success: function(res) {
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#cboPosition").val(res.OUT_REC[0]["pos_id"]);
			    $('#cboPosition').attr('disabled',true);
			    $("#oldPosition").val(res.OUT_REC[0]["pos_id"]);
			    $("#cboBranch").val(res.OUT_REC[0]["bra_id"]);
			    $('#cboBranch').attr('disabled',true);
			    $("#oldBranch").val(res.OUT_REC[0]["bra_id"]);
			    //
			    if(res.OUT_REC[0]["comset_salary_yn"] == "Y"){
			    	$("#chkSalaryYn").prop( "checked", true );
			    	$("#txtSalaryYn").val("Y");
			    }else{
			    	$("#chkSalaryYn").prop( "checked", false );
			    	$("#txtSalaryYn").val("N");
			    }
			    //
			    if(res.OUT_REC[0]["comset_commi_yn"] == "Y"){
			    	$("#chkComiYn").prop( "checked", true );
			    	$("#txtComiYn").val("Y");
			    }else{
			    	$("#chkComiYn").prop( "checked", false );
			    	$("#txtComiYn").val("N");
			    }
				for(var i=0; i<res.OUT_REC.length; i++){
					 $(".comi_type"+res.OUT_REC[i]["cat_id"]).val(res.OUT_REC[i]["comset_type"]);
					 $(".comi_amt"+res.OUT_REC[i]["cat_id"]).val(res.OUT_REC[i]["comset_amt"]);
					 $(".comi_type_per"+res.OUT_REC[i]["cat_id"]).val(res.OUT_REC[i]["comset_type_ex"]);
					 $(".comi_amt_per"+res.OUT_REC[i]["cat_id"]).val(res.OUT_REC[i]["comset_amt_ex"]);
				}
			   
			    
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
    $("#cboPosition").val("");
    $("#cboBranch").val("");
    $("#chkComiYn").prop( "checked", false );
    $("#txtComiYn").val("N");
    $("#chkComiYn").prop( "checked", false );
    $("#txtComiYn").val("N");
}

function selectBranchCallback(data){
	$("#txtBraNm").val(data["bra_nm"]);
	$("#txtBraId").val(data["bra_id"]);
}

function selectPositionCallback(data){
	$("#txtPosNm").val(data["pos_nm"]);
	$("#txtPosId").val(data["pos_id"]);
}

/**
 * 
 */
//
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function (e) {
            $('#staImgView').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}


function saveData(str){
	var data = [];
	
	var catObj={};
	for(var i=0; i < $(".cat-data").length; i++){
		var dataObj = {};
		dataObj["catId"] = $(".cat-data").eq(i).attr("data-id");
		dataObj["commType"] = $(".comi_type").eq(i).val();
		dataObj["commAmt"] = $(".comi_amt").eq(i).val();
		dataObj["commTypeEx"] = $(".comi_type_per").eq(i).val();
		dataObj["commAmtEx"] = $(".comi_amt_per").eq(i).val();
		
		dataObj["cboPosition"] = $("#cboPosition").val();
		dataObj["cboBranch"] = $("#cboBranch").val();
		dataObj["txtSalaryYn"] = $("#txtSalaryYn").val();
		dataObj["txtComiYn"] = $("#txtComiYn").val();
		dataObj["commsetId"] = $("#commsetId").val();
		data.push(dataObj);
	}
	catObj["catData"] = data;
	//
	checkSetting($("#cboPosition").val(),$("#cboBranch").val());
	if(_chkSetting){
		return;
	}
	
	/*
	//
	if(menuChk == null || menuChk == undefined || menuChk.length <=0 ){
		showMenuErr();
		return;
	}
	*/
	$('#cboPosition').attr('disabled',false);
	$('#cboBranch').attr('disabled',false);
	$("#commsetId").appendTo("#frmCommSet");
	
    parent.$("#loading").show();
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"CommissionSetting/save",
		data: catObj ,
		success: function(res) {
		    parent.$("#loading").hide();
			if(res =="OK"){
				parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"braNm");
				if(str == "new"){
				    clearForm();
				}else{
				    //close popup
				    parent.stock.comm.closePopUpForm("PopupFormCommissionSetting",parent.popupCommissionSettingCallback);
				}
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}


function listCategory(){
    $.ajax({
		type: "POST",
		url: $("#base_url").val() +"Category/getCategoryData",
		dataType: "json",
		async: false,
		success: function(res) {
			$("#divCategory").html("");
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				var html = '';
			    for(var i=0; i<res.OUT_REC.length;i++){
			    	html += '<div class="col-xs-4"><label class="cat-data" data-id="'+res.OUT_REC[i]["cat_id"]+'" for="">'+res.OUT_REC[i]["cat_nm_kh"]+'</label></div>';
			    	html += '<div class="col-xs-2"><select class="form-control input-sm margin-left-5px comi_type comi_type'+res.OUT_REC[i]["cat_id"]+'" ><option value="M">សាច់ប្រាក់ $</option><option value="P">ភាគរយ %</option></select></div>';
			    	html += '<div class="col-xs-2"><input type="number" required="required"  oninvalid="this.setCustomValidity(\'សូមបញ្ជូលទិន្នន័យ\')" oninput="setCustomValidity(\'\')" class="form-control input-sm margin-left-5px comi_amt 999'+i+' comi_amt'+res.OUT_REC[i]["cat_id"]+'"" /></div>';
			    	html += '<div class="col-xs-2"><select class="form-control input-sm margin-left-5px comi_type_per comi_type_per'+res.OUT_REC[i]["cat_id"]+'" ><option value="M">សាច់ប្រាក់ $</option><option value="P">ភាគរយ %</option></select></div>';
			    	html += '<div class="col-xs-2"><input type="number" required="required" oninvalid="this.setCustomValidity(\'សូមបញ្ជូលទិន្នន័យ\')" oninput="setCustomValidity(\'\')" class="form-control input-sm margin-left-5px comi_amt_per 999'+i+' comi_amt_per'+res.OUT_REC[i]["cat_id"]+'"/></div>';
			    	html +='<div class="col-xs-12" style="margin-top:10px"></div>';
			    	
			    }    
			    
			    
			    $("#divCategory").append(html);
			    
			}
		
		},
		error : function(data) {
		    console.log(data);
		    parent.stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
	
} 
/**
 * 
 * @returns
 */
function getPosition(){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Position/getPositionData",
		dataType: 'json',
		async: false,
		success: function(res) {
			if(res.OUT_REC.length > 0){
				$("#cboPosition option").remove();
				$("#cboPosition").append("<option value=''>សូមជ្រើសរើសតួនាទីបុគ្គលិក</option>");
				
				for(var i=0; i<res.OUT_REC.length; i++){
					var braNm = res.OUT_REC[i]["pos_nm_kh"];
					$("#cboPosition").append("<option value='"+res.OUT_REC[i]["pos_id"]+"'>"+braNm+"</option>");
				}
				
			}else{
				console.log(res);
			}
		},
		error : function(data) {
			console.log(data);
			parent.stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
}

/**
 * 
 * @returns
 */
function getBranch(){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Branch/getBranch",
		dataType: 'json',
		async: false,
		success: function(res) {
			if(res.OUT_REC.length > 0){
				$("#cboBranch option").remove();
				$("#cboBranch").append("<option value=''>សូមជ្រើសរើសគំរោង</option>");
				
				for(var i=0; i<res.OUT_REC.length; i++){
					var braNm = res.OUT_REC[i]["bra_nm_kh"];
					$("#cboBranch").append("<option value='"+res.OUT_REC[i]["bra_id"]+"'>"+braNm+"</option>");
				}
				
			}else{
				console.log(res);
			}
		},
		error : function(data) {
			console.log(data);
			parent.stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
}
/**
 * 
 * @param userNm
 * @returns
 */
function checkSetting(posId,braId){
	if($("#cboPosition").val() == $("#oldPosition").val() && $("#cboBranch").val() == $("#oldBranch").val()){
		return;
	}
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"CommissionSetting/checkSetting",
		data: {"posId":posId,"braId":braId},
		async: false,
		success: function(res) {
			if(res == "ERROR"){
				showUserNameErr();
				_chkSetting = true;
			}else{
				_chkSetting = false;
				parent.$("#msgErr").hide();
				$("#cboBranch").css("border-color","#ced4da");
			}
		},
		error : function(data) {
			console.log(data);
			parent.stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
}

function showPwdErr(){
	$("#txtPwd").css("border-color","red");
	$("#txtPwdCon").css("border-color","red");
	parent.$("#msgShw").html("ការបញ្ជាក់ពាក្យសំងាត់ មិនត្រឹមត្រូវទេ!!!");
	parent.$("#msgErr").show();
	
}

function showMenuErr(){
	$(".panel").css("border-color","red");
	parent.$("#msgShw").html("សូមជ្រើសរើស មីនុយ!!!");
	parent.$("#msgErr").show();
	
}

function showUserNameErr(){
	$("#cboBranch").css("border-color","red");
	parent.$("#msgShw").html(" គំរោងកំណត់រូចហើយ  សូមជ្រើសរើសគំរោងផ្សេង!!!");
	parent.$("#msgErr").show();
	
}

function inputCurrency(class_target){
	
	$("."+class_target).keydown(function (e) {
		if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
            // Allow: Ctrl+A, Command+A
           (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
            // Allow: home, end, left, right, down, up
           (e.keyCode >= 35 && e.keyCode <= 40)) {
                // let it happen, don't do anything
                return;
       }
       // Ensure that it is a number and stop the keypress
       if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
           e.preventDefault();
       }
	});
}

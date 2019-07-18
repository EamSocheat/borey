var _btnId;
var _this;
var menu_id_0;
var _chkUserNm;
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
			clearForm();
			
			listMenu();
			getStaff();
			$("#txtEditYn").val("N");
			
			if($("#frmAct").val() == "U"){
			    getDataEdit($("#userAccId").val());
			    $("#popupTitle").html("<i class='fa fa-user-circle-o'></i> "+$.i18n.prop("btn_edit")+" "+ $.i18n.prop("lb_user_account"));
			}else{
			    $("#btnSaveNew").show();
			    $("#popupTitle").html("<i class='fa fa-user-circle-o'></i> "+$.i18n.prop("btn_add_new")+" "+ $.i18n.prop("lb_user_account"));
			}
			$("#frmUserAcc").show();
			$("#braNm").focus();
			
			//
			$('#txtDob').datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				format: "dd/mm/yyyy",
			    startView: 'decade',
			    viewSelect: 'decade',
			    minView: 2,
			    autoclose: true
		    });
			$("#txtDob").inputmask();
			//
			
			//
			$("#txtStartDate").datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: 1,
				forceParse: 0,
				sideBySide: true,
				format: "dd/mm/yyyy",
			});
			$("#txtStartDate").inputmask();
			//
			
			//
			//
			$("#txtStopDate").datepicker({
				language: (getCookie("lang") == "kh" ? "kh" : "en"),
				weekStart: true,
		        todayBtn:  true,
				autoclose: true,
				todayHighlight: true,
				forceParse: 0,
				sideBySide: true,
				format: "dd/mm/yyyy",
			});
			$("#txtStopDate").inputmask();
			//
			
		
			
			
		},
		event : function(){
			//
			$("#btnClose,#btnExit").click(function(e){
				//parent.$("#modalMd").modal('hide');
				parent.$("#msgErr").hide();
				parent.stock.comm.closePopUpForm("PopupFormUserAccount",parent.popupStaffCallback);
			});
			//
			$("#frmUserAcc").submit(function(e){
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
			$("#chkAllMenuNav").click(function(e){
				if($(this).is(":checked")){
					$(".menu-user1").prop( "checked", true );
				}else{
					$(".menu-user1").prop( "checked", false );
				}
			});
			//
			$("#divMenuNav").on("click", ".menu-user1 ", function(e) {
				if($("#divMenuNav .menu-user1 ").length == $("#divMenuNav .menu-user1:checked").length){
	                $("#chkAllMenuNav").prop( "checked", true );
	            }else{
	                $("#chkAllMenuNav").prop( "checked", false );
	            }
			});
			
			//
			$("#chkAllMenuPro").click(function(e){
				if($(this).is(":checked")){
					$(".menu-user2").prop( "checked", true );
				}else{
					$(".menu-user2").prop( "checked", false );
				}
			});
			//
			$("#divMenuPro").on("click", ".menu-user2", function(e) {
				if($("#divMenuPro .menu-user2").length == $("#divMenuPro .menu-user2:checked").length){
	                $("#chkAllMenuPro").prop( "checked", true );
	            }else{
	                $("#chkAllMenuPro").prop( "checked", false );
	            }
			});
			
			//
			$("#chkAllMenuOth").click(function(e){
				if($(this).is(":checked")){
					$(".menu-user3").prop( "checked", true );
				}else{
					$(".menu-user3").prop( "checked", false );
				}
			});
			//
			$("#divMenuOth").on("click", ".menu-user3", function(e) {
				if($("#divMenuOth .menu-user3").length == $("#divMenuOth .menu-user3:checked").length){
	                $("#chkAllMenuOth").prop( "checked", true );
	            }else{
	                $("#chkAllMenuOth").prop( "checked", false );
	            }
			});
			//
			$("#txtPwdCon").keyup(function(e){
				if($("#txtPwd").val() != $("#txtPwdCon").val()){
					showPwdErr();
				}else{
					parent.$("#msgErr").hide();
					$("#txtPwd").css("border-color","#ced4da");
					$("#txtPwdCon").css("border-color","#ced4da");
				}
			});
			
			$("#txtPwd").keyup(function(e){
				if($("#txtPwd").val() != $("#txtPwdCon").val()){
					showPwdErr();
				}else{
					parent.$("#msgErr").hide();
					$("#txtPwd").css("border-color","#ced4da");
					$("#txtPwdCon").css("border-color","#ced4da");
				}
			});
			
			//
			$("#chkAddYn").click(function(e){
				if($(this).is(":checked")){
					$("#txtAddYn").val("Y");
				}else{
					$("#txtAddYn").val("N");
				}
			});
			
			//
			$("#chkEditYn").click(function(e){
				if($(this).is(":checked")){
					$("#txtEditYn").val("Y");
				}else{
					$("#txtEditYn").val("N");
				}
			});
			
			//
			$("#divMenuOth,#divMenuPro,#divMenuNav").on("click", ".menu-save", function(e) {
				parent.$("#msgErr").hide();
				$(".panel").css("border-color","#ced4da");
			});
			
			///
			$("#txtUserNm").keyup(function(e){
				checkUserName($("#txtUserNm").val());	
			});
			
		}
};

function getDataEdit(usr_id){
    //
    $("#loading").show();
    $.ajax({
		type: "POST",
		url: $("#base_url").val() +"User/getUserAccountMenu",
		data: {"usrId":usr_id},
		dataType: "json",
		async: false,
		success: function(res) {
			console.log(res);
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				$("#cboStaff").val(res.OUT_REC[0]["sta_id"]);
			    $('#cboStaff').attr('disabled',true);
			    $("#txtUserNm").val(res.OUT_REC[0]["usr_nm"]);
			    $("#oldUserNm").val(res.OUT_REC[0]["usr_nm"]);
			    $("#txtPwd").val(res.OUT_REC[0]["usr_pwd"]);
			    $("#txtPwdCon").val(res.OUT_REC[0]["usr_pwd"]);
			    //
			    if(res.OUT_REC[0]["usr_wri_yn"] == "Y"){
			    	$("#chkAddYn").prop( "checked", true );
			    }else{
			    	$("#chkAddYn").prop( "checked", false );
			    }
			    //
			    if(res.OUT_REC[0]["usr_edit_yn"] == "Y"){
			    	$("#chkEditYn").prop( "checked", true );
			    }else{
			    	$("#chkEditYn").prop( "checked", false );
			    }
				for(var i=0; i<res.OUT_REC.length; i++){
				    $("#menuNo"+res.OUT_REC[i]["menu_id"]).prop( "checked", true );
				}
			    $("#txtUserNm").focus();
			    
			    if($("#divMenuNav .menu-user1 ").length == $("#divMenuNav .menu-user1:checked").length){
	                $("#chkAllMenuNav").prop( "checked", true );
	            }else{
	                $("#chkAllMenuNav").prop( "checked", false );
	            }
			    
			    if($("#divMenuPro .menu-user2").length == $("#divMenuPro .menu-user2:checked").length){
	                $("#chkAllMenuPro").prop( "checked", true );
	            }else{
	                $("#chkAllMenuPro").prop( "checked", false );
	            }
			    
			    if($("#divMenuOth .menu-user3").length == $("#divMenuOth .menu-user3:checked").length){
	                $("#chkAllMenuOth").prop( "checked", true );
	            }else{
	                $("#chkAllMenuOth").prop( "checked", false );
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
    $("#frmUserAcc input").val("");
    $("#frmUserAcc textarea").val("");
    $("#staImgView").attr("src",$("#base_url").val()+"assets/image/default-staff-photo.png");
    $("#txtStaffNm").focus();
    $("#txtAddYn").val("Y");
    $("#txtPwd").val("1234");
	$("#txtPwdCon").val("1234");
	$("#chkAddYn").prop( "checked", true );
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
	//
	
	checkUserName($("#txtUserNm").val());
	if(_chkUserNm){
		return;
	}
	
	//
	
	var menuChk=$(".menu-save:checked");
	var menuArr=[];
	menuChk.each(function(i){
		menuArr.push(parseInt($(this).attr("data-id")));
	});
	
	if(menuChk == null || menuChk == undefined || menuChk.length <=0 ){
		showMenuErr();
		return;
	}
	menuArr.push(menu_id_0);
	
	$('#cboStaff').attr('disabled',false);
	$("#userAccId").appendTo("#frmUserAcc");
	
    parent.$("#loading").show();
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"User/save",
		data: $("#frmUserAcc").serialize()+"&menuArr="+menuArr ,
		success: function(res) {
		    parent.$("#loading").hide();
			if(res =="OK"){
				parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"braNm");
				if(str == "new"){
				    clearForm();
				}else{
				    //close popup
				    parent.stock.comm.closePopUpForm("PopupFormUserAccount",parent.popupUserAccountCallback);
				}
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}


function listMenu(){
    $.ajax({
		type: "POST",
		url: $("#base_url").val() +"Menu/getMenuCompany",
		dataType: "json",
		async: false,
		success: function(res) {
			$("#divMenuNav").html("");
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				
			    for(var i=0; i<res.OUT_REC.length;i++){
			    	var menuId=res.OUT_REC[i]['menu_id'];
			        var html= '';
			        html+= '<div class="col-xs-4" data-val="'+menuId+'">';
			        html+= '<input type="checkbox" data-id="'+menuId+'" id="menuNo'+menuId+'" class="menu-save menu-user'+res.OUT_REC[i]['menu_group']+'" />';
			        html+= '<label for="menuNo'+menuId+'" style="cursor:pointer"><span> '+
			        		(getCookie("lang") == "kh" ? res.OUT_REC[i]['menu_nm_kh'] : res.OUT_REC[i]['menu_nm'])+
			        		'&nbsp;<i class="'+res.OUT_REC[i]['menu_icon_nm']+'"></i></span><label>';
			        html+='</div>';
	    		
			    	if(res.OUT_REC[i]['menu_group'] == '1'){
			    		$("#divMenuNav").append(html);
			        }else if(res.OUT_REC[i]['menu_group'] == '2'){
			        	$("#divMenuPro").append(html);
			        }else if(res.OUT_REC[i]['menu_group'] == '3'){
			        	$("#divMenuOth").append(html);
			        }else{
			        	menu_id_0 = menuId;
			        }
			    }    
			}
		},
		error : function(data) {
		    console.log(data);
            stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
	
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
				$("#cboStaff option").remove();
				$("#cboStaff").append("<option value=''>សូមជ្រើសរើសបុគ្គលិក</option>");
				
				for(var i=0; i<res.OUT_REC.length; i++){
					var braNm = res.OUT_REC[i]["sta_nm_kh"];
					$("#cboStaff").append("<option value='"+res.OUT_REC[i]["sta_id"]+"'>"+braNm+"</option>");
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
function checkUserName(userNm){
	if($("#txtUserNm").val() == $("#oldUserNm").val()){
		return;
	}
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"User/checkUserName",
		data: {"userNm":userNm},
		async: false,
		success: function(res) {
			if(res == "ERROR"){
				showUserNameErr();
				_chkUserNm = true;
			}else{
				_chkUserNm = false;
				parent.$("#msgErr").hide();
				$("#txtUserNm").css("border-color","#ced4da");
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
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
	$("#txtUserNm").css("border-color","red");
	parent.$("#msgShw").html("ឈ្មោះគណនីមានរូចហើយ  សូមជ្រើសរើសឈ្មោះគណនីផ្សេង!!!");
	parent.$("#msgErr").show();
	
}

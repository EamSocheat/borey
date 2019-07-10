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
			clearForm();
			if($("#frmAct").val() == "U"){
			    getDataEdit($("#cat_id").val());
			    $("#popupTitle").html("<i class='fa fa-ship'></i> "+$.i18n.prop("btn_edit")+" "+ $.i18n.prop("lb_import"));
			}else{
			    $("#btnSaveNew").show();
			    $("#popupTitle").html("<i class='fa fa-ship'></i> "+$.i18n.prop("btn_add_new")+" "+ $.i18n.prop("lb_import"));
			}
			$("#frmCateg").show();
			$("#braNm").focus();
		},
		event : function(){
			$("#btnClose, #btnExit").click(function(){
				parent.stock.comm.closePopUpForm("PopupFormImport", parent.popupImportCallback);
			});
			$("#frmCateg").submit(function(e){
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
				$("#categFile").trigger( "click" );
			});
			//
			$("#categFile").change(function(){
			    readURL(this);
			});

		}
};


function saveData(str){
    parent.$("#loading").show();
    $("#cat_id").appendTo("#frmCateg");
    
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Import/save",
		//data: $("#frmCateg").serialize(),//+ "&cat_id=" +$("#cat_id").val(),
		data: new FormData($("#frmCateg")[0]),
		cache: false,
        contentType: false,
        processData: false,
		success: function(res) {
		    parent.$("#loading").hide();
			if(res =="OK"){
				parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"txtCateNm");
				if(str == "new"){
				    clearForm();
				}else{
				    parent.stock.comm.closePopUpForm("PopupFormImport",parent.popupImportCallback);
				}
			}
		},
		error : function(data) {
			console.log(data);
			stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}

function getDataEdit(cat_id){
    $("#loading").show();
    $.ajax({
		type: "POST",
		url : $("#base_url").val() +"Import/getImportData",
		data: {"cat_id":cat_id},
		dataType: "json",
		async: false,
		success: function(res) {
			console.log("popup")
			console.log(res.OUT_REC)
			if(res.OUT_REC != null && res.OUT_REC.length >0){
				if(res.OUT_REC[0]["cat_photo"] != "" && res.OUT_REC[0]["cat_photo"] != null){
					$("#categImgView").attr("src", $("#base_url").val()+"/upload"+res.OUT_REC[0]["cat_photo"]);
				}
				
			    $("#txtCateNm").val(res.OUT_REC[0]["cat_nm"]);
			    $("#txtCateNmKh").val(res.OUT_REC[0]["cat_nm_kh"]);
			    $("#cateDescr").val(res.OUT_REC[0]["cat_des"]);
			    $("#txtCateNm").focus();
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
    $("#frmCateg input").val("");
    $("#frmCateg textarea").val("");
    
    $("#txtCateNm").focus();
}

/**
 * 
 */
//
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function (e) {
            $('#categImgView').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}


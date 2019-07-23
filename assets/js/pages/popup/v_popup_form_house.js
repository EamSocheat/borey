
var _btnId;

$(document).ready(function(){
	_thisPage.onload();
});


var _thisPage = {
		onload : function(){
			_this = this;
			parent.$("#loading").hide();
			_this.event();

			if($("#houseId").val() != ""){
			    _thisPage.fillData($("#houseId").val());
			    $("#popupTitle").html("<i class='fa fa-building-o'></i> "+$.i18n.prop("btn_edit")+" "+ $.i18n.prop("lb_house"));
			}else{
			    $("#btnSaveNew").show();
			    $("#popupTitle").html("<i class='fa fa-building-o'></i> "+$.i18n.prop("btn_add_new")+" "+ $.i18n.prop("lb_house"));
			}
			$("#frmHouse").show();
			stock.comm.inputNumber("txtHouseLength");
			stock.comm.inputNumber("txtHouseWidth");
			stock.comm.inputNumber("txtHouseArea");
			stock.comm.inputNumber("txtFloorQty");
			stock.comm.inputNumber("txtRoomQty");
			stock.comm.inputNumber("txtToiletQty");
			stock.comm.inputCurrency("txtHousePrice");
		}, fillData : function(pos_id){
			$.ajax({
				type: "POST",
				url: $("#base_url").val() +"Position/getPositionData",
				data: {"pos_id" : pos_id},
				dataType: "json",
				success: function(data) {
					$("#loading").hide();
					if(data.OUT_REC.length > 0){
						$("#posNm").val(data.OUT_REC[0]["pos_nm"]);
						$("#posNmKh").val(data.OUT_REC[0]["pos_nm_kh"]);
						$("#posDescr").val(data.OUT_REC[0]["pos_des"]);
					}
				}, error : function(data) {
				    console.log(data);
				    $("#loading").hide();
				    parent.stock.comm.alertMsg($.i18n.prop("msg_err"));
		        }
			});
		}, saveHouseName : function(str){
			parent.$("#loading").show();

			$.ajax({
				type: "POST",
				url: $("#base_url").val() + "House/save",
				data: $("#frmHouse").serialize() + "&proId=" + $("#houseId").val(),
				success: function(res) {
				    parent.$("#loading").hide();
					if(res =="OK"){
						parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"projNm");
						if(str == "new"){
						    clearForm();
						}else{
							var parentFrame = "";
							var callbackFunction = null;
							parentFrame = $("#parentId").val();
							callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.popupHouseCallback
							parent.stock.comm.closePopUpForm("PopupFormHouse", callbackFunction);
						}
					}
				},
				error : function(data) {
					console.log(data);
					parent.stock.comm.alertMsg($.i18n.prop("msg_err"));
		        }
			});
		}, event : function(){
			$("#btnClose, #btnExit").click(function(e){
				parent.stock.comm.closePopUpForm("PopupFormHouse",parent.popupHouseCallback);
			});

			$("#frmHouse").submit(function(e){
				e.preventDefault();
				if(_btnId == "btnSave"){
					_this.saveHouseName();
				}else{
					_this.saveHouseName("new");
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
			$("#houseImgView, #btnSelectPhoto").click(function(e){
				$("#fileHousePhoto").trigger( "click" );
			});
			//
			$("#fileHousePhoto").change(function(){
				readURL(this);
			});
			//
			$("#btnPopupCategory").click(function(e){
				var data  = "parentId=ifameStockForm";
				data += "&dataSrch="+$("#txtCatNm").val();
				var controllerNm = "PopupSelectCategory";
				var option = {};
				option["height"] = "597px";
				stock.comm.openPopUpSelect(controllerNm, option, data, "modal-md");
			});
			//
			$("#btnPopupProject").click(function(e){
				var data  = "parentId=ifameStockForm";
				data += "&dataSrch="+$("#txtProjNm").val();
				var controllerNm = "PopupSelectProject";
				var option = {};
				option["height"] = "567px";
				stock.comm.openPopUpSelect(controllerNm, option, data, "modal-md");
			});
		}
}

function selectCategoryCallback(data) {
	if(data["cat_nm_kh"] != "" && data["cat_nm_kh"] != null){
		$("#txtCatNm").val(data["cat_nm_kh"]);
		$("#txtCatNmVal").val(data["cat_nm_kh"]);
	}else{
		$("#txtCatNm").val(data['cat_nm']);
		$("#txtCatNmVal").val(data['cat_nm']);
	}

	$("#txtCatIdVal").val(data["cat_id"]);
}

function selectProjectCallback(data) {
	if(data["proj_nm_kh"] != "" && data["proj_nm_kh"] != null){
		$("#txtProjNm").val(data["proj_nm_kh"]);
		$("#txtProjNmVal").val(data["proj_nm_kh"]);
	}else{
		$("#txtProjNm").val(data['proj_nm']);
		$("#txtProjNmVal").val(data['proj_nm']);
	}

	$("#txtProjIdVal").val(data["proj_id"]);
}

function clearForm(){
    $("#frmHouse input").val("");
    $("#frmHouse textarea").val("");

    $("#posNm").focus();
}

/**
 *
 */
//
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$("#houseImgView").attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

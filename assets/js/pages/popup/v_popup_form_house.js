
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
			stock.comm.inputCurrency("txtHouseLength");
			stock.comm.inputCurrency("txtHouseWidth");
			stock.comm.inputCurrency("txtHouseArea");
			stock.comm.inputNumber("txtFloorQty");
			stock.comm.inputNumber("txtRoomQty");
			stock.comm.inputNumber("txtToiletQty");
			stock.comm.inputCurrency("txtHousePrice");
		}, fillData : function(pro_id){
			$.ajax({
				type: "POST",
				url: $("#base_url").val() +"House/getHouse",
				data: {"houseId" : pro_id},
				dataType: "json",
				success: function(res) {
					$("#loading").hide();
					if(res.OUT_REC != null && res.OUT_REC.length > 0){
						$("#houseId").val(res.OUT_REC[0]["pro_id"]);

						if(res.OUT_REC[0]["cat_nm_kh"] != "" && res.OUT_REC[0]["cat_nm_kh"] != null){
							$("#txtCatNm").val(res.OUT_REC[0]["cat_nm_kh"]);
							$("#txtCatNmVal").val(res.OUT_REC[0]["cat_nm_kh"]);
						}else{
							$("#txtCatNm").val(res.OUT_REC[0]["cat_nm"]);
							$("#txtCatNmVal").val(res.OUT_REC[0]["cat_nm"]);
						}
						$("#txtCatIdVal").val(res.OUT_REC[0]["cat_id"]);

						if(res.OUT_REC[0]["bra_nm_kh"] != "" && res.OUT_REC[0]["bra_nm_kh"] != null){
							$("#txtProjNm").val(res.OUT_REC[0]["bra_nm_kh"]);
							$("#txtProjNmVal").val(res.OUT_REC[0]["bra_nm_kh"]);
						}else{
							$("#txtProjNm").val(res.OUT_REC[0]["bra_nm"]);
							$("#txtProjNmVal").val(res.OUT_REC[0]["bra_nm"]);
						}
						$("#txtProjIdVal").val(res.OUT_REC[0]["bra_id"]);

						$("#txtCode").val(res.OUT_REC[0]["pro_code"]);
						$("#txtOldCode").val(res.OUT_REC[0]["pro_code"]);
						
						$("#txtHousePrice").val(stock.comm.formatCurrency(res.OUT_REC[0]["pro_price"]));
						$("#txtHouseNo").val(res.OUT_REC[0]["pro_number"]);
						$("#txtHouseLength").val(res.OUT_REC[0]["pro_length"]);
						$("#txtHouseWidth").val(res.OUT_REC[0]["pro_width"]);
						$("#txtHouseArea").val(res.OUT_REC[0]["pro_area"]);
						$("#txtStreetNo").val(res.OUT_REC[0]["pro_street"]);
						$("#txtRoomQty").val(res.OUT_REC[0]["pro_room"]);
						$("#txtToiletQty").val(res.OUT_REC[0]["pro_toilet"]);

						$("#txtDesc").val(res.OUT_REC[0]["pro_des"]);
						if(res.OUT_REC[0]["pro_photo"] != null && res.OUT_REC[0]["pro_photo"] != ""){
							$("#expendImgView").attr("src", $("#base_url").val()+"upload"+res.OUT_REC[0]["pro_photo"]);
							$("#expImgPath").val(res.OUT_REC[0]["pro_photo"]);
						}
					}else{
						stock.comm.alertMsg($.i18n.prop("msg_err"));
					}
				}, error : function(data) {
				    console.log(data);
				    $("#loading").hide();
				    parent.stock.comm.alertMsg($.i18n.prop("msg_err"));
		        }
			});
		}, saveHouseName : function(str){
			$("#houseId").appendTo("#frmHouse");
			parent.$("#loading").show();
			if($("#txtCatNm").val() == "" || $("#txtCatNm").val() == ""){
				top.stock.comm.alertMsg($.i18n.prop("msg_choose_cat"));
				parent.$("#loading").hide();
				return;
			}

			if($("#txtProjNm").val() == "" || $("#txtProjNm").val() == ""){
				top.stock.comm.alertMsg($.i18n.prop("msg_choose_bra"));
				parent.$("#loading").hide();
				return;
			}

			$.ajax({
				type: "POST",
				url: $("#base_url").val() + "House/save",
				data: $("#frmHouse").serialize() + "&proId=" + $("#houseId").val(),
				success: function(res) {
				    parent.$("#loading").hide();
				    if(res =="DUP"){
				    	parent.stock.comm.alertMsg("លេខកូដអចលនទ្រព្យ មានរួចហើយសូមបញ្ចូល លេខកូដថ្មី","projNm");
				    	return;
				    }else if(res =="OK"){
						parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"projNm");
						if(str == "new"){
						    clearForm();
						}else{
							var parentFrame = "";
							var callbackFunction = null;

							if($("#parentId").val() != "" && $("#parentId").val() != null){
								parentFrame = $("#parentId").val();
								callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.popupHouseCallback
							}else{
								callbackFunction = parent.popupHouseCallback;
							}
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
				option["height"] = "500px";
				stock.comm.openPopUpSelect(controllerNm, option, data, "modal-md");
			});
			//
			$("#btnPopupProject").click(function(e){
				var data  = "parentId=ifameStockForm";
				data += "&dataSrch="+$("#txtProjNm").val();
				var controllerNm = "PopupSelectBranch";
				var option = {};
				option["height"] = "500px";
				stock.comm.openPopUpSelect(controllerNm, option, data, "modal-md");
			});
			//
			$("#txtHouseLength").on("keyup", function(e){
				var lenVal = $(this).val();
				var widVal = $("#txtHouseWidth").val();

				$("#txtHouseArea").val(Number(lenVal) * Number(widVal));
			});
			//
			$("#txtHouseWidth").on("keyup", function(e){
				var lenVal = $("#txtHouseLength").val();
				var widVal = $(this).val();

				$("#txtHouseArea").val(Number(lenVal) * Number(widVal));
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

function selectBranchCallback(data) {
	if(data["bra_nm_kh"] != "" && data["bra_nm_kh"] != null){
		$("#txtProjNm").val(data["bra_nm_kh"]);
		$("#txtProjNmVal").val(data["bra_nm_kh"]);
	}else{
		$("#txtProjNm").val(data['bra_nm']);
		$("#txtProjNmVal").val(data['bra_nm']);
	}

	$("#txtProjIdVal").val(data["bra_id"]);
}

function clearForm(){
    $("#frmHouse input").val("");
    $("#frmHouse textarea").val("");

	$("#houseImgView").attr("src",$("#base_url").val()+"assets/image/default-house.jpg");

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

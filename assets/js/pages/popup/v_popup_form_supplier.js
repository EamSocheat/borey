
var _btnId;
var supId;
$(document).ready(function(){
	_thisPage.onload();
});


var _thisPage = {
		onload : function(){
			_this = this;
			parent.$("#loading").hide();
			supId = $("#supId").val();
			_this.event();
			// top.$("#modalMdContent").height(460);
			top.$("#modalMdContentPosition").height(463);

			if(supId != ""){
				_this.fillData(supId);
			    $("#popupTitle").html("<i class='fa fa-address-card-o'></i> "+$.i18n.prop("btn_edit")+" "+ $.i18n.prop("lb_supplier"));
			}else{
			    $("#btnSaveNew").show();
			    $("#popupTitle").html("<i class='fa fa-address-card-o'></i> "+$.i18n.prop("btn_add_new")+" "+ $.i18n.prop("lb_supplier"));
			}
			stock.comm.inputNumber("phoneNum");

		}, fillData : function(sup_id){
			$.ajax({
				type: "POST",
				url: $("#base_url").val() +"Supplier/getSupplierData",
				data: {"sup_id" : sup_id},
				dataType: "json",
				success: function(data) {
					$("#loading").hide();
					if(data.OUT_REC.length > 0){
						$("#suppplyNm").val(data.OUT_REC[0]["sup_nm"]);
						$("#suppplyNmKh").val(data.OUT_REC[0]["sup_nm_kh"]);
						$("#phoneNum").val(data.OUT_REC[0]["sup_phone"]);
						$("#supplEmail").val(data.OUT_REC[0]["sup_email"]);
						$("#suppAddr").val(data.OUT_REC[0]["sup_addr"]);
						$("#suppDescr").val(data.OUT_REC[0]["sup_des"]);
					}
				}, error : function(data) {
					parent.$("#loading").hide();
				    parent.stock.comm.alertMsg($.i18n.prop("msg_err"));
		        }
			});
		}, savePositionName : function(str){
			parent.$("#loading").show();
			
			$.ajax({
				type: "POST",
				url: $("#base_url").val() + "Supplier/insertSupplierData",
				data: $("#frmBranch").serialize() + "&supId=" + supId,
				success: function(res) {
				    parent.$("#loading").hide();
					if(res =="OK"){
						parent.stock.comm.alertMsg($.i18n.prop("msg_save_com"),"suppplyNm");
						if(str == "new"){
						    clearForm();
						    parent._this.loadData();
						}else{
							var parentFrame = $("#parentId").val();
							var callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.popupSupplierCallback;
							parent.stock.comm.closePopUpForm("PopupFormSupplier", callbackFunction);
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
				var parentFrame = $("#parentId").val();
				var callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.popupSupplierCallback;
				parent.stock.comm.closePopUpForm("PopupFormSupplier", callbackFunction);

			});
			$("#btnSave").click(function(){
				_btnId = $(this).attr("id");
			}); 
			$("#btnSaveNew").click(function(){
				_btnId = $(this).attr("id");
			});
			$("#frmBranch").submit(function(e){
				e.preventDefault();
				if(_btnId == "btnSave"){
					_this.savePositionName();
				}else{
					_this.savePositionName('new');
				}
			});
		}
}

function clearForm(){
    $("#frmBranch input").val("");
    $("#frmBranch textarea").val("");
    
    $("#suppplyNm").focus();
}


var _pageNo  = 1;
var _perPage = 6;
$(document).ready(function() {
	_thisPage.init();
});


var _thisPage = {
	init : function(){
		_this = this;
		_this.onload();
		_this.event();
		//
	    // stock.comm.checkAllTblChk("chkAllCategory","tblCategory","chk_box");
	},
	onload : function(){
		parent.parent.$("#loading").hide();
		$("#frmCategory").show();
		//
		fnSearch();
	},event : function(){
		$("#btnClose, #btnExit").click(function(e){
			parent.parent.stock.comm.closePopUpForm("PopupSelectCategory");
		});
		//
		$("#btnAddNew").click(function(){
		    // parent.$("#loading").show();
			var controllerNm = "PopupFormCategory";
			var option = {};
			option["height"] = "352px";
			var data="parentId="+"ifameStockSelect";
			
			parent.stock.comm.openPopUpForm(controllerNm,option, data,null,"modalMdPosition","modalMdContentPosition","ifameStockFormPosition");
		});
		//
		$("#btnEdit").click(function(){
			var chkVal = $('#tblCategory tbody tr td.radio_box input[type="radio"]:checked');
			if(chkVal.length != 1){
			    parent.stock.comm.alertMsg($.i18n.prop("msg_con_edit1"));
				return;
			}
			
			var tblTr = chkVal.parent().parent();
			var catId = tblTr.attr("data-id");
			editData(catId);
		});
		//
		$("#btnSearch").click(function(e){
			_pageNo=1;
			_perPage=6;
			fnSearch();
		});
		//
		$("#txtSearch").keypress(function(e) {
		    if(e.which == 13) {
		    	_pageNo=1;
		    	_perPage=6;
				fnSearch();
		    }
		});
		//on scroll event
		var lastScrollTop = 0;
		$(".fix-header-tbl").scroll(function(e) {
			var st = $(this).scrollTop();
			if (st > lastScrollTop){
				if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
					_pageNo+=1;
					getCategoryData();
		        }
			} 
			lastScrollTop = st;
			
		});
		//
		$("#btnChoose").click(function(e) {
			var chkVal = $('#tblCategory tbody tr td.radio_box input[type="radio"]:checked');
			if(chkVal.length != 1){
			    parent.stock.comm.alertMsg($.i18n.prop("msg_con_choose1"));
				return;
			}
			
			var tblTr = chkVal.parent().parent();
			var data  = {};

			data["cat_id"] = tblTr.attr("data-id");
			data["cat_nm"] = tblTr.find("div.cat_nm").html();
			data["cat_nm_kh"] = tblTr.find("div.cat_nm_kh").html();

			var parentFrame = "";
			var callbackFunction = null;
			if($("#parentId").val() != "" && $("#parentId").val() != null){
				parentFrame = $("#parentId").val();
				callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.selectCategoryCallback
			}
			
			parent.stock.comm.closePopUpForm("PopupSelectCategory", callbackFunction, data);
		});
		
		//
		$("#tblCategory tbody").on("dblclick", "tr td:not(.radio_box)", function() {
			var tblTr = $(this).parent();
			var data  = {};
			data["cat_id"] = tblTr.attr("data-id");
			data["cat_nm"] = tblTr.find("div.cat_nm").html();
			data["cat_nm_kh"] = tblTr.find("div.cat_nm_kh").html();
			
			var parentFrame = "";
			var callbackFunction = null;
			if($("#parentId").val() != "" && $("#parentId").val() != null){
				parentFrame = $("#parentId").val();
				callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.selectCategoryCallback
			}

			parent.stock.comm.closePopUpForm("PopupSelectCategory", callbackFunction, data);
		});
		//
		$("#btnDelete").click(function(e){
			var chkVal = $('#tblCategory tbody tr td.radio_box input[type="radio"]:checked');

			if(chkVal.length <=0){
				parent.stock.comm.alertMsg($.i18n.prop("msg_con_del"));
				return;
			}

			parent.stock.comm.confirmMsg($.i18n.prop("msg_sure_del"));
			parent.$("#btnConfirmOk").unbind().click(function(e){
				parent.$("#mdlConfirm").modal('hide');

				var delArr=[];
				var delObj={};
				chkVal.each(function(i){
					var delData={};
					var tblTr  = $(this).parent().parent();
					var catId = tblTr.attr("data-id");
					delData["catId"] = catId;
					delArr.push(delData);
				});

				delObj["delObj"]= delArr;
				deleteDataArr(delObj);
			});

		});
		
	}
};

function getCategoryData(){
	var input = {};
	input["perPage"] = 10000;
	input["offset"]  = 1;
	input["srchAll"] = $("#txtSearch").val().trim();

	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Category/getCategoryData",
		data: input,
		dataType: "json",
		success: function(data) {
			$("#tblCategory tbody").empty();
			var html = "";
			var catPhoto = ""

			if(data.OUT_REC.length > 0){
				$.each(data.OUT_REC, function(i,v){
					if(!stock.comm.isEmpty(v.cat_photo)){
						catPhoto = $("#base_url").val()+"/upload"+v.cat_photo;
					}else{
						catPhoto = $("#base_url").val()+"assets/image/default-image.jpg";
					}

					html += '<tr data-id='+v.cat_id+' class="cur-pointer">';
					html += '	<td class="radio_box line-height-30"><input type="radio"></td>';
					html += '   <td style="height: 30px;"><div style="width: 30px;" class="image">';
					html += '       <img id="staImgView" src="'+catPhoto+'" class="" style="width:30px;height: 30px;" alt="User Image">';
					html += '   </div></td>';
					html += '	<td class="line-height-30"><div class="cat_nm">'+v.cat_nm+'</div></td>';
					html += '	<td class="line-height-30"><div class="cat_nm_kh">'+v.cat_nm_kh+'</div></td>';
					html += '	<td class="line-height-30"><div>'+v.cat_des+'</div></td>';
					// html += '	<td><div>'+(null2Void(v.regDt)).substr(0,10)+'</div></td>';
					html += '	<td class="text-center line-height-30">';
					html += '		<button onclick="editData('+v.cat_id+')" type="button" class="btn btn-primary btn-xs">';
					html += '		<i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>';
					html += '	</td>';
					html += '</tr>';
				});

				$("#tblCategory tbody").append(html);
			}else{
				setTimeout(function () {
					parent.$("#loading").hide();
				}, 300);
				$("#tblCategory tbody").append("<tr><td colspan='5' style='text-align:center;'>No data to show.</td></tr>");
			}

		}, error : function(data) {
			top.$("#loading").hide();
			stock.comm.alertMsg($.i18n.prop("msg_err"));
		}
	});
}


/**
 *
 */
function deleteDataArr(dataArr){
	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Category/delete",
		data: dataArr,
		success: function(res) {
			if(res > 0){
				parent.stock.comm.alertMsg(res+$.i18n.prop("msg_del_com"));
				_pageNo  = 1;
				_perPage = $("#tblCategory tbody tr").length;
				getCategoryData();
			}else{
				parent.stock.comm.alertMsg($.i18n.prop("msg_err_del"));
				return;
			}
			parent.$("#loading").hide();
		},
		error : function(data) {
			console.log(data);
			parent.stock.comm.alertMsg($.i18n.prop("msg_err"));
		}
	});
}

function editData(cat_id){
	var data = "id="+cat_id;
	data += "&action=U";
	data += "&parentId="+"ifameStockSelect";
	var controllerNm = "PopupFormCategory";
	var option = {};
	option["height"] = "352px";
	parent.stock.comm.openPopUpForm(controllerNm,option, data,null,"modalMdPosition","modalMdContentPosition","ifameStockFormPosition");
}

function popupCategoryCallback(){
	getCategoryData();
}

function fnSearch(){
	parent.$("#loading").show();
	getCategoryData();
	setTimeout(function () {
		parent.$("#loading").hide();
	}, 300);
}

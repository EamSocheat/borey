
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
	    // stock.comm.checkAllTblChk("chkAllProject","tblProject","chk_box");
	},
	onload : function(){
		parent.parent.$("#loading").hide();
		$("#frmProject").show();
		fnSearch();
	},event : function(){
		$("#btnClose, #btnExit").click(function(e){
			parent.parent.stock.comm.closePopUpForm("PopupSelectProject");
		});
		//
		$("#btnAddNew").click(function(){
		    // parent.$("#loading").show();
			var controllerNm = "PopupFormProject";
			var option = {};
			option["height"] = "352px";
			var data="parentId="+"ifameStockSelect";
			
			parent.stock.comm.openPopUpForm(controllerNm,option, data,null,"modalMdPosition","modalMdContentPosition","ifameStockFormPosition");
		});
		//
		$("#btnEdit").click(function(){
			var chkVal = $('#tblProject tbody tr td.radio_box input[type="radio"]:checked');
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
					getProjectData();
		        }
			} 
			lastScrollTop = st;
			
		});
		//
		$("#btnChoose").click(function(e) {
			var chkVal = $('#tblProject tbody tr td.radio_box input[type="radio"]:checked');
			if(chkVal.length != 1){
			    parent.stock.comm.alertMsg($.i18n.prop("msg_con_choose1"));
				return;
			}
			
			var tblTr = chkVal.parent().parent();
			var data  = {};
			data["proj_id"] = tblTr.attr("data-id");
			data["proj_nm"] = tblTr.find("div.bra_nm").html();
			data["proj_nm_kh"] = tblTr.find("div.bra_nm_kh").html();

			var parentFrame = "";
			var callbackFunction = null;
			if($("#parentId").val() != "" && $("#parentId").val() != null){
				parentFrame = $("#parentId").val();
				callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.selectProjectCallback
			}
			
			parent.stock.comm.closePopUpForm("PopupSelectProject", callbackFunction, data);
		});
		
		//
		$("#tblProject tbody").on("dblclick", "tr td:not(.radio_box)", function() {
			var tblTr = $(this).parent();
			var data  = {};
			data["proj_id"] = tblTr.attr("data-id");
			data["proj_nm"] = tblTr.find("div.bra_nm").html();
			data["proj_nm_kh"] = tblTr.find("div.bra_nm_kh").html();
			
			var parentFrame = "";
			var callbackFunction = null;
			if($("#parentId").val() != "" && $("#parentId").val() != null){
				parentFrame = $("#parentId").val();
				callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.selectProjectCallback
			}

			parent.stock.comm.closePopUpForm("PopupSelectProject", callbackFunction, data);
		});
		//
		$("#btnDelete").click(function(e){
			var chkVal = $('#tblProject tbody tr td.radio_box input[type="radio"]:checked');

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

function getProjectData(){
	var input = {};
	input["perPage"] = 10000;
	input["offset"]  = 1;
	input["srchAll"] = $("#txtSearch").val().trim();

	$.ajax({
		type: "POST",
		url : $("#base_url").val() +"Project/getProjectData",
		data: input,
		dataType: "json",
		success: function(data) {
			$("#tblProject tbody").empty();
			var html = "";
			var braPhoto = ""

			if(data.OUT_REC.length > 0){
				$.each(data.OUT_REC, function(i,v){

					html += '<tr data-id='+v.bra_id+' class="cur-pointer">';
					html += '	<td class="radio_box line-height-30"><input type="radio"></td>';
					html += '	<td class="line-height-30"><div class="bra_nm">'+v.bra_nm+'</div></td>';
					html += '	<td class="line-height-30"><div class="bra_nm_kh">'+v.bra_nm_kh+'</div></td>';
					html += '	<td class="line-height-30"><div>'+v.bra_des+'</div></td>';
					html += '	<td class="text-center line-height-30">';
					html += '		<button onclick="editData('+v.bra_id+')" type="button" class="btn btn-primary btn-xs">';
					html += '		<i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>';
					html += '	</td>';
					html += '</tr>';
				});

				$("#tblProject tbody").append(html);
			}else{
				setTimeout(function () {
					parent.$("#loading").hide();
				}, 300);
				$("#tblProject tbody").append("<tr><td colspan='5' style='text-align:center;'>No data to show.</td></tr>");
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
		url : $("#base_url").val() +"Project/delete",
		data: dataArr,
		success: function(res) {
			if(res > 0){
				parent.stock.comm.alertMsg(res+$.i18n.prop("msg_del_com"));
				_pageNo  = 1;
				_perPage = $("#tblProject tbody tr").length;
				getProjectData();
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
	var controllerNm = "PopupFormProject";
	var option = {};
	option["height"] = "352px";
	parent.stock.comm.openPopUpForm(controllerNm,option, data,null,"modalMdPosition","modalMdContentPosition","ifameStockFormPosition");
}

function popupProjectCallback(){
	getProjectData();
}

function fnSearch(){
	parent.$("#loading").show();
	getProjectData();
	setTimeout(function () {
		parent.$("#loading").hide();
	}, 300);
}

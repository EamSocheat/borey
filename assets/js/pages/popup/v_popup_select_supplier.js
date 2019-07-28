
var _pageNo=1;
var _perPage=6;
$(document).ready(function() {
	_thisPage.init();
});


var _thisPage = {
	init : function(){
		_this = this;
		_this.onload();
		_this.event();
		//
	    // stock.comm.checkAllTblChk("chkAllSupplier","tblSupplier","chk_box");
	},
	onload : function(){
		parent.parent.$("#loading").hide();
		$("#frmSupplier").show();
		//
	    getData();
	},event : function(){
		$("#btnClose, #btnExit").click(function(e){
			parent.parent.stock.comm.closePopUpForm("PopupSelectSupplier");
		});
		//
		$("#btnAddNew").click(function(){
		    // parent.$("#loading").show();
			var controllerNm = "PopupFormSupplier";
			var option = {};
			option["height"] = "463px";
			var data="parentId="+"ifameStockSelect";
			
			parent.stock.comm.openPopUpForm(controllerNm,option, data,null,"modalMdPosition","modalMdContentPosition","ifameStockFormPosition");
		});
		
		
		//
		$("#btnEdit").click(function(){
			var chkVal = $('#tblSupplier tbody tr td.radio_box input[type="radio"]:checked');
			if(chkVal.length != 1){
			    parent.stock.comm.alertMsg($.i18n.prop("msg_con_edit1"));
				return;
			}
			
			var tblTr = chkVal.parent().parent();
			var suppId = tblTr.attr("data-id");
			editData(suppId);
		});
		
		//
		$("#btnDelete").click(function(e){
			var chkVal = $('#tblSupplier tbody tr td.radio_box input[type="radio"]:checked');
			
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
					var suppId = tblTr.attr("data-id");
					delData["supId"] = suppId;
					delArr.push(delData);
				});
				
				delObj["delObj"]= delArr;
				//
				deleteDataArr(delObj);
			});
			
		});
		
		//
		$("#btnSearch").click(function(e){
			_pageNo=1;
			_perPage=6;
			getData();
		});
		
		//
		$("#txtSearch").keypress(function(e) {
		    if(e.which == 13) {
		    	_pageNo=1;
		    	_perPage=6;
			    getData();
		    }
		});
		//on scroll event
		var lastScrollTop = 0;
		$(".fix-header-tbl").scroll(function(e) {
			var st = $(this).scrollTop();
			if (st > lastScrollTop){
				if($(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight) {
					_pageNo+=1;
		            getData();
		        }
			} 
			lastScrollTop = st;
			
		});
		//
		$("#btnChoose").click(function(e) {
			var chkVal = $('#tblSupplier tbody tr td.radio_box input[type="radio"]:checked');
			if(chkVal.length != 1){
			    parent.stock.comm.alertMsg($.i18n.prop("msg_con_choose1"));
				return;
			}
			
			var tblTr = chkVal.parent().parent();
			var data  = {};

			data["sup_id"] = tblTr.attr("data-id");
			data["sup_nm"] = tblTr.find("div.sup_nm").html();
			data["sup_nm_kh"] = tblTr.find("div.sup_nm_kh").html();
			data["sup_phone"] = tblTr.find("div.sup_phone").html();

			var parentFrame = "";
			var callbackFunction = null;
			if($("#parentId").val() != "" && $("#parentId").val() != null){
				parentFrame = $("#parentId").val();
				callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.selectSupplierCallback
			}
			parent.stock.comm.closePopUpForm("PopupSelectSupplier", callbackFunction, data);
		});
		
		//
		$("#tblSupplier tbody").on("dblclick", "tr td:not(.radio_box)", function() {
			var tblTr = $(this).parent();
			var data  = {};
			data["sup_id"] = tblTr.attr("data-id");
			data["sup_nm"] = tblTr.find("div.sup_nm").html();
			data["sup_nm_kh"] = tblTr.find("div.sup_nm_kh").html();
			data["sup_phone"] = tblTr.find("div.sup_phone").html();
			
			var parentFrame = "";
			var callbackFunction = null;
			if($("#parentId").val() != "" && $("#parentId").val() != null){
				parentFrame = $("#parentId").val();
				callbackFunction = parent.$("#"+parentFrame)[0].contentWindow.selectSupplierCallback
			}
			parent.stock.comm.closePopUpForm("PopupSelectSupplier", callbackFunction, data);
		});
		
		
	}
};

function getData(){
	var dat = {};
	//paging
    dat["perPage"] = 10000;
    dat["offset"]  = 1;
    //searching
    dat["srchAll"] = $("#txtSearch").val().trim();	
    //
    parent.$("#loading").show();
    $.ajax({
		type: "POST",
		url: $("#base_url").val() +"Supplier/getSupplierData",
		data: dat,
		dataType: "json",
		success: function(res) {
			$("#tblSupplier tbody").html("");
			var strHtml = "";
			var supNmKh = "";

			if(res.OUT_REC != null && res.OUT_REC.length >0){
				for(var i=0; i<res.OUT_REC.length;i++){
					if(res.OUT_REC[i]['sup_nm_kh'] != "" && res.OUT_REC[i]['sup_nm_kh'] != null){
						supNmKh = res.OUT_REC[i]['sup_nm_kh'];
					}else{
						supNmKh = res.OUT_REC[i]['sup_nm'];
					}

					strHtml += '<tr class="cur-pointer" data-id="'+res.OUT_REC[i]['sup_id']+'">';
					strHtml += '	<td class="radio_box"><input type="radio" id="chkSupplier"></td>';
					strHtml += '	<td><div title="'+res.OUT_REC[i]['sup_nm']+'" class="sup_nm">'+supNmKh+'</div></td>';
					strHtml += '	<td style="display: none"><div class="sup_nm_kh">'+res.OUT_REC[i]['sup_nm_kh']+'</div></td>';
					strHtml += '	<td><div title="'+res.OUT_REC[i]['sup_phone']+'" class="sup_phone">'+res.OUT_REC[i]['sup_phone']+'</div></td>';
					// strHtml += '	<td><div title="'+res.OUT_REC[i]['sup_email']+'" class="sup_email">'+res.OUT_REC[i]['sup_email']+'</div></td>';
					strHtml += '	<td><div title="'+res.OUT_REC[i]['sup_addr']+'" class="sup_addr">'+res.OUT_REC[i]['sup_addr']+'</div></td>';
					strHtml +=	'	<td class="act_btn text-center">';
					strHtml +=	'		<button onclick="editData('+res.OUT_REC[i]['sup_id']+')" type="button" class="btn btn-primary btn-xs">';
					strHtml +=	'			<i class="fa fa-pencil-square-o" aria-hidden="true"></i>';
					strHtml +=	'		</button>';
					strHtml +=	'	</td>';
					strHtml += '</tr>';
			    }
				$("#tblSupplier tbody").append(strHtml);
			}else{
				$("#tblSupplier tbody").append("<tr><td colspan='5' style='    text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
			}
			setTimeout(function () {
				parent.$("#loading").hide();
				}, 300);
		},
		error : function(data) {
		    console.log(data);
            parent.stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}


/**
 *
 */
function deleteDataArr(dataArr){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Supplier/deleteSupplier",
		data: dataArr,
		success: function(res) {
			if(res > 0){
				parent.stock.comm.alertMsg(res+$.i18n.prop("msg_del_com"));
				_pageNo=1;
				_perPage=$("#tblBranch tbody tr").length;
				getData();
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

function editData(sup_id){
	var data = "id="+sup_id;
	data += "&action=U";
	data += "&parentId="+"ifameStockSelect";
	var controllerNm = "PopupFormSupplier";
	var option = {};
	option["height"] = "463px";
	parent.stock.comm.openPopUpForm(controllerNm,option, data,null,"modalMdPosition","modalMdContentPosition","ifameStockFormPosition");
}

function popupSupplierCallback(){
	getData();
}

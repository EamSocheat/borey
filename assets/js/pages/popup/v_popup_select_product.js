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
	    stock.comm.checkAllTblChk("chkAll","tblProduct","chk_box");
	},
	onload : function(){
		parent.parent.$("#loading").hide();
		$("#frmStaff").show();
		//
	    getData(); 
	    
	    
	},event : function(){
		$("#btnClose,#btnExit").click(function(e){
			
			parent.parent.stock.comm.closePopUpForm("PopupSelectProduct");
			
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
			var chkVal = $('#tblProduct tbody tr td.chk_box input[type="checkbox"]:checked');
			if(chkVal.length < 1){
			    parent.stock.comm.alertMsg("សូមជ្រើសរើសទិន្ន័យ!!!");
				return;
			}
			
			var dataArr = [];
			var dataObj = {};
			chkVal.each(function(i){
				var data = {};
				var tblTr = $(this).parent().parent();
				data["pro_code"] = tblTr.find("td.pro_code").html();
				data["cat_nm"] = tblTr.find("td.cat_nm").html();
				data["bra_nm"] = tblTr.find("td.bra_nm").html();
				data["pro_id"] = tblTr.attr("data-id");
				dataArr.push(data);
			});
			
			dataObj["data"]= dataArr;
			var parentFrame="";
			var callbackFunction=null;
			if($("#parentId").val() !="" && $("#parentId").val() !=null){
				parentFrame= $("#parentId").val();
				callbackFunction=parent.$("#"+parentFrame)[0].contentWindow.selectProductCallback
			}
			parent.stock.comm.closePopUpForm("PopupSelectProduct",callbackFunction,dataObj);
		});
		
		//
		$("#tblProduct tbody").on("dblclick", "tr td:not(.chk_box,.act_btn)", function() {
			/*var tblTr = $(this).parent();
			var data={};
			data["pro_code"] = tblTr.find("td.pro_code").html();
			data["cat_nm"] = tblTr.find("td.cat_nm").html();
			data["bra_nm"] = tblTr.find("td.bra_nm").html();

			data["pro_id"] = tblTr.attr("data-id");
			
			var parentFrame="";
			var callbackFunction=null;
			if($("#parentId").val() !="" && $("#parentId").val() !=null){
				parentFrame= $("#parentId").val();
				callbackFunction=parent.$("#"+parentFrame)[0].contentWindow.selectBranchCallback
			}
			parent.stock.comm.closePopUpForm("PopupSelectProduct",callbackFunction,data);*/
		});
		
		
	}
};

function getData(){
	var dat={};
	//paging
    dat["perPage"] = _perPage;
    dat["offset"] = _perPage * ( _pageNo - 1);
    //searching
    //dat["srchAll"] = $("#txtSearch").val().trim();	
    //
    parent.$("#loading").show();
    $.ajax({
		type: "POST",
		url: $("#base_url").val() +"House/getHouse",
		data: dat,
		dataType: "json",
		success: function(res) {
			parent.$("#loading").hide();
			if(dat["offset"] == 0){
				$("#tblProduct tbody").html("");
			}
			
			if(res.OUT_REC != null && res.OUT_REC.length >0){
			    for(var i=0; i<res.OUT_REC.length;i++){
			        var html = "<tr data-id='"+res.OUT_REC[i]["pro_id"]+"'>";
			        html += "<td class='chk_box'><input type='checkbox'></td>";
			        html += "<td class='pro_code cur-pointer'>"+res.OUT_REC[i]["pro_code"]+"</td>";
			        html += "<td class='cat_nm cur-pointer'>"+res.OUT_REC[i]["cat_nm_kh"]+"</td>";
			        html += "<td class='bra_nm cur-pointer'>"+res.OUT_REC[i]["bra_nm_kh"]+"</td>";
			        html += "<td class='pro_price cur-pointer'>"+res.OUT_REC[i]["pro_price"]+"</td>";
			        html += "</tr>";
			        
			        $("#tblProduct tbody").append(html);
			    }    
			    
			}else{
				if($("#tblProduct tbody tr").length <= 0){
					$("#tblProduct tbody").append("<tr><td colspan='5' style='    text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
				}
			    
			}
			
		},
		error : function(data) {
		    console.log(data);
            parent.stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}
function deleteData(pro_id){
    parent.stock.comm.confirmMsg($.i18n.prop("msg_sure_del"));
    parent.$("#btnConfirmOk").unbind().click(function(e){
		parent.$("#mdlConfirm").modal('hide');
		
		var delArr=[];
		var delObj={};
		var delData={};
		
		delData["braId"] = pro_id;
		delArr.push(delData);
		delObj["delObj"]= delArr;
		//
		deleteDataArr(delObj);
	});
}

function editData(pro_id){
	var data="id="+pro_id;
	data+="&action=U";
	data+="&parentId="+"ifameStockSelect";
	var controllerNm = "PopupFormBranch";
	var option={};
	option["height"] = "460px";
    parent.stock.comm.openPopUpForm(controllerNm,option, data,null,"modalMdBranch","modalMdContentBranch","ifameStockFormBranch");
}

/**
 * 
 */
function deleteDataArr(dataArr){

	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Branch/delete",
		data: dataArr,
		success: function(res) {
		    if(res > 0){
		        parent.stock.comm.alertMsg(res+$.i18n.prop("msg_del_com"));
		        _pageNo=1;
		    	_perPage=$("#tblProduct tbody tr").length;
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

/**
 * 
 */
function resetFormSearch(){
	$("#txtSrchBraNm").val("");
    $("#txtSrchBraNmKh").val("");
    $("#txtSrchBraPhone").val("");
    $("#cbxSrchBraType").val("");
}

/**
 * 
*/
function popupBranchCallback(){
	_pageNo=1;
	_perPage=$("#tblProduct tbody tr").length;
    getData();
}

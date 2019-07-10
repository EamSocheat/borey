var _pageNo = 1;
$(document).ready(function(){
	_thisPage.onload();
});

var _thisPage = {
		onload : function(){
			_this = this;
			_this.loadData();
			_this.event();
			stock.comm.checkAllTblChk("chkAll","tblImport","chk_box");
		}, loadData : function(page_no){
			var input = {};
			var pageNo = 1;
		    if(page_no != "" && page_no != null && page_no != undefined){
		        if(page_no <= 0){
		        	page_no = 1;
		        }
		        pageNo = page_no;
		    }
			
			input["limit"]		= $("#perPage").val();
			input["offset"]		= parseInt($("#perPage").val()) * ( pageNo - 1);
			input["importNm"]	= $("#txtSrchImportNm").val();
			input["importNmKh"]	= $("#txtSrchImportNmKh").val();
			return;
		    $("#loading").show();
		    $.ajax({
				type: "POST",
				url : $("#base_url").val() +"Import/getCategoryData",
				data: input,
				dataType: "json",
				success: function(data) {
					$("#categoryList").empty();
					var html = "";
					
					if(data.OUT_REC.length > 0){
						
						$.each(data.OUT_REC, function(i,v){
							html += '<tr data-id='+v.cat_id+'>';
							html += '	<td class="chk_box"><input type="checkbox"></td>';
							html += '   <td style="width: 30px;height: 30px;"><div class="image">';
							html += '       <img id="staImgView" src="'+$("#base_url").val()+"/upload"+v.cat_photo+'" class="img-circle" style="width:25px;" alt="User Image">';
							html += '   </div></td>';
							html += '	<td><div>'+null2Void(v.cat_nm)+'</div></td>';
							html += '	<td><div>'+null2Void(v.cat_nm_kh)+'</div></td>';
							html += '	<td><div>'+null2Void(v.cat_des)+'</div></td>';
							html += '	<td><div>'+(null2Void(v.regDt)).substr(0,10)+'</div></td>';
							html += '	<td class="text-center">';
							html += '		<button onclick="_thisPage.editData('+v.cat_id+')" type="button" class="btn btn-primary btn-xs">';
							html += '		<i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>';
							html += '	</td>';
							html += '</tr>';
						});
						
						$("#categoryList").append(html);
						$("#chkAll").show();
						$("#chkAll").prop("checked",false);
						$("#loading").hide();
						stock.comm.renderPaging("paging", $("#perPage").val(), data.OUT_REC_CNT[0]["total_rec"], pageNo);
					}else{
						$("#chkAll").hide();
						$("#loading").hide();
						$("#categoryList").append("<tr><td colspan='6' style='text-align:center;'>No data to show.</td></tr>");
						stock.comm.renderPaging("paging", $("#perPage").val(), 0, pageNo);
					}
					 
				}, error : function(data) {
				    $("#loading").hide();
				    stock.comm.alertMsg($.i18n.prop("msg_err"));
		        }
			});
		}, editData : function(cat_id){
			var data = "id="+cat_id;
			data += "&action=U";
			
			var controllerNm = "PopupFormImport";
			var option = {};
			option["height"] = "352px";
		    stock.comm.openPopUpForm(controllerNm,option, data,"modal-md");		    
		}, addNewImport : function(){
			$("#loading").show();
			var data   = "";
			var option = {};
			var controllerNm = "PopupFormImport";
			option["height"] = "352px";
			
			stock.comm.openPopUpForm(controllerNm, option, data);
		}, deleteDataArr : function(dataArr){
			
			$.ajax({
				type: "POST",
				url : $("#base_url").val() +"Category/delete",
				data: dataArr,
				success: function(res) {
				    if(res > 0){
				        stock.comm.alertMsg(res+$.i18n.prop("msg_del_com"));
				        _this.loadData(_pageNo);
				    }else{
				        stock.comm.alertMsg($.i18n.prop("msg_err_del"));
				        return;
				    }
				    $("#loading").hide();
				},
				error : function(data) {
					console.log(data);
					stock.comm.alertMsg($.i18n.prop("msg_err"));
		        }
			});
		}, event : function(){
			
		}
}

function deleteImport(){
	var chkVal = $('#categoryList tr td.chk_box input[type="checkbox"]:checked');
	
	if(chkVal.length <=0){
		stock.comm.alertMsg($.i18n.prop("msg_con_del"));
		return;
	}
	
	stock.comm.confirmMsg($.i18n.prop("msg_sure_del"));
	$("#btnConfirmOk").unbind().click(function(e){
		$("#mdlConfirm").modal('hide');
		
		var delArr = [];
		var delObj = {};
		chkVal.each(function(i){
			var delData = {};
			var tblTr = $(this).parent().parent();
			var catId = tblTr.attr("data-id");
			delData["catId"] = catId;
			delArr.push(delData);
		});
		
		delObj["delObj"]= delArr;
		_thisPage.deleteDataArr(delObj);
	});
}

function popupCategoryCallback(){
    _this.loadData(_pageNo);
}

function null2Void(dat){
	if(dat == null || dat == undefined || dat == "null" || dat == "undefined"){
		return "";
	}
	return dat;
}



















var _pageNo=1;
var _this;
$(document).ready(function(){
	_thisPage.init();
});

var _thisPage = {
	init : function(){
		_this = this;
		_this.onload();
		_this.event();
	},
	onload : function(){
		getPosition();
		getBranch();
		//
		getData(); 
		//
		
		stock.comm.checkAllTblChk("chkAllBox","tblCommSet","chk_box");
		
		$("#cbxSrchBraType").prepend("<option value='' selected='selected'></option>");
		
		
		stock.comm.getPositionSelect("cbxSrchPos");
		$("#cbxSrchPos").prepend("<option value='' selected='selected'></option>");
		$("#cbxSrchBranch").prepend("<option value='' selected='selected'></option>");
	},event : function(){
		$("#perPage").change(function(e){
			_pageNo=1;
			getData();
		});

		//--pagination
		$("#paging").on("click", "li a", function(e) {
			var pageNo = $(this).html();
			_pageNo = pageNo;
			getData(pageNo);
		});
		$(".box-footer").on("click", "#btnGoToPage", function(e) {
			var pageNo = $("#txtGoToPage").val();
			getData(pageNo);
		}); 
		
		
		//
		$("#btnAddNew").click(function(){
			$("#loading").show();
			var controllerNm = "PopupFormCommissionSetting";
			var option={};
			option["height"] = "600px";
			
			stock.comm.openPopUpForm(controllerNm,option, null,"modal-lg");
		});
		
		//
		$("#btnEdit").click(function(){
			var chkVal = $('#tblCommSet tbody tr td.chk_box input[type="checkbox"]:checked');
			if(chkVal.length != 1){
				stock.comm.alertMsg($.i18n.prop("msg_con_edit1"));
				return;
			}
			
			var tblTr = chkVal.parent().parent();
			var braId=tblTr.attr("data-id");
			editData(braId);
		});
		
		//
		$("#btnDelete").click(function(e){
			var chkVal = $('#tblCommSet tbody tr td.chk_box input[type="checkbox"]:checked');
			
			if(chkVal.length <=0){
				stock.comm.alertMsg($.i18n.prop("msg_con_del"));
				return;
			}
			
			stock.comm.confirmMsg($.i18n.prop("msg_sure_del"));
			$("#btnConfirmOk").unbind().click(function(e){
				$("#mdlConfirm").modal('hide');
				
				var delArr=[];
				var delObj={};
				chkVal.each(function(i){
					var delData={};
					var tblTr = $(this).parent().parent();
					var braId=tblTr.attr("data-id");
					delData["comsetId"] = braId;
					delArr.push(delData);
				});
				
				delObj["delObj"]= delArr;
				//
				deleteDataArr(delObj);
			});
			
		});
		
		//
		$("#btnSearch").click(function(e){
			getData(1);
		});
		
		//
		$("#btnReset").click(function(e){
			resetFormSearch();
		});
		
		//
		$("#cboPosition").change(function(e){
			getData();
		});
		
		//
		$("#cboBranch").change(function(e){
			getData();
		});
		
		
	}
};

function getData(page_no){
	$("#chkAllBox").prop( "checked", false );
    var pageNo =1;
    if(page_no != "" && page_no != null && page_no != undefined){
        if(page_no <=0){
            page_no = 1;
        }
        pageNo = page_no;
    }
    var dat = {};
    //paging
    dat["perPage"] = $("#perPage").val();
    dat["offset"] = parseInt($("#perPage").val())  * ( pageNo - 1);
    //searching
    dat["posId"] = $("#cboPosition").val();
    dat["braId"] = $("#cboBranch").val();

    //
    $("#loading").show();
    $.ajax({
		type: "POST",
		url: $("#base_url").val() +"CommissionSetting/getCommissionSetting",
		data: dat,
		dataType: "json",
		success: function(res) {
			$("#loading").hide();
			$("#tblCommSet tbody").html("");
			if(res.OUT_REC != null && res.OUT_REC.length >0){
			   for(var i=0; i<res.OUT_REC.length;i++){
			        var html = "<tr data-id='"+res.OUT_REC[i]["comset_id"]+"'>";
			        
			        html += "<td class='chk_box'><input type='checkbox'></td>";
			        html += "<td class='pos_nm_kh'>"+res.OUT_REC[i]["pos_nm_kh"]+"</td>";
			        html += "<td class='bra_nm_kh'>"+res.OUT_REC[i]["bra_nm_kh"]+"</td>";
			        html += "<td class='comset_salary_yn'>"+renderStatusYn(res.OUT_REC[i]["comset_salary_yn"])+"</td>";
			        html += "<td class='comset_commi_yn'>"+renderStatusYn(res.OUT_REC[i]["comset_commi_yn"])+"</td>";
			        html += "<td class='act_btn text-center'><button onclick='editData("+res.OUT_REC[i]["comset_id"]+")' type='button' class='btn btn-primary btn-xs'><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button></td>";
			
			        html += "</tr>";
			        
			        $("#tblCommSet tbody").append(html);
			    }
			    //--pagination
			    stock.comm.renderPaging("paging",$("#perPage").val(),res.OUT_REC_CNT[0]["total_rec"],pageNo);
			}else{
			    $("#tblCommSet tbody").append("<tr><td colspan='6' style='    text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
			    //--pagination
			    stock.comm.renderPaging("paging",$("#perPage").val(),0,pageNo);
			}
			
		},
		error : function(data) {
		    console.log(data);
            stock.comm.alertMsg($.i18n.prop("msg_err"));
        }
	});
}
function deleteData(sta_id){
    stock.comm.confirmMsg($.i18n.prop("msg_sure_del"));
	$("#btnConfirmOk").unbind().click(function(e){
		$("#mdlConfirm").modal('hide');
		
		var delArr=[];
		var delObj={};
		var delData={};
		
		delData["comsetId"] = sta_id;
		delArr.push(delData);
		delObj["delObj"]= delArr;
		//
		deleteDataArr(delObj);
	});
}

function editData(sta_id){
	var data="id="+sta_id;
	data+="&action=U";
	
	var controllerNm = "PopupFormCommissionSetting";
	var option={};
	option["height"] = "600px";
    stock.comm.openPopUpForm(controllerNm,option, data,"modal-lg");
}

/**
 * 
 */
function deleteDataArr(dataArr){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"CommissionSetting/delete",
		data: dataArr,
		success: function(res) {
		    if(res > 0){
		        stock.comm.alertMsg(res+$.i18n.prop("msg_del_com"));
		        getData(_pageNo);
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
}

/**
 * 
 * @returns
 */
function getPosition(){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Position/getPositionData",
		dataType: 'json',
		async: false,
		success: function(res) {
			if(res.OUT_REC.length > 0){
				$("#cboPosition option").remove();
				$("#cboPosition").append("<option value=''>សូមជ្រើសរើសតួនាទីបុគ្គលិក</option>");
				
				for(var i=0; i<res.OUT_REC.length; i++){
					var braNm = res.OUT_REC[i]["pos_nm_kh"];
					$("#cboPosition").append("<option value='"+res.OUT_REC[i]["pos_id"]+"'>"+braNm+"</option>");
				}
				
			}else{
				console.log(res);
			}
		},
		error : function(data) {
			console.log(data);
			parent.stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
}


/**
 * 
 * @returns
 */
function getBranch(){
	$.ajax({
		type: "POST",
		url: $("#base_url").val() +"Branch/getBranch",
		dataType: 'json',
		async: false,
		success: function(res) {
			if(res.OUT_REC.length > 0){
				$("#cboBranch option").remove();
				$("#cboBranch").append("<option value=''>សូមជ្រើសរើសគំរោង</option>");
				
				for(var i=0; i<res.OUT_REC.length; i++){
					var braNm = res.OUT_REC[i]["bra_nm_kh"];
					$("#cboBranch").append("<option value='"+res.OUT_REC[i]["bra_id"]+"'>"+braNm+"</option>");
				}
				
			}else{
				console.log(res);
			}
		},
		error : function(data) {
			console.log(data);
			parent.stock.comm.alertMsg("ប្រព័ន្ធដំណើរការ មិនប្រក្រតី សូមភ្ជាប់ម្តងទៀត");
        }
	});
}

function renderStatusYn(str){
	if(str == "Y"){
		return '<span class="label label-primary">មាន</span>';
	}else{
		return '<span class="label label-warning">គ្នាន</span>';
	}
}


/**
 * 
 */
function resetFormSearch(){
	$("#cboBranch").val("");
    $("#cboPosition").val("");
   
}

/**
 * 
*/
function popupCommissionSettingCallback(){
    getData(_pageNo);
}
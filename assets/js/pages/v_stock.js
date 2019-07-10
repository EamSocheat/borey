

var _pageNo = 1;
$(document).ready(function(){
	$("#loading").show();
	_thisPage.loadData(1);
	$("#loading").hide();
});

var _thisPage = {
		onload : function(){
			
		}, loadData : function(page_no){
			var pageNo = 1;
			var dat    = {};
		    if(page_no != "" && page_no != null && page_no != undefined){
		        if(page_no <=0){
		            page_no = 1;
		        }
		        pageNo = page_no;
		    }
			
		    //paging
		    dat["perPage"] = $("#perPage").val();
		    dat["offset"]  = parseInt($("#perPage").val())  * ( pageNo - 1);
		    //searching
		    dat["stoNm"]	= $("#txtSrchStocNm").val().trim();
		    dat["stoNmKh"]	= $("#txtSrchStoNmKh").val().trim();

		    //
		    $("#loading").show();
		    $.ajax({
				type: "POST",
				url : $("#base_url").val() +"Stock/getStock",
				data: dat,
				dataType: "json",
				success: function(res) {
					$("#loading").hide();
					$("#tblStock tbody").html("");

					if(res.OUT_REC != null && res.OUT_REC.length >0){
					    for(var i=0; i<res.OUT_REC.length;i++){
					        var html = "<tr data-id='"+res.OUT_REC[i]["sto_id"]+"'>";
					        html += "<td class='chk_box'><input type='checkbox'></td>";
					        html += "<td class='sto_nm'>"+res.OUT_REC[i]["sto_nm"]+"</td>";
					        html += "<td class='sto_nm_kh'>"+res.OUT_REC[i]["sto_nm_kh"]+"</td>";
					        html += "<td class='sto_addr'>"+res.OUT_REC[i]["sto_addr"]+"</td>";
					        html += "<td class='sto_des'>"+res.OUT_REC[i]["sto_des"]+"</td>";
					        html += "<td class='act_btn text-center'><button onclick='editData("+res.OUT_REC[i]["sto_id"]+")' type='button' class='btn btn-primary btn-xs'><i class='fa fa-pencil-square-o' aria-hidden='true'></i></button></td>";
					        html += "</tr>";
					        
					        $("#tblStock tbody").append(html);
					    }
					    $("#chkAll").show();
					    //--pagination
					    stock.comm.renderPaging("paging",$("#perPage").val(),res.OUT_REC_CNT[0]["total_rec"],pageNo);
					}else{
						$("#chkAll").hide();
					    $("#tblStock tbody").append("<tr><td colspan='6' style='text-align: center;'>"+$.i18n.prop("lb_no_data")+"</td></tr>");
					    //--pagination
					    stock.comm.renderPaging("paging",$("#perPage").val(),0,pageNo);
					}
					
				},
				error : function(data) {
				    console.log(data);
		            stock.comm.alertMsg($.i18n.prop("msg_err"));
		        }
			});
		}, editData : function(pos_id){
			
		}, addNewData : function(){
			
		}, deleteData : function(dataArr){
			
		}, event : function(){
			//
			$("#btnAddNew").click(function(){
			    $("#loading").show();
				var controllerNm = "PopupFormBranch";
				var option={};
				option["height"] = "460px";
				
				stock.comm.openPopUpForm(controllerNm,option, null);
			});
			//
			$("#btnEdit").click(function(){
				var chkVal = $('#tblStock tbody tr td.chk_box input[type="checkbox"]:checked');
				if(chkVal.length != 1){
				    stock.comm.alertMsg($.i18n.prop("msg_con_edit1"));
					return;
				}
				
				var tblTr = chkVal.parent().parent();
				var braId=tblTr.attr("data-id");
				editData(braId);
			});
		}
}

function popupPositionCallback(){
	
}























var _pageNo = 1;
$(document).ready(function(){
	$("#loading").show();
	_thisPage.onload();
	$("#loading").hide();
});

var _thisPage = {
		onload : function(){
			_thisPage.event();
		}, loadData : function(page_no){
			
		}, editData : function(pos_id){
			
		}, addNewData : function(){
			$("#loading").show();
			var data = "";
			var controllerNm = "PopupFormCategory";
			var option = {};
			option["height"] = "352px";
			
			stock.comm.openPopUpForm(controllerNm, option, data);
		}, deleteData : function(dataArr){
			
		}, event : function(){
			
		}
}

function popupPositionCallback(){
	
}





















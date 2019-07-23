<?php include 'v_popup_header.php';?>
<!-- general form elements -->
<input type="hidden" id="houseId" name="houseId" value="<?php if(isset($_GET["id"])){ echo $_GET["id"]; }?>"/>
<input type="hidden" id="frmAct" name="frmAct" value="<?php if(isset($_GET["action"])){ echo $_GET["action"]; }?>"/>
<input type="hidden" id="parentId" name="parentId" value="<?php if(isset($_GET["parentId"])){ echo $_GET["parentId"]; }?>"/>
<!-- form start -->

<form role="form" class="form-horizontal" id="frmHouse" action="" style="display: none">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnExit">
	  	<span aria-hidden="true">&times;</span></button>
		<h4  class="modal-title" id="popupTitle"><i class="fa fa-building-o"></i> <span data-i18ncd="pop_select_product">Choose Product</span></h4>
	</div>

	<div class="modal-body" id="modalMdBody">
	  <!-- modal body  -->
		<div class="row">
		  <div class="col-xs-12 row" style="padding:0px; margin-bottom: 20px;">
			  <div class="col-xs-4 padding-forms-left" style="padding-left: 35px;">
				  <div class="image" style="text-align: center">
					  <img id="houseImgView" src="<?php echo base_url('assets/image/default-house.jpg') ?>" class="" style="width: 150px;height: 150px;" alt="House Image">
					  <input type="hidden" class="form-control" id="houseImgPath" name="houseImgPath">
				  </div>
				  <div style="text-align: center;margin-top: 5px;">
					  <button  type="button" class="btn btn-info btn-xs" id="btnSelectPhoto"><i class="fa fa-image" aria-hidden="true"></i> <span data-i18ncd="lb_select_img">Select Image</span></button>
					  <input type="file" style="display: none" class="form-control" accept="image/*"  id="fileHousePhoto" name="fileHousePhoto" autocomplete="off" />
				  </div>
			  </div>
			  <div class="col-xs-4 padding-forms-right">
				  <div class="form-group">
					  <label for="txtCatNm" data-i18ncd="lb_category">ប្រភេទទំនិញ</label>
					  <div class="input-group">
						  <input type="text" class="form-control" id="txtCatNm" name="txtCatNm" required="required" disabled />
						  <span id="btnPopupCategory" class="input-group-addon label-info" style="border-top-right-radius: 5px;border-bottom-right-radius: 5px;cursor: pointer;border-color: #46b8da !important;"><i class="fa fa-search-plus"></i></span>
					  </div>
					  <input type="hidden" id="txtCatNmVal" name="txtCatNmVal">
					  <input type="hidden" id="txtCatIdVal" name="txtCatIdVal">
				  </div>
			  </div>

			  <div class="col-xs-4 padding-forms-right">
				  <div class="form-group">
					  <label for="txtProjNm" data-i18ncd="lb_project">គម្រោង</label>
					  <div class="input-group">
						  <input type="text" class="form-control" id="txtProjNm" name="txtProjNm" required="required" disabled />
						  <span id="btnPopupProject" class="input-group-addon label-info" style="border-top-right-radius: 5px;border-bottom-right-radius: 5px;cursor: pointer;border-color: #46b8da !important;"><i class="fa fa-search-plus"></i></span>
					  </div>
					  <input type="hidden" id="txtProjNmVal" name="txtProjNmVal">
					  <input type="hidden" id="txtProjIdVal" name="txtProjIdVal">
				  </div>
			  </div>

			  <div class="col-xs-4 padding-forms-right">
				  <div class="form-group">
					  <label for="txtCode" data-i18ncd="lb_house_code">លេខកូដ</label>
					  <input type="text" class="form-control" id="txtCode" name="txtCode" required="required" maxlength="9" autocomplete="off" />
				  </div>
			  </div>

			  <div class="col-xs-4 padding-forms-right">
				  <div class="form-group input-right">
					  <label for="txtHousePrice" data-i18ncd="lb_price">តម្លៃ</label>
					  <input type="text" class="form-control input-right" id="txtHousePrice" name="txtHousePrice" required="required" autocomplete="off" />
				  </div>
			  </div>
		  </div>

		  <div class="col-xs-12 row" style="padding:0px">
			  <div class="col-xs-3 padding-forms-left">
				  <div class="form-group">
					  <label for="txtHouseNo" data-i18ncd="lb_house_no">No.</label>
					  <input type="text" class="form-control" id="txtHouseNo" name="txtHouseNo" autocomplete="off" style="font-size: 14px;">
				  </div>
			  </div>
			  <div class="col-xs-3 padding-forms-right">
				  <div class="form-group input-right">
					  <label for="txtHouseLength" data-i18ncd="lb_house_length">ប្រវែងបណ្ដោយ</label>
					  <input type="text" class="form-control input-right" id="txtHouseLength" name="txtHouseLength" autocomplete="off" style="font-size: 14px;">
				  </div>
			  </div>
			  <div class="col-xs-3 padding-forms-right">
				  <div class="form-group input-right">
					  <label for="txtHouseWidth" data-i18ncd="lb_house_width">ប្រវែងទទឹង</label>
					  <input type="text" class="form-control input-right" id="txtHouseWidth" name="txtHouseWidth" autocomplete="off" style="font-size: 14px;">
				  </div>
			  </div>
			  <div class="col-xs-3 padding-forms-right">
				  <div class="form-group input-right">
					  <label for="txtHouseArea" data-i18ncd="lb_house_area">ផ្ទៃផ្ទះ</label>
					  <input type="text" class="form-control input-right" id="txtHouseArea" name="txtHouseArea" autocomplete="off" style="font-size: 14px;">
				  </div>
			  </div>
		  </div>

		  <div class="col-xs-12 row" style="padding:0px">
			  <div class="col-xs-3 padding-forms-left">
				  <div class="form-group">
					  <label for="txtStreetNo" data-i18ncd="lb_house_street">ផ្លូវលេខ</label>
					  <input type="text" class="form-control input-right" id="txtStreetNo" name="txtStreetNo" required="required" autocomplete="off" />
				  </div>
			  </div>
			  <div class="col-xs-3 padding-forms-right">
				  <div class="form-group input-right">
					  <label for="txtFloorQty" data-i18ncd="lb_house_floor">ចំនួនជាន់</label>
					  <input type="text" class="form-control input-right" id="txtFloorQty" name="txtFloorQty" autocomplete="off" />
				  </div>
			  </div>
			  <div class="col-xs-3 padding-forms-right">
				  <div class="form-group input-right">
					  <label for="txtRoomQty" data-i18ncd="lb_house_room">ចំនួនបន្ទប់</label>
					  <input type="text" class="form-control input-right" id="txtRoomQty" name="txtRoomQty" autocomplete="off" />
				  </div>
			  </div>
			  <div class="col-xs-3 padding-forms-right">
				  <div class="form-group input-right">
					  <label for="txtToiletQty" data-i18ncd="lb_house_toilet">ចំនួនបន្ទប់ទឹក</label>
					  <input type="text" class="form-control input-right" id="txtToiletQty" name="txtToiletQty" autocomplete="off" />
				  </div>
			  </div>
		  </div>

		  <div class="col-xs-12 row" style="padding:0px">
			  <div class="col-xs-12 padding-forms-left padding-forms-right">
				  <div class="form-group">
					  <label for="txtDesc" data-i18ncd="lb_des">ការពិព័ណ៏នា</label>
					  <input type="text" class="form-control" id="txtDesc" name="txtDesc" autocomplete="off" />
				  </div>
			  </div>
		  </div>
	  </div>
	  <!-- end modal body  -->
	</div>

	<div class="modal-footer">
		<button data-i18ncd="btn_save_new"  type="submit" class="btn btn-success btn-sm" id="btnSaveNew" style="display:none">Save + New</button>
		<button data-i18ncd="btn_save" type="submit" class="btn btn-primary btn-sm" id="btnSave">Save</button>
		<button data-i18ncd="btn_close" type="button" class="btn btn-default btn-sm" id="btnClose">Close</button>
	</div>
</form>
      <!-- form end --> 
      <!-- end general form elements -->
<?php include 'v_popup_footer.php';?>
<script src="<?php echo base_url('assets/') ?>js/pages/popup/v_popup_form_house.js"></script>

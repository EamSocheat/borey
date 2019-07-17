<?php include 'v_popup_header.php';?>
		  <!-- general form elements -->
		  <input type="hidden" id="expId" name="expId" value="<?php if(isset($_GET["id"])){ echo $_GET["id"]; }?>"/>
		  <input type="hidden" id="frmAct" name="frmAct" value="<?php if(isset($_GET["action"])){ echo $_GET["action"]; }?>"/>
          <input type="hidden" id="parentId" name="parentId" value="<?php if(isset($_GET["parentId"])){ echo $_GET["parentId"]; }?>"/>
		  <!-- form start -->
          <form role="form" class="form-horizontal" id="frmExpend" action="" style="display: none">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnExit">
				<span aria-hidden="true">&times;</span>
			</button>
            <h4 class="modal-title" id="popupTitle">Default Modal</h4>
			  <input type="hidden" id="addNewExpend" name="addNewExpend" value="ការចំណាយថ្មី">
          </div>
          
          <div class="modal-body" id="modalMdBody">
          		<!-- modal body  -->
            	
            	<div class="row">
            		<div class="col-xs-12 row" style="padding:0px;">
                		<div class="col-xs-6 padding-forms-left">
                			<div class="form-group">
								<label for="txtSuppNm" data-i18ncd="lb_supplier">ឈ្មោះអ្នកផ្គត់ផ្គង់</label>
								<div class="input-group">
									<input type="text" class="form-control" id="txtSuppNm" name="txtSuppNm" autocomplete="off" disabled />
									<span id="btnPopupSupplier" class="input-group-addon label-info" style="border-top-right-radius: 5px;border-bottom-right-radius: 5px;cursor: pointer;border-color: #46b8da !important;"><i class="fa fa-search-plus"></i></span>
								</div>
								<input type="hidden" id="txtSuppNmVal" name="txtSuppNmVal">
								<input type="hidden" id="txtSuppIdVal" name="txtSuppIdVal">
							</div>
                		</div>
                		
                		<div class="col-xs-6 padding-forms-right">
                			<div class="form-group">
                               	<label for="txtSuppPhone" data-i18ncd="lb_supplier_phone">លេខទូរស័ព្ទអ្នកផ្គត់ផ្គង់</label>
                            	<input type="text" class="form-control" id="txtSuppPhone" name="txtSuppPhone" required="required" autocomplete="off" disabled />
                            </div>
							<input type="hidden" id="txtSuppPhoneVal" name="txtSuppPhoneVal">
						</div>
                	</div>
                
                	<div class="col-xs-12 row"  style="padding:0px;">
                		<div class="col-xs-6 padding-forms-left">
                			<div class="form-group">
                              <label for="projectNm" data-i18ncd="lb_project">គម្រោង</label>
                              <select class="form-control" id="projectNm" name="projectNm" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity(' សូមជ្រើសរើស ')" oninput="setCustomValidity('')">
	                    			<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>
	                    			<option value="1" data-i18ncd="lb_project_1">គម្រោងទី ១</option>
	                    			<option value="2" data-i18ncd="lb_project_2">គម្រោងទី ២</option>
			                  </select>
                            </div>
                		</div>
                		<div class="col-xs-6 padding-forms-right">
                			<div class="form-group">
                               	<label for="txtExpendDate" data-i18ncd="lb_expend_date">ថ្ងៃចំណាយ</label>
			                	<div class="input-group date">
				                  	<div class="input-group-addon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;" id="dobIcon">
				                    	<i class="fa fa-calendar"></i>
				                  	</div>
				                  	<input type="text" class="form-control pull-right date-pick" id="txtExpendDate" name="txtExpendDate" required="required" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" autocomplete="off" />
				                </div>
                            </div>
                		</div>
                	</div>
                	
                	<div class="col-xs-12 row" style="padding:0px;">
						<div class="col-xs-6 padding-forms-left">
							<div class="form-group">
								<label for="cboStaffPay" data-i18ncd="lb_staff_expend">បុគ្គលិក(អ្នកទូទាត់)</label>
								<select class="form-control" id="cboStaffPay" name="cboStaffPay" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity(' សូមជ្រើសរើសបុគ្គលិក ')" oninput="setCustomValidity('')">
									<option value="" data-i18ncd="lb_project_choose" selected>សូមជ្រើសរើស</option>
									<option value="0" data-i18ncd="lb_staff_admin">Admin</option>
									<option value="1" data-i18ncd="lb_staff_1">សុមិនា</option>
									<option value="2" data-i18ncd="lb_staff_1">សុធា</option>
								</select>
							</div>
						</div>
                		<div class="col-xs-6 padding-forms-right">
                			<div class="form-group">
                              <label for="txtTotalExp" data-i18ncd="lb_total_exp">ការចំណាយសរុប</label>
                              <input type="text" class="form-control" id="txtTotalExp" name="txtTotalExp" required="required" autocomplete="off" />
                            </div>
                		</div>
                	</div>
                	
                	<div class="col-xs-12 row"  style="padding:0px;">
                		<div class="col-xs-12 padding-forms-left padding-forms-right">
                			<div class="form-group">
                               	<label for="txtDesc" data-i18ncd="lb_des">Description</label>
                            	<input type="text" class="form-control" id="txtDesc" name="txtDesc" autocomplete="off" />
                            </div>
                		</div>
                	</div>

					<div class="col-xs-12 row"  style="padding:0px;">
						<div class="col-xs-12 padding-forms-left" style="padding-left: 35px;">
							<div class="image" style="text-align: center">
								<img id="expendImgView" src="<?php echo base_url('assets\image\default-image.jpg')?>" class="cur-pointer" style="opacity: 0.5;width: 350px;height: 150px;" alt="User Image">
								<input type="hidden" class="form-control" id="expImgPath" name="expImgPath">
							</div>
							<div style="text-align: center;margin-top: 5px;">
								<button  type="button" class="btn btn-info btn-xs" id="btnSelectPhoto"><i class="fa fa-image" aria-hidden="true"></i> <span data-i18ncd="lb_select_img">Select Image</span></button>
								<input type="file" style="display: none" class="form-control" accept="image/*"  id="fileExpPhoto" name="fileExpPhoto" autocomplete="off" />
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
<script src="<?php echo base_url('assets/') ?>js/pages/popup/v_popup_form_expend.js"></script>

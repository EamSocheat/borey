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
                		<div class="col-xs-4 padding-forms-left">
                			<div class="form-group">
								<label for="txtSuppNm" data-i18ncd="lb_supplier">ឈ្មោះអ្នកផ្គត់ផ្គង់</label><label style="color: red;font-weight: bold;"><input type="checkbox" id="cboSupYn" name="cboSupYn" style="margin-left: 15px;color: red">None</label>
								<div class="input-group">
									<input type="text" class="form-control" id="txtSuppNm" name="txtSuppNm" required="required" disabled />
									<span id="btnPopupSupplier" class="input-group-addon label-info" style="border-top-right-radius: 5px;border-bottom-right-radius: 5px;cursor: pointer;border-color: #46b8da !important;"><i class="fa fa-search-plus"></i></span>
								</div>
								<input type="hidden" id="txtSuppNmVal" name="txtSuppNmVal">
								<input type="hidden" id="txtSuppIdVal" name="txtSuppIdVal">
							</div>
                		</div>
                		
                		<div class="col-xs-4 padding-forms-right">
                			<div class="form-group">
                               	<label for="txtSuppPhone" data-i18ncd="lb_supplier_phone">លេខទូរស័ព្ទអ្នកផ្គត់ផ្គង់</label>
                            	<input type="text" class="form-control" id="txtSuppPhone" name="txtSuppPhone" required="required" autocomplete="off" disabled />
                            	
                            </div>
                            
							<input type="hidden" id="txtSuppPhoneVal" name="txtSuppPhoneVal">
						</div>
						<div class="col-xs-4 padding-forms-right">
							<div class="form-group">
                              <label for="projectNm" data-i18ncd="lb_project">គម្រោង</label>
                              <select class="form-control" id="projectNm" name="projectNm" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity(' សូមជ្រើសរើស ')" oninput="setCustomValidity('')">
	                    			<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>
	                    			<option value="1" data-i18ncd="lb_project_1">គម្រោងទី ១</option>
	                    			<option value="2" data-i18ncd="lb_project_2">គម្រោងទី ២</option>
			                  </select>
                            </div>
						</div>
                	</div>
                
                	<div class="col-xs-12 row"  style="padding:0px;">
                		<div class="col-xs-4 padding-forms-left">
                			<div class="form-group">
                               	<label for="txtRequestDate" data-i18ncd="lb_expend_date">ថ្ងៃស្នើសុំ​</label>
			                	<div class="input-group date">
				                  	<div class="input-group-addon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;" id="dobIcon">
				                    	<i class="fa fa-calendar"></i>
				                  	</div>
				                  	<input type="text" class="form-control pull-right date-pick" id="txtRequestDate" name="txtRequestDate" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" autocomplete="off" />
				                </div>
                            </div>
                		</div>
                		<div class="col-xs-4 padding-forms-right">
                			<div class="form-group">
                               	<label for="txtExpendDate" data-i18ncd="lb_expend_date">ថ្ងៃចំណាយ</label>
			                	<div class="input-group date">
				                  	<div class="input-group-addon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;" id="dobIcon">
				                    	<i class="fa fa-calendar"></i>
				                  	</div>
				                  	<input type="text" class="form-control pull-right date-pick" id="txtExpendDate" name="txtExpendDate" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" autocomplete="off" />
				                </div>
                            </div>
                		</div>
                		
                		<div class="col-xs-4 padding-forms-right">
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
                	</div>
                	
                	<div class="col-xs-12 row" style="padding:0px;">
						<div class="col-xs-4 padding-forms-left">
							<div class="form-group">
                              <label for="txtInvNo">លេខ​វិ​ក័​យ​ប័ត្រ </label>
                              <input type="text" class="form-control" id="txtInvNo" name="txtInvNo" autocomplete="off" />
                            </div>
						</div>
						<div class="col-xs-4 padding-forms-right">
							<div class="form-group">
                              <label for="txtVoNo">លេខប័ណ្ណ </label>
                              <input type="text" class="form-control" id="txtVoNo" name="txtVoNo" autocomplete="off" />
                            </div>
						</div>
						<div class="col-xs-4 padding-forms-right">
							<div class="form-group">
                              <label for="cboReqStaff">អ្នកស្នើសុំ</label><label style="color: red;font-weight: bold;"><input type="checkbox" id="cboReqStaffYn" name="cboReqStaffYn" style="margin-left: 15px;color: red">None</label>
                              <select class="form-control" id="cboReqStaff" name="cboReqStaff" style="font-size: 14px;" >
									<option value=""  selected>សូមជ្រើសរើស</option>
							  </select>
                            </div>
						</div>
                		
                	</div>
                	
                	<div class="col-xs-12 row" style="padding:0px;">
						
                		<div class="col-xs-12 padding-forms-left">
                			<div class="image" style="text-align: right;margin-right: -20px;">
								<img id="expendImgView" src="<?php echo base_url('assets\image\default-image.jpg')?>" class="cur-pointer" style="width:185px;height: 90px;" alt="User Image">
								<input type="hidden" class="form-control" id="expImgPath" name="expImgPath">
								<button  type="button" class="btn btn-info btn-xs" id="btnSelectPhoto"><i class="fa fa-image" aria-hidden="true"></i> <span data-i18ncd="lb_select_img">Select Image</span></button>
								<input type="file" style="display: none" class="form-control" accept="image/*"  id="fileExpPhoto" name="fileExpPhoto" autocomplete="off" />
							</div>
                		</div>
                	</div>
                	
                	<div class="col-xs-12 row"  style="padding:0px;">
                		<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;">
                			<span style="float: right;"><button type="button" class="btn btn-danger btn-xs" id="btnMinus"><i class="fa fa-minus" aria-hidden="true"></i></button> <button type="button" class="btn btn-info btn-xs" id="btnPlus"><i class="fa fa-plus" aria-hidden="true"></i></button></span>
                		</div>
                		<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;" id="tblExpendItemDiv">
	                		<span><b>បរិយាយការចំណាយ </b></span>
	                		<br>
	                    	<div class="box-body" style="height: 220px;padding: 0px;overflow-y: scroll;">
	        				  <table class="table table-bordered" id="tblExpendItem" >
	        				  	<col width="5">
  								<col width="10">
  								<col width="200">
  								<col width="10">
  								<col width="105">
  								<col width="105">
  								<col width="10">
  								<col width="105">
  								<col width="105">
	        				    <thead>  
	            					<tr>
	            					  <th rowspan="2" ></th>
	            					  <th rowspan="2"> ល.រ </th>
	            					  <th rowspan="2" class="text-center">បរិយាយ</th>
	            					  <th colspan="3" class="text-center">តម្លៃប្រាក់រៀល (៛)</th>
	            					  <th colspan="3" class="text-center">តម្លៃជាដុល្លារ ($)</th>
	            					</tr>
	            					<tr>
	            					 
	            					  <th class="text-center">បរិមាណ</th>
	            					  <th class="text-center">តម្លៃក្នុង១ឯកតា</th>
	            					  <th class="text-center">សរុប</th>
	            					  
	            					  <th class="text-center">បរិមាណ</th>
	            					  <th class="text-center">តម្លៃក្នុង១ឯកតា </th>
	            					  <th class="text-center">សរុប </th>
	            					  
	            					</tr>
	            					
	        					</thead>
	        					<tbody>
	        						<tr>
	        							<td class="text-center chk-box"></td>
	        							<td class="text-center exp-no">1</td>
	        							<td class="text-center exp-des"><input type='text' style='width:100%;' class='form-control input-sm' autocomplete='off'/> </td>
	        							<td class="text-center exp-qty-khr"><input type='text' style='width:100%;' class='form-control input-sm input-sm-num' autocomplete='off'/></td>
	        							<td class="text-center exp-unit-price-khr"><input type='text' style='width:100%;' class='form-control text-right input-sm input-sm-num' autocomplete='off'/> </td>
	        							<td class="text-center exp-total-price-khr"></td>
	        							<td class="text-center exp-qty"><input type='text' style='width:100%;' class='form-control input-sm input-sm-num' autocomplete='off'/> </td>
	        							<td class="text-center exp-unit-price"><input type='text' style='width:100%;' class='form-control text-right input-sm input-sm-num' autocomplete='off'/> </td>
	        							<td class="text-center exp-total-price"></td>
	        						</tr>
	        					   
	        					</tbody>
	        					
	        				  </table>
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

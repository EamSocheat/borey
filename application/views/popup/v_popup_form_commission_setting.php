<?php include 'v_popup_header.php';?>
		  <!-- general form elements -->
		  <input type="hidden" id="commsetId" name="commsetId" value="<?php if(isset($_GET["id"])){ echo $_GET["id"]; }?>"/>
		  <input type="hidden" id="frmAct" name="frmAct" value="<?php if(isset($_GET["action"])){ echo $_GET["action"]; }?>"/>
		  <input type="hidden" id ="oldBranch" name = "oldBranch"/>
		  <input type="hidden" id ="oldPosition" name = "oldPosition"/>
		  <!-- form start -->
          <form role="form" class="form-horizontal" id="frmCommSet" action="" style="display: none" autocomplete="off">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnExit">
              <span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="popupTitle">Default Modal</h4>
          </div>
          
          <div class="modal-body" id="modalMdBody">
          		<!-- modal body  -->
            	
            	<div class="row">
            		<div class="col-xs-12 row" style="padding:0px;">
            		
                		<div class="col-xs-6 padding-forms-left">
                			<div class="form-group">
                              <label for="cboPosition">តួនាទីបុគ្គលិក</label>
                              <select class="form-control" id="cboPosition" name="cboPosition" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសតួនាទីបុគ្គលិក ')" oninput="setCustomValidity('')">
	                    			<option value="">សូមជ្រើសរើសតួនាទីបុគ្គលិក </option>
			                  </select>
                            </div>
                		</div>
                		
                		<div class="col-xs-6 padding-forms-right">
                			<!--  -->
                			<div class="form-group">
                              <label for="cboBranch">គំរោង</label>
                              <select class="form-control" id="cboBranch" name="cboBranch" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសគំរោង ')" oninput="setCustomValidity('')">
	                    			<option value="">សូមជ្រើសរើសគំរោង </option>
			                  </select>
                            </div>
                		</div>
                		
                		
                	</div>
                	
                	<div class="col-xs-12 row" style="padding:0px; margin-bottom: 20px;">
            		
                		<div class="col-xs-6 padding-forms-left">
                    		
                		</div>
                		<div class="col-xs-6 padding-forms-right">
                			
                			<!--  -->
                			<div class="form-group">
                    			<div class="checkbox-inline">
                                  	<label><input type="checkbox" id="chkSalaryYn"> ទទួលបានប្រាក់ខែ</label>
                                  	<input type="hidden" name ="txtSalaryYn" id="txtSalaryYn" value="N">
                                </div>
                                <div class="checkbox-inline">
                                  	<label><input type="checkbox" id="chkComiYn"> ទទួលបានចំណែកប្រាក់កំរៃជើងសារ </label>
                                  	<input type="hidden" name ="txtComiYn" id="txtComiYn" value="N">
                                </div>
                                
                            </div>
                		</div>
                	</div>
					
                	<div class="col-xs-12 row" style="padding:0px">
                		<div class="col-xs-12 padding-forms-left padding-forms-right" style="margin-top: -20px;    margin-bottom: -45px;">
                			<div class="form-group">
	                			<div class="panel panel-default">
							    	<div class="panel-heading"> <label >កំណត់កំរៃជើងសារ</label></div>
							    	<div class="panel-body">
							    	
							    		<div class="col-xs-12 row"  style="padding: 0;">
								    		<div class="col-xs-4"><label style="font-weight: 600;" for="">ប្រភេទអចលនទ្រព្យ</label></div>
								    		<div class="col-xs-2"><label style="font-weight: 600;" for="">ប្រភេទកំរៃជើងសារ</label></div>
								    		<div class="col-xs-2"><label style="font-weight: 600;" for="">កំរៃជើងសារ</label></div>
								    		<div class="col-xs-2"><label style="font-weight: 600;" for="">ប្រភេទចំណែក</label></div>
								    		<div class="col-xs-2"><label style="font-weight: 600;"  for="">ចំនួនចំណែក</label></div>
								    	</div>
								    	<div class="col-xs-12 row" id="divCategory" style="margin-top:10px;padding: 0;min-height: 200px; max-height: 200px;overflow-y: scroll;">
								    	
								    	</div>
								    	
							    	</div>
							    </div>
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
<script src="<?php echo base_url('assets/') ?>js/pages/popup/v_popup_form_commission_setting.js"></script>
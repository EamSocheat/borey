<?php include 'v_popup_header.php';?>
		  <!-- general form elements -->
		  <input type="hidden" id="userAccId" name="userAccId" value="<?php if(isset($_GET["id"])){ echo $_GET["id"]; }?>"/>
		  <input type="hidden" id="frmAct" name="frmAct" value="<?php if(isset($_GET["action"])){ echo $_GET["action"]; }?>"/>
		  <!-- form start -->
          <form role="form" class="form-horizontal" id="frmUserAcc" action="" style="display: none" autocomplete="off">
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
                              <label for="cboStaff">បុគ្កលិក</label>
                              <select class="form-control" id="cboStaff" name="cboStaff" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសបុគ្គលិក ')" oninput="setCustomValidity('')">
	                    			<option value="">សូមជ្រើសរើសបុគ្គលិក </option>
			                  </select>
                            </div>
                		</div>
                		
                		<div class="col-xs-6 padding-forms-right">
                			<!--  -->
                			<div class="form-group">
                               	<label for="txtUserNm">ឈ្មោះគណនី</label>
                            	<input type="text" class="form-control" id="txtUserNm" name="txtUserNm" required="required" >
                            </div>
                		</div>
                		
                		
                	</div>
                	
                	<div class="col-xs-12 row" style="padding:0px;">
            		
                		<div class="col-xs-6 padding-forms-left">
                			<div class="form-group">
                               	<label for="txtPwd">ពាក្យសំងាត់</label>
                            	<input type="password" value="1234" class="form-control" id="txtPwd" name="txtPwd" required="required">
                            </div>
                		</div>
                		
                		<div class="col-xs-6 padding-forms-right">
                			<!--  -->
                			<div class="form-group">
                               	<label for="txtPwdCon">បញ្ជាក់ពាក្យសំងាត់</label>
                            	<input type="password" value="1234" class="form-control" id="txtPwdCon" name="txtPwdCon" required="required">
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
                                  <label><input type="checkbox" checked="checked" id="chkAddYn"> បន្ថែមថ្មី </label>
                                  <input type="hidden" name ="txtAddYn" id="txtAddYn" value="Y">
                                </div>
                                <div class="checkbox-inline">
                                  <label><input type="checkbox" id="chkEditYn"> កែប្រែនិង លុប </label>
                                  <input type="hidden" name ="txtEditYn" id="txtEditYn">
                                </div>
                            </div>
                		</div>
                	</div>
					
					<div class="col-xs-12 row" style="padding:0px">
                		<div class="col-xs-12 padding-forms-left padding-forms-right" style="margin-top: -20px;">
                			<div class="form-group">
	                			<div class="panel panel-success">
							    	<div class="panel-heading"><input type="checkbox" id="chkAllMenuNav" /> <label for="chkAllMenuNav" style="cursor:pointer">មីនុយការកំណត់</label></div>
							    	<div class="panel-body">
			
								    	<div class="col-xs-12 row" id="divMenuNav"  style="padding: 0;">
								    		
								    	</div>
							    	
							    	</div>
							    </div>
							</div>	    
                		</div>
                	</div>
                	
                	<div class="col-xs-12 row" style="padding:0px">
                		<div class="col-xs-12 padding-forms-left padding-forms-right" style="margin-top: -20px;">
                			<div class="form-group">
	                			<div class="panel panel-info">
							    	<div class="panel-heading"><input type="checkbox" id="chkAllMenuPro" /> <label for="chkAllMenuPro" style="cursor:pointer">មីនុយកំណត់ត្រា</label></div>
							    	<div class="panel-body">
							    	
							    		<div class="col-xs-12 row" id="divMenuPro" style="padding: 0;">
								    		
								    	</div>
								    	
							    	</div>
							    </div>
							</div>	    
                		</div>
                	</div>
                	
                	<div class="col-xs-12 row" style="padding:0px">
                		<div class="col-xs-12 padding-forms-left padding-forms-right" style="margin-top: -20px;    margin-bottom: -45px;">
                			<div class="form-group">
	                			<div class="panel panel-default">
							    	<div class="panel-heading"><input type="checkbox" id="chkAllMenuOth" /> <label for="chkAllMenuOth" style="cursor:pointer">មីនុយទូទៅ</label></div>
							    	<div class="panel-body">
							    	
							    		<div class="col-xs-12 row" id="divMenuOth" style="padding: 0;">
								    		
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
<script src="<?php echo base_url('assets/') ?>js/pages/popup/v_popup_form_user_account.js"></script>
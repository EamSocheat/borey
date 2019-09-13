<?php include 'v_popup_header.php';?>
    <!-- general form elements -->
	<input type="hidden" id="commiId" name="commiId" value="<?php if(isset($_GET["id"])){ echo $_GET["id"]; }?>"/>
	<input type="hidden" id="frmAct" name="frmAct" value="<?php if(isset($_GET["action"])){ echo $_GET["action"]; }?>"/>
    <!-- form start -->
	<form role="form" class="form-horizontal" id="frmCommission" action="" style="display: none">
		<input type="hidden" id="txtInstType" name="txtInstType"/>
		<input type="hidden" id="txtInstNum" name="txtInstNum"/>
		<input type="hidden" id="txtPayDesPer" name="txtPayDesPer"/>
		<input type="hidden" id="txtSellId" name="txtSellId"/>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnExit">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="popupTitle">Default Modal</h4>
            
		</div>

		<div class="modal-body" id="modalMdBody">
		<!-- modal body  -->
			<div class="row">
				
				<div class="col-xs-12 row" style="padding:0px">
            		<div class="col-xs-4 padding-forms-left">
            			<div class="form-group">
							<label for="txtCommiType" >ប្រភេទកម្រៃជើងសារ</label>
							<input type="text" style="height: 34px;font-size: 14px;" class="form-control input-sm" disabled="disabled" id="txtCommiType" name="txtCommiType" autocomplete="off" />
							
						</div>
            		</div>

            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
							<label for="txtSeller" >អ្នកលក់</label>
							<input style="height: 34px; border-radius: 3px;font-size: 14px;" type="text"  class="form-control input-sm" disabled="disabled" id="txtSeller" name="txtSeller" autocomplete="off" />
							
						</div>
            		</div>

            		<div class="col-xs-4 padding-forms-right">
                        
            			<div class="form-group">
            				<label for="txtCommiApprDate">ថ្ងៃអនុម័ត </label>
							<div class="input-group date">
								<div class="input-group-addon" id="txtPayDateIcon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right date-pick" id="txtCommiApprDate" name="txtCommiApprDate" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" autocomplete="off" />
							</div>
            			</div>
            		</div>
            	</div>

            	<!-- second row -->
            	<div class="col-xs-12 row" style="padding:0px">
            		<div class="col-xs-4 padding-forms-left">
            			<div class="form-group">
							<label for="txtSellPrice" >តំលៃលក់$</label>
							<input type="text" style="height: 34px;font-size: 14px;" class="form-control input-sm" disabled="disabled" id="txtSellPrice" name="txtSellPrice" autocomplete="off" />
							
						</div>
            		</div>
            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
							<label for="txtCommiAmt">ប្រាក់កម្រៃជើងសារ$</label>
							<input style="height: 34px; border-radius: 3px;font-size: 14px;" type="text"  class="form-control input-sm" disabled="disabled" id="txtCommiAmt" name="txtCommiAmt" autocomplete="off" />
            			</div>
            		</div>
            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
				      		<label  for="txtCommiPay" >ប្រាក់អនុម័ត$</label>
                			<input style="height: 34px; border-radius: 3px;font-size: 14px;" type="text"  class="form-control input-sm" id="txtCommiPay" name="txtCommiPay" autocomplete="off" required ="required"/>
				    	</div>
            		</div>
            		
            		
            	</div>
            	
               <!-- third row -->
            	<div class="col-xs-12 row" style="padding:0px">
            		<div class="col-xs-8 padding-forms-left">
            			<div class="form-group">
							<label for="txtDes" data-i18ncd="lb_des"></label>
							<input type="text" style="height: 34px;font-size: 14px;" class="form-control input-sm" id="txtDes" name="txtDes" autocomplete="off" />
							
						</div>
            		</div>
            		
            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
				      		<label  for="cboStatus" >ដំណើការ</label>
                			 <select class="form-control" id="cboStatus" name="cboStatus" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសបុគ្គលិក ')" oninput="setCustomValidity('')">
	            
								<option value="P" data-i18ncd="lb_wating">រង់ចាំ</option>
								<option value="Y" data-i18ncd="lb_finished" selected>រូចរាល់</option>
		                	</select>
				    	</div>
            		</div>
            		
            		
            	</div>
                             
            <!-- end modal body  -->
        </div>
     
        <div class="modal-footer" >
            <input type="hidden" value="" id="statusID" name="statusID" />
            <button  type="submit" class="btn btn-primary btn-sm" id="btnApprove"><i class="fa fa-check" aria-hidden="true"></i> អនុម័ត</button>
            <button data-i18ncd="btn_close" type="button" class="btn btn-default btn-sm" id="btnClose">Close</button>
        </div>
    </form>
    <!-- form end --> 
    <!-- end general form elements -->
<?php include 'v_popup_footer.php';?>
<script src="<?php echo base_url('assets/') ?>js/pages/popup/v_popup_form_commission_report.js"></script>
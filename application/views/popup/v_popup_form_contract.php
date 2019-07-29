<?php include 'v_popup_header.php';?>
    <!-- general form elements -->
	<input type="hidden" id="contId" name="contId" value="<?php if(isset($_GET["id"])){ echo $_GET["id"]; }?>"/>
	<input type="hidden" id="frmAct" name="frmAct" value="<?php if(isset($_GET["action"])){ echo $_GET["action"]; }?>"/>
    <!-- form start -->
	<form role="form" class="form-horizontal" id="frmContract" action="" style="display: none">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnExit">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="popupTitle">Default Modal</h4>
            <h5 class="modal-title" id="balanceLeft" style="float: right;margin-top: -24px;margin-right: 45%;"></h5>
            <h5 class="modal-title" id="contractNo" style="float: right;margin-top: -24px;margin-right: 31px;"></h5>
            
		</div>

		<div class="modal-body" id="modalMdBody">
		<!-- modal body  -->
			<div class="row">
				<div class="col-xs-12 row" style="padding:0px">
            		<div class="col-xs-4 padding-forms-left">
            			<div class="form-group">
							<label for="cusNm2" data-i18ncd="lb_customer_name">Customer Name</label>
							<div class="input-group">
								<input type="text" style="height: 34px;" class="form-control input-sm" disabled="disabled" id="txtCusNm" name="txtCusNm" autocomplete="off" />
								<span id="btnPopupCusch" class="input-group-addon label-info" style="border-top-right-radius: 5px;border-bottom-right-radius: 5px;cursor: pointer;border-color: #46b8da !important;"><i class="fa fa-search-plus"></i></span>
							</div>
							<input type="hidden" id="txtCusId" name="txtCusId">
						</div>
            		</div>

            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
							<label for="txtCusPhone" data-i18ncd="lb_customer_phone">Customer Phone</label>
							<div class="input-group" style="width:100%;">
								<input style="height: 34px; border-radius: 3px;" type="text"  class="form-control input-sm" disabled="disabled" id="txtCusPhone" name="txtCusPhone" autocomplete="off" />
							</div>
						</div>
            		</div>

            		<div class="col-xs-4 padding-forms-right">
                        <div class="form-group">
            				<label for="txtContSD" >ថ្ងៃកក់ប្រាក់</label>
							<div class="input-group date">
								<div class="input-group-addon" id="txtContSDIcon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right date-pick" id="txtContSD" name="txtContSD" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" autocomplete="off" />
							</div>
            			</div>
            		</div>
            	</div>

            	<!-- second row -->
            	<div class="col-xs-12 row" style="padding:0px">
            		<div class="col-xs-4 padding-forms-left">
            			<div class="form-group">
				      		<label  for="lAmt" >លុយកក់</label>
				        	<input type="text" class="form-control" id="lAmt" placeholder="Enter loan amount" name="lAmt" autocomplete="off" />
				    	</div>
            		</div>
            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
				      		<label  for="cbointerestType" >អ្នកទទួលលុយ(បុគ្គលិក)</label>
                			 <select class="form-control" id="cbointerestType" name="cbointerestType" style="font-size: 14px;">
	                    		<option value="M" data-i18nCd="lb_interest_type_M">Monthly</option>
	                    		<option value="Y" data-i18nCd="lb_interest_type_Y">Yearly</option>
			                </select>
				    	</div>
            		</div>
            		
            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
            				<label for="txtContSD1" >ថ្ងៃផុតកំណត់</label>
							<div class="input-group date">
								<div class="input-group-addon" id="txtContSDIcon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right date-pick" id="txtContSD1" name="txtContSD1" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" autocomplete="off" />
							</div>
            			</div>
            		</div>
            	</div>
            	<!-- 3 row -->
                <div class="col-xs-12 row" style="padding:0px">
                    <div class="col-xs-8 padding-forms-left">
                        <div class="form-group">
                            <label  for="txtDesc" data-i18nCd="lb_des">Description</label>
                            <input type="text" class="form-control" id="txtDesc" placeholder="Enter Description" name="txtDesc" autocomplete="off" />
                        </div>
                    </div>
                    
                    <div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
				      		<label  for="cbointerestType" >អ្នកលក់(បុគ្គលិក)</label>
                			 <select class="form-control" id="cbointerestType" name="cbointerestType" style="font-size: 14px;">
	                    		<option value="M" data-i18nCd="lb_interest_type_M">Monthly</option>
	                    		<option value="Y" data-i18nCd="lb_interest_type_Y">Yearly</option>
			                </select>
				    	</div>
            		</div>
            		
                </div>
                             
            <!-- end modal body  -->
        </div>
     
        <div class="modal-footer" style="text-align: center;">
            <input type="hidden" value="" id="statusID" name="statusID" />
            <button data-i18ncd="btn_status_closed" type="button" class="btn btn-success btn-sm" id="btnStatusActive" style="float: left;display: none;">Close</button>
            <button data-i18ncd="btn_status_active" type="button" class="btn btn-danger btn-sm" id="btnStatusClose" style="float: left;display: none;">Cancel Close</button>
            <button data-i18ncd="btn_save_new" type="submit" class="btn btn-success btn-sm" id="btnSaveNew" style="display:none">Save + New</button>
            <button data-i18ncd="btn_save" type="submit" class="btn btn-primary btn-sm" id="btnSave">Save</button>
            <button data-i18ncd="btn_close" type="button" class="btn btn-default btn-sm" id="btnClose">Close</button>
        </div>
    </form>
    <!-- form end --> 
    <!-- end general form elements -->
<?php include 'v_popup_footer.php';?>
<script src="<?php echo base_url('assets/') ?>js/pages/popup/v_popup_form_contract.js"></script>
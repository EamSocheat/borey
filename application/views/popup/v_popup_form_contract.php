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
				<div class="col-xs-12 row" style="padding:0px;display:none" id="btnEditDiv">
					
					<div class="col-xs-12 padding-forms-left text-left" style="padding-left: 35px;margin-bottom: 10px;">
						<button type="button" class="btn btn-warning btn-xs" id="btnExp"><i class="fa fa-check" aria-hidden="true"></i> កំណត់ផុតកំណត់</button>
						<button type="button" class="btn btn-danger btn-xs" id="btnReturn"><i class="fa fa-check" aria-hidden="true"></i> កំណត់ត្រលប់ប្រាក់ </button>
						<button type="button" class="btn btn-success btn-xs" id="btnOpen"><i class="fa fa-check" aria-hidden="true"></i> កំណត់បើក </button>
					</div>
					
				</div>
				<div class="col-xs-12 row" style="padding:0px">
            		<div class="col-xs-4 padding-forms-left">
            			<div class="form-group">
							<label for="cusNm2" data-i18ncd="lb_customer_name">Customer Name</label>
							<div class="input-group">
								<input type="text" style="height: 34px;font-size: 14px;" class="form-control input-sm" disabled="disabled" id="txtCusNm" name="txtCusNm" autocomplete="off" />
								<span id="btnPopupCusch" class="input-group-addon label-info" style="border-top-right-radius: 5px;border-bottom-right-radius: 5px;cursor: pointer;border-color: #46b8da !important;"><i class="fa fa-search-plus"></i></span>
							</div>
							<input type="hidden" id="txtCusId" name="txtCusId">
						</div>
            		</div>

            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
							<label for="txtCusPhone" data-i18ncd="lb_customer_phone">Customer Phone</label>
							<div class="input-group" style="width:100%;">
								<input style="height: 34px; border-radius: 3px;font-size: 14px;" type="text"  class="form-control input-sm" disabled="disabled" id="txtCusPhone" name="txtCusPhone" autocomplete="off" />
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
            				<label  for="cboSeller" >អ្នកលក់(បុគ្គលិក)</label>
                			<select class="form-control" id="cboSeller" name="cboSeller" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសបុគ្គលិក ')" oninput="setCustomValidity('')">
	                    		
			                </select>
			        	</div>
            		</div>
            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
				      		<label  for="cboReceiver" >អ្នកទទួលលុយ(បុគ្គលិក)</label>
                			 <select class="form-control" id="cboReceiver" name="cboReceiver" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសបុគ្គលិក ')" oninput="setCustomValidity('')">
	                    		
			                </select>
				    	</div>
            		</div>
            		
            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
            				<label for="txtContED" >ថ្ងៃផុតកំណត់</label>
							<div class="input-group date">
								<div class="input-group-addon" id="txtContEDIcon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right date-pick" id="txtContED" name="txtContED" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" autocomplete="off" />
							</div>
            			</div>
            		</div>
            	</div>
            	<!-- 3 row -->
                <div class="col-xs-12 row" style="padding:0px">
                    <div class="col-xs-4 padding-forms-left">
                    	<div class="form-group">
	                        <label  for="cboPaymentMet" >វីធីបង់ប្រាក់</label>
	                		<select class="form-control" id="cboPaymentMet" name="cboPaymentMet" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសវីធីបង់ប្រាក់ ')" oninput="setCustomValidity('')">
	                    		
		                	</select>
	                	</div>
                    </div>
                    <div class="col-xs-4 padding-forms-right">
            			
		                <div class="form-group">
				      		<label  for="txtTran" >លេខប្រតិបត្តិការណ៍</label>
				        	<input type="text" class="form-control" id="txtTran" placeholder="Enter loan amount" name="txtTran" autocomplete="off" />
				    	</div>
			    	
            		</div>
                    <div class="col-xs-4 padding-forms-right">
            			
		                <div class="form-group">
				      		<label  for="txtAmtBooking" >ចំនូនលុយកក់</label>
				        	<input type="text" class="form-control" id="txtAmtBooking" placeholder="Enter loan amount" name="txtAmtBooking" autocomplete="off" required="required" />
				    	</div>
			    	
            		</div>
            		
                </div>
                <div class="col-xs-12 row" style="padding:0px">
                	<div class="col-xs-12 padding-forms-left">
                        <div class="form-group">
                            <label  for="txtDesc" data-i18nCd="lb_des">Description</label>
                            <input type="text" class="form-control" id="txtDesc" placeholder="Enter Description" name="txtDesc" autocomplete="off" />
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 row" style="padding:0px">
                	<div style="text-align: right;    margin-right: 5px;">
                		<button  type="button" class="btn btn-info btn-sm" id="btnSelectPro"><i class="fa fa-home" aria-hidden="true"></i> ជ្រើសរើសអចលនទ្រព្យ</button>
                	</div>
                	<!--  -->
                	<br>
                	<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;">
                    	<div class="box-body table-responsive fix-header-tbl" style="height: 150px;padding: 0px;">
        				  <table class="table table-hover" id="tblProduct" >
        				    <thead>  
            					<tr>
            					  <th>លេខកូដ</th>
	        					  <th>ប្រភេទ</th>
	        					  <th>គំរោង</th>
	        					  <th>តំលៃ $</th>
            					</tr>
        					</thead>
        					<tbody>
        					   
        					</tbody>
        					
        				  </table>
        				</div> 	
                	</div>
    				<!--  --> 
                </div>
                             
            <!-- end modal body  -->
        </div>
     
        <div class="modal-footer" >
            <input type="hidden" value="" id="statusID" name="statusID" />
            <button type="button" class="btn btn-info btn-sm" id="btnPrint" style="display: none;">បោះពុម្ព</button>
            <button data-i18ncd="btn_save_new" type="submit" class="btn btn-success btn-sm" id="btnSaveNew" style="display:none">Save + New</button>
            <button data-i18ncd="btn_save" type="submit" class="btn btn-primary btn-sm" id="btnSave">Save</button>
            <button data-i18ncd="btn_close" type="button" class="btn btn-default btn-sm" id="btnClose">Close</button>
        </div>
    </form>
    <!-- form end --> 
    <!-- end general form elements -->
<?php include 'v_popup_footer.php';?>
<script src="<?php echo base_url('assets/') ?>js/pages/popup/v_popup_form_contract.js"></script>
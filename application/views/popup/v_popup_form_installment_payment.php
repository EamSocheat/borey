<?php include 'v_popup_header.php';?>
    <!-- general form elements -->
	<input type="hidden" id="instId" name="instId" value="<?php if(isset($_GET["id"])){ echo $_GET["id"]; }?>"/>
	<input type="hidden" id="frmAct" name="frmAct" value="<?php if(isset($_GET["action"])){ echo $_GET["action"]; }?>"/>
    <!-- form start -->
	<form role="form" class="form-horizontal" id="frmPayment" action="" style="display: none">
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
            		<div class="col-xs-8 padding-forms-left">
            			<div class="form-group">
							<label for="cusNm2" data-i18ncd="lb_customer_name">Customer Name</label>
							<input type="text" style="height: 34px;font-size: 14px;" class="form-control input-sm" disabled="disabled" id="txtCusNm" name="txtCusNm" autocomplete="off" />
							<input type="hidden" id="txtCusId" name="txtCusId">
						</div>
            		</div>
					<!--  
            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
							<label for="txtCusPhone" data-i18ncd="lb_customer_phone">Customer Phone</label>
							<input style="height: 34px; border-radius: 3px;font-size: 14px;" type="text"  class="form-control input-sm" disabled="disabled" id="txtCusPhone" name="txtCusPhone" autocomplete="off" />
							
						</div>
            		</div>
                    -->
            		<div class="col-xs-4 padding-forms-right">
                        <div class="form-group">
							<label for="txtProCode">លេខកូដផ្ទះ</label>
							<input style="height: 34px; border-radius: 3px;font-size: 14px;" type="text"  class="form-control input-sm" disabled="disabled" id="txtProCode" name="txtProCode" autocomplete="off" />
            			</div>
            		</div>
            	</div>
            	
            	<div class="col-xs-12 row" style="padding:0px">
            		<div class="col-xs-4 padding-forms-left">
            			<div class="form-group">
							<label for="txtDueDate" >ថ្ងៃត្រូវបង់</label>
							<input type="text" style="height: 34px;font-size: 14px;" class="form-control input-sm" disabled="disabled" id="txtDueDate" name="txtDueDate" autocomplete="off" />
						</div>
            		</div>
					
            		<div class="col-xs-4 padding-forms-right">
                        <div class="form-group">
							<label for="txtInstNo">លេខរៀង</label>
							<input style="height: 34px; border-radius: 3px;font-size: 14px;" type="text"  class="form-control input-sm" disabled="disabled" id="txtInstNo" name="txtInstNo" autocomplete="off" />
            			</div>
            		</div>
            		
            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
							<label for="txtInstPayAmt" >ប្រាក់ត្រូវបង់ $</label>
							<input type="text" style="height: 34px;font-size: 14px;" class="form-control input-sm" disabled="disabled" id="txtInstPayAmt" name="txtInstPayAmt" autocomplete="off" />
							
						</div>
            		</div>
            	</div>

            	<!-- second row -->
            	<div class="col-xs-12 row" style="padding:0px">
            		<div class="col-xs-4 padding-forms-left">
            			<div class="form-group">
            				<label for="txtPayDate">ថ្ងៃបង់ប្រាក់ </label>
							<div class="input-group date">
								<div class="input-group-addon" id="txtPayDateIcon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control pull-right date-pick" id="txtPayDate" name="txtPayDate" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" autocomplete="off" />
							</div>
            			</div>
            		</div>
            		<div class="col-xs-4 padding-forms-right">
            			<div class="form-group">
				      		<label  for="cboReceiver" >អ្នកទទួលប្រាក់(បុគ្គលិក)</label>
                			 <select class="form-control" id="cboReceiver" name="cboReceiver" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសបុគ្គលិក ')" oninput="setCustomValidity('')">
	                    		
			                </select>
				    	</div>
            		</div>
            		
            		<div class="col-xs-4 padding-forms-right">
            			
		                <div class="form-group">
				      		<label  for="txtPenaltyAmt" >ប្រាក់ពិន័យ​ $</label>
				        	<input type="text" class="form-control" id="txtPenaltyAmt" placeholder="Enter loan amount" name="txtPenaltyAmt" autocomplete="off" required="required" />
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
							<label for="txtTotalPayAmt">ប្រាក់ត្រូវបង់សរុប $</label>
							<input type="text" style="height: 34px;font-size: 14px;" class="form-control input-sm" disabled="disabled" id="txtTotalPayAmt" name="txtTotalPayAmt" autocomplete="off" />
						</div>
                    </div>
            		
                </div>
                <div class="col-xs-12 row" style="padding:0px">
                	<div class="col-xs-8 padding-forms-left">
                        <div class="form-group">
                            <label  for="txtDesc" data-i18nCd="lb_des">Description</label>
                            <input type="text" class="form-control" id="txtDesc" placeholder="Enter Description" name="txtDesc" autocomplete="off" />
                        </div>
                    </div>
                    <div class="col-xs-4 padding-forms-right">
                       <div class="form-group">
							<label for="txtTotalPayAmt1">ប្រាក់ត្រូវបង់សរុប $</label>
							<input type="text" style="height: 34px;font-size: 14px;" class="form-control input-sm" disabled="disabled" id="txtTotalPayAmt1" name="txtTotalPayAmt1" autocomplete="off" />
						</div>
                    </div>
                    
                </div>
                
               
                             
            <!-- end modal body  -->
        </div>
     
        <div class="modal-footer" >
            <input type="hidden" value="" id="statusID" name="statusID" />
            <button  type="submit" class="btn btn-primary btn-sm" id="btnPay"><i class="fa fa-check" aria-hidden="true"></i> បង់ប្រាក់</button>
            <button data-i18ncd="btn_close" type="button" class="btn btn-default btn-sm" id="btnClose">Close</button>
        </div>
    </form>
    <!-- form end --> 
    <!-- end general form elements -->
<?php include 'v_popup_footer.php';?>
<script src="<?php echo base_url('assets/') ?>js/pages/popup/v_popup_form_installment_payment.js"></script>
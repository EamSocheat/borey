<?php include 'v_popup_header.php';?>
    <!-- general form elements -->
	<input type="hidden" id="sellId" name="sellId" value="<?php if(isset($_GET["id"])){ echo $_GET["id"]; }?>"/>
	<input type="hidden" id="frmAct" name="frmAct" value="<?php if(isset($_GET["action"])){ echo $_GET["action"]; }?>"/>
    <!-- form start -->
	<form role="form" class="form-horizontal" id="frmSell" action="" style="display: none">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnExit">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="popupTitle">Default Modal</h4>
            <!--
            <ul class="nav nav-tabs" style="line-height: 5px; border: none ">
			    <li class="active" id="divSell"><a data-toggle="tab" href="#divSellView" style="line-height: 5px;font-size: 15px;font-weight: bold;"><i class="fa fa-shopping-cart"></i> ពត៌មាន ការល​ក់</a></li>
			    <li id="divInstallment" class="totalPaidDiv" style="display: none"><a data-toggle="tab" href="#divInstallmentView" style="line-height: 5px;font-size: 15px;font-weight: bold;"><i class="fa fa-line-chart"></i> ពត៌មាន បង់រំលស់</a></li>
			</ul>
			-->
            <h5 class="modal-title" id="balanceLeft" style="float: right;margin-top: -24px;margin-right: 45%;"></h5>
            <h5 class="modal-title" id="contractNo" style="float: right;margin-top: -24px;margin-right: 31px;"></h5>
            
		</div>

		<div class="modal-body" id="modalMdBody">
		<!-- modal body  -->
			<div class="tab-content">
				<div id="divSellView" class="tab-pane fade in active">
			    	<div class="row">
						<div class="col-xs-12 row" style="padding:0px" >
		            		<div class="col-xs-3 padding-forms-left">
		            			<div class="form-group">
		                			<label for="txtContract">លេខកូដអចលនទ្រព្យកក់</label>
		    						<div class="input-group">
		    							<input type="text" style="height: 34px;font-size: 14px;" class="form-control input-sm" id="txtContract" name="txtContract" autocomplete="off" />
		    							<span id="btnContractSrch" class="input-group-addon label-info" style="border-top-right-radius: 5px;border-bottom-right-radius: 5px;cursor: pointer;border-color: #46b8da !important;"><i class="fa fa-search-plus"> ​</i></span>
		    							<input type="hidden" id="txtContID" name="txtContID"/>
		    						</div>
		    					</div>
		            		</div>
		
		            		<div class="col-xs-3 padding-forms-right">
		            			<div class="form-group">
						      		<label  for="txtBookingAmt" >ចំនូនលុយកក់</label>
						        	<input type="text" disabled="disabled" class="form-control" id="txtBookingAmt" placeholder="Enter loan amount" name="txtBookingAmt" autocomplete="off" />
						    	</div>
		            		</div>
		
		            		<div class="col-xs-3 padding-forms-right">
		                        <div class="form-group">
						      		<label  for="txtBookDate" > ថ្ងៃកក់ប្រាក់</label>
						        	<input type="text" disabled="disabled" class="form-control" id="txtBookDate" placeholder="Enter loan amount" name="txtBookDate" autocomplete="off" />
						    	</div>
		            		</div>
		            		<div class="col-xs-3 padding-forms-right text-right" style="padding: 0px">
                    			<button  type="button" class="btn btn-info btn-sm" id="btnPopupCusch" style="margin-top: 26px;height:34px; width: 100%"><i class="fa fa-address-card" aria-hidden="true"></i> ជ្រើសរើសអតិថិជន </button>
                    		</div>
		            	</div>
		            	
		            	<div class="col-xs-12 row" style="padding-right: 0px;padding-left: 35px;">
                    		<span><b>ពត៍មានអតិថិជន </b></span>
                        	<div class="box-body table-responsive fix-header-tbl" style="height: 120px;padding: 0px;">
            				  <table class="table table-hover" id="tblCustomer" >
            				    <thead>  
                					<tr>
                					  <th>	លេខអត្តសញ្ញាណ </th>
                					  <th>ឈ្មោះអតិថិជន </th>
    	        					  <th>លេខទូរស័ព្ទអតិថិជន </th>
    	        					  <th>ភេទ </th>
    	        					  
                					</tr>
            					</thead>
            					<tbody>
            					   
            					</tbody>
            					
            				  </table>
            				</div> 	
                    	</div>
						
						<div class="col-xs-12 row" style="padding:0px;" id="conDivInfo2">
		            		<div class="col-xs-3 padding-forms-left">
		                        <div class="form-group">
		            				<label  for="cboSeller" >អ្នកលក់(បុគ្គលិក)</label>
		                			<select class="form-control" id="cboSeller" name="cboSeller" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសបុគ្គលិក ')" oninput="setCustomValidity('')">
			                    		
					                </select>
					        	</div>
		            		</div>
		
							<div class="col-xs-3 padding-forms-right">
		                    	<div class="form-group">
			                        <label  for="cboConType" >ប្រភេទកិច្ចសន្យា</label>
			                		<select class="form-control" id="cboConType" name="cboConType" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសប្រភេទកិច្ចសន្យា ')" oninput="setCustomValidity('')">
			                    		
				                	</select>
			                	</div>
		                    </div>
		                    
		                    <div class="col-xs-3 padding-forms-right" id="divDes">
		            			
				                <div class="form-group">
		                            <label  for="txtDesc" data-i18nCd="lb_des">Description</label>
		                            <input type="text" class="form-control" id="txtDesc" placeholder="Enter Description" name="txtDesc" autocomplete="off" />
		                        </div>
					    	
		            		</div>
		            		<div class="col-xs-3 padding-forms-right text-right" style="padding: 0px" id="divSelectPro">
		                		<button  type="button" class="btn btn-info btn-sm" id="btnSelectPro" style="margin-top: 26px;height:34px; width: 100%"><i class="fa fa-home" aria-hidden="true"></i> ជ្រើសរើសអចលនទ្រព្យ</button>
		                	</div>
		            	</div>
		            	
		                <div class="col-xs-12 row" style="padding:0px;">
		                	<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;">
		                		<span><b>ពត៍មានអចលនទ្រព្យ</b></span>
		                    	<div class="box-body table-responsive fix-header-tbl" style="height: 90px;padding: 0px;">
		        				  <table class="table table-hover" id="tblProduct" >
		        				    <thead>  
		            					<tr>
		            					  <th>លេខកូដ</th>
			        					  <th>ប្រភេទ</th>
			        					  <th>គំរោង</th>
			        					  <th>រយៈពេលសាងសង់ (ខែ)</th>
			        					  <th>តំលៃលក់ជាអក្សរ</th>
			        					  <th class="text-right" style="padding-right: 25px;">តំលៃលក់$</th>
		            					</tr>
		        					</thead>
		        					<tbody>
		        					   
		        					</tbody>
		        					
		        				  </table>
		        				</div> 	
		                	</div>
		    				<!--  --> 
		                </div>
		                
		                 <div class="col-xs-12 row" style="padding:0px;">
		                	
		                	 <div class="col-xs-3 padding-forms-left">
		                        <div class="form-group">
		        		      		<label  for="txtTranPrice" >តំលៃផ្ទេរកិច្ចសន្យា $</label><span> </span>
		        		        	<input type="text" class="form-control text-right" id="txtTranPrice" required="required"  placeholder="Enter loan amount" name="txtTranPrice" autocomplete="off" />
		        		    	</div>
		                    </div>
		                	<div class="col-xs-3 padding-forms-right">
		                		<div class="form-group">
		        		      		<label  for="txtPayPer" > ប្រាក់ទូទាត់​ជាមុន  % </label><span> </span>
		        		        	<input type="text" maxlength="5" class="form-control text-right" id="txtPayPer" required="required"  placeholder="Enter loan amount" name="txtPayPer" autocomplete="off" />
		        		    	</div>
		                    </div>
		                    <div class="col-xs-3 padding-forms-right">
		                        <div class="form-group">
		        		      		<label  for="txtPayCash" > ប្រាក់ទូទាត់​ជាមុន $</label><span> </span>
		        		        	<input type="text" class="form-control text-right" id="txtPayCash" required="required"  placeholder="Enter loan amount" name="txtPayCash" autocomplete="off" />
		        		    	</div>
		                    </div>
		                    <!-- 
		                    <div class="col-xs-3 padding-forms-right">
		                        <div class="form-group">
		        		      		<label  for="txtPayCashDesc" > ប្រាក់ទូទាត់​ជាមុនជាអក្សរ</label><span> </span>
		        		        	<input type="text" class="form-control text-right" id="txtPayCashDesc" required="required"  placeholder="Enter loan amount" name="txtPayCashDesc" autocomplete="on" />
		        		    	</div>
		                    </div>
		                     -->
		                    <div class="col-xs-3 padding-forms-right">
		                        <div class="form-group">
		        		      		<label  for="txtPayTime" > ចំនួនលើកទូទាត់​ជាមុន</label><span> </span>
		        		        	<input type="text" class="form-control text-right" id="txtPayTime" required="required"  placeholder="Enter loan amount" name="txtPayTime" autocomplete="off" />
		        		    	</div>
		                    </div>
		                    
		                </div>
		                
		                <div class="col-xs-12 row" style="padding:0px;" >
		                	<div class="col-xs-3 padding-forms-left">
		                		
		                		<div class="form-group">
		            				<label for="txtContSD" >ថ្ងៃលក់</label>
									<div class="input-group date">
										<div class="input-group-addon" id="txtContSDIcon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control pull-right date-pick" id="txtContSD" name="txtContSD" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" autocomplete="off" />
									</div>
		            			</div>
		                	</div>
		                	<div class="col-xs-3 padding-forms-right">
		                        <div class="form-group">
			                    	<label for="txtStartInstDate" >ថ្ងៃបង់បន្ទាប់</label>
									<div class="input-group date">
										<div class="input-group-addon" id="txtStartInstDateIcon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control pull-right date-pick" id="txtStartInstDate" name="txtStartInstDate" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" autocomplete="off" />
									</div>
								</div>
		                    </div>
		                	<div class="col-xs-3 padding-forms-right">
		                		<div class="form-group">
		        		      		<label  for="txtDisPer" > បញ្ចុះតំលៃ % </label><span> </span>
		        		        	<input type="text" maxlength="2" class="form-control text-right" id="txtDisPer" placeholder="Enter loan amount" name="txtDisPer" autocomplete="off" />
		        		    	</div>
		                	</div>
		                	<div class="col-xs-3 padding-forms-right">
		                		<div class="form-group">
		        		      		<label  for="txtDisCash">បញ្ចុះតំលៃ $ </label><span> </span>
		        		        	<input type="text" class="form-control text-right" id="txtDisCash" placeholder="Enter loan amount" name="txtDisCash" autocomplete="off" />
		        		    	</div>
		                    </div>
		                	
		                	
		                	
		                </div>
		                <div class="col-xs-12 row " style="padding:0px;">
		                	<!--  -->
				    		<div class="col-xs-4 padding-forms-left div_installment" style="display: none;">
		                        <div class="form-group" >
		        		      		<label  for="txtTotalLeftInst" > ប្រាក់ដើមនៅសល់</label><span> </span>
		        		        	<input type="text" disabled="disabled" class="form-control text-right" id="txtTotalLeftInst" placeholder="Enter loan amount" name="txtTotalLeftInst" autocomplete="off" />
		        		    	</div>
		                	</div>
		                	<!-- <div class="col-xs-3 padding-forms-right">
		                		<div class="form-group">
		        		      		<label  for="txtTotalLeftInstDesc" > ប្រាក់ដើមនៅសល់ជាអក្សរ</label><span> </span>
		        		        	<input type="text" class="form-control text-right" id="txtTotalLeftInstDesc"  placeholder="Enter loan amount" name="txtTotalLeftInstDesc" required="required" />
		        		    	</div>
		                    </div> -->
		                	<div class="col-xs-4 padding-forms-right div_installment" style="display: none;" >
		                		<div class="form-group">
		        		      		<label  for="txtInterstRate" > អត្រាការប្រាក់ %(ក្នុងមួយឆ្នាំ) </label><span> </span>
		        		        	<input type="text"  maxlength="5" class=" form-control text-right" id="txtInterstRate"  placeholder="Enter loan amount" name="txtInterstRate" autocomplete="off" />
		        		    	</div>
		                    </div>
		                    <div class="col-xs-4 padding-forms-right div_installment" style="display: none;">
		                        <div class="form-group">
		        		      		<label  for="txtPeriod" > រយៈពេលរំលស់(ខែ)</label><span> </span>
		        		        	<input type="text"   maxlength="3" class=" form-control text-right" id="txtPeriod" placeholder="Enter loan amount" name="txtPeriod" autocomplete="off" />
		        		    	</div>
		                    </div>
		                   <!--  -->
		                </div>
		                <div class="col-xs-12 row" style="padding:0px;">
		                	<div class="col-xs-9 padding-forms-left">
		                		<div class="form-group">
		                			<input type="checkbox" id="cboInstYn" name="cboInstYn" disabled="disabled"> <label  for="cboInstYn" > ធ្វើការរំលស់ជាមួយក្រុមហ៊ុន</label><span> </span>
		                			<input type="hidden" name="txt_com_inst_yn" id="txt_com_inst_yn" value="Y"/>
		                			<button  type="button" class="btn btn-danger btn-xs" id="btnEditInst" style="margin-left: 15px;display: none"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> កំណត់តារាងបង់ប្រាក់</button>
		                		</div>
		                		
		                	</div>
		                	<div class="col-xs-3 padding-forms-right text-right" style="    padding-left: 0px;padding-right: 0px;">
    	                        <button  type="button" class="btn btn-warning btn-sm" id="btnCalInst" style="width: 100%;height: 34px;"><i class="fa fa-plus"></i> គណនាតារាងបង់ប្រាក់</button>
		                	</div>
		                </div>
		                
		                
		                
		                <div class="col-xs-12 row div_installment" style="padding:0px;display: none;margin-top: -10px;">
		                	<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;">
		                		<table style="width:100%" class="table">
		                			<colgroup>
										<col width="15%">
										<col width="5%">
										<col width="15%">
										<col width="12%">
										<col width="5%">
										<col width="15%">
										<col width="12%">
										<col width="5%">
										<col width="15%">
									</colgroup>
								  	<tr >
								    	<th style="border:none;">ប្រាក់បង់ប្រចាំខែ</th>
								    	<th style="border:none;">៖</th>
								    	<td style="border:none;" id="monthlyPay"></td>
								    	<th style="border:none;" >ការប្រាក់សរុប</th>
								    	<th style="border:none;" >៖</th>
								    	<td  style="border:none;" id="totalPayInterest"></td>
								    	<th style="border:none;" >ប្រាក់បង់សរុប</th>
								    	<th style="border:none;" >៖</th>
								    	<td  style="border:none;" id="totalPayInstallment"></td>
								  	</tr>
								  	<tr>
								    	
								  	</tr>
								  	<tr>
								    	
								  	</tr>
								</table>
		                	</div>
		                	
		                	
		    				<!--  --> 
		                </div>
		                <div class="col-xs-12 row" style="padding:0px;">
		                	<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;">
		                		<!-- <span><b>ប្រវត្តិនៃការបង់ប្រាក់</b></span>--> 
		                    	<div class="box-body table-responsive fix-header-tbl" style="height: 185px;padding: 0px;">
		        				  <table class="table table-hover" id="tblInstallment" >
		        				    <thead>  
		            					<tr>
		            					  <th>ល.រ</th>
		            					  <th class="text-center">ថ្ងៃត្រូវបង់</th>
		            					  <th class="text-center">ភាគរយ%</th>
		            					  <th class="text-right">បញ្ចុះ $</th>
		            					  <th class="text-right">ប្រាក់ដើម $</th>
			        					  <th class="text-right">ប្រាក់ការ $</th>
			        					  <th class="text-right" ​>ប្រាក់បង់សរុប $</th>
			        					  <th class="text-right" style="padding-right: 25px;">ប្រាក់ដើមនៅសល់ $</th>
			        					  
		            					</tr>
		        					</thead>
		        					<tbody>
		        					   
		        					</tbody>
		        					
		        				  </table>
		        				</div> 	
		                	</div>
		                </div>
		              
		        	</div>
		        	<div class="modal-footer" >
			            <input type="hidden" value="" id="statusID" name="statusID" />
			            <button type="button" class="btn btn-primary btn-sm" id="btnPrint" style="display: none;"><i class="fa fa-print" aria-hidden="true"></i> បោះពុម្ពតារាងបង់ប្រាក់​ + កិច្ចសន្យា</button> 
			            <!--<button type="submit" class="btn btn-primary btn-sm" id="btnAddPayment" style="display: none;"><i class="fa fa-plus"></i> បង់ប្រាក់បន្ថែម</button>-->
			            <button data-i18ncd="btn_save_new" type="submit" class="btn btn-success btn-sm" id="btnSaveNew" style="display:none">Save + New</button>
			            <button data-i18ncd="btn_save" type="submit" class="btn btn-primary btn-sm" id="btnSave">Save</button>
			            <button data-i18ncd="btn_close" type="button" class="btn btn-default btn-sm" id="btnClose">Close</button>
			        </div>
			    </div>
			    <!--installment  --> 
			    <div id="divInstallmentView" class="tab-pane fade">
			    	 <div class="col-xs-12 row" style="padding:0px;">
			    	 	<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;">
			    	 		<table style="width:100%" class="table">
		                			<colgroup>
										<col width="17%">
										<col width="2%">
										<col width="15%">
										<col width="17%">
										<col width="2%">
										<col width="15%">
										<col width="15%">
										<col width="2%">
										<col width="17%">
									</colgroup>
								  	<tr >
								    	<th style="border:none;">ប្រាក់ទូទាត់​ជាមុន %</th>
								    	<th style="border:none;">៖</th>
								    	<td style="border:none;" id="txtPayPerEdit"></td>
								    	<th style="border:none;" >ប្រាក់ទូទាត់​ជាមុន $</th>
								    	<th style="border:none;" >៖</th>
								    	<td  style="border:none;" id="txtPayAmtEdit"></td>
								    	<th style="border:none;" >ប្រាក់នៅសល់ $</th>
								    	<th style="border:none;" >៖</th>
								    	<td  style="border:none;" id="txtPayLeftAmtEdit"></td>
								  	</tr>
								  	<tr>
								    	
								  	</tr>
								  	<tr>
								    	
								  	</tr>
								</table>
						</div>
			    	 </div>
			    	 <div class="col-xs-12 row" style="padding:0px;text-align: right; margin-top: -15px;">
			    	 	<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;">
			    	 		<button  type="button" class="btn btn-default btn-xs" id="btnCancel"><i class="fa fa-arrow-left" aria-hidden="true"></i> បោះបង់</button>
				    	 	<button type="button" class="btn btn-primary btn-xs" id="btnReady"><i class="fa fa-check" aria-hidden="true"></i> កែប្រែរួចរាល់</button>
			           </div>
			    	 </div>
			         <div class="col-xs-12 row" style="padding:0px;">
	                	<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;" id="tblInstallmentEditDiv">
	                		<span><b>កំណត់តារាងបង់ប្រាក់</b></span>
	                    	<div class="box-body table-responsive fix-header-tbl" style="height: 700px;padding: 0px;">
	        				  <table class="table table-hover" id="tblInstallmentEdit" >
	        				    <thead>  
	            					<tr>
	            					  <th>ល.រ</th>
	            					  <th class="text-center">ថ្ងៃត្រូវបង់</th>
	            					  <th class="text-center">ភាគរយ%</th>
	            					  <th class="text-right">បញ្ចុះ $</th>
	            					  <th class="text-right">ប្រាក់ដើម $</th>
		        					  <th class="text-right">ប្រាក់ការ $</th>
		        					  <th class="text-right" ​>ប្រាក់បង់សរុប $</th>
		        					  <th class="text-right" style="padding-right: 25px;">ប្រាក់ដើមនៅសល់ $</th>
		        					  
	            					</tr>
	        					</thead>
	        					<tbody>
	        					   
	        					</tbody>
	        					
	        				  </table>
	        				</div> 	
	                	</div>
	                </div>
			    	
			    </div>
		    </div>           
            <!-- end modal body  -->
        </div>
     
        
    </form>
    <!-- form end --> 
    <!-- end general form elements -->
<?php include 'v_popup_footer.php';?>
<script src="<?php echo base_url('assets/') ?>js/pages/popup/v_popup_form_sell.js"></script>
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
						<div class="col-xs-12 row" style="padding:0px">
		            		<div class="col-xs-4 padding-forms-left">
		            			<div class="form-group">
		                			<label for="txtContract">លេខកក់ប្រាក់</label>
		    						<div class="input-group">
		    							<input type="text" style="height: 34px;font-size: 14px;" class="form-control input-sm" id="txtContract" name="txtContract" autocomplete="off" />
		    							<span id="btnContractSrch" class="input-group-addon label-info" style="border-top-right-radius: 5px;border-bottom-right-radius: 5px;cursor: pointer;border-color: #46b8da !important;"><i class="fa fa-search-plus"> ​</i></span>
		    							<input type="hidden" id="txtContID" name="txtContID"/>
		    						</div>
		    					</div>
		            		</div>
		
		            		<div class="col-xs-4 padding-forms-right">
		            			<div class="form-group">
						      		<label  for="txtBookingAmt" >ចំនូនលុយកក់</label>
						        	<input type="text" disabled="disabled" class="form-control" id="txtBookingAmt" placeholder="Enter loan amount" name="txtBookingAmt" autocomplete="off" />
						    	</div>
		            		</div>
		
		            		<div class="col-xs-4 padding-forms-right">
		                        <div class="form-group">
						      		<label  for="txtBookDate" > ថ្ងៃកក់ប្រាក់</label>
						        	<input type="text" disabled="disabled" class="form-control" id="txtBookDate" placeholder="Enter loan amount" name="txtBookDate" autocomplete="off" />
						    	</div>
		            		</div>
		            	</div>
						
						<div class="col-xs-12 row" style="padding:0px;margin-top: -10px;">
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
		            				<label  for="cboSeller" >អ្នកលក់(បុគ្គលិក)</label>
		                			<select class="form-control" id="cboSeller" name="cboSeller" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសបុគ្គលិក ')" oninput="setCustomValidity('')">
			                    		
					                </select>
					        	</div>
		            		</div>
		            	</div>
		            	<!-- 3 row -->
		                <div class="col-xs-12 row" style="padding:0px;margin-top: -10px;">
		                    <div class="col-xs-4 padding-forms-left">
		                    	<div class="form-group">
			                        <label  for="cboConType" >ប្រភេទកិច្ចសន្យា</label>
			                		<select class="form-control" id="cboConType" name="cboConType" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសប្រភេទកិច្ចសន្យា ')" oninput="setCustomValidity('')">
			                    		
				                	</select>
			                	</div>
		                    </div>
		                    <div class="col-xs-8 padding-forms-right">
		            			
				                <div class="form-group">
		                            <label  for="txtDesc" data-i18nCd="lb_des">Description</label>
		                            <input type="text" class="form-control" id="txtDesc" placeholder="Enter Description" name="txtDesc" autocomplete="off" />
		                        </div>
					    	
		            		</div>
		            		<!--
		            		<div class="col-xs-3 padding-forms-right text-right">
		            			<div class="form-group">
		            				<label  for="btnSelectPro" ></label>
				                	<button  type="button" style="margin-top: 26px;" class="btn btn-info btn-sm" id="btnSelectPro"><i class="fa fa-home" aria-hidden="true"></i> ជ្រើសរើសអចលនទ្រព្យ</button>
					    		</div>
		            		</div>
		                    -->
		                </div>
		                
		                <div class="col-xs-12 row" style="padding:0px;">
		                	<div style="text-align: right;    margin-right: 5px;">
		                		<button  type="button" class="btn btn-info btn-sm" id="btnSelectPro"><i class="fa fa-home" aria-hidden="true"></i> ជ្រើសរើសអចលនទ្រព្យ</button>
		                	</div>
		                	
		                	<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;margin-top: -15px;">
		                		<span><b>ពត៍មានអចលនទ្រព្យ</b></span>
		                    	<div class="box-body table-responsive fix-header-tbl" style="height: 80px;padding: 0px;">
		        				  <table class="table table-hover" id="tblProduct" >
		        				    <thead>  
		            					<tr>
		            					  <th>លេខកូដ</th>
			        					  <th>ប្រភេទ</th>
			        					  <th>គំរោង</th>
			        					  <th class="text-right" style="padding-right: 25px;">តំលៃ $</th>
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
		        		      		<label  for="txtPayPer" > ប្រាក់ទូទាត់​ជាមុន  % </label><span> </span>
		        		        	<input type="text" maxlength="2" class="form-control text-right" id="txtPayPer" required="required"  placeholder="Enter loan amount" name="txtPayPer" autocomplete="off" />
		        		    	</div>
		                    </div>
		                    <div class="col-xs-3 padding-forms-right">
		                        <div class="form-group">
		        		      		<label  for="txtPayCash" > ប្រាក់ទូទាត់​ជាមុន $</label><span> </span>
		        		        	<input type="text" class="form-control text-right" id="txtPayCash" required="required"  placeholder="Enter loan amount" name="txtPayCash" autocomplete="off" />
		        		    	</div>
		                    </div>
		                    <div class="col-xs-3 padding-forms-right">
		                        <div class="form-group">
		        		      		<label  for="txtPayTime" > ចំនួនលើកទូទាត់​ជាមុន</label><span> </span>
		        		        	<input type="text" class="form-control text-right" id="txtPayTime" required="required"  placeholder="Enter loan amount" name="txtPayTime" autocomplete="off" />
		        		    	</div>
		                    </div>
		                </div>
		                
		                <div class="col-xs-12 row" style="padding:0px;margin-top: -10px;" >
		                	<div class="col-xs-3 padding-forms-left">
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
		                	
		                	<div class="col-xs-3 padding-forms-right text-right" style="padding-right: 5px;">
    	                        <button style="margin-top: 25px;" type="button" class="btn btn-warning btn-sm" id="btnCalInst"><i class="fa fa-plus"></i> គណនាតារាងបង់ប្រាក់</button>
    	                    	
		                	</div>
		                	
		                </div>
		                
		                <div class="col-xs-12 row" style="padding:0px;margin-top: -10px;">
		                	<div class="col-xs-4 padding-forms-left">
		                		<div class="form-group">
		                			<input type="checkbox" id="cboInstYn" name="cboInstYn"> <label  for="cboInstYn" > ធ្វើការរំលស់ជាមួយក្រុមហ៊ុន</label><span> </span>
		                			<input type="hidden" name="txt_com_inst_yn" id="txt_com_inst_yn" value="N"/>
		                		</div>
		                	</div>
		                	
		                </div>
		                
		                <div class="col-xs-12 row div_installment" style="padding:0px;display: none;margin-top: -10px;">
		                	<!--  -->
				    		<div class="col-xs-4 padding-forms-left">
		                        <div class="form-group" >
		        		      		<label  for="txtTotalLeftInst" > ប្រាក់ដើមនៅសល់</label><span> </span>
		        		        	<input type="text" disabled="disabled" class="form-control text-right" id="txtTotalLeftInst" placeholder="Enter loan amount" name="txtTotalLeftInst" autocomplete="off" />
		        		    	</div>
		                	</div>
		                	<div class="col-xs-4 padding-forms-right">
		                		<div class="form-group">
		        		      		<label  for="txtInterstRate" > អត្រាការប្រាក់ %(ក្នុងមួយឆ្នាំ) </label><span> </span>
		        		        	<input type="text"  maxlength="5" class="form-control text-right" id="txtInterstRate"  placeholder="Enter loan amount" name="txtInterstRate" autocomplete="off" />
		        		    	</div>
		                    </div>
		                    <div class="col-xs-4 padding-forms-right">
		                        <div class="form-group">
		        		      		<label  for="txtPeriod" > រយៈពេលរំលស់(ខែ)</label><span> </span>
		        		        	<input type="text" maxlength="3" class="form-control text-right" id="txtPeriod" placeholder="Enter loan amount" name="txtPeriod" autocomplete="off" />
		        		    	</div>
		                    </div>
		                   <!--  -->
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
		                <div class="col-xs-12 row" style="padding:0px;margin-top: -10px;">
		                	<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;">
		                		<!-- <span><b>ប្រវត្តិនៃការបង់ប្រាក់</b></span>--> 
		                    	<div class="box-body table-responsive fix-header-tbl" style="height: 185px;padding: 0px;">
		        				  <table class="table table-hover" id="tblInstallment" >
		        				    <thead>  
		            					<tr>
		            					  <th>ល.រ</th>
		            					  <th class="text-center">ថ្ងៃត្រូវបង់</th>
		            					  <th class="text-right">ភាគរយ%</th>
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
		                <!--
		                <div class="col-xs-12 row" style="padding:0px;">
		                	
				    		<div class="col-xs-3 padding-forms-left">
		                		<div class="form-group">
		            				<label for="txtContSD" >ថ្ងៃបង់ប្រាក់</label>
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
						      		<label  for="cboReceiver" >អ្នកទទួលប្រាក់(បុគ្គលិក)</label>
		                			 <select class="form-control" id="cboReceiver" name="cboReceiver" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសបុគ្គលិក ')" oninput="setCustomValidity('')">
			                    		
					                </select>
						    	</div>
		                    </div>
		                    <div class="col-xs-3 padding-forms-right">
		                        <div class="form-group">
		        		      		<label  for="txtPayPer" > ប្រាក់បង់  % </label><span> </span>
		        		        	<input type="text" maxlength="2" class="form-control text-right" id="txtPayPer" required="required"  placeholder="Enter loan amount" name="txtPayPer" autocomplete="off" />
		        		    	</div>
		                    </div>
		                    <div class="col-xs-3 padding-forms-right">
		                        <div class="form-group">
		        		      		<label  for="txtPayCash">ប្រាក់បង់ $ </label><span> </span>
		        		        	<input type="text" class="form-control text-right" id="txtPayCash" required="required"  placeholder="Enter loan amount" name="txtPayCash" autocomplete="off" />
		        		    	</div>
		                    </div>
					    	
		                </div>
		                
		                <div class="col-xs-12 row" style="padding:0px;">
		                    <div class="col-xs-3 padding-forms-left">
		                    	<div class="form-group">
			                        <label  for="cboPaymentMet" >វីធីបង់ប្រាក់</label>
			                		<select class="form-control" id="cboPaymentMet" name="cboPaymentMet" style="font-size: 14px;" required="required" oninvalid="this.setCustomValidity('​ ​សូមជ្រើសរើសវីធីបង់ប្រាក់ ')" oninput="setCustomValidity('')">
			                    		
				                	</select>
			                	</div>
		                    </div>
		                    <div class="col-xs-3 padding-forms-right">
		            			
				                <div class="form-group">
						      		<label  for="txtTran" >លេខប្រតិបត្តិការណ៍</label>
						        	<input type="text" class="form-control" id="txtTran" placeholder="Enter loan amount" name="txtTran" autocomplete="off" />
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
		                
		                <div class="col-xs-12 row" style="padding:0px;">
		                	
		                	
				    		<div class="col-xs-3 padding-forms-left">
		                		
		                		<div class="form-group totalPaidDiv" style="display: none;">
		        		      		<label  for="txtPayPenalty">ប្រាក់ពិន័យ $ </label><span> </span>
		        		        	<input type="text" class="form-control text-right" id="txtPayPenalty" placeholder="Enter loan amount" name="txtPayPenalty" autocomplete="off" />
		        		    	</div>
		                        
		                	</div>
		                	<div class="col-xs-3 padding-forms-right">
		                		<div class="form-group totalPaidDiv" style="display: none;">
		                		<label  for="txtTotalPaid" > ប្រាក់បានបង់សរុប</label><span> </span>
		        		        	<input type="text" disabled="disabled" class="form-control text-right" id="txtTotalPaid" placeholder="Enter loan amount" name="txtTotalPaid" autocomplete="off" />
		                		</div>
		                    </div>
		                    <div class="col-xs-3 padding-forms-right">
		                        <div class="form-group totalPaidDiv" style="display: none">
		        		      		<label  for="txtTotalLeft" > ប្រាក់ដើមនៅសល់</label><span> </span>
		        		        	<input type="text" disabled="disabled" class="form-control text-right" id="txtTotalLeft" placeholder="Enter loan amount" name="txtTotalLeft" autocomplete="off" />
		        		    	</div>
		                    </div>
		                    <div class="col-xs-3 padding-forms-right">
		        		    	<div class="form-group">
		        		      		<label  for="txtRealPayAmt" > ប្រាក់ត្រូវបង់សរុប</label><span> </span>
		        		        	<input type="text" disabled="disabled" class="form-control text-right" id="txtRealPayAmt" placeholder="Enter loan amount" name="txtRealPayAmt" autocomplete="off" />
		        		    	</div>
		                    </div>
					    	
		                </div>
		                
		                <div class="col-xs-12 row totalPaidDiv" style="padding:0px;display: none">
		                	<div class="col-xs-12 " style="padding-right: 0px;padding-left: 35px;">
		                		<span><b>ប្រវត្តិនៃការបង់ប្រាក់</b></span>
		                    	<div class="box-body table-responsive fix-header-tbl" style="height: 160px;padding: 0px;">
		        				  <table class="table table-hover" id="tblPayment" >
		        				    <thead>  
		            					<tr>
		            					  <th> </th>
		            					  <th>ថ្ងៃបង់ប្រាក់ </th>
			        					  <th>អ្នកទទួលប្រាក់ </th>
			        					  <th>វីធីបង់ប្រាក់</th>
			        					  <th class="text-right">ប្រាក់ពិន័យ $ </th>
			        					  <th class="text-right">បញ្ចុះ%</th>
			        					  <th class="text-right">ប្រាក់បង់ % </th>
			        					  <th class="text-right"  >ប្រាក់បង់ $</th>
			        					  <!-- <th class="text-right"  >បញ្ចុះតំលៃ $</th> 
			        					  <th class="text-right"  style="padding-right: 25px;">ប្រាក់បង់សរុប</th>
		            					</tr>
		        					</thead>
		        					<tbody>
		        					   
		        					</tbody>
		        					
		        				  </table>
		        				</div> 	
		                	</div>
		    				 
		                </div>
		                -->
		        	</div>
		        	<div class="modal-footer" >
			            <input type="hidden" value="" id="statusID" name="statusID" />
			            <button type="button" class="btn btn-info btn-sm" id="btnPrint" style="display: none;"><i class="fa fa-print" aria-hidden="true"></i> បោះពុម្ពតារាងបង់ប្រាក់​</button> 
			            <!--<button type="submit" class="btn btn-primary btn-sm" id="btnAddPayment" style="display: none;"><i class="fa fa-plus"></i> បង់ប្រាក់បន្ថែម</button>-->
			            <button data-i18ncd="btn_save_new" type="submit" class="btn btn-success btn-sm" id="btnSaveNew" style="display:none">Save + New</button>
			            <button data-i18ncd="btn_save" type="submit" class="btn btn-primary btn-sm" id="btnSave">Save</button>
			            <button data-i18ncd="btn_close" type="button" class="btn btn-default btn-sm" id="btnClose">Close</button>
			        </div>
			    </div>
			    <!--installment  --> 
			    <div id="divInstallmentView" class="tab-pane fade">
			         
			    	
	                <div class="modal-footer" >
	                	<button type="button" style="display: none" class="btn btn-danger btn-sm" id="btnUpdateInstallment"><i class="fa fa-refresh" aria-hidden="true"></i> កែប្រែ ទិន្ន័យបង់រំលស់</button>
			            <button type="button" class="btn btn-primary btn-sm" id="btnSaveInstallment"><i class="fa fa-check" aria-hidden="true"></i> រក្សាទុក ទិន្ន័យបង់រំលស់</button>
			            <button data-i18ncd="btn_close" type="button" class="btn btn-default btn-sm" id="btnClose">Close</button>
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
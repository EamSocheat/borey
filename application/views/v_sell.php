<?php echo $header; ?>
<!--  test git -->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
		<i class="fa fa-handshake-o"></i>
		<span data-i18ncd="lb_contract">Contract</span>
		<small data-i18ncd="lb_information">Information</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="javascript:"><i class="fa fa-dashboard"></i><span data-i18ncd="lb_dasbord">Dashboard</span></a></li>
			<li class="active" data-i18ncd="lb_contract">Contract</li>
		</ol>
	</section>
	<!-- Main content -->
	<section class="content">
		<!-- Main row -->
		<div class="row">
			<!-- main col -->
			<section class="">
				<div class="col-xs-12">
					<div class="box">
						<!-- box-header -->
						<div class="box-header">
							
							<div class="box box-solid box-search">
								<div class="box-header with-border">
									<i class="fa fa-search-plus" aria-hidden="true"></i>
									<h3 class="box-title" data-i18ncd="lb_search">Search</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<div class="row" >
										<div class="col-sm-12 col-md-12 col-lg-12 row" style="
											">
											<div class="col-sm-2 col-md-2 col-lg-2" style="
												">
												<div class="form-group form-inline">
													<label for="txtSrchContCode" class="control-label"  style="
														margin-bottom: 7px;
														display: -webkit-box;
													">លេខសម្គាល់​​</label>
													<input type="text" class="form-control input-sm" id="txtSrchContCode" placeholder="" style="
													">
												</div>
											</div>
											<div class="col-sm-2 col-md-2 col-lg-2" style="
												">
												<div class="input-group date" style="
													">
													<label for="txtSrchContSD" class="control-label" style="
														margin-bottom: 7px;
														display: table-caption;
													">ថ្ងៃកក់ប្រាក់​​​</label>
													<div class="input-group-addon" id="txtContSDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;padding: 5px 11px;">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control pull-left date-pick" id="txtSrchContSD" name="txtSrchContSD" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="" style="font-size: 12px;width: 60%;">
												</div>
											</div>
											<div class="col-sm-2 col-md-2 col-lg-2" style="
												">
												<div class="input-group date">
													<label for="txtContEDIcon" class="control-label"  style="
														display: table-caption;
														margin-bottom: 7px;"> ថ្ងៃកក់ប្រាក់​​​​</label>
													<div class="input-group-addon" id="txtContEDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control pull-left date-pick" id="txtSrchContED" name="txtSrchContED" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="áž”áž‰áŸ’áž‡áž¼áž› " style="font-size: 12px;width: 60%;">
												</div>
											</div>
											
                                            
                                            <div class="col-sm-2 col-md-2 col-lg-2" style="
												">
												<div class="input-group date" style="
													">
													<label for="txtSrchContSDExp" class="control-label" style="margin-bottom: 7px;display: table-caption;"> ថ្ងៃផុតកំណត់​​</label>
													<div class="input-group-addon"  style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;padding: 5px 11px;">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control pull-left date-pick" id="txtSrchContSDExp" name="txtSrchContSDExp" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="" style="font-size: 12px;width: 60%;">
												</div>
											</div>
											<div class="col-sm-2 col-md-2 col-lg-2" style="
												">
												<div class="input-group date">
													<label for="txtSrchContEDExp" class="control-label"  style="
														display: table-caption;
														margin-bottom: 7px;"> ថ្ងៃផុតកំណត់​​​​</label>
													<div class="input-group-addon"  style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control pull-left date-pick" id="txtSrchContEDExp" name="txtSrchContEDExp" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="áž”áž‰áŸ’áž‡áž¼áž› " style="font-size: 12px;width: 60%;">
												</div>
											</div>
											
											
										</div>
										<div class="col-sm-12 col-md-12 col-lg-12">
											
										</div>
									</div>
									
									<div class="row" >
										<div class="col-sm-12 col-md-12 col-lg-12 row" style="">
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
                                                <div class="form-group form-inline">
                                                    <label for="txtSrchCusNm" class="control-label" data-i18ncd="lb_customer" style="margin-bottom: 7px;display: -webkit-box;">អតិថិជន </label>
                                                    <input type="text" class="form-control input-sm" id="txtSrchCusNm" placeholder="អតិថិជន">
                                                </div>
                                            </div>
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
												<div class="form-group form-inline">
													<label for="cboStatus" class="control-label" data-i18ncd="lb_status" style="
														margin-bottom: 7px;
														display: -webkit-box;
													">ការប្រើប្រាស់ </label>
													<select class="form-control  input-sm" id="cboStatus" name="cboStatus" style="font-size: 14px;min-width: 150px;">
														<option value="">សូមជ្រើសរើស</option>
														<option value="B">បើក​</option>
														<option value="S">លក់​</option>
														<option value="E">ផុតកំណត់ </option>
														<option value="C">ត្រលប់ប្រាក់ </option>
													</select>
												</div>
											</div>
											
											
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
                                                <div class="form-group form-inline">
                                                    <label for="txtSrchSeller" class="control-label" style="margin-bottom: 7px;display: -webkit-box;">អ្នកលក់(បុគ្គលិក) </label>
                                                    <select class="form-control input-sm" id="cboSeller" name="cboSeller" >
                    	                    			
                        			                </select>
                                                </div>
                                            </div>
										
											
										</div>
										<div class="col-sm-12 col-md-12 col-lg-12">
											<button id="btnSearch" type="button" class="btn btn-success btn-sm pull-right" onclick="_thisPage.loadData(1);"><i class="fa fa-search" aria-hidden="true"></i> <span data-i18ncd="lb_search">Search</span></button>
											<button id="btnReset" type="button" class="btn btn-warning btn-sm pull-right" style="margin-right: 5px"><i class="fa fa-refresh" aria-hidden="true"></i> <span data-i18ncd="btn_reset">Reset</span></button>
										</div>
									</div>
									
									
								</div>
								<!-- /.box-body -->
							</div>
							
						</div>
						<!-- /.box-header -->
						
						<!-- button -->
						<div class="row">
							<div class="col-xs-12">
								<div class="col-xs-12">
									<button type="button" id="btnDelete" class="btn btn-danger btn-sm" style="margin-right: 5px"><i class="fa fa-trash" aria-hidden="true"></i> <span data-i18ncd="btn_delete">Delete</span></button>
									<!-- <button type="button" id="btnEdit" class="btn btn-primary btn-sm" style="margin-right: 5px"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <span data-i18ncd="btn_edit">Edit</span></button> -->
									<button type="button" id="btnAddNew" class="btn btn-default btn-sm" onclick="_thisPage.addNewData();"><i class="fa fa-plus" aria-hidden="true"></i> <span data-i18ncd="btn_add_new">Add New</span></button>
									<!-- <button type="button" id="btnDownExcel" class="btn btn-success btn-sm" style="margin-left: 7px;"><i class="fa fa-download" aria-hidden="true"></i> <span data-i18ncd="btn_excel">Download Excel</span></button>-->
									<div style="margin-left: 5px;display: none;">
		                                <form method="post" action="<?php echo base_url(); ?>Contract/download_excel" id="btnExcel">
		                                    <input type="submit" value="Submit">
		                                    <input type="hidden" name="conIdArray" id="contId" class="btn btn-success" value="" />
		                                </form>
		                            </div>
								</div>
							</div>
						</div>
						<!-- /.button -->
						
						<div class="col-sm-12">
							
							<div class="pull-right" style="padding-bottom: 5px;">
								<form class="form-inline" action="">
									<label for="limitRow" data-i18ncd="lb_records">Records</label>
									<select class="form-control input-sm" id="perPage" onchange="_thisPage.loadData(1);">
										<option value="1" data-i18ncd="lb_row1">1 rows</option>
										<option value="10" data-i18ncd="lb_row10" selected="selected">10 rows</option>
										<option value="20" data-i18ncd="lb_row20" >20 rows</option>
										<option value="50" data-i18ncd="lb_row50">50 rows</option>
										<option value="100" data-i18ncd="lb_row100">100 rows</option>
										<option value="10000000" data-i18ncd="lb_all">All</option>
									</select>
								</form>
							</div>
							<br>
						</div>
						
						<div class="box-body table-responsive">
							<table class="table table-hover" id="tblContract">
								<thead>
									<tr>
										<th><input type="checkbox" id="chkAllBox" ></th>
										<th class="txt_c">លេខសម្គាល់ </th>
										<th class="txt_c">ថ្ងៃកក់ប្រាក់</  </th>
										<th class="txt_r">ថ្ងៃផុតកំណត់</<< </th>
										<th class="text-right">ចំនូនលុយកក់</    </th>
										<th class="text-right">វីធីបង់ប្រាក់</   </th>
										<th class="text-right">អតិថិជន</  </th>
										<th class="text-right">អ្នកលក់(បុគ្គលិក)</th>
										<th class="text-center">ការប្រើប្រាស់</  </th>
										<th data-i18ncd="lb_action"​ class="txt_c">Action</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
						<!-- /.box-body -->
						<!-- box-footer -->
						<div class="box-footer clearfix">
							<ul class="pagination pagination-sm no-margin pull-right" id="paging" style="display:none">
								<!--<li><a href="javascript:">&laquo;</a></li>-->
								<li><a href="javascript:">1</a></li>
								<li><a href="javascript:">2</a></li>
								<li><a href="javascript:">3</a></li>
								<!--<li><a href="javascript:">&raquo;</a></li>-->
							</ul>
						</div>
						<!-- /.box-footer -->
					</div>
					<!-- /.box -->
					<div>
					</div>
				</div>
			</section>
			<!-- main col -->
		</div>
		<!-- /.row (main row) -->
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<?php echo $footer; ?>
<script src="<?php echo base_url('assets/') ?>js/pages/v_sell.js"></script>
<?php echo $iframe; ?>
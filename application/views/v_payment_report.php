<?php echo $header; ?>
<!--  test git -->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
		<i class="fa fa-shopping-cart"></i>
		<span >បង់ប្រាក់</span>
		<small data-i18ncd="lb_information">Information</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="javascript:"><i class="fa fa-dashboard"></i><span data-i18ncd="lb_dasbord">Dashboard</span></a></li>
			<li class="active" >បង់ប្រាក់</li>
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
								<div class="box-body" style="display: block;">
									<div class="row" >
										<div class="col-sm-12 col-md-12 col-lg-12 row" style="">
											
											<div class="col-sm-3 col-md-3 col-lg-3" style="
												">
												<div class="input-group date" style="
													">
													<label for="txtSrchContSD" class="control-label" style="
														margin-bottom: 7px;
														display: table-caption;
													">ថ្ងៃបង់ប្រាក់</label>
													<div class="input-group-addon" id="txtContSDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;padding: 5px 11px;">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" style="width: 100%" class="form-control pull-left date-pick input-sm" id="txtSrchContSD" name="txtSrchContSD" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="" style="font-size: 12px;width: 60%;">
												</div>
											</div>
											<div class="col-sm-3 col-md-3 col-lg-3" style="
												">
												<div class="input-group date">
													<label for="txtSrchContED" class="control-label"  style="
														display: table-caption;
														margin-bottom: 7px;">ថ្ងៃបង់ប្រាក់</label>
													<div class="input-group-addon" id="txtContEDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" style="width: 100%" class="form-control pull-left date-pick input-sm" id="txtSrchContED" name="txtSrchContED" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="áž”áž‰áŸ’áž‡áž¼áž› " style="font-size: 12px;width: 60%;">
												</div>
											</div>
											<div class="col-sm-3 col-md-3 col-lg-3" style="
												">
												<div class="form-group form-inline">
													<label for="txtSrchSellCode" class="control-label"  style="
														margin-bottom: 7px;
														display: -webkit-box;
													">លេខការលក់</label>
													<input type="text" style="width: 100%" class="form-control input-sm" id="txtSrchSellCode" placeholder="" style="
													">
												</div>
											</div>
											
											<div class="col-sm-3 col-md-3 col-lg-3" style="">
												<div class="form-group form-inline">
                                                    <label for="txtSrchProCode" class="control-label" style="margin-bottom: 7px;display: -webkit-box;">	លេខកូដផ្ទះ </label>
                                                    <input type="text" style="width: 100%" class="form-control input-sm" id="txtSrchProCode" placeholder="អតិថិជន">
                                                </div>
											</div>
											
										</div>
										<div class="col-sm-12 col-md-12 col-lg-12 row">
											<div class="col-sm-3 col-md-3 col-lg-3" style="">
												<div class="form-group form-inline">
                                                    <label for="txtSrchInstPaidCode" class="control-label" style="margin-bottom: 7px;display: -webkit-box;">លេខបង្កាន់ដៃ  </label>
                                                    <input type="text" style="width: 100%" class="form-control input-sm" id="txtSrchInstPaidCode" placeholder="អតិថិជន">
                                                </div>
											</div>
										</div>
									</div>
									
									<div class="row" >
										
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
									<!-- -->
									<button type="button" id="btnDelete" class="btn btn-danger btn-sm" style="margin-right: 5px"><i class="fa fa-trash" aria-hidden="true"></i> <span data-i18ncd="btn_delete">Delete</span></button>
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
						
						<div class="box-body " style="overflow-x:auto;">
							<table class="table table-hover" id="tblInstallment"  style="width: 2200px;">
								<thead>
									<tr>
										<!-- <th><input type="checkbox" id="chkAllBox" ></th> -->
										<th></th>
										<th></th>
										<th class="text-center">ថ្ងៃបង់ប្រាក់ </th>
										<th class="text-center">អ្នកទទួលប្រាក់</th>
										<th class="text-center">វីធីបង់ប្រាក់</th>
										<th class="text-center">លេខប្រតិបត្តិការណ៍</th>
										<th class="text-center">ការពិពណ៌នា</th>
										<th class="text-right">ប្រាក់បានបង់សរុប$</th>
										<th class="text-center">ប្រាក់ពិន័យ​$</th>
										
										<th class="text-center">លេខកូដផ្ទះ </th>
										<th class="text-center">លេខការលក់</th>
										<th class="text-center">អតិថិជន</th>
										<th class="text-center">ល.រ</th>
										<th class="text-center">ថ្ងៃបង់ប្រាក់</th>
										<th class="text-center">ភាគរយ%</th>
										<th class="text-right">បញ្ចុះ$</th>
										<th class="text-right">ប្រាក់ដើម$</th>
										<th class="text-right">ប្រាក់ការ$</th>
										<th class="text-right">ប្រាក់បង់សរុប$</th>
										<th class="text-right" style="padding-right: 20px;">ប្រាក់ដើមនៅសល់$</th>
										<!-- <th data-i18ncd="lb_action"​ class="text-center">Action</th> -->
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
<script src="<?php echo base_url('assets/') ?>js/pages/v_payment_report.js"></script>
<?php echo $iframe; ?>
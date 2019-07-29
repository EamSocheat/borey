<?php echo $header; ?>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				<i class="fa fa-users"></i> <span data-i18ncd="lb_expend">Expend</span>
				<small data-i18ncd="lb_information">Information</small>
			</h1>

			<ol class="breadcrumb">
				<li><a href="Dashboard"><i class="fa fa-dashboard"></i> <span data-i18ncd="lb_dashbord">Dashboard</span></a></li>
				<li class="active" data-i18ncd="lb_expend">Expend</li>
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
													<div class="form-group form-inline" >
														<label for="cboSupNm" class="control-label" data-i18ncd="lb_supp_nm" style="
                                                        margin-bottom: 7px;display: -webkit-box;
                                                    ">អ្នកផ្គត់ផ្គង់</label>
														<!-- <input type="text" class="form-control input-sm" name="txtSrchSuppNm" id="txtSrchSuppNm" placeholder="អ្នកផ្គត់ផ្គង់" style="width: 100%;">-->
														<select class="form-control" id="cboSupNm" name="cboSupNm" style="font-size: 14px;" onchange="getData()">
															<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>
															<option value="1" data-i18ncd="lb_project_1">static</option>
														</select>
													</div>
												</div>
												<div class="col-sm-2 col-md-2 col-lg-2" style="">
													<div class="form-group form-inline">
														<label for="projectNm" class="control-label" data-i18ncd="lb_project" style="
                                                        margin-bottom: 7px;display: -webkit-box;
                                                    ">គម្រោង</label>
														<!-- <input type="text" class="form-control input-sm" id="txtSrchProNm" name="txtSrchProNm" placeholder="គម្រោង" style="width: 100%;">-->
														<select class="form-control" id="projectNm" name="projectNm" style="font-size: 14px;" onchange="getData()">
															<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>
															<option value="1" data-i18ncd="lb_project_1">static</option>
														</select>
													</div>
												</div>
												<div class="col-sm-2 col-md-2 col-lg-2" style="">
													<div class="form-group form-inline">
														<label for="cboStaffPay" class="control-label" data-i18ncd="lb_staff_nm" style="margin-bottom: 7px;display: -webkit-box;">បុគ្គលិក(អ្នកទូទាត់)</label>
														<!-- <input type="text" class="form-control input-sm" id="txtSrchStaffNm" name="txtSrchStaffNm" placeholder="បុគ្គលិក(អ្នកទូទាត់)" style="width: 100%;">-->
														<select class="form-control" id="cboStaffPay" name="cboStaffPay" style="font-size: 14px;" onchange="getData()">
															<option value="" data-i18ncd="lb_project_choose" selected>សូមជ្រើសរើស</option>
															<option value="0" data-i18ncd="lb_staff_admin">static</option>
														</select>
													</div>
												</div>
												<div class="col-sm-6 col-md-6 col-lg-6" style="display: inline-flex;">
													<div class="input-group date" style="width: 100%;">
														<label for="txtSrchExpendSD" class="control-label" data-i18ncd="lb_expend_start" style="margin-bottom: 7px;display: table-caption;">ថ្ងៃចាប់ផ្ដើមការចំណាយ</label>
														<div class="input-group-addon" id="txtSrchExpendSDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;padding: 5px 11px;">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" class="form-control pull-left date-pick" id="txtSrchExpendSD" name="txtSrchExpendSD" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="បញ្ជូល ថ្ងៃចាប់ផ្ដើមការបង់លុយ" style="font-size: 12px;width: 80%;">
													</div>
													<div class="input-group date" style="margin-top: 26px;width: 100%;">
														<label for="txtSrchExpendED" class="control-label" data-i18ncd="lb_expend_end" style="margin-bottom: 7px;display: none;">ថ្ងៃចាប់ផ្ដើមការចំណាយ</label>
														<div class="input-group-addon" id="txtSrchExpendEDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" class="form-control pull-left date-pick" id="txtSrchExpendED" name="txtSrchExpendED" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="បញ្ជូល ថ្ងៃបញ្ចប់ការបង់លុយ" style="font-size: 12px;width: 80%;">
													</div>
												</div>
											</div>
											<div class="col-sm-12 col-md-12 col-lg-12">

											</div>
										</div>

										<div class="row" >
											<div class="col-sm-12 col-md-12 col-lg-12">
												<button id="btnSearch" type="button" class="btn btn-success btn-sm pull-right" onclick="getData(1);"><i class="fa fa-search" aria-hidden="true"></i> <span data-i18ncd="lb_search">Search</span></button>
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
									<div class="col-xs-12" style="display: flex;">
										<button type="button" id="btnDelete" class="btn btn-danger btn-sm" style="margin-right: 5px"><i class="fa fa-trash" aria-hidden="true"></i> <span data-i18ncd="btn_delete">Delete</span></button>
										<!-- <button type="button" id="btnEdit" class="btn btn-primary btn-sm" style="margin-right: 5px"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <span data-i18ncd="btn_edit">Edit</span></button> -->
										<button type="button" id="btnAddNew" class="btn btn-default btn-sm"><i class="fa fa-plus" aria-hidden="true"></i> <span data-i18ncd="btn_add_new">Add New</span></button>
<!--										<button type="button" id="btnDownExcel" class="btn btn-success btn-sm" style="margin-left: 7px;"><i class="fa fa-download" aria-hidden="true"></i> <span data-i18ncd="btn_excel">Download Excel</span></button>-->
<!--										<div style="margin-left: 5px;display: none;">-->
<!--											<form method="post" action="--><?php //echo base_url(); ?><!--Expend/download_excel" id="btnExcel">-->
<!--												<input type="submit" value="Submit">-->
<!--												<input type="hidden" name="cusIdArray" class="btn btn-success" value="" id="cusId" />-->
<!--											</form>-->
<!--										</div>-->
									</div>
								</div>
							</div>
							<!-- /.button -->

							<div class="col-sm-12">
								<div class="pull-right" style="padding-bottom: 5px;">
									<form class="form-inline" action="">
										<label for="limitRow" data-i18ncd="lb_records">Records</label>
										<select class="form-control input-sm" id="perPage">
											<option value="10" data-i18ncd="lb_row10" selected>10 rows</option>
											<option value="20" data-i18ncd="lb_row20">20 rows</option>
											<option value="50" data-i18ncd="lb_row50">50 rows</option>
											<option value="100" data-i18ncd="lb_row100">100 rows</option>
											<option value="10000000" data-i18ncd="lb_all">All</option>
										</select>
									</form>
								</div>
								<br>
							</div>


							<div class="box-body table-responsive">
								<table class="table table-hover" id="tblExpend">
									<colgroup>
										<col style="width:5px;">
										<col style="width:150px;">
										<col style="width:150px;">
										<col style="width:150px;">
										<col style="width:100px;">
										<col style="width:100px">
										<col style="width:5px;">
									</colgroup>
									<thead>
									<tr>
										<th><input type="checkbox" id="chkAllBox" style="display: none;"></th>
										<th data-i18ncd="lb_supplier">អ្នកផ្គត់ផ្គង់</th>
										<th data-i18ncd="lb_total_exp" style="text-align: right;">ការចំណាយសរុប</th>
										<th data-i18ncd="lb_project">គម្រោង</th>
										<th data-i18ncd="lb_date_exp">កាលបរិច្ឆេទចំណាយ</th>
										<th data-i18ncd="lb_staff_expend">បុគ្គលិក(អ្នកទូទាត់)</th>
										<th style="text-align: center;" data-i18ncd="lb_action">Action</th>
									</tr>
									</thead>
									<tbody>
										<!--<tr>
											<td><input type='checkbox'></td>
											<td><div>supllier 000001</div></td>
											<td><div style="text-align: right">$100,000</div></td>
											<td><div>project 000001</div></td>
											<td><div>13-07-2019</div></td>
											<td><div>សុមិនា</div></td>
											<td class="text-center">
												<button type="button" class="btn btn-primary btn-xs">
													<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
												</button>
											</td>
										</tr>-->
									</tbody>

								</table>
							</div>
							<!-- /.box-body -->
							<!-- box-footer -->
							<div class="box-footer clearfix">
								<ul class="pagination pagination-sm no-margin pull-right" id="paging" style="display:none">
									<!--<li><a href="#">&laquo;</a></li>-->
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<!--<li><a href="#">&raquo;</a></li>-->
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
	<script src="<?php echo base_url('assets/') ?>js/pages/v_expend.js"></script>
<?php echo $iframe; ?>
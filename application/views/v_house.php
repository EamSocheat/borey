<?php echo $header; ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<i class="fa fa-building-o"></i> <span data-i18ncd="lb_house">House</span>
			<small data-i18ncd="lb_information">Information</small>
		</h1>

		<ol class="breadcrumb">
			<li><a href="Dashboard"><i class="fa fa-dashboard"></i> <span data-i18ncd="lb_dashbord">Dashboard</span></a></li>
			<li class="active" data-i18ncd="lb_house">House</li>
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
										<div class="col-sm-12 col-md-12 col-lg-12 row" style="">
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
												<div class="form-group form-inline">
													<label for="projectNm" class="control-label" data-i18ncd="lb_project" style="
                                                        margin-bottom: 7px;display: -webkit-box;
                                                    ">គម្រោង</label>
													<select class="form-control" id="projectNm" name="projectNm" style="font-size: 14px;" onchange="getData()">
														<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>
														<option value="1" data-i18ncd="lb_project_1">static</option>
													</select>
												</div>
											</div>
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
												<div class="form-group form-inline" >
													<label for="cboCatNm" class="control-label" data-i18ncd="lb_cat" style="
                                                        margin-bottom: 7px;display: -webkit-box;
                                                    ">ប្រភេទទំនិញ</label>
													<select class="form-control" id="cboCatNm" name="cboCatNm" style="width: 143px;font-size: 14px;" onchange="getData()">
														<option value="" data-i18ncd="lb_cat_choose">សូមជ្រើសរើស</option>
														<option value="1" data-i18ncd="lb_category_1">static</option>
													</select>
												</div>
											</div>
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
												<div class="form-group form-inline">
													 <label for="txtCodePay" class="control-label" data-i18ncd="lb_pro_code" style="margin-bottom: 7px;display: -webkit-box;">លេខកូដ</label>
													 <input type="text" class="form-control input-sm" id="txtCodePay" name="txtCodePay" placeholder="េខកូដ" style="width: 100%;">
												</div>
											</div>
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
												<div class="form-group form-inline" >
													<label for="cboStatusNm" class="control-label" data-i18ncd="lb_status" style="
                                                        margin-bottom: 7px;display: -webkit-box;
                                                    ">ការប្រើប្រាស់</label>
													<select class="form-control" id="cboStatusNm" name="cboStatusNm" style="width: 143px;font-size: 14px;" onchange="getData()">
														<option value="1" data-i18ncd="lb_status_active">នៅប្រើប្រាស់</option>
														<option value="0" data-i18ncd="lb_status_inactive">ឈប់ប្រើប្រាស់</option>
													</select>
												</div>
											</div>
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
												<div class="form-group form-inline">
													<label for="txtMinPrice" class="control-label" data-i18ncd="lb_pro_price" style="margin-bottom: 7px;display: -webkit-box;">តម្លៃអចលនទ្រព្យ</label>
													<input type="text" class="form-control input-sm" id="txtMinPrice" name="txtMinPrice" placeholder="តម្លៃអចលនទ្រព្យ" style="width: 100%;">
												</div>
											</div>
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
												<div class="form-group form-inline" style="margin-top: 26px;">
													<label for="txtMaxPrice" class="control-label" data-i18ncd="lb_pro_price" style="display: none;margin-bottom: 7px;">តម្លៃអចលនទ្រព្យ</label>
													<input type="text" class="form-control input-sm" id="txtMaxPrice" name="txtMaxPrice" placeholder="តម្លៃអចលនទ្រព្យ" style="width: 100%;">
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
							<table class="table table-hover" id="tblHouse">
								<colgroup>
									<col style="width:5px;">
									<col style="width:5px;">
									<col style="width:130px;">
									<col style="width:50px;">
									<col style="width:50px;">
									<col style="width:50px;">
									<col style="width:50px">
									<col style="width:50px;">
								</colgroup>
								<thead>
								<tr>
									<th><input type="checkbox" id="chkAllBox" style="display: none;"></th>
									<th></th>
									<th data-i18ncd="lb_pro_cd">លេខកូដ</th>
									<th data-i18ncd="lb_sale_price" style="text-align: right;">តម្លៃផ្ទះ</th>
									<th data-i18ncd="lb_height">ប្រវែងទទឹង</th>
									<th data-i18ncd="lb_width">ប្រវែងបណ្ដោយ</th>
									<th data-i18ncd="lb_area">ទំហំផ្ទះ</th>
									<th style="text-align: center;" data-i18ncd="lb_action">Action</th>
								</tr>
								</thead>
								<tbody>
									<!--<tr class="cur-pointer">
										<td><div class="line-height" style="width: 10px;"><input type='checkbox'></div></td>
										<td class='cus_image' style=''>
											<div style="width: 10px;">
												<img style='width: 45px;height: 45px;' src="<?php /*echo base_url('\assets\image\house_cv-h01.jpg') */?>" />
											</div>
										</td>
										<td><div class="line-height">House CV-H01</div></td>
										<td><div class="line-height" style="text-align: right">$100,000</div></td>
										<td><div class="line-height hous-height">10</div></td>
										<td><div class="line-height hous-width">5</div></td>
										<td><div class="line-height hous-area">50</div></td>
										<td class="text-center">
											<button type="button" class="btn btn-primary btn-xs" style="margin-top: 12px;">
												<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
											</button>
										</td>
									</tr>
									<tr class="cur-pointer">
										<td><div class="line-height"><input type='checkbox'></div></td>
										<td class='cus_image' style=''>
											<div style="width: 5px;">
												<img style='width: 45px;height: 45px;' src="<?php /*echo base_url('\assets\image\house_cv-h01.jpg') */?>" />
											</div>
										</td>
										<td><div class="line-height">House CV-H01</div></td>
										<td><div class="line-height" style="text-align: right">$100,000</div></td>
										<td><div class="line-height hous-height">10</div></td>
										<td><div class="line-height hous-width">5</div></td>
										<td><div class="line-height hous-area">50</div></td>
										<td class="text-center">
											<button type="button" class="btn btn-primary btn-xs" style="margin-top: 12px;">
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
<script src="<?php echo base_url('assets/') ?>js/pages/v_house.js"></script>
<?php echo $iframe; ?>

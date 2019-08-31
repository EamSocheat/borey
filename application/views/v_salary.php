<?php echo $header; ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<i class="fa fa-university"></i> <span data-i18ncd="lb_salary">Salary</span>
			<small data-i18ncd="lb_information">Information</small>
		</h1>

		<ol class="breadcrumb">
			<li><a href="Dashboard"><i class="fa fa-dashboard"></i> <span data-i18ncd="lb_dashbord">Dashboard</span></a></li>
			<li class="active" data-i18ncd="lb_salary">Salary</li>
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
													<label for="staffNm" class="control-label" data-i18ncd="lb_staff" style="margin-bottom: 7px;display: -webkit-box;">បុគ្គលិក</label>
													<select class="form-control" id="staffNm" name="staffNm" style="font-size: 14px;" onchange="getData()">
														<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>
														<option value="1" data-i18ncd="lb_project_1">static</option>
													</select>
												</div>
											</div>
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
												<div class="form-group form-inline">
													<label for="cboStatus" class="control-label" data-i18ncd="lb_cat" style="margin-bottom: 7px;display: -webkit-box;">ការប្រើប្រាស់</label>
													<select class="form-control" id="cboStatus" name="cboStatus" style="width: 143px;font-size: 14px;" onchange="getData()">
														<option value="" data-i18ncd="lb_status_choose">សូមជ្រើសរើស</option>
														<option value="P" data-i18ncd="lb_prepare">ព្រាងទុក</option>
														<option value="G" data-i18ncd="lb_given">បានប្រគល់</option>
													</select>
												</div>
											</div>
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
												<label for="txtSalMonth" class="control-label" data-i18ncd="lb_pro_code" style="margin-bottom: 7px;display: -webkit-box;">ខែបើកប្រាក់</label>
												<div class="input-group date">
													<div class="input-group-addon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;" id="salMonthIcon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control input-sm" id="txtSalMonth" name="txtSalMonth" placeholder="បញ្ជូល ខែបើកប្រាក់" style="width: 100%;" onchange="getData()">
												</div>
											</div>
										</div>
									</div>

									<div class="row">
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
						<div class="row test-est">
							<div class="col-xs-12">
								<div class="col-xs-12" style="display: flex;">
									<button type="button" id="btnDelete" class="btn btn-danger btn-sm" style="margin-right: 5px"><i class="fa fa-trash" aria-hidden="true"></i> <span data-i18ncd="btn_delete">លុប</span></button>
									<button type="button" id="btnAddNew" class="btn btn-default btn-sm"><i class="fa fa-plus" aria-hidden="true"></i> <span data-i18ncd="btn_add_new">បន្ថែម&#8203;ថ្មី</span></button>
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
							<table class="table table-hover" id="tblSalary">
								<colgroup>
									<col style="width:5px;">
									<!--<col style="width:5px;">
									<col style="width:5px;">-->
									<col style="width:50px;">
									<col style="width:50px;">
									<col style="width:50px;">
									<col style="width:50px;">
									<col style="width:50px;">
									<col style="width:50px">
									<col style="width:10px;">
									<col style="width:10px;">
								</colgroup>
								<thead>
									<tr>
										<th><input type="checkbox" id="chkAllBox" style="display: none;"></th>
										<!--<th data-i18ncd="">ថៃ្ងចាប់ផ្តើម</th>
										<th data-i18ncd="">ថ្ងៃបញ្ចប់</th>-->
										<th data-i18ncd="">ខែបើកប្រាក់</th>
										<th data-i18ncd="" style="text-align: right;">ប្រាក់ខែ</th>
										<th data-i18ncd="" style="text-align: right;">ប្រាក់កំរៃជើងសារ</th>
										<th data-i18ncd="" style="text-align: right;">ប្រាក់បន្ថែមម៉ោង</th>
										<th data-i18ncd="" style="text-align: right;">ប្រាក់ខែសរុប</th>
										<th data-i18ncd="" style="">ការប្រើប្រាស់</th>
										<th style="text-align: center;" data-i18ncd="lb_action">Action</th>
									</tr>
								</thead>
								<tbody>
									<tr class="cur-pointer">
										<td><div class="" style="width: 10px;"><input type='checkbox'></div></td>
										<td><div class="">08-2019</div></td>
										<td><div class="" style="text-align: right">$100,000</div></td>
										<td><div class="" style="text-align: right">$100,000</div></td>
										<td><div class="" style="text-align: right">$100,000</div></td>
										<td><div class="" style="text-align: right">$200,000</div></td>
										<td><div class="" style="">ព្រាងទុក</div></td>
										<td class="text-center">
											<button type="button" class="btn btn-primary btn-xs">
												<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
											</button>
										</td>
									</tr>
									<tr class="cur-pointer">
										<td><div class="" style="width: 10px;"><input type='checkbox'></div></td>
										<!--<td><div class="">09-08-2019</div></td>
										<td><div class="">09-08-2019</div></td>-->
										<td><div class="">08-2019</div></td>
										<td><div class="" style="text-align: right">$100,000</div></td>
										<td><div class="" style="text-align: right">$100,000</div></td>
										<td><div class="" style="text-align: right">$100,000</div></td>
										<td><div class="" style="text-align: right">$200,000</div></td>
										<td><div class="" style="">បានប្រគល់</div></td>
										<td class="text-center">
											<button type="button" class="btn btn-primary btn-xs">
												<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
											</button>
										</td>
									</tr>
									<tr class="total">
										<td class="" colspan="5" style="text-align: right;font-weight: 600;">សរុបប្រាក់ខែបុគ្គលិក: </td>
										<td class="" style="text-align: right;"><b>12,369,565.23</b></td>
										<td class="" style="text-align: right;"></td>
										<td class="" style="text-align: right;"></td>
									</tr>

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
<script src="<?php echo base_url('assets/') ?>js/pages/v_salary.js"></script>
<?php echo $iframe; ?>

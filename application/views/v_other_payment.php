<?php echo $header; ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<i class="fa fa-money"></i> <span >បង់ប្រាក់ សេវាបន្ថែម</span>
			<small data-i18ncd="lb_information">Information</small>
		</h1>

		<ol class="breadcrumb">
			<li><a href="Dashboard"><i class="fa fa-dashboard"></i> <span data-i18ncd="lb_dashbord">Dashboard</span></a></li>
			<li class="active" >បង់ប្រាក់ សេវាបន្ថែម</li>
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
													<label for="staffNm" class="control-label" style="margin-bottom: 7px;display: -webkit-box;">លេខកូដផ្ទះ</label>
													<select class="form-control input-sm" id="cboProCodeSrch" name="cboProCodeSrch" style="font-size: 14px;" onchange="getData()">
														<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>
														<option value="1" data-i18ncd="lb_project_1">static</option>
													</select>
												</div>
											</div>
											
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
												<label for="txtOtherPayDate" class="control-label" data-i18ncd="lb_pro_code" style="margin-bottom: 7px;display: -webkit-box;">ថ្ងៃបង់ប្រាក់</label>
												<div class="input-group date">
													<div class="input-group-addon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;" id="salMonthIcon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control input-sm" id="txtOtherPayDate" name="txtOtherPayDate" placeholder="បញ្ជូល ខែបើកប្រាក់" style="width: 100%;" >
												</div>
											</div>
											
											<div class="col-sm-2 col-md-2 col-lg-2" style="">
												<label for="txtOtherPayDateEnd" class="control-label"  style="margin-bottom: 7px;display: -webkit-box;visibility: hidden;">ថ្ងៃបង់ប្រាក់</label>
												<div class="input-group date">
													<div class="input-group-addon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;" id="salMonthIconEnd">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control input-sm" id="txtOtherPayDateEnd" name="txtOtherPayDateEnd" placeholder="បញ្ជូល ខែបើកប្រាក់" style="width: 100%;" >
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
									<col style="width:25px;">
									<col style="width:25px;">
									<col style="width:150px;">
									<col style="width:60px;">
									<col style="width:50px;">
									<col style="width:50px;">
									<col style="width:50px;">
									<col style="width:90px;">
									<col style="width:50px">
									<col style="width:10px;">
								</colgroup>
								<thead>
									<tr>
										<th><input type="checkbox" id="chkAllBox" style="display: none;"></th>
										<th data-i18ncd="">លេខបង្កាន់ដៃ</th>
										<th data-i18ncd="">លេខកូដផ្ទះ</th>
										<th data-i18ncd="">ឈ្មោះអតិថិជន</th>
										<th data-i18ncd="" >ថ្ងៃបង់ប្រាក់</th>
										<th data-i18ncd="">អ្នកទទួលប្រាក់(បុគ្គលិក)</th>
										<th data-i18ncd="" style="text-align: right;">ប្រាក់ត្រូវបង់ $</th>
										<th data-i18ncd="" >វីធីបង់ប្រាក់</th>
										<th data-i18ncd="" >លេខប្រតិបត្តិការណ៍</th>
										<th data-i18ncd="">ការពិពណ៌នា</th>
										<th style="text-align: center;">បោះពុម្ព</th>
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
<script src="<?php echo base_url('assets/') ?>js/pages/v_other_payment.js"></script>
<?php echo $iframe; ?>

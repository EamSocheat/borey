<?php echo $header; ?>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				<i class="fa fa-users"></i> <span data-i18ncd="lb_customer">Customer</span>
				<small data-i18ncd="lb_information">Information</small>
			</h1>

			<ol class="breadcrumb">
				<li><a href="Dashboard"><i class="fa fa-dashboard"></i> <span data-i18ncd="lb_dashbord">Dashboard</span></a></li>
				<li class="active" data-i18ncd="lb_customer">Customer</li>
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
											<div class="col-sm-12 col-md-12 col-lg-12 row">
												<div class="col-sm-3 col-md-3 col-lg-3">
													<div class="form-group">
														<label for="txtSrchCusNm" class="control-label" data-i18ncd="lb_name">Name</label>
														<input type="text" class="form-control input-sm" id="txtSrchCusNm" placeholder="Name">

													</div>
												</div>
												<div class="col-sm-3 col-md-3 col-lg-3">
													<div class="form-group">
														<label for="txtSrchCusNmKh" class="control-label" data-i18ncd="lb_name_kh">Khmer Name </label>
														<input type="text" class="form-control input-sm" id="txtSrchCusNmKh" placeholder="Khmer Name ">

													</div>
												</div>

												<div class="col-sm-3 col-md-3 col-lg-3">
													<div class="form-group">
														<label for="txtSrchCusPhone" class="control-label" data-i18ncd="lb_phone">Phone </label>
														<input type="text" class="form-control input-sm"  id="txtSrchCusPhone" placeholder="Phone">

													</div>
												</div>

												<div class="col-sm-3 col-md-3 col-lg-3">
													<div class="form-group">
														<label for="txtSrchIdentityNmKh" class="control-label" data-i18ncd="lb_identity">Identity</label>
														<input type="text" class="form-control input-sm"  id="txtSrchIdentityNmKh" placeholder="Identity" maxlength="9">

													</div>
												</div>

											</div>

											<div class="col-sm-12 col-md-12 col-lg-12">
												<button id="btnSearch" type="button" class="btn btn-success btn-sm pull-right"><i class="fa fa-search" aria-hidden="true"></i> <span data-i18ncd="lb_search">Search</span></button>
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
										<button type="button" id="btnDownExcel" class="btn btn-success btn-sm" style="margin-left: 7px;"><i class="fa fa-download" aria-hidden="true"></i> <span data-i18ncd="btn_excel">Download Excel</span></button>
										<div style="margin-left: 5px;display: none;">
											<form method="post" action="<?php echo base_url(); ?>Customer/download_excel" id="btnExcel">
												<input type="submit" value="Submit">
												<input type="hidden" name="cusIdArray" class="btn btn-success" value="" id="cusId" />
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
										<select class="form-control input-sm" id="perPage">
											<option value="1" data-i18ncd="lb_row1">1 rows</option>
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
								<table class="table table-hover" id="tblCustomer">
									<thead>
									<tr>
										<th><input type="checkbox" id="chkAllBox"></th>
										<th></th>
										<th data-i18ncd="lb_identity">Identity</th>
										<th data-i18ncd="lb_name">Name</th>
										<th data-i18ncd="lb_name_kh">Khmer Name</th>
										<th data-i18ncd="lb_gender">Gender</th>
										<th data-i18ncd="lb_phone">Phone</th>
										<!--<th data-i18ncd="lb_email">Email</th>
                                        <th data-i18ncd="lb_addr">Address</th>
                                        <th data-i18ncd="lb_des">Description</th>-->
										<th data-i18ncd="lb_action">Action</th>
									</tr>
									</thead>
									<tbody>
									<!-- -->
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
	<script src="<?php echo base_url('assets/') ?>js/pages/v_customer.js"></script>
<?php echo $iframe; ?>

<?php echo $header; ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			<i class="fa fa-pie-chart"></i> <span data-i18ncd="lb_commission">Commission</span>
			<small data-i18ncd="lb_information">Information</small>
		</h1>

		<ol class="breadcrumb">
			<li><a href="Dashboard"><i class="fa fa-dashboard"></i> <span data-i18ncd="lb_dashbord">Dashboard</span></a></li>
			<li class="active" data-i18ncd="lb_commission">Commission</li>
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
											<div class="col-sm-2 col-md-2 col-lg-2">
												<div class="form-group form-inline">
													<label for="txtSellCode" class="control-label" data-i18ncd="lb_sell_code" style="margin-bottom: 7px;display: -webkit-box;">លេខកូដនៃការលក់</label>
													<input type="text" class="form-control input-sm" id="txtSellCode" name="txtSellCode" placeholder="លេខកូដនៃការលក់" style="width: 100%;">
												</div>
											</div>
											<div class="col-sm-2 col-md-2 col-lg-2">
												<div class="form-group form-inline">
													<label for="cmboSeller" class="control-label" data-i18ncd="lb_seller" style="margin-bottom: 7px;display: -webkit-box;">អ្នកលក់</label>
													<select class="form-control" id="cmboSeller" name="cmboSeller" style="width: 143px;font-size: 14px;" onchange="getData()">
														<option value="" data-i18ncd="lb_seller_choose">សូមជ្រើសរើស</option>
														<option value="1" data-i18ncd="lb_seller_1">static</option>
													</select>
												</div>
											</div>
											<div class="col-sm-4 col-md-4 col-lg-4" style="display: inline-flex;">
												<div class="input-group date" style="width: 100%;">
													<label for="txtSrchSaleSD" class="control-label" data-i18ncd="lb_sell_start" style="margin-bottom: 7px;display: table-caption;">ថ្ងៃលក់</label>
													<div class="input-group-addon" id="txtSrchSaleSDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;padding: 5px 11px;">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control pull-left date-pick input-sm" id="txtSrchSaleSD" name="txtSrchSaleSD" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="បញ្ជូល ថ្ងៃលក់" style="font-size: 12px;width: 80%;">
												</div>
												<div class="input-group date" style="margin-top: 26px;width: 100%;">
													<label for="txtSrchSaleED" class="control-label" data-i18ncd="lb_expend_end" style="margin-bottom: 7px;display: none;">ថ្ងៃលក់</label>
													<div class="input-group-addon " id="txtSrchSaleEDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control pull-left date-pick input-sm" id="txtSrchSaleED" name="txtSrchSaleED" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="បញ្ជូល ថ្ងៃលក់" style="font-size: 12px;width: 80%;">
												</div>
											</div>
											<div class="col-sm-4 col-md-4 col-lg-4" style="display: inline-flex;">
												<div class="input-group date" style="width: 100%;">
													<label for="txtSrchApproveSD" class="control-label" data-i18ncd="lb_expend_start" style="margin-bottom: 7px;display: table-caption;">ថ្ងៃអនុម័ត</label>
													<div class="input-group-addon" id="txtSrchApproveSDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;padding: 5px 11px;">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control pull-left date-pick input-sm" id="txtSrchApproveSD" name="txtSrchApproveSD" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="បញ្ជូល ថ្ងៃអនុម័ត" style="font-size: 12px;width: 80%;">
												</div>
												<div class="input-group date" style="margin-top: 26px;width: 100%;">
													<label for="txtSrchApproveED" class="control-label" data-i18ncd="lb_expend_end" style="margin-bottom: 7px;display: none;">ថ្ងៃអនុម័ត</label>
													<div class="input-group-addon " id="txtSrchApproveEDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control pull-left date-pick input-sm" id="txtSrchApproveED" name="txtSrchApproveED" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="បញ្ជូល ថ្ងៃអនុម័ត" style="font-size: 12px;width: 80%;">
												</div>
											</div>
										</div>
										<div class="col-sm-12 col-md-12 col-lg-12 row" style="">
											<div class="col-sm-3 col-md-3 col-lg-3" style="">
												<div class="form-group form-inline">
													<label for="cboStatus" class="control-label" data-i18ncd="lb_cat" style="margin-bottom: 7px;display: -webkit-box;">ដំណើការកម្រៃជើងសារ</label>
													<select class="form-control" id="cboStatus" name="cboStatus" style="width: 143px;font-size: 14px;" onchange="getData()">
														<option value="" data-i18ncd="lb_status_choose">សូមជ្រើសរើស</option>
														<option value="P" data-i18ncd="lb_wating">រង់ចាំ</option>
														<option value="G" data-i18ncd="lb_finished">រូចរាល់</option>
													</select>
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
<!--									<button type="button" id="btnAddNew" class="btn btn-default btn-sm"><i class="fa fa-plus" aria-hidden="true"></i> <span data-i18ncd="btn_add_new">បន្ថែម&#8203;ថ្មី</span></button>-->
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
							<table class="table table-hover" id="tblCommission">
								<colgroup>
									<col style="width:5px;">
									<!--<col style="width:5px;">
									<col style="width:5px;">-->
									<col style="width:90px;">
									<col style="width:80px;">
									<col style="width:100px;">
									<col style="width:50px;">
									<col style="width:50px;">
									<col style="width:50px">
									<col style="width:80px;">
									<col style="width:10px;">
									<col style="width:10px;">
								</colgroup>
								<thead>
									<tr>
										<th><input type="checkbox" id="chkAllBox" style="display: none;"></th>
										<th data-i18ncd="">ប្រភេទកម្រៃជើងសារ</th>
										<th data-i18ncd="" style="text-align: right;">ប្រាក់កម្រៃជើងសារ</th>
										<th data-i18ncd="" style="">ដំណើការកម្រៃជើងសារ</th>
										<th data-i18ncd="" style="">ថ្ងៃអនុម័ត</th>
										<th data-i18ncd="" style="">អ្នកលក់</th>
										<th data-i18ncd="" style="">ថ្ងៃលក់</th>
										<th data-i18ncd="" style="">លេខកូដនៃការលក់</th>
										<th style="text-align: center;" data-i18ncd="lb_action">Action</th>
									</tr>
								</thead>
								<tbody>
									<tr class="cur-pointer">
										<td><div class="" style="width: 10px;"><input type='checkbox'></div></td>
										<td><div class="">បុគ្គល</div></td>
										<td><div class="" style="text-align: right">$100,000</div></td>
										<td><div class="" style="">រង់ចាំ</div></td>
										<td><div class="" style="">01-09-2019</div></td>
										<td><div class="" style="">customer 00001</div></td>
										<td><div class="" style="">01-08-2019</div></td>
										<td><div class="" style="">sell 00001</div></td>
										<td class="text-center">
											<button type="button" class="btn btn-primary btn-xs">អនុម័ត</button>
										</td>
									</tr>
									<tr class="cur-pointer">
										<td><div class="" style="width: 10px;"><input type='checkbox'></div></td>
										<td><div class="">ទាំងអស់</div></td>
										<td><div class="" style="text-align: right">$100,000</div></td>
										<td><div class="" style="">រូចរាល់</div></td>
										<td><div class="" style="">01-09-2019</div></td>
										<td><div class="" style="">customer 00001</div></td>
										<td><div class="" style="">01-08-2019</div></td>
										<td><div class="" style="">sell 00001</div></td>
										<td class="text-center">
											<button type="button" class="btn btn-primary btn-xs">អនុម័ត</button>
										</td>
									</tr>
									<tr class="total">
										<td class="" colspan="2" style="text-align: right;font-weight: 600;">សរុបប្រាក់កម្រៃជើងសារ: </td>
										<td class="" colspan="" style="text-align: right;"><b>12,369,565.23</b></td>
										<td colspan="6"></td>
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
<script src="<?php echo base_url('assets/') ?>js/pages/v_commission.js"></script>
<?php echo $iframe; ?>

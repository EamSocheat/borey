<?php echo $header; ?>
<!--  test git -->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
		<i class="fa fa-download"></i>
		<span >របាយការណ៏ បង់ប្រាក់</span>
		<small data-i18ncd="lb_information">Information</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="javascript:"><i class="fa fa-dashboard"></i><span data-i18ncd="lb_dasbord">Dashboard</span></a></li>
			<li class="active" >របាយការណ៏ បង់ប្រាក់</li>
		</ol>
	</section>
	<!-- Main content -->
	<section class="content">
		<!-- Main row -->
		<div class="row">
			<!-- main col -->
			<section class="">
				<div class="col-md-6">
					<div class="box">
						<!-- box-header -->
						<div class="box-header">
							
							<div class="box box-solid box-search2">
								<div class="box-header with-border">
									<i class="fa fa-search-plus" aria-hidden="true"></i>
									<h3 class="box-title">តាមដានការបង់ប្រាក់របស់អតិថិជនប្រចាំខែ</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body" style="display: block;">
									<div class="row" >
										<div class="col-sm-12 col-md-12 col-lg-12 row" style="">
											
											<div class="col-sm-4 col-md-4 col-lg-4" style="
												">
												<div class="input-group date" style="
													">
													<label for="txtSrchContSD" class="control-label" style="
														margin-bottom: 7px;
														display: table-caption;
													">ខែបង់ប្រាក់</label>
													<div class="input-group-addon" id="txtPayMonthIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;padding: 5px 11px;">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" style="width: 100%" class="form-control pull-left date-pick input-sm" id="txtPayMonth" name="txtPayMonth" required="required" data-inputmask="'alias': 'mm-yyyy'" data-mask="" placeholder="" style="font-size: 12px;width: 60%;">
												</div>
											</div>
											<div class="col-sm-4 col-md-4 col-lg-4" style="">
												<div class="form-group form-inline" style="    margin-top: 27px;">
													<button id="btnGetPaymentSchByMonth" type="button" class="btn btn-success btn-sm"><i class="fa fa-file-excel-o" aria-hidden="true"></i> <span>ទាញយក Excel</span></button>
												</div>
												<div style="margin-left: 5px;display: none;">
        											<form method="post" action="<?php echo base_url(); ?>PaymentSchedule/getPayment" id="btnExcelPaymentSchByMonth">
        												<input type="submit" value="Submit">
        												<input type="hidden" name="payMonth" value="" id="payMonth" />
        											</form>
        										</div>
											</div>
											
										<!-- 
										<div class="col-sm-12 col-md-12 col-lg-12 row">
											
										</div>
										 -->
									</div>
									
								</div>
								<!-- /.box-body -->
							</div>
							
						</div>
						<!-- /.box-header -->
						
					</div>
					</div>
				
				</div>
				<div class = "col-md-6">
				<!-- box-2 -->
				<div class="box">
					<!-- box-header -->
					<div class="box-header">
						
							<div class="box box-solid box-search2">
								<div class="box-header with-border">
									<i class="fa fa-search-plus" aria-hidden="true"></i>
									<h3 class="box-title">របាយការណ៏ប្រគល់ផ្ទះទៅអតិថិជន</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body" style="display: block;">
									<div class="row" >
										<div class="col-sm-12 col-md-12 col-lg-12 row" style="">
									
											<div class="col-sm-4 col-md-4 col-lg-4" style="">
												<div class="form-group form-inline" style="    margin-top: 27px;">
													<button id="btnGetContractInfo" type="button" class="btn btn-success btn-sm"><i class="fa fa-file-excel-o" aria-hidden="true"></i> <span>ទាញយក Excel</span></button>
												</div>
												<div style="margin-left: 5px;display: none;">
													<form method="post" action="<?php echo base_url(); ?>PaymentSchedule/getContractInfo" id="btnExcelContractInfo">
														<input type="submit" value="Submit">
													</form>
												</div>
											</div>
											
										<!-- 
										<div class="col-sm-12 col-md-12 col-lg-12 row">
											
										</div>
										 -->
									</div>
									
								</div>
								<!-- /.box-body -->
							</div>
							
						</div>
						<!-- /.box-header -->
					</div>
					
				</div>
				</div>
				<div class = "col-md-6">
				<!-- box-2 -->
				<div class="box">
					<!-- box-header -->
					<div class="box-header">
						
							<div class="box box-solid box-search2">
								<div class="box-header with-border">
									<i class="fa fa-search-plus" aria-hidden="true"></i>
									<h3 class="box-title">តារាងបង់ប្រាក់របស់អតិថិជន</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body" style="display: block;">
									<div class="row" >
										<div class="col-sm-12 col-md-12 col-lg-12 row" style="">
									
											<div class="col-sm-4 col-md-4 col-lg-4" style="">
												<div class="form-group form-inline" style="    margin-top: 27px;">
													<button id="btnGetSellPaymentInfo" type="button" class="btn btn-success btn-sm"><i class="fa fa-file-excel-o" aria-hidden="true"></i> <span>ទាញយក Excel</span></button>
												</div>
												<div style="margin-left: 5px;display: none;">
													<form method="post" action="<?php echo base_url(); ?>PaymentSchedule/getSellPaymentInfo" id="btnExcelSellPaymentInfo">
														<input type="submit" value="Submit">
													</form>
												</div>
											</div>
											
										<!-- 
										<div class="col-sm-12 col-md-12 col-lg-12 row">
											
										</div>
										 -->
									</div>
									
								</div>
								<!-- /.box-body -->
							</div>
							
						</div>
						<!-- /.box-header -->
					</div>
					
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
<script src="<?php echo base_url('assets/') ?>js/pages/v_payment_schedule.js"></script>
<?php echo $iframe; ?>
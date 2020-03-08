<?php echo $header; ?>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>
				<i class="fa fa-bar-chart"></i> <span data-i18ncd="lb_expend">Expend</span>
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
														<select class="form-control input-sm" id="cboSupNm" name="cboSupNm" style="font-size: 14px;" onchange="getData()">
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
														<select class="form-control input-sm" id="projectNm" name="projectNm" style="font-size: 14px;" onchange="getData()">
															<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>
															<option value="1" data-i18ncd="lb_project_1">static</option>
														</select>
													</div>
												</div>
												<div class="col-sm-2 col-md-2 col-lg-2" style="">
													<div class="form-group form-inline">
														<label for="cboStaffPay" class="control-label" data-i18ncd="lb_staff_nm" style="margin-bottom: 7px;display: -webkit-box;">បុគ្គលិក(អ្នកទូទាត់)</label>
														<!-- <input type="text" class="form-control input-sm" id="txtSrchStaffNm" name="txtSrchStaffNm" placeholder="បុគ្គលិក(អ្នកទូទាត់)" style="width: 100%;">-->
														<select class="form-control input-sm" id="cboStaffPay" name="cboStaffPay" style="font-size: 14px;" onchange="getData()">
															<option value="" data-i18ncd="lb_project_choose" selected>សូមជ្រើសរើស</option>
															<option value="0" data-i18ncd="lb_staff_admin">static</option>
														</select>
													</div>
												</div>
												<div class="col-sm-6 col-md-6 col-lg-6" style="display: inline-flex;">
													<div class="input-group date" style="width: 100%;">
														<label for="txtSrchExpendSD" class="control-label" data-i18ncd="lb_expend_start" style="margin-bottom: 7px;display: table-caption;">ថ្ងៃចំណាយ</label>
														<div class="input-group-addon" id="txtSrchExpendSDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;padding: 5px 11px;">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" class="form-control input-sm pull-left date-pick" id="txtSrchExpendSD" name="txtSrchExpendSD" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="បញ្ជូល ថ្ងៃចាប់ផ្ដើមការបង់លុយ" style="font-size: 12px;width: 80%;">
													</div>
													<div class="input-group date" style="margin-top: 26px;width: 100%;">
														<label for="txtSrchExpendED" class="control-label" data-i18ncd="lb_expend_end" style="margin-bottom: 7px;display: none;">ថ្ងៃចំណាយ</label>
														<div class="input-group-addon " id="txtSrchExpendEDIcon" style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;">
															<i class="fa fa-calendar"></i>
														</div>
														<input type="text" class="form-control input-sm pull-left date-pick" id="txtSrchExpendED" name="txtSrchExpendED" required="required" data-inputmask="'alias': 'dd-mm-yyyy'" data-mask="" placeholder="បញ្ជូល ថ្ងៃបញ្ចប់ការបង់លុយ" style="font-size: 12px;width: 80%;">
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
										<button type="button" id="btnDownExcel" class="btn btn-success btn-sm" style="margin-left: 7px;"><i class="fa fa-file-excel-o" aria-hidden="true"></i> <span>ទាញយក Excel</span></button>
										<div style="margin-left: 5px;display: none;">
											<form method="post" action="<?php echo base_url(); ?>Expend/download_excel" id="btnExcel">
												<input type="submit" value="Submit">
												<input type="hidden" name="expIdArray" class="btn btn-success" value="" id="expId" />
												<input type="hidden" name="expSchDateStart" class="btn btn-success" value="" id="expSchDateStart" />
												<input type="hidden" name="expSchDateEnd" class="btn btn-success" value="" id="expSchDateEnd" />
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


							<div class="box-body" style="overflow-x:auto;">
								<table class="table table-bordered table-hover" id="tblExpend" style="width: 2100px;">
								    
									<colgroup>
										<col style="width:5px;">
										<col style="width:5px;">
										<col style="width:130px;">
										<col style="width:150px;">
										<col style="width:150px;">
										<col style="width:400px;">
										<col style="width:20px;">
										<col style="width:120px;">
										<col style="width:120px;">
										<col style="width:20px;">
										<col style="width:120px;">
										<col style="width:100px;">
										<col style="width:120px;">
										<col style="width:120px;">
										<col style="width:120px;">
										<col style="width:120px;">
									</colgroup>
									<!--
									<thead>
									<tr>
										<th><input type="checkbox" id="chkAllBox" style="display: none;"></th>
										<th data-i18ncd="lb_supplier">អ្នកផ្គត់ផ្គង់</th>
										<th data-i18ncd="lb_total_exp" style="text-align: right;">ការចំណាយសរុប</th>
										<th data-i18ncd="lb_project" style="text-align: center;">គម្រោង</th>
										<th style="text-align: center;">កាលបរិច្ឆេទ</th>
										<th data-i18ncd="lb_staff_expend">បុគ្គលិក(អ្នកទូទាត់)</th>
										<th style="text-align: center;" data-i18ncd="lb_action">Action</th>
									</tr>
									</thead>
									-->
									<thead>  
    	            					<tr>
    	            					  <th rowspan="2"><input type="checkbox" id="chkAllBox" style="display: none;"></th>
    	            					  <th rowspan="2"> </th>
    	            					  <th rowspan="2">គម្រោង</th>
    	            					  <th rowspan="2"> អ្នកផ្គត់ផ្គង់</th>
    	            					  <th rowspan="2">លេខ​វិ​ក័​យ​ប័ត្រ</th>
    	            					  
    	            					  <th rowspan="2">បរិយាយ</th>
    	            					  <th colspan="3" class="text-center">តម្លៃប្រាក់រៀល (៛)</th>
    	            					  <th colspan="3" class="text-center">តម្លៃជាដុល្លារ ($)</th>
    	            					  <th rowspan="2">លេខប័ណ្ណ </th>
    	            					  <th rowspan="2">អ្នកស្នើសុំ​ </th>
    	            					  <th rowspan="2" style="text-align: center">ថ្ងៃស្នើសុំ​ </th>
    	            					  <th rowspan="2" style="text-align: center">ថ្ងៃចំណាយ </th>
    	            					  <th rowspan="2">អ្នកទូទាត់ </th>
    	            					  
    	            					</tr>
    	            					<tr>
    	            					 
    	            					  <th class="text-right">បរិមាណ</th>
    	            					  <th class="text-right">តម្លៃក្នុង១ឯកតា</th>
    	            					  <th class="text-right">សរុប</th>
    	            					  
    	            					  <th class="text-right">បរិមាណ</th>
    	            					  <th class="text-right">តម្លៃក្នុង១ឯកតា </th>
    	            					  <th class="text-right">សរុប </th>
    	            					  
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

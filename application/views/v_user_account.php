<?php echo $header; ?>
	<!--  test git --> 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
		<h1>
			<i class="fa fa-user-circle-o"></i>
			<span data-i18ncd="lb_user_account">User Account</span>
        	<small data-i18ncd="lb_information">Information</small>
		</h1>
      	<ol class="breadcrumb">
        	<li><a href="javascript:"><i class="fa fa-dashboard"></i><span data-i18ncd="lb_dasbord">Dashboard</span></a></li>
			<li class="active" data-i18ncd="lb_user_account">User Account</li>
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
							        <div class="col-sm-4 col-md-4 col-lg-4">
    									<div class="form-group form-inline">
                                            <label for="cboStaff" class="control-label" > បុគ្គលិក</label>
                                            <select class="form-control input-sm" id="cboStaff" name="cboStaff" >
            	                    			<option value="">សូមជ្រើសរើសបុគ្គលិក </option>
                			                </select>
                                        </div>
    								</div>
    								<div class="col-sm-4 col-md-4 col-lg-4">
    									<div class="form-group form-inline">
                                            <label for="txtSrchUserNm" class="control-label" >	ឈ្មោះ​គណនី</label>
                                            <input type="text" class="form-control input-sm" id="txtSrchUserNm" >
                                        </div>
    								</div>
    								<!-- <div class="col-sm-3 col-md-3 col-lg-3">
    									<div class="form-group form-inline">
                                            <label for="txtSrchBraPhone" class="control-label" data-i18ncd="lb_phone">Phone </label>
                                            <input type="text" class="form-control input-sm"  id="txtSrchBraPhone" placeholder="Phone">
                                        </div>
    								</div> -->
    								<!-- <div class="col-sm-4 col-md-4 col-lg-4">
    									<div class="form-group form-inline">
                                            <label for="cbxSrchBraType" class="control-label" data-i18ncd="lb_branch_type">Branch Type </label>
                                            <select class="form-control input-sm" id="cbxSrchBraType" name="cbxSrchBraType">
                                               
                                            </select>
                                        </div>
    								</div> -->
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
    					    <button type="button" id="btnAddNew" class="btn btn-default btn-sm" ><i class="fa fa-plus" aria-hidden="true"></i> <span data-i18ncd="btn_add_new">Add New</span></button>
                        </div>
    				</div>
				</div>
				<!-- /.button -->
				
				<div class="col-sm-12">
				    <div class="pull-right" style="padding-bottom: 5px;">
						<form class="form-inline" action="">
                            <label for="limitRow" data-i18ncd="lb_records">Records</label>
                            <select class="form-control input-sm" id="perPage" onchange="_thisPage.loadData(1);">
                                <option value="10" data-i18ncd="lb_row10">10 rows</option>
                                <option value="20" data-i18ncd="lb_row20">20 rows</option>
                                <option value="50" data-i18ncd="lb_row50">50 rows</option>
                                <option value="1000000" >ទាំងអស់</option>
                            </select>
						</form>
					</div>
				    <br>
				</div>
				
				<div class="box-body table-responsive">
				  <table class="table table-hover" id="tblUserAcc">
				    <thead>  
    					<tr>
    					  <th><input type="checkbox" id="chkAllBox"></th>
    					  <th>បុគ្គលិក</th>
    					  <th>ឈ្មោះ​គណនី</th>
    					  <th>ថ្ងៃខែ​ឆ្នាំ​បង្កើត</th>
    					  <th>សកម្មភាព</th>
    					</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td><div>User Account 000001</div></td>
							<td><div>000001</div></td>
							<td><div>000001</div></td>
							<td><div>2018-10-01</div></td>
							<td class="text-center">
								<button onclick="" type="button" class="btn btn-primary btn-xs"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
							</td>
						</tr>
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
<script src="<?php echo base_url('assets/') ?>js/pages/v_user_account.js"></script>
<?php echo $iframe; ?>

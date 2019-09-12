<?php include 'v_popup_header.php';?>
  <!-- general form elements -->
  <input type="hidden" id="salId" name="salId" value="<?php if(isset($_GET["id"])){ echo $_GET["id"]; }?>"/>
  <input type="hidden" id="frmAct" name="frmAct" value="<?php if(isset($_GET["action"])){ echo $_GET["action"]; }?>"/>
  <input type="hidden" id="parentId" name="parentId" value="<?php if(isset($_GET["parentId"])){ echo $_GET["parentId"]; }?>"/>
  <!-- form start -->
  <form role="form" class="form-horizontal" id="frmSalary" action="" style="display: none">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnExit">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title" id="popupTitle">Default Modal</h4>
		  <input type="hidden" id="addNewSalary" name="addNewSalary" value="ការចំណាយថ្មី">
	  </div>

	  <div class="modal-body" id="modalMdBody">
			<!-- modal body  -->

			<div class="row">
				<div class="col-xs-12 row" style="padding:0px;">
					<div class="col-xs-6 padding-forms-left">
						<div class="form-group">
							<label for="txtStaffNm" data-i18ncd="lb_staff">បុគ្កលិក</label>
							<select class="form-control" id="txtStaffNm" name="txtStaffNm" style="font-size: 14px;">
								<option value="" data-i18ncd="lb_project_choose">សូមជ្រើសរើស</option>
								<option value="1" data-i18ncd="lb_project_1">static</option>
							</select>
						</div>
					</div>

					<div class="col-xs-6 padding-forms-right">
						<div class="form-group">
							<label for="txtSalMonth" data-i18ncd="lb_salary_month">ខែបើកប្រាក់</label>
							<div class="input-group date">
								<div class="input-group-addon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;" id="salMonthIcon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control" id="txtSalMonth" name="txtSalMonth" required="required" autocomplete="off" />
								<input type="hidden" class="form-control" id="txtOldSalMonth" name="txtOldSalMonth"  />
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 row"  style="padding:0px;">
					<div class="col-xs-6 padding-forms-left">
						<div class="form-group">
						  	<label for="txtSalSDate" data-i18ncd="lb_sal_sDate">ថៃ្ងចាប់ផ្តើម</label>
							<div class="input-group date">
								<div class="input-group-addon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;" id="salSDateIcon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control" id="txtSalSDate" name="txtSalSDate" required="required" autocomplete="off" />
							</div>
						</div>
					</div>
					<div class="col-xs-6 padding-forms-right">
						<div class="form-group">
							<label for="txtSalEDate" data-i18ncd="lb_sal_eDate">ថៃ្ងបញ្ជប់</label>
							<div class="input-group date">
								<div class="input-group-addon" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;" id="salEDateIcon">
									<i class="fa fa-calendar"></i>
								</div>
								<input type="text" class="form-control" id="txtSalEDate" name="txtSalEDate" required="required" autocomplete="off" />
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 row" style="padding:0px;">
					<div class="col-xs-6 padding-forms-left">
						<div class="form-group">
							<label for="txtSalAmt" data-i18ncd="lb_sal_amt">ប្រាក់ខែ</label>
							<input type="text" class="form-control" id="txtSalAmt" name="txtSalAmt" autocomplete="off" style="text-align: right;" />
						</div>
					</div>
					<div class="col-xs-6 padding-forms-right">
						<div class="form-group">
						  <label for="txtSalComm" data-i18ncd="lb_sal_comm">ប្រាក់កំរៃជើងសារ</label>
						  <input type="text" class="form-control" id="txtSalComm" name="txtSalComm" autocomplete="off" style="text-align: right;" />
						</div>
					</div>
				</div>

				<div class="col-xs-12 row"  style="padding:0px;">
					<div class="col-xs-6 padding-forms-left">
						<div class="form-group">
							<label for="txtSalOT" data-i18ncd="lb_sal_ot">ប្រាក់បន្ថែមម៉ោង</label>
							<input type="text" class="form-control" id="txtSalOT" name="txtSalOT" autocomplete="off" style="text-align: right;" />
						</div>
					</div>
					<div class="col-xs-3 padding-forms-right">
						<div class="form-group">
							<label for="salTotalAmt" data-i18ncd="lb_sal_total_amt">ប្រាក់ខែសរុប</label>
							<input type="text" class="form-control" id="salTotalAmt" name="salTotalAmt" autocomplete="off" style="text-align: right;" disabled />

						</div>
					</div>
					<div class="col-xs-3 padding-forms-right">
						<div class="form-group">
							<label for="salStatus" data-i18ncd="lb_sal_status">ការប្រើប្រាស់</label>
							<select class="form-control" id="salStatus" name="salStatus" style="width: 143px;font-size: 14px;">
								<option value="P" data-i18ncd="lb_prepare" selected>ព្រាងទុក</option>
								<option value="G" data-i18ncd="lb_given">បានប្រគល់</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<!-- end modal body  -->
	  </div>

	  <div class="modal-footer">
		<button data-i18ncd="btn_save_new"  type="submit" class="btn btn-success btn-sm" id="btnSaveNew" style="display:none">Save + New</button>
		<button data-i18ncd="btn_save" type="submit" class="btn btn-primary btn-sm" id="btnSave">Save</button>
		<button data-i18ncd="btn_close" type="button" class="btn btn-default btn-sm" id="btnClose">Close</button>
	  </div>
  </form>
  <!-- form end -->
  <!-- end general form elements -->
<?php include 'v_popup_footer.php';?>
<script src="<?php echo base_url('assets/') ?>js/pages/popup/v_popup_form_salary.js"></script>

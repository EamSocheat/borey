<?php include 'v_popup_header.php';?>
	  <!-- general form elements -->
	  <input type="hidden" id="cat_id" name="cat_id" value="<?php if(isset($_GET["id"])){ echo $_GET["id"]; }?>"/>
	  <input type="hidden" id="frmAct" name="frmAct" value="<?php if(isset($_GET["action"])){ echo $_GET["action"]; }?>"/>
	  <!-- form start -->
      <form role="form" class="form-horizontal" id="frmCateg" action="" style="display: none">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnExit">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="popupTitle">Default Modal</h4>
      </div>
      
      <div class="modal-body" id="modalMdBody">
      		<!-- modal body  -->
        	
        	<div class="row">
				<div class="col-xs-12 row" style="padding:0px;margin-bottom:20px;">
        		
        			<div class="col-xs-4 padding-forms-left" style="padding-left:35px;">
            			<div class="image" style="text-align:center">
                        	<img id="categImgView" src="<?php echo base_url('assets/image/default-staff-photo.png') ?>" class="img-circle" style="width: 150px;" alt="User Image">
                        </div>
                        <div style="text-align:center;margin-top:5px;">
                        	<button  type="button" class="btn btn-info btn-xs" id="btnSelectPhoto"><i class="fa fa-image" aria-hidden="true"></i> <span data-i18ncd="lb_select_img">Select Image</span></button>
                        	<input type="file" style="display:none;" class="form-control" accept="image/*"  id="categFile" name="categFile">
                        </div>
            		</div>
            		<div class="col-xs-8 padding-forms-right">
            			<div class="col-xs-6 padding-forms-right">
                			<div class="form-group">
                              	<label for="cateNm" data-i18ncd="lb_name">Name</label>
                              	<input type="text" class="form-control" id="txtCateNm" name="txtCateNm" required="required" placeholder="Enter ">
                            </div>
                        </div>
                        <div class="col-xs-6 padding-forms-right">
                            <div class="form-group">
                               	<label for="txtCateNmKh" data-i18ncd="lb_name_kh">Khmer Name</label>
                            	<input type="text" class="form-control" id="txtCateNmKh" name="txtCateNmKh" required="required" placeholder="Enter Khmer Name">
                            </div>
                        </div>
                        <div class="col-xs-12 padding-forms-right" style="margin-top:17px;">
                			<div class="form-group">
                				<label for="cateDescr" data-i18ncd="lb_des">Description</label>
                				<textarea rows="2" style="width:100%;border-radius:5px;" id="cateDescr" name="cateDescr" class="form-control md-textarea" placeholder="Enter Description"></textarea>
                			</div>
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
<script src="<?php echo base_url('assets/') ?>js/pages/popup/v_popup_form_category.js"></script>
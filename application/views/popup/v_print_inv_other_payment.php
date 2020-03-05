<?php setlocale(LC_MONETARY, 'en_US');?>
<html>
	<head>
		<style>
		
		@media print {
           body {
              -webkit-print-color-adjust: exact;
           }
           
           @page{margin:0px auto;}
        }
        
		body{font-family: Khmer OS Siemreap;
			padding-top: 20px;
		}
		  table {
		  	border-collapse: collapse;
		  	font-size: 13px;
		   	width: 100%;
		  }
		  td, th {
			border: 1px solid #000000;
		  	text-align: left;
		  	padding-left: 5px;
		  	padding-right: 5px;
		  }
		  
		  table.show-amount td, th {
			border: 1px solid #000000;
		  	text-align: left;
		  	padding: 5px;
		  }
		  
		  table.tbl-head tr td{
		  	border: none;
		  }
		   .div-box{
				border: 2px solid #D4AF37;border-radius: 15px;padding:18px;
			    min-height: 100px;
				max-height: 100px;
		  }
		  .with-100{
			width: 60px;
			font-weight: bold;
		  }
		  .with-150{
			width: 90px;
			font-weight: bold;
		  }
		  .with-10{
			width: 5px;
			font-weight: bold;
		  }
		  .with-200{
			width: 120px;
			font-weight: bold;
		  }
		  p{
			font-size: 13px;
		  }
		   .block-dis{
		  	display: inline-block;
		  	font-size: 13px;
		  }
		  .with-15{
			width: 15px;
			font-weight: bold;
		  }
		</style>
	</head>
	<body style="">
		<div style="text-align: left;"><img style="width: 200px;margin-top: 40px;" src="<?php echo $printData[0]["base_url"]."/upload/fix/";?>galaxy11-logo.png" /></div>
		<div style="text-align: center;margin-top: -20px"><h3>បង្កាន់ដៃបង់ប្រាក់</h3></div>
		<div style="margin-top: -30px;display: flex;margin-bottom: 15px;">
			<div style="width: 75%"></div>		
			<div style="width: 25%">
				<div>
					<span class="with-150 block-dis ">លេខបង្កាន់ដៃ</span><span class="with-15 block-dis">:</span><span class="block-dis"><?php echo $OUT_REC[0]->oth_pay_inv_code;?></span>
				</div>
				<div>
					<span class="with-150 block-dis ">កាលបរិច្ឆេទ</span><span class="with-15 block-dis">:</span><span class="block-dis"><?php echo date('d-m-Y',strtotime($OUT_REC[0]->oth_pay_date));?></span>
				</div>
			</div>	
			  
		</div>
		
		<div style="display: flex;">
			<div style="width: 50%;margin-right: 10px">
    			<div class="div-box">
    				<div>
    					<span class="with-100 block-dis ">គម្រោង</span><span class="with-15 block-dis">:</span><span class="block-dis"><?php echo $OUT_REC[0]->bra_nm_kh;?></span>
    				</div>
    				<div>
    					<span class="with-100 block-dis ">កូដផ្ទះ</span><span class="with-15 block-dis">:</span><span class="block-dis"><?php echo $OUT_REC[0]->pro_code;?></span>
    				</div>
    				<div>
    					<span class="with-100 block-dis ">ប្រភេទផ្ទះ</span><span class="with-15 block-dis">:</span><span class="block-dis"><?php echo $OUT_REC[0]->cat_nm_kh;?></span>
    				</div>
    					
    			</div>
			</div>
			<div style="width: 50%;">
				<div class="div-box">
					
    				<div style="display: flex;">
    					<div style="width: 90px;display: inline-block;">
    						<span class="with-150 block-dis ">ឈ្មោះអតិថិជន</span>
    					</div>
    					<div style="display: inline-block;">
    						<span class="with-15 block-dis">:</span>
    					</div>
    					<div style="display: inline-block;">
    						<span class="block-dis"><?php echo $OUT_REC[0]->cus_nm_kh; if($OUT_REC[1]->cus_nm_kh != null){ echo ' & '.$OUT_REC[1]->cus_nm_kh; } if($OUT_REC[2]->cus_nm_kh != null){ echo ' & '.$OUT_REC[2]->cus_nm_kh; }?></span>
    					</div>
    					
    				</div>
    				<div>	
    					<span class="with-150 block-dis ">លេខទូរស័ព្ទ</span><span class="with-15 block-dis">:</span><span class="block-dis"><?php echo $OUT_REC[0]->cus_phone1; if($OUT_REC[1]->cus_phone1 != null && $OUT_REC[1]->cus_phone1 != $OUT_REC[0]->cus_phone1){ echo ' / '.$OUT_REC[1]->cus_phone1; }?></span>
    				</div>
    				<div style="display: flex;">
    					<div style="width: 90px;display: inline-block;">
    						<span class="with-150 block-dis ">អាស័យដ្ឋាន</span>
    					</div>
    					<div style="display: inline-block;">
    						<span class="with-15 block-dis">:</span>
    					</div>
    					<div style="display: inline-block;">
    						<span class="block-dis"><?php echo $OUT_REC[0]->cus_addr;?></span>
    					</div>
    					
    				</div>
				</div>
			</div>
		</div>
		
		<div style="display: flex;margin-top: 15px;height: 30px;">
			
		</div>
		
		<div style="margin-top: 15px">
			<table class="show-amount">
				<colgroup>
					<col style="width:2%;">
					<col style="width:25%;">
					<col style="width:48%;">
					<col style="width:30%;">
				</colgroup>
				<tr>
					<th style="text-align: center">ល.រ</th>
					<th style="text-align: center">ប្រភេទបង់</th>
					<th style="text-align: center">បរិយាយ</th>
					<th>ប្រាក់បានបង់</th>
				</tr>
				<tr>
					<td style="text-align: center">1</td>
					<td style="text-align: center"><?php echo $OUT_REC[0]->met_nm_kh;?></td>
					<td style="text-align: center"><?php echo $OUT_REC[0]->oth_pay_des;?> </td>
					<td>$<?php echo number_format($OUT_REC[0]->oth_pay_amt,2);?></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: right;border: none;">ចំនួនសរុបបានបង់</td>
					<td colspan="3">$<?php echo number_format($OUT_REC[0]->oth_pay_amt,2);?></td>
				</tr>
				<!-- 
				<tr>
					<td colspan="3" style="text-align: right;border: none;">នៅខ្វះ</td>
					<td colspan="3">$0.00</td>
				</tr>
				 -->
			</table>
		</div>
		
		<div style="margin-top: 70px;">
			<table class="tbl-head">
				<tr>
					<td style="width: 5%">កំណត់សំគាល់:</td>
				</tr>
				<tr>
					<td></td>
					<td>&#9733; ក្នុងករណីបង់ប្រាក់ពុំទៀងទាត់នឹងត្រូវផាកពិន័យដូចបានចែងក្នុងកិច្ចសន្យា</td>
				</tr>
				<tr>
					<td></td>
					<td>&#9733; អាចបង់នៅការិយាល័យផ្ទាល់ ឫបង់តាមរយះធានាគា ABA <br>&#10004; Account Name: Heng Piseth & Mean Tong <br> &#10004; Account Number: 000935494</td>
				</tr>
				<tr>
					<td></td><td></td>
				</tr>
				<tr>
					
				</tr>
				
			</table>
		</div>
		<div style="margin-top: 50px;">
			<table class="tbl-head">
				<tr>
					<td style="width: 25%">ស្នាមមេដៃម្ចាស់ផ្ទះ</td>
					<td style="width: 25%">ស្នាមមេដៃស្ដាំបេទ្បាធិការ</td>
					<td style="width: 25%">ត្រួតពិនិត្យដោយ</td>
					<td style="width: 25%">ឯកភាព និងអនុម័ត</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>ឈ្មោះ........................</td>
					<td>ឈ្មោះ........................</td>
					<td>ឈ្មោះ........................</td>
					<td>ឈ្មោះ........................</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				
			</table>
		</div>
		<div style="position: absolute;bottom: 70px; width: 100%;font-size: 11px;margin-left: 7px;">
			<p style="font-weight: bold;color: #D4AF37;font-size: 11px;">BOREY GALAXY11</p>
			<p style="margin-top: -5px;font-size: 11px;">ការិយាល័យ: ផ្សារព្រែកជ្រៃ សង្កាត់ស្ពានថ្ម ខណ្ឌដង្កោ រាជធានីភ្នំពេញ (ជិតផ្លូវ៦០សម្តេចតេជោ)ទូរសព្ទ័៖ 092 327 317 / 096 232 7317</p>
		</div>
	</body>
</html>
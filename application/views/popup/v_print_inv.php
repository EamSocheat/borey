<?php setlocale(LC_MONETARY, 'en_US');?>
<html>
	<head>
		<style>
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
				border: 2px solid #D4AF37;border-radius: 15px;padding:10px;
			    min-height: 100px;
				max-height: 100px;
		  }
		  .with-100{
			width: 50px;
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
		<div style="text-align: left;"><img style="width: 200px;" src="<?php echo $printData[0]["base_url"]."/upload/fix/";?>galaxy11-logo.png" /></div>
		<div style="text-align: center;margin-top: -20px"><h3>បង្កាន់ដៃបង់ប្រាក់</h3></div>
		<div style="text-align: right; margin-top: -30px">		
			<p>លេខបង្កាន់ដៃកក់ប្រាក់ : <span><?php echo $OUT_REC[0]->con_code;?></span></p>
			<p>កាលបរិច្ឆេទ : <span><?php echo date('d-m-Y',strtotime($OUT_REC[0]->con_date));?></span></p>  
		</div>
		<div>
			<table class="tbl-head" >
				<colgroup>
					<col width="50%">
					<col width="50%">
				</colgroup>
				<tbody>
					<tr>
						<td><div class="div-box">
							<table class="tbl-head">
								<col width="20%">
								<col width="2%">
								<col width="80%">
								<tr>
									<td class="with-100">គម្រោង</td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->bra_nm_kh;?></td>
								</tr>
								<tr>
									<td class="with-100">កូដផ្ទះ</td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->pro_code;?></td>
								<tr>
									<td class="with-100">តំលៃផ្ទះ</td><td class="with-10">:</td><td>$<?php echo number_format($OUT_REC[0]->pro_book_price);?></td>
								</tr>
								<tr>
									<td class="with-100">ភ្នាក់ងារ</td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->seller_nm;?></td>
								</tr>
							</table>
						<div></td>
						<td><div class="div-box">
							<table class="tbl-head">
								<col width="33%">
								<col width="2%">
								<col width="65%">
								<tr>
									<td class="with-150">ឈ្មោះអតិថិជន</td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->cus_nm_kh; if($OUT_REC[1]->cus_nm_kh != null){ echo ' & '.$OUT_REC[1]->cus_nm_kh; } if($OUT_REC[2]->cus_nm_kh != null){ echo ' & '.$OUT_REC[2]->cus_nm_kh; }?></td>
								</tr>
								<tr>
									<td class="with-150">លេខទូរស័ព្ទ </td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->cus_phone1; if($OUT_REC[1]->cus_phone1 != null){ echo ' / '.$OUT_REC[1]->cus_phone1; }?></td>
								<tr>
									<td class="with-150">អាស័យដ្ឋាន &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td><td class="with-10">:&nbsp;&nbsp; &nbsp;&nbsp;</td><td <?php if(strlen($OUT_REC[0]->cus_addr) > 200){echo 'style="font-size: 11px; padding-top: -5px;"'; } ?>> <?php echo $OUT_REC[0]->cus_addr; if(strlen($OUT_REC[0]->cus_addr) < 110 ){echo '&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;' ;}?></td>
								</tr>
								
							</table>
						<div></td>
					</tr>
					<tr style="height: 10px;"></tr>
					
				</tbody>
			</table>
		</div>
		<div style="display: flex;">
			<div style="width: 50%;margin-left: 5px;">
				<div>
					<span class="with-200 block-dis ">លេខវិក័យបត្រ</span><span class="with-15 block-dis">:</span><span class="block-dis">000001</span>
				</div>
				<div>
					<span class="with-200 block-dis ">ប្រភេទកិច្ចសន្យា</span><span class="with-15 block-dis">:</span><span class="block-dis"><?php echo $OUT_REC[0]->con_type_nm_kh;?></span>
				</div>
				<div>
					<span class="with-200 block-dis ">ប្រាក់ដើមបានបង់សរុប</span><span class="with-15 block-dis">:</span><span class="block-dis">$<?php echo number_format($OUT_REC[0]->con_total_price);?></span>
				</div>
				<div>	
					<span class="with-200 block-dis ">ប្រាក់ដើមនៅសល់</span><span class="with-15 block-dis">:</span><span class="block-dis">$<?php echo number_format((floatval($OUT_REC[0]->pro_book_price) - floatval($OUT_REC[0]->con_total_price))) ?></span>
				</div>
				<div style="display: flex;">
					<div style="width: 120px;display: inline-block;">
						<span class="with-200 block-dis ">បរិយាយ</span>
					</div>
					<div style="display: inline-block;">
						<span class="with-15 block-dis">:</span>
					</div>
					<div style="display: inline-block;">
						<span class="block-dis"><?php echo $OUT_REC[0]->con_des;?></span>
					</div>
					
				</div>
			</div>
			<div style="width: 50%">
				<div>
					<span class="with-200 block-dis ">ថ្ងៃត្រូវបង់</span><span class="with-15 block-dis">:</span><span class="block-dis"><?php echo date('d-m-Y',strtotime($OUT_REC[0]->con_date));?></span>
				</div>
				<div>
					<span class="with-200 block-dis ">ប្រាក់ត្រូវបង់</span><span class="with-15 block-dis">:</span><span class="block-dis">$<?php echo number_format($OUT_REC[0]->con_total_price);?></span>
				</div>
				<div>
					<span class="with-200 block-dis ">បន្ថែមដើម</span><span class="with-15 block-dis">:</span><span class="block-dis">$0.00</span>
				</div>
				<div>	
					<span class="with-200 block-dis ">ប្រាក់ពិន័យ</span><span class="with-15 block-dis">:</span><span class="block-dis">$0.00</span>
				</div>
				<div>	
					<span class="with-200 block-dis ">ប្រាក់ត្រូវបង់សរុប</span><span class="with-15 block-dis">:</span><span class="block-dis">$<?php echo number_format($OUT_REC[0]->con_total_price);?></span>
				</div>
			</div>
		</div>
		<div style="margin-top: 10px">
			<table class="show-amount">
				<tr>
					<th style="text-align: center">ល.រ</th>
					<th style="text-align: center">ប្រភេទបង់</th>
					<th style="text-align: center">កំណត់សំគាល់</th>
					<th>ប្រាក់បានបង់</th>
				</tr>
				<tr>
					<td style="text-align: center">1</td>
					<td style="text-align: center"><?php echo $OUT_REC[0]->met_nm_kh;?></td>
					<td style="text-align: center">បង់កក់ទ្រនាប់ដៃ</td>
					<td>$<?php echo number_format($OUT_REC[0]->con_total_price);?></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: right;border: none;">ចំនួនសរុបបានបង់</td>
					<td colspan="3">$<?php echo number_format($OUT_REC[0]->con_total_price);?></td>
				</tr>
				
				
			</table>
		</div>
		
		<div style="margin-top: 10px;">
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
		<div style="margin-top: 40px;">
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
				
				
				<tr>
					<td style="font-weight: bold;color: #D4AF37;font-size: 11px;">BOREY GALAXY11</td>
				</tr>
				<tr>
					<td colspan="4" style="font-size: 11px;">ការិយាល័យ: ផ្សារព្រែកជ្រៃ សង្កាត់ស្ពានថ្ម ខណ្ឌដង្កោ រាជធានីភ្នំពេញ (ជិតផ្លូវ៦០សម្តេចតេជោ)ទូរសព្ទ័០17 661 122/098 66 11 22</td>
				</tr>
			</table>
		</div>
		
	</body>
</html>
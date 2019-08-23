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
		  	padding: 5px;
		  }
		  
		  table.tbl-head tr td{
		  	border: none;
		  }
		  .div-box{
				border: 2px solid #D4AF37;border-radius: 15px;padding:10px;
			    min-height: 130px;
				max-height: 130px;
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
		</style>
	</head>
	<body style="">
		<div style="text-align: left;"><img style="width: 200px;" src="<?php echo $printData[0]["base_url"]."/upload/fix/";?>galaxy11-logo.png" /></div>
		<div style="text-align: center;margin-top: -20px"><h3>បង្កាន់ដៃបង់ប្រាក់</h3></div>
		<div style="text-align: right; margin-top: -30px">		
			<p>លេខបង្កាន់ដៃ ៖ <span><?php echo $OUT_REC[0]->con_code;?></span></p>
			<p>កាលបរិច្ឆេទ ៖ <span><?php echo date('d-m-Y',strtotime($OUT_REC[0]->con_date));?></span></p>  
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
								<tr>
									<td class="with-100">គម្រោង</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->bra_nm_kh;?></td>
								</tr>
								<tr>
								</tr>
									<td class="with-100">កូដផ្ទះ</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->pro_code;?></td>
								<tr>
									<td class="with-100">តំលៃផ្ទះ</td><td class="with-10">៖</td><td>$<?php echo number_format($OUT_REC[0]->pro_book_price);?></td>
								</tr>
								<tr>
									<td class="with-100">ភ្នាក់ងារ</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->seller_nm;?></td>
								</tr>
							</table>
						<div></td>
						<td><div class="div-box">
							<table class="tbl-head">
								<tr>
									<td class="with-150">ឈ្មោះអតិថិជន</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->cus_nm_kh;?></td>
								</tr>
								<tr>
								</tr>
									<td class="with-150">លេខទូរស័ព្ទ</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->cus_phone1;?></td>
								<tr>
									<td class="with-150">អាស័យដ្ឋាន</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->cus_addr;?></td>
								</tr>
								
							</table>
						<div></td>
					</tr>
					<tr>
						<td>
							<table class="tbl-head">
								<tr>
									<td class="with-200">លេខវិក័យបត្រ</td><td class="with-10">៖</td><td>000001</td>
								</tr>
								<tr>
								</tr>
									<td class="with-200">ប្រភេទកិច្ចសន្យា</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->con_type_nm_kh;?></td>
								<tr>
									<td class="with-200">ប្រាក់ដើមបានបង់សរុប</td><td class="with-10">៖</td><td>$<?php echo number_format($OUT_REC[0]->con_total_price);?></td>
								</tr>
								<tr>
									<td class="with-200">ប្រាក់ដើមនៅសល់</td><td class="with-10">៖</td><td>$<?php echo number_format((floatval($OUT_REC[0]->pro_book_price) - floatval($OUT_REC[0]->con_total_price))) ?></td>
								</tr>
								<tr>
									<td class="with-200">បរិយាយ</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->con_des;?></td>
								</tr>
							</table>
						</td>
						<td>
							<table class="tbl-head">
								<tr>
									<td class="with-200">ថ្ងៃត្រូវបង់</td><td class="with-10">៖</td><td><?php echo date('d-m-Y',strtotime($OUT_REC[0]->con_date));?></td>
								</tr>
								<tr>
								</tr>
									<td class="with-200">ប្រាក់ត្រូវបង់</td><td class="with-10">៖</td><td>$<?php echo number_format($OUT_REC[0]->con_total_price);?></td>
								<tr>
									<td class="with-200">បន្ថែមដើម</td><td class="with-10">៖</td><td>$0.00</td>
								</tr>
								<tr>
									<td class="with-200">ប្រាក់ពិន័យ</td><td class="with-10">៖</td><td>$0.00</td>
								</tr>
								<tr>
									<td class="with-200">ប្រាក់ត្រូវបង់សរុប</td><td class="with-10">៖</td><td>$<?php echo number_format($OUT_REC[0]->con_total_price);?></td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="">
			<table>
				<tr>
					<th>ល.រ</th>
					<th>ប្រភេទបង់</th>
					<th>កំណត់សំគាល់</th>
					<th>ប្រាក់បានបង់</th>
				</tr>
				<tr>
					<td>1</td>
					<td><?php echo $OUT_REC[0]->met_nm_kh;?></td>
					<td>បង់កក់ទ្រនាប់ដៃ</td>
					<td>$<?php echo number_format($OUT_REC[0]->con_total_price);?></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: right;border: none;">ចំនួនសរុបបានបង់</td>
					<td colspan="3">$<?php echo number_format($OUT_REC[0]->con_total_price);?></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: right;border: none;">នៅខ្វះ</td>
					<td colspan="3">$0.00</td>
				</tr>
				
			</table>
		</div>
		
		<div style="">
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
		<div style="">
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
					<td>ឈ្មោះ........................</td>
					<td>ឈ្មោះ........................</td>
					<td>ឈ្មោះ........................</td>
					<td>ឈ្មោះ........................</td>
				</tr>
				<tr>
					<td style="font-weight: bold;color: #D4AF37;">BOREY GALAXY11</td>
				</tr>
				<tr>
					<td colspan="4">ការិយាល័យ: ផ្សារព្រែកជ្រៃ សង្កាត់ស្ពានថ្ម ខណ្ឌដង្កោ រាជធានីភ្នំពេញ (ជិតផ្លូវ៦០សម្តេចតេជោ)ទូរសព្ទ័០17 661 122/098 66 11 22</td>
				</tr>
			</table>
		</div>
		
	</body>
</html>
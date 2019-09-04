<?php setlocale(LC_MONETARY, 'en_US');?>
				<?php
					$advPeriod=0; 
					$loanPeriod=0; 
					for($j=0;$j<count($OUT_REC);$j++){
    				if($OUT_REC[$j]->inst_type =="ADV"){
    					$advPeriod+=1;
    				}
    				if($OUT_REC[$j]->inst_type =="LOAN"){
    					$loanPeriod+=1;
    				}
    					
				}?>
<html>
	<head>
		<style>
		@media print {
           body {
              -webkit-print-color-adjust: exact;
           }
        }
        		
		body{font-family: Khmer OS Siemreap;
			padding-top: 10px;
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
			width: 100px;
			font-weight: bold;
		  }
		  .with-10{
			width: 2px;
			font-weight: bold;
		  }
		  .with-200{
			width: 120px;
			font-weight: bold;
		  }
		   .with-40{
			width: 40px;
			font-weight: bold;
		  }
		  
		  p{
			font-size: 13px;
		  }
		  .text-right{
		  	text-align: right;
		  }
		  .text-center{
		  	text-align: center;
		  }
		</style>
	</head>
	<body style="">
		<div style="text-align: left;"><img style="width: 200px;" src="<?php echo $printData[0]["base_url"]."/upload/fix/";?>galaxy11-logo.png" /></div>
		<div style="text-align: center;margin-top: -70px"><h3>តារាងកាលវិភាគបង់ប្រាក់</h3></div>
		
		<div>
			<table class="tbl-head" >
				<colgroup>
					<col width="50%">
					<col width="50%">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<table class="tbl-head">
								<tr>
									<td class="with-200" style="font-size: 16px;">ពត៍មានអតិថិជន</td><td class="with-10"></td><td></td>
								</tr>
								<tr>
									<td class="with-200">ឈ្មោះ</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->cus_nm_kh;?></td>
								</tr>
								<tr>
									<td class="with-200">ភេទ</td><td class="with-10">៖</td>
									<td>
										<?php 	if($OUT_REC[0]->cus_gender=="Female"){
													echo "ប្រុស";
												}else if($OUT_REC[0]->cus_gender=="Male"){
													echo "ស្រី";
												}else{
													echo "ប្រុស&ស្រី";
												}
										?>
									</td>
								</tr>
								<tr>
									<td class="with-200">ផ្ទះលេខ</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->pro_code;?></td>
								</tr>
								<tr>
									<td class="with-200">ប្រភេទ</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->cat_nm_kh ?></td>
								</tr>
								<tr>
									<td class="with-200">ប្រភេទកិច្ចសន្យា</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->con_type_nm_kh;?></td>
								</tr>
								<tr>
									<td class="with-200">ទូរសព្ទ័លេខ</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->cus_phone1;?></td>
								</tr>
							</table>
						</td>
						<td>
							<table class="tbl-head">
								<tr>
									<td class="with-200" style="font-size: 16px;">ពត៍មានបង់ប្រាក់</td><td class="with-10"></td><td></td>
								</tr>
								<tr>
									<td class="with-200">ការិយាល័យ</td><td class="with-10">៖</td><td>ផ្សារព្រែកជ្រៃ</td>
								</tr>
								<tr>
									<td class="with-200">កាលបរិច្ឆេទលក់</td><td class="with-10">៖</td><td><?php echo date('d-m-Y',strtotime($OUT_REC[0]->sell_date));?></td>
								</tr>
								<tr>
									<td class="with-200">រយះពេល</td><td class="with-10">៖</td><td><?php echo ($advPeriod+$loanPeriod);?>ខែ</td>
								</tr>
								<tr>
									<td class="with-200">អត្រាការប្រាក់</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->inst_interest_rate;?>%</td>
								</tr>
								<tr>
									<td class="with-200">តំលៃផ្ទះ</td><td class="with-10">៖</td><td>$<?php echo number_format($OUT_REC[0]->pro_sell_price);?></td>
								</tr>
								<tr>
									<td class="with-200">លេខបង្កាន់ដៃលក់</td><td class="with-10">៖</td><td><?php echo $OUT_REC[0]->sell_code;?></td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="padding-right: 10px;padding-left: 10px;">
			<table style="font-size: 10px;">
				<tr style="background: yellow;">
					<th>ល.រ</th>
					<th>ថ្ងៃត្រូវបង់</th>
					<th>ភាគរយ%</th>
					<th>បញ្ចុះតំលៃ</th>
					<th>ប្រាក់ដើមត្រូវបង់</th>
					<th>ការប្រាក់ត្រូវបង់</th>
					<th>សរុបប្រាក់ត្រូវបង់</th>
					<th>ប្រាក់ដើមនៅសល់</th>
				</tr>
				<?php for($i=0;$i<count($OUT_REC);$i++){?>
    				<tr>
    					<td class="text-center"><?php echo $OUT_REC[$i]->inst_num;?></td>
    					<td class="text-center"><?php echo date('d-m-Y',strtotime($OUT_REC[$i]->inst_date));?></td>
    					<?php 
    						if($OUT_REC[$i]->inst_type=="BOOK"){
    							echo "<td class='text-center'>បង់កក់ទ្រនាប់ដៃ</td>";
    							echo "<td class='text-center'>-</td>";
    						}else if($OUT_REC[$i]->inst_type=="ADV"){
    							echo "<td class='text-center'>".$OUT_REC[$i]->inst_pay_per."%</td>";
    							echo "<td class='text-center'>".($OUT_REC[$i]->inst_dis_amt == "0" ? "-" : "$".number_format($OUT_REC[$i]->inst_dis_amt))."</td>";
    						}else if($OUT_REC[$i]->inst_type=="LOAN"){
    							echo "<td class='text-center'>រំលួស</td>";
    							echo "<td class='text-center'>-</td>";
    						}else if($OUT_REC[$i]->inst_type=="LEFT"){
    							echo "<td class='text-center'>".$OUT_REC[$i]->inst_pay_per."%</td>";
    							echo "<td class='text-center'>-</td>";
    						}
    					?>
    					<td class="text-right">$<?php echo number_format($OUT_REC[$i]->inst_amt_principle);?></td>
    					
    						<?php 
    							if($OUT_REC[$i]->inst_amt_interest =="0"){
    								echo "<td class='text-center'>-</td>";
    							}else{
    								echo "<td class='text-right'>$".number_format($OUT_REC[$i]->inst_amt_interest)."</td>";
    							}
    						?>
    					
    					<td class="text-right">$<?php echo number_format($OUT_REC[$i]->inst_amt_pay);?></td>
    					<td class="text-right">$<?php 
							if($OUT_REC[$i]->inst_type=="LEFT"){
    							echo "-";
    						}else{
    							echo number_format($OUT_REC[$i]->inst_amt_balance);
    						}
    					?></td>
    				</tr>
				<?php }?>
				
			</table>
		</div>
		
		<div style="margin-top: 10px">
			<table class="tbl-head">
				<tr>
					<td style="width: 100%">&#9733;  ភាគីខ បានយល់ព្រមជ្រើសរើសបង់ប្រាក់តាមតារាងខាងលើនេះពិតប្រាកដមែន</td>
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
					<td style="width: 50%;font-weight: bold;">ស្នាមមេដៃស្ដាំភាគី ខ</td>
					<td style="width: 50%;font-weight: bold;text-align: right;">ស្នាមមេដៃស្ដាំភាគី ក</td>
					
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
					<td><?php echo $OUT_REC[0]->cus_nm_kh;?></td>
					<td style="text-align: right;">ហេង ពិសិដ្ឋ</td>
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
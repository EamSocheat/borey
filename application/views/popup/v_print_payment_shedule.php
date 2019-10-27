<?php setlocale(LC_MONETARY, 'en_US');?>
				<?php
					$advPeriod=0; 
					$loanPeriod=0; 
					$bookTrue="";
					for($j=0;$j<count($OUT_REC);$j++){
    				if($OUT_REC[$j]->inst_type =="ADV"){
    					$advPeriod+=1;
    				}
    				if($OUT_REC[$j]->inst_type =="LOAN"){
    					$loanPeriod+=1;
    				}
    				if($OUT_REC[$j]->inst_type =="BOOK"){
    				    $bookTrue = "បង្រ្គប់";
    				}
    					
				}?>
<html>
	<head>
		<style>
		@media print {
           body {
              -webkit-print-color-adjust: exact;
           }
           
           @page{margin:30px auto auto auto;}
        }
        		
		body{font-family: Khmer OS Siemreap;
			padding-top: 10px;
		}
		  table {
		  	border-collapse: collapse;
		  	font-size: 11px;
		   	width: 100%;
		  }
		  td {
			border: 1px solid #000000;
		  	text-align: left;
		  	font-weight: bold;
		  	/* padding: 5px; */
		  }
		  
		 th {
			border: 1px solid #000000;
		  	text-align: center;
		  	/* padding: 5px; */
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
			font-size: 11px;
		  }
		  .text-right{
		  	text-align: right;
		  	padding-right: 10px;
		  }
		  .text-center{
		  	text-align: center;
		  }
		</style>
	</head>
	<body style="">
		<div style="text-align: left;"><img style="width: 200px;" src="<?php echo $printData[0]["base_url"]."/upload/fix/";?>galaxy11-logo.png" /></div>
		<div style="text-align: center;margin-top: -20px"><h4>តារាងកាលវិភាគបង់ប្រាក់</h4></div>
		
		<div>
			<table class="tbl-head" >
				<colgroup>
					<col width="60%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<table class="tbl-head">
								<tr>
									<td class="with-200" style="font-size: 14px;">ពត៍មានអតិថិជន</td><td class="with-10"></td><td></td>
								</tr>
								<tr>
									<td class="with-200">ឈ្មោះ</td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->cus_nm_kh;if($OUT_REC[0]->cus_nm_kh2 != null){ echo ' & '.$OUT_REC[0]->cus_nm_kh2; } if($OUT_REC[0]->cus_nm_kh3 != null){ echo ' & '.$OUT_REC[0]->cus_nm_kh3; }?></td>
								</tr>
								<tr>
									<td class="with-200">ភេទ</td><td class="with-10">:</td>
									<td>
										<?php 	if($OUT_REC[0]->cus_gender=="Male"){
													echo "ប្រុស";
												}else if($OUT_REC[0]->cus_gender=="Female"){
													echo "ស្រី";
												}
												
												if($OUT_REC[0]->cus_gender2=="Male"){
												    echo " & ប្រុស";
												}else if($OUT_REC[0]->cus_gender2=="Female"){
												    echo " & ស្រី";
												}
												
												if($OUT_REC[0]->cus_gender3=="Male"){
												    echo " & ប្រុស";
												}else if($OUT_REC[0]->cus_gender3=="Female"){
												    echo " & ស្រី";
												}
										?>
									</td>
								</tr>
								<tr>
									<td class="with-200">ផ្ទះលេខ</td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->pro_code;?></td>
								</tr>
								<tr>
									<td class="with-200">ប្រភេទ</td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->cat_nm_kh ?></td>
								</tr>
								<tr>
									<td class="with-200">ប្រភេទកិច្ចសន្យា</td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->con_type_nm_kh;?></td>
								</tr>
								<tr>
									<td class="with-200">ទូរសព្ទ័លេខ</td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->cus_phone1; if($OUT_REC[0]->cus_phone2 != null && $OUT_REC[0]->cus_phone2 != $OUT_REC[0]->cus_phone1){ echo ' / '.$OUT_REC[0]->cus_phone2; } /* if($OUT_REC[0]->cus_phone3 != null  && $OUT_REC[0]->cus_phone3 != $OUT_REC[0]->cus_phone1){ echo ' / '.$OUT_REC[0]->cus_phone3; } */?></td>
								</tr>
							</table>
						</td>
						<td>
							<table class="tbl-head">
								<tr>
									<td class="with-200" style="font-size: 14px;">ពត៍មានបង់ប្រាក់</td><td class="with-10"></td><td></td>
								</tr>
								<tr>
									<td class="with-200">ការិយាល័យ</td><td class="with-10">:</td><td>ផ្សារព្រែកជ្រៃ</td>
								</tr>
								<tr>
									<td class="with-200">កាលបរិច្ឆេទលក់</td><td class="with-10">:</td><td><?php echo date('d-m-Y',strtotime($OUT_REC[0]->sell_date));?></td>
								</tr>
								<tr>
									<td class="with-200">រយះពេល</td><td class="with-10">:</td><td><?php echo ($advPeriod+$loanPeriod);?>ខែ</td>
								</tr>
								<tr>
									<td class="with-200">អត្រាការប្រាក់</td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->inst_interest_rate;?>%</td>
								</tr>
								<tr>
									<td class="with-200">តំលៃផ្ទះ</td><td class="with-10">:</td><td>$<?php echo number_format($OUT_REC[0]->pro_sell_price);?></td>
								</tr>
								<tr>
									<td class="with-200">លេខបង្កាន់ដៃលក់</td><td class="with-10">:</td><td><?php echo $OUT_REC[0]->sell_code;?></td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div >
			<table style="font-size: 11px;">
				<tr style="background: yellow;">
					<th>ល.រ</th>
					<th>ថ្ងៃត្រូវបង់</th>
					<th>ភាគរយ%</th>
					<!-- <th>បញ្ចុះតំលៃ</th> -->
					<th>ប្រាក់ដើមត្រូវបង់</th>
					<th>ការប្រាក់ត្រូវបង់</th>
					<th>សរុបប្រាក់ត្រូវបង់</th>
					<th>ប្រាក់ដើមនៅសល់</th>
				</tr>
				<?php $totalPrinciple=0; $totalInterest=0;$totalPayAmount=0;$totalDiscount=0;
				    for($i=0;$i<count($OUT_REC);$i++){
				        $totalPrinciple += floatval($OUT_REC[$i]->inst_amt_principle);
				        $totalPayAmount += floatval($OUT_REC[$i]->inst_amt_pay);
				         
				?>
				    
    				<tr>
    					<td class="text-center"><?php echo $OUT_REC[$i]->inst_num;?></td>
    					<td class="text-center"><?php echo date('d-m-Y',strtotime($OUT_REC[$i]->inst_date));?></td>
    					<?php 
    						if($OUT_REC[$i]->inst_type=="BOOK"){
    							echo "<td class='text-center'>បង់កក់ទ្រនាប់ដៃ</td>";
    							//echo "<td class='text-right'><span style='float: left; margin-left: 5px;'>$</span>-</td>";
    						}else if($OUT_REC[$i]->inst_type=="ADV"){
    						    echo "<td class='text-center'>".$bookTrue.$OUT_REC[$i]->inst_pay_per."%</td>";
    							//echo "<td class='text-right'>".($OUT_REC[$i]->inst_dis_amt == "0" ? "<span style='float: left; margin-left: 5px;'>$</span>-" : "<span style='float: left; margin-left: 5px;'>$</span>".number_format($OUT_REC[$i]->inst_dis_amt))."</td>";
    							$bookTrue="";
    							$totalDiscount += $OUT_REC[$i]->inst_dis_amt;
    						}else if($OUT_REC[$i]->inst_type=="LOAN"){
    						    echo "<td class='text-center'>".$OUT_REC[$i]->con_type_nm_kh."</​​td>";
    							//echo "<td class='text-right'><span style='float: left; margin-left: 5px;'>$</span>-</td>";
    							$totalInterest += floatval($OUT_REC[$i]->inst_amt_interest);
    						}else if($OUT_REC[$i]->inst_type=="LEFT"){
    						    echo "<td class='text-center'>".$OUT_REC[$i]->con_type_nm_kh.$OUT_REC[$i]->inst_pay_per."%</td>";
    							//echo "<td class='text-right'><span style='float: left; margin-left: 5px;'>$</span>-</td>";
    						}
    					?>
    					<td class="text-right"><span style='float: left; margin-left: 5px;'>$</span><?php echo number_format($OUT_REC[$i]->inst_amt_principle);?></td>
    					
    						<?php 
    							if($OUT_REC[$i]->inst_amt_interest =="0"){
    								echo "<td class='text-right'><span style='float: left; margin-left: 5px;'>$</span>-</td>";
    							}else{
    								echo "<td class='text-right'><span style='float: left; margin-left: 5px;'>$</span>".number_format($OUT_REC[$i]->inst_amt_interest)."</td>";
    							}
    						?>
    					
    					<td class="text-right"><span style='float: left; margin-left: 5px;'>$</span><?php echo number_format($OUT_REC[$i]->inst_amt_pay);?></td>
    					<td class="text-right"><span style='float: left; margin-left: 5px;'>$</span><?php 
							if($OUT_REC[$i]->inst_type=="LEFT"){
    							echo "-";
    						}else{
    							echo number_format($OUT_REC[$i]->inst_amt_balance);
    						}
    					?></td>
    				</tr>
				<?php }?>
				<tr>
					<td colspan="3" class="text-center" style="font-weight: bold">សរុប</td>
					<td class="text-right" style="font-weight: bold"><span style='float: left; margin-left: 5px;'>$</span><?php echo number_format($totalPrinciple);?></td>
					<td class="text-right" style="font-weight: bold"><?php echo $totalInterest == 0 ? "<span style='float: left; margin-left: 5px;'>$</span>-" : "<span style='float: left; margin-left: 5px;'>$</span>".number_format($totalInterest);?></td>
					<td class="text-right" style="font-weight: bold"><span style='float: left; margin-left: 5px;'>$</span><?php echo number_format($totalPayAmount);?></td>
					<td></td>
				</tr>	
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
					<td style="width: 50%;font-weight: bold;padding-left: 100px;">ស្នាមមេដៃស្ដាំភាគី ខ</td>
					<td style="width: 50%;font-weight: bold;padding-left: 150px;">ស្នាមមេដៃស្ដាំភាគី ក</td>
					
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
					<td style="width: 50%;font-weight: bold;padding-left: 100px;"><?php echo $OUT_REC[0]->cus_nm_kh;if($OUT_REC[0]->cus_nm_kh2 != null){ echo ' & '.$OUT_REC[0]->cus_nm_kh2; } if($OUT_REC[0]->cus_nm_kh3 != null){ echo ' & '.$OUT_REC[0]->cus_nm_kh3; }?></td>
					<td style="width: 50%;font-weight: bold;padding-left: 150px;">ហេង ពិសិដ្ឋ</td>
				</tr>
				<!-- 
				<tr>
					<td style="font-weight: bold;color: #D4AF37;">BOREY GALAXY11</td>
				</tr>
				<tr>
					<td colspan="4">ការិយាល័យ: ផ្សារព្រែកជ្រៃ សង្កាត់ស្ពានថ្ម ខណ្ឌដង្កោ រាជធានីភ្នំពេញ (ជិតផ្លូវ៦០សម្តេចតេជោ)ទូរសព្ទ័០17 661 122/098 66 11 22</td>
				</tr>
				 -->
			</table>
		</div>
		
	</body>
</html>
<?php setlocale(LC_MONETARY, 'en_US');?>
				<?php
					function returnAdvPerDesc($dataAdvPer) {
    				    $dataAdvPer = floatval($dataAdvPer);
    				    if($dataAdvPer == 100){
    				        return 'មួយរយ';
    				    }else{
    				        $desc="";
    				        if($dataAdvPer >= 10){
    				            $dataAdvPerStr = $dataAdvPer."";
    				            switch (intval(substr($dataAdvPerStr, 0,1))) {
    				                case 9:
    				                    $desc="កៅសិប";
    				                    break;
    				                case 8:
    				                    $desc="ប៉ែតសិប";
    				                    break;
    				                case 7:
    				                    $desc="ចិតសិប";
    				                    break;
    				                case 6:
    				                    $desc="ហុកសិប";
    				                    break;
    				                case 5:
    				                    $desc="ហាសិប";
    				                    break;
    				                case 4:
    				                    $desc="សែសិប";
    				                    break;
    				                case 3:
    				                    $desc="សាមសិប";
    				                    break;
    				                case 2:
    				                    $desc="ម្ភៃ";
    				                    break;
    				                case 1:
    				                    $desc="ដប់";
    				                    break;
    				            }
    				            if(substr($dataAdvPerStr, 1,1) =="9"){
    				                $desc.="ប្រាំបូន";
    				            }else if(substr($dataAdvPerStr, 1,1) =="8"){
    				                $desc.="ប្រាំបី";
    				            }else if(substr($dataAdvPerStr, 1,1) =="7"){
    				                $desc.="ប្រាំពីរ";
    				            }else if(substr($dataAdvPerStr, 1,1) =="6"){
    				                $desc.="ប្រាំមួយ";
    				            }else if(substr($dataAdvPerStr, 1,1) =="5"){
    				                $desc.="ប្រាំ";
    				            }else if(substr($dataAdvPerStr, 1,1) =="4"){
    				                $desc.="បួន";
    				            }else if(substr($dataAdvPerStr, 1,1) =="3"){
    				                $desc.="បី";
    				            }else if(substr($dataAdvPerStr, 1,1) =="2"){
    				                $desc.="ពីរ";
    				            }else if(substr($dataAdvPerStr, 1,1) =="1"){
    				                $desc.="មួយ";
    				            }
    				            return $desc;
    				        }else{
    				            if(substr($dataAdvPerStr, 0,1) =="9"){
    				                $desc.="ប្រាំបូន";
    				            }else if(substr($dataAdvPerStr, 0,1) =="8"){
    				                $desc.="ប្រាំបី";
    				            }else if(substr($dataAdvPerStr, 0,1) =="7"){
    				                $desc.="ប្រាំពីរ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="6"){
    				                $desc.="ប្រាំមួយ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="5"){
    				                $desc.="ប្រាំ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="4"){
    				                $desc.="បួន";
    				            }else if(substr($dataAdvPerStr, 0,1) =="3"){
    				                $desc.="បី";
    				            }else if(substr($dataAdvPerStr, 0,1) =="2"){
    				                $desc.="ពីរ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="1"){
    				                $desc.="មួយ";
    				            }
    				            return $desc;
    				        }
    				    }
    				}
    				
    				
    				function returnMoneyDesc($dataAdvPer) {
    				    $dataAdvPer = floatval($dataAdvPer);
    				    if($dataAdvPer === 1000){
    				        return 'មួយពាន់';
    				    }else{
    				        $desc="";
    				        if($dataAdvPer >= 100){
    				            $dataAdvPerStr = $dataAdvPer."";
    				            if(substr($dataAdvPerStr, 0,1) =="9"){
    				                $desc.="ប្រាំបូន";
    				            }else if(substr($dataAdvPerStr, 0,1) =="8"){
    				                $desc.="ប្រាំបី";
    				            }else if(substr($dataAdvPerStr, 0,1) =="7"){
    				                $desc.="ប្រាំពីរ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="6"){
    				                $desc.="ប្រាំមួយ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="5"){
    				                $desc.="ប្រាំ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="4"){
    				                $desc.="បួន";
    				            }else if(substr($dataAdvPerStr, 0,1) =="3"){
    				                $desc.="បី";
    				            }else if(substr($dataAdvPerStr, 0,1) =="2"){
    				                $desc.="ពីរ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="1"){
    				                $desc.="មួយ";
    				            }
    				            $desc.="រយ";
    				            
    				            switch (intval(substr($dataAdvPerStr, 1,1))) {
    				                case 9:
    				                    $desc="កៅសិប";
    				                    break;
    				                case 8:
    				                    $desc="ប៉ែតសិប";
    				                    break;
    				                case 7:
    				                    $desc="ចិតសិប";
    				                    break;
    				                case 6:
    				                    $desc="ហុកសិប";
    				                    break;
    				                case 5:
    				                    $desc="ហាសិប";
    				                    break;
    				                case 4:
    				                    $desc="សែសិប";
    				                    break;
    				                case 3:
    				                    $desc="សាមសិប";
    				                    break;
    				                case 2:
    				                    $desc="ម្ភៃ";
    				                    break;
    				                case 1:
    				                    $desc="ដប់";
    				                    break;
    				            }
    				            if(substr($dataAdvPerStr, 2,1) =="9"){
    				                $desc.="ប្រាំបូន";
    				            }else if(substr($dataAdvPerStr, 2,1) =="8"){
    				                $desc.="ប្រាំបី";
    				            }else if(substr($dataAdvPerStr, 2,1) =="7"){
    				                $desc.="ប្រាំពីរ";
    				            }else if(substr($dataAdvPerStr, 2,1) =="6"){
    				                $desc.="ប្រាំមួយ";
    				            }else if(substr($dataAdvPerStr, 2,1) =="5"){
    				                $desc.="ប្រាំ";
    				            }else if(substr($dataAdvPerStr, 2,1) =="4"){
    				                $desc.="បួន";
    				            }else if(substr($dataAdvPerStr, 2,1) =="3"){
    				                $desc.="បី";
    				            }else if(substr($dataAdvPerStr, 2,1) =="2"){
    				                $desc.="ពីរ";
    				            }else if(substr($dataAdvPerStr, 2,1) =="1"){
    				                $desc.="មួយ";
    				            }
    				            return $desc;
    				           
    				        }else if($dataAdvPer >= 10){
    				            $dataAdvPerStr = $dataAdvPer."";
    				            switch (intval(substr($dataAdvPerStr, 0,1))) {
    				                case 9:
    				                    $desc="កៅសិប";
    				                    break;
    				                case 8:
    				                    $desc="ប៉ែតសិប";
    				                    break;
    				                case 7:
    				                    $desc="ចិតសិប";
    				                    break;
    				                case 6:
    				                    $desc="ហុកសិប";
    				                    break;
    				                case 5:
    				                    $desc="ហាសិប";
    				                    break;
    				                case 4:
    				                    $desc="សែសិប";
    				                    break;
    				                case 3:
    				                    $desc="សាមសិប";
    				                    break;
    				                case 2:
    				                    $desc="ម្ភៃ";
    				                    break;
    				                case 1:
    				                    $desc="ដប់";
    				                    break;
    				            }
    				            if(substr($dataAdvPerStr, 1,1) =="9"){
    				                $desc.="ប្រាំបូន";
    				            }else if(substr($dataAdvPerStr, 1,1) =="8"){
    				                $desc.="ប្រាំបី";
    				            }else if(substr($dataAdvPerStr, 1,1) =="7"){
    				                $desc.="ប្រាំពីរ";
    				            }else if(substr($dataAdvPerStr, 1,1) =="6"){
    				                $desc.="ប្រាំមួយ";
    				            }else if(substr($dataAdvPerStr, 1,1) =="5"){
    				                $desc.="ប្រាំ";
    				            }else if(substr($dataAdvPerStr, 1,1) =="4"){
    				                $desc.="បួន";
    				            }else if(substr($dataAdvPerStr, 1,1) =="3"){
    				                $desc.="បី";
    				            }else if(substr($dataAdvPerStr, 1,1) =="2"){
    				                $desc.="ពីរ";
    				            }else if(substr($dataAdvPerStr, 1,1) =="1"){
    				                $desc.="មួយ";
    				            }
    				            return $desc;
    				        }else{
    				            if(substr($dataAdvPerStr, 0,1) =="9"){
    				                $desc.="ប្រាំបូន";
    				            }else if(substr($dataAdvPerStr, 0,1) =="8"){
    				                $desc.="ប្រាំបី";
    				            }else if(substr($dataAdvPerStr, 0,1) =="7"){
    				                $desc.="ប្រាំពីរ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="6"){
    				                $desc.="ប្រាំមួយ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="5"){
    				                $desc.="ប្រាំ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="4"){
    				                $desc.="បួន";
    				            }else if(substr($dataAdvPerStr, 0,1) =="3"){
    				                $desc.="បី";
    				            }else if(substr($dataAdvPerStr, 0,1) =="2"){
    				                $desc.="ពីរ";
    				            }else if(substr($dataAdvPerStr, 0,1) =="1"){
    				                $desc.="មួយ";
    				            }
    				            return $desc;
    				        }
    				    }
    				
				}?>
<html>
	<head>
		<style>
		@media print {
           body {
              -webkit-print-color-adjust: exact;
           }
           #Header{ display: none !important; }
           
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
		  	font-size: 15px;
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
		  h4,h5,b{
		      font-family: Khmer OS Muol Light;
		      font-weight: 500;
		  }
		  h4{
		      font-weight: 500;
		      font-size: 15px;
		  }
		</style>
	</head>
	<body style="">
		
		<div style="text-align: center;"><h4>ព្រះរាជាណាចក្រកម្ពុជា</h4></div>
		<div style="text-align: center;margin-top: -20px"><h4>ជាតិ សាសនា ព្រះមហាក្សត្រ</h4></div>
		<div style="text-align: center;margin-top: -30px"><span style='font-size:15px;'>&#10037;</span></div>
		<div style="text-align: center;margin-top: -30px"><h4>កិច្ចសន្យាទិញ-លក់ផ្ទះ</h4></div>
		<div style="text-align: left;"><h4>កិច្ចសន្យានេះធ្វើឡើងរវាង</h4></div>
		
		<div>
			<p style="font-size: 15px">
				ក្រុមហ៊ុន <b>ហ្គាឡាក់ស៊ី១១</b> មានទីតាំងស្ថិតនៅជិតផ្លូវលេខ២១៧   ភូមិដូង  សង្កាត់ស្ពានថ្ម ខណ្ឌដង្កោ រាជធានីភ្នំពេញ   ដែលតំណាងដោយលោក <b>ហេង ពិសិដ្ឋ</b> សញ្ជាតិ ខ្មែរ កាន់អត្តសញ្ញាណប័ណ្ណលេខ ០១០៥៥២៧៧៧ ចុះថ្ងៃទី១៧ ខែ០៧ ឆ្នាំ ២០១៨    មានទីលំនៅផ្ទះលេខ២១៦ ផ្លូវម៉ៅសេទុង   សង្កាត់ទំនប់ទឹក ខណ្ឌចំការមន រាជធានីភ្នំពេញ ជាអ្នកលក់ ហៅកាត់ថា <b>ភាគី “ក”</b> លេខទូរស័ព្ទទំនាក់ទំនង 017 678 889 ។
			</p>
		</div>
		<div style="text-align: center;margin-top: -10px"><h4>និង</h4></div>
		<div style="margin-top: -10px">
			<p style="font-size: 15px;">
				ឈ្មោះ <b> <?php echo $OUT_REC[0]->cus_nm_kh;?></b> ភេទ  <?php 	if($OUT_REC[0]->cus_gender=="Male"){echo "ប្រុស";}else if($OUT_REC[0]->cus_gender=="Female"){echo "ស្រី";}?> ជនជាតិខ្មែរ កាន់អត្តសញ្ញាណប័ណ្ណសញ្ជាតិខ្មែរលេខ <?php echo $OUT_REC[0]->cus_idnt_num;?>  ចុះថ្ងៃទី <?php echo substr($OUT_REC[0]->cus_indt_date,8,2);?> ខែ <?php echo substr($OUT_REC[0]->cus_indt_date,5,2);?> ឆ្នាំ <?php echo substr($OUT_REC[0]->cus_indt_date,0,4);?>  អាស័យដ្ឋាន <?php echo $OUT_REC[0]->cus_addr;?> ជាអ្នកទិញ ហៅកាត់ថា <b>ភាគី “ខ”</b> លេខទូរស័ព្ទទំនាក់ទំនង <?php echo $OUT_REC[0]->cus_phone1;?>។
			</p>
		</div>
		<div style="text-align: center;margin-top: -10px"><h4>បុព្វកថា</h4></div>
		<div style="margin-top: -10px">
			<p style="font-size: 15px;">
				ដោយហេតុថា  <b><b>ភាគី”ក”</b></b>  ជាម្ចាស់សំណង់ នៃក្រុមហ៊ុន <b>ហ្គាឡាក់ស៊ី១១</b> សម្រាប់ លក់ជូនអតិថិជនជា <b>ភាគី”ខ”</b> ហើយ <b>ភាគី”ខ”</b>  មានបំណងចង់ទិញផ្ទះរបស់ <b>ភាគី”ក”</b>។
			</p>
		</div>
		<div style="text-align: center;margin-top: -10px"><h4>ភាគីទាំងពីរឯកភាពតាមប្រការដូចខាងក្រោមៈ</h4></div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ១៖</u>	<span style="margin-left: 30px"> ទំហំដី និង ផ្ទះ</span></h4></div>
		
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<b>ភាគី”ក”</b> យល់ព្រមលក់ ហើយ<b>ភាគី”ខ”</b>យល់ព្រមទិញពី<b>ភាគី”ក”</b> នូវផ្ទះ  ដែលមានដីទំហំ <?php echo $OUT_REC[0]->pro_land_width;?>m x <?php echo $OUT_REC[0]->pro_land_height;?>m និងផ្ទះទំហំសរុប <?php echo $OUT_REC[0]->pro_area;?>m<sup>2</sup> ដែលមានទទឹង <?php echo floatval($OUT_REC[0]->pro_width);?>m បណ្ដោយ <?php echo floatval($OUT_REC[0]->pro_length);?>m ផ្ទះលេខ <?php echo $OUT_REC[0]->pro_code;?> ប្រភេទ<?php echo $OUT_REC[0]->cat_nm_kh;?>  ស្ថិតនៅក្នុងទីតាំងរបស់<b>ភាគី”ក”</b> ជិតផ្លូវ ២១៧ ភូមិដូង សង្កាត់ស្ពានថ្ម ខណ្ឌដង្កោ រាជធានីភ្នំពេញ ។ តាមប្លង់គោលភ្ជាប់ជូនខាងលើ (ភាគី “ក” រក្សាសិទ្ធិកែប្រែប្លង់គោលតាមករណីជាក់ស្ដែង)
			</p>
		</div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ២៖</u>	<span style="margin-left: 30px"> តម្លៃផ្ទះ</span></h4></div>
		
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<b>ភាគី”ក”</b> យល់ព្រមលក់ដី និងផ្ទះប្រភេទ<?php echo $OUT_REC[0]->cat_nm_kh;?> ខាងលើជូន <b>ភាគី”ខ”</b> ក្នុងតំលៃព្រមព្រៀងចំនួន <b style="font-weight: bold;">USD<?php echo number_format( floatval($OUT_REC[0]->pro_sell_price) );?></b> <br>(<?php echo $OUT_REC[0]->pro_sell_price_desc;?>ដុល្លារអាមេរិកគត់)។
			</p>
		</div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ៣៖</u>	<span style="margin-left: 30px"> ការទូទាត់ប្រាក់ ថ្លៃទិញ-លក់ផ្ទះ</span></h4></div>
		
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<b>ភាគី”ខ”</b> ត្រូវទូទាត់ប្រាក់ថ្លៃទិញ-លក់ជូន<b>ភាគី”ក”</b> តាមចំនួន និងកាលបរិច្ឆេទនៃកិច្ចសន្យាដែលមានភ្ជាប់ជា	ឧបសម្ព័ន្ធ នៃកិច្ចសន្យា។លក្ខខណ្ឌ័នៃការទូទាត់ប្រាក់ថ្លៃទិញ-លក់ផ្ទះនេះអាចមានការប្រែប្រួលអាស្រ័យតាម	ការពិភាក្សាព្រម	ព្រៀងរវាង	ភាគីលក់ និងភាគីទិញ ដោយផ្អែកតាមតារាងកាលវិភាគបង់ប្រាក់ រឹតាមការទូទាត់ជាក់ស្ដែង។
			</p>
		</div>
		
		<!--  
		<span style="position: relative;top: 120px;left: 700px;font-size: 10px;">1/4</span>
		 -->
		
		<br>
		<div style="text-align: left;margin-top: 0px"><h4><u>ប្រការ ៤៖</u>	<span style="margin-left: 30px"> សិទ្ធិ និង កាតព្វកិច្ចរបស់<b>ភាគី”ក”</b></span></h4></div>
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៤.១</span>	<b>ភាគី”ក”</b> ធានាសាងសង់ផ្ទះវីឡាទោលជូន<b>ភាគី”ខ”</b> តាមគំនូសប្លង់ផ្ទះគំរូ និង សាងសង់ផ្ទះឲ្យរួចរាល់ក្នុង
រយៈពេល  <?php echo $OUT_REC[0]->pro_sell_time_build;?>ខែ គិតពីថ្ងៃចុះកិច្ចសន្យា លើកលែងក្នុងករណីប្រធានស័ក្កដូចជា៖ ទឹកជំនន់ រញ្ជួយដី វិបត្តិនយោបាយ អស្ថេរភាពសង្គមកើតឡើង ដែលហេតុការណ៍ទាំងនេះ បណ្ដាលឲ្យមានការរាំងស្ទះដល់ការសាងសង់ ។
			</p>
			
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៤.២</span>	<b>ភាគី”ក”</b> ត្រូវធានារយៈពេល ១ឆ្នាំ ចំពោះករណីជញ្ជាំង ប្រេះស្រាំ ប្រព័ន្ធលូ និង ប្រព័ន្ធទឹកស្ទះ ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៤.៣</span>	ករណី <b>ភាគី”ក”</b> មិនបានសាងសង់ផ្ទះវីឡាទោលជូន<b>ភាគី”ខ”</b> តាមកាលកំណត់ខាងលើទេនោះ <b>ភាគី”ក”</b> 	យល់ព្រមបង់ប្រាក់ពិន័យចំនួន<b style="font-weight: bold;"> USD300</b>(បីរយដុល្លារ) ក្នុងមួយខែអោយ<b>ភាគី”ខ”</b> រហូតដល់ផ្ទះសាងសង់រួចរាល់។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៤.៤</span>	<b>ភាគី”ក”</b> អះអាងថា ផ្ទះ<?php echo $OUT_REC[0]->cat_nm_kh;?>ដែលបានលក់ខាងលើ ជាកម្មសិទ្ធិស្របច្បាប់របស់ខ្លួនយ៉ាងពិតប្រាកដ 	ដោយពុំមានជាប់ពាក់ព័ន្ធ បណ្ដឹងវិវាទអ្វីឡើយ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៤.៥</span>	<b>ភាគី”ក”</b> ទទួលខុសត្រូវក្នុងការកាត់ប្លង់បំបែកក្បាលដីជូន<b>ភាគី”ខ”</b> ដោយសោហ៊ុយចំណាយជាបន្ទុក	របស់<b>ភាគី”ក”</b> ។
			</p>
		</div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ៥៖</u>	<span style="margin-left: 30px"> សិទ្ធិកាតព្វកិច្ចរបស់ភាគី ”ខ”</span></h4></div>
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.១</span>	<b>ភាគី”ខ”</b> ពុំមានសិទ្ធិកែប្រែប្លង់សាងសង់ ឬ សាងសង់បន្ថែមខុសពី ផ្ទះគំរូឡើយទោះបីជាក្រោយពេល	<b>ភាគី”ក”</b> ប្រគល់ផ្ទះវីឡាទោលជូន<b>ភាគី”ខ”</b> រួចហើយក៏ដោយ ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.២</span>	ក្នុងកំឡុងពេលអនុវត្តន៍កិច្ចសន្យានេះ <b>ភាគី”ខ”</b> អាចលក់ រឺផ្ទេរកិច្ចសន្យានេះអោយអតិថិជនណាមួយ  ដោយ<b>ភាគី”ខ”</b> ត្រូវបំពេញបែបបទលក់រឺ ផ្ទេរសិទ្ធិចំពោះមុខ  	<b>ភាគី”ក”</b> ជាមុខសិន។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៣</span>	<b>ភាគី”ខ”</b> ត្រូវទទួលខុសត្រូវបន្ទុកបង់សោហ៊ុយក្នុងការលក់ ឬផ្ទេរកិច្ចសន្យាចំនួន<b style="font-weight: bold;">USD<?php echo number_format( floatval($OUT_REC[0]->sell_tran_price) );?></b>(<?php echo returnMoneyDesc($OUT_REC[0]->sell_tran_price);?>ដុល្លារ) ជូន <b>ភាគី”ក”</b> អតិថិជនដែលទទួលបានសិទ្ធិបន្តត្រូវអនុវត្តន៍តាមកិច្ចសន្យានេះទាំងស្រុង។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៤</span>	<b>ភាគី”ខ”</b> ត្រូវអនុវត្តន៍ការទូទាត់ប្រាក់នៅស្នាក់ការរបស់ <b>ភាគី”ក”</b> ដូចបានកំណត់ខាងលើ។
			</p>
			
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៥</span>	<b>ភាគី”ខ”</b> តូ្រវធ្វើការទូទាត់ប្រាក់តាមប្រព័ន្ធធនាគារ ឬ ឯកជន តាមមធ្យោបាយសមស្រប	ណាមួយ	ប្រសិនបើមានការស្នើសុំពី <b>ភាគី”ក”</b> អ្នកតំណាងរបស់<b>ភាគី”ខ”</b> ឬ អតិថិជនណាមួយដែលយក	ប្រាក់ទូទាត់	នៃកិច្ចសន្យានេះត្រូវសន្មត់ថាធ្វើការទូទាត់ដើម្បីប្រយោជន៍ទាំងស្រុងរបស់<b>ភាគី”ខ”</b> ។
			</p>
			
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៦</span>	<b>ភាគី”ខ”</b> ត្រូវទូទាត់ប្រាក់បង់រំលោះអោយទាន់ពេលវេលា និងកាលកំណត់។
			</p>
			
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៧</span>	ក្នុងករណីដែល <b>ភាគី”ខ”</b> ខកខាន ឫ យឺតយ៉ាវក្នុងការទូទាត់ជូន <b>ភាគី”ក”</b> នោះ<b>ភាគី”ខ”</b> ត្រូវបង់ប្រាក់ពិន័យដូចខាងក្រោម៖
				<ul>
					<li>បើលើសរយះពេលកំណត់ចាប់ពី ៥ថ្ងៃ រហូតដល់៣០ថ្ងៃត្រូវពិន័យចំនួន៣% (បីភាគរយ)</li>
					<li style="list-style-type: none;">&nbsp;</li>
					<br>
					<li>បើលើសរយះពេលកំណត់ចាប់ពី ៣០ថ្ងៃ រហូតដល់ ៩០ថ្ងៃ ត្រូវពិន័យចំនួន ៥%(ប្រាំភាគរយ) នៃប្រាក់ដែលមិនទាន់បានបង់ (ប្រចាំខែ)។ ការយឺតយ៉ាវ រឺការខកខាន នេះមិនត្រូវលើសពី៩០ថ្ងៃឡើយ។</li>
				</ul>
			</p>
			
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៨</span>	ក្នុងករណីដែល <b>ភាគី”ខ”</b> មិនបានបង់ប្រាក់ លើសពីរយះពេល ៩០ថ្ងៃ ជូន  <b>ភាគី”ក”</b> នោះ <b>ភាគី”ខ”</b> យល់ព្រមបោះបង់សិទ្ធក្នុងការទិញផ្ទះ ហើយយល់ព្រមប្រគល់ផ្ទះ និងដី ដែលបានទិញស្របតាមកិច្ចសន្យាលក់ទិញផ្ទះនេះ ជូនក្រុមហ៊ុន <b>ហ្គាឡាក់ស៊ី១១ </b> ជាកម្មសិទ្ធវិញ។ ហើយក្រុមហ៊ុន <b>ហ្គាឡាក់ស៊ី១១ </b> មានសិទ្ធចាត់ចែងអចលនទ្រព្យដោយស្របច្បាប់។ <b>ភាគី”ខ”</b> យល់ព្រមដោយស្ម័គ្រចិត្តមិនប្ដឹងទាមទារ រឺតវ៉ាជាដាច់
ខាត ដោយទទួលស្គាល់ថានេះជាការបំពានកិច្ចសន្យារបស់ខ្លួន។

			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៩</span>	<b>ភាគី”ខ”</b> ត្រូវបង់សេវាសន្តិសុខ អំពូលភ្លើងផ្លូវ ថែសួនអនាម័យសាធារណៈចំនួន 	USD‌‌	(   ) 	ក្នុងមួយខែជារៀងរាល់ខែ គិតចាប់ពីថ្ងៃប្រគល់ទទួលផ្ទះ ទោះជាបានស្នាក់នៅ ឬមិន	ស្នាក់នៅក៍ដោយ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.១០</span>	<b>ភាគី”ខ”</b> ត្រូវគោរពតាមបទបញ្ជាផ្ទៃក្នុង និង គោលការណ៍រួមរបស់គំរោង រួមទាំងការគ្រប់គ្រងរបស់ ក្រុមហ៊ុន <b>ហ្គាឡាក់ស៊ី១១ </b>។
			</p>
			
		</div>
		
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ៦៖</u>	<span style="margin-left: 30px"> អនុភាពនៃកិច្ចសន្យា</span></h4></div>
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.១</span>	ភាគីទាំងពីរបានអានរាល់ខ្លឹមសារទាំងអស់ នៃកិច្ចសន្យានេះហើយសន្យាគោរពអោយបានរាល់ខ្លឹមសារទាំងអស់នៃកិច្ចសន្យាបើភាគីណាមួយមិនគោរពរឺបំពាននិងត្រូវទទួលខុសត្រូវចំពោះមុខច្បាប់ជាធរមាន ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.២</span>	កិច្ចសន្យានេះធ្វើឡើង ដោយស័្មគ្រចិត្ត រវាងភាគីទាំងពីរ ដោយឥតមានការបង្ខិតបង្ខំ ឬគំរាមកំហែង ពីភាគីណាមួយឡើយ ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.៣</span>	ការជូនដំណឹងទៅភាគីទាំងពីរ ត្រូវផ្ញើរទៅអាស័យដ្ឋានដូចបញ្ជាក់ខាងលើ ឬតាមការបញ្ជូន	លិខិតដោយផ្ទាល់ និង តាមការជូនដំណឹងតាមរយៈទូរស័ព្ទទំនាក់ទំនងខាងលើ ។ 
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.៤</span>	កិច្ចសន្យានេះធ្វើឡើងចំនួន 03 ច្បាប់ដើមមាន 04ទំព័រ មានតំលៃស្មើៗគ្នាដោយរក្សាទុកនៅ ៖
				<ul>
					<li>ភាគី”ក” ចំនួន 01ច្បាប់ដើម  </li>
					<li>ភាគី”ខ” ចំនួន 01ច្បាប់ដើម  និង</li>
					<li>មេធាវីភាគី (ក) ចំនួន 01ច្បាប់ដើម </li>
				</ul>
			</p>
			
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.៥</span>	ភាគីទាំងពីរសុខចិត្តផ្ដិតមេដៃស្តាំទុកជាភស្តុតាងជូនចំពោះមុខមេធាវី<b>ភាគី”ក”</b>។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.៦</span>	កិច្ចសន្យាលក់ទិញ ផ្ទះ នេះមានប្រសិទ្ធិភាពចាប់ពីថ្ងៃផ្ដិតមេដៃនេះតទៅ។
			</p>
			
		</div>
		<br><br><br><br>
		<div style="margin-top: 150px;">
			<br><br>
			<table class="tbl-head">
				<tr>
					<td style="width: 50%;font-weight: normal;padding-left: 100px;"></td>
					<td style="width: 50%;font-weight: normal;padding-left: 0px;">រាជធានីភ្នំពេញ ថ្ងៃទី…………ខែ…………ឆ្នាំ………… </td>
					
				</tr>
				<tr style="height: 50px;">
					
				</tr>
				<tr>
					<td style="width: 50%;font-weight: normal;padding-left: 100px;">ស្នាមមេដៃស្តាំភាគី(ខ) អ្នកទិញ</td>
					<td style="width: 50%;font-weight: normal;padding-left: 100px;">ស្នាមមេដៃស្តាំភាគី(ក) អ្នកលក់</td>
					
				</tr>
				<tr>
					<td style="width: 50%;padding-left: 100px;"></td>
					<td style="width: 50%;padding-left: 70px;"><h4>តំណាងក្រុមហ៊ុន ហ្គាឡាក់ស៊ី១១</h4></td>
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
					<td style="width: 50%;padding-left: 125px;"><h4><?php echo $OUT_REC[0]->cus_nm_kh;?></h4></td>
					<td style="width: 50%;padding-left: 125px;"><h4>ហេង ពិសិដ្ឋ</h4></td>
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
		
		<div style="margin-top: 30px;text-align: center;">
			<h4>បានឃើញ</h4>
			<p style="font-size: 15px;">
				រាជធានីភ្នំពេញថ្ងៃទី…………ខែ…………ឆ្នាំ………… 
			</p>
			<h4>ហត្ថលេខា និង ត្រា</h4>
			
		</div>
		
	</body>
</html>
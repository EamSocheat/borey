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
		  h4,h5,b{
		      font-family: Khmer OS Muol Light;
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
			<p style="font-size: 15px;">
				ក្រុមហ៊ុន <b>ហ្គាឡាក់ស៊ី១១</b> មានទីតាំងស្ថិតនៅជិតផ្លូវលេខ២១៧   ភូមិដូង  សង្កាត់ស្ពានថ្ម ខណ្ឌដង្កោ រាជធានីភ្នំពេញ   ដែលតំណាងដោយលោក <b>ហេង ពិសិដ្ឋ</b> សញ្ជាតិ ខ្មែរ កាន់អត្តសញ្ញាណប័ណ្ណលេខ ០១០៥៥២៧៧៧ ចុះថ្ងៃទី១៧ ខែ០៧ ឆ្នាំ ២០១៨    មានទីលំនៅផ្ទះលេខ២១៦ ផ្លូវម៉ៅសេទុង   សង្កាត់ទំនប់ទឹក ខណ្ឌចំការមន រាជធានីភ្នំពេញ ជាអ្នកលក់ ហៅកាត់ថា <b>ភាគី “ក”</b> លេខទូរស័ព្ទទំនាក់ទំនង 017 678 889 ។
			</p>
		</div>
		<div style="text-align: center;margin-top: -10px"><h4>និង</h4></div>
		<div style="margin-top: -10px">
			<p style="font-size: 15px;">
				ឈ្មោះ .................... ភេទ ............ កាន់អត្តសញ្ញាណប័ណ្ណលេខ ……………..  ចុះថ្ងៃទី…… ខែ….. ឆ្នាំ …………  អាស័យដ្ឋាន ………. សង្កាត់….. ………………………….  ជាអ្នកទិញ ហៅកាត់ថា ភាគី “ខ” លេខទូរស័ព្ទទំនាក់ទំនង 0………………………………….។
			</p>
		</div>
		<div style="text-align: center;margin-top: -10px"><h4>បុព្វកថា</h4></div>
		<div style="margin-top: -10px">
			<p style="font-size: 15px;">
				ដោយ <b>ភាគី”ក”</b>  ជាម្ចាស់សំណង់ ក្រុមហ៊ុន <b>ហ្គាឡាក់ស៊ី១១</b> សម្រាប់ លក់ជូនអតិថិជនជា ភាគី”ខ” មានបំណងចង់ទិញផ្ទះ ភាគី”ក”។
			</p>
		</div>
		<div style="text-align: center;margin-top: -10px"><h4>ភាគីទាំងពីរឯកភាពតាមប្រការដូចខាងក្រោមៈ</h4></div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ១៖</u>	<span style="margin-left: 30px"> ទំហំដី និង ផ្ទះ</span></h4></div>
		
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				ភាគី”ក” យល់ព្រមលក់ ហើយភាគី”ខ”យល់ព្រមទិញពីភាគី”ក” នូវផ្ទះប្រភេទ វីឡាកូនទោល ដែលមានដីទំហំ ..m និងផ្ទះទំហំសរុប ..m2 ដែលមានទទឹង..m បណ្ដោយ...m ផ្ទះលេខ…………ប្លុកV-…… ប្រភេទផ្ទះ... ស្ថិតនៅក្នុងទីតាំងរបស់ភាគី”ក” នៅជិតផ្លូវ ២១៧ ភូមិដូង សង្កាត់ស្ពានថ្ម ខណ្ឌដង្កោ រាជធានីភ្នំពេញ ។ តាមប្លង់គោលភ្ជាប់ជូនខាងលើ (ភាគី “ក” រក្សាសិទ្ធិកែប្រែប្លង់គោលតាមករណីជាក់ស្ដែង)
			</p>
		</div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ២៖</u>	<span style="margin-left: 30px"> តម្លៃផ្ទះ</span></h4></div>
		
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				ភាគី”ក” យល់ព្រមលក់ដី និងផ្ទះប្រភេទវីឡាទោល ខាងលើជូន ភាគី”ខ” ក្នុងតំលៃព្រមព្រៀងចំនួន USD ……………. (......................................................................)។
			</p>
		</div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ៣៖</u>	<span style="margin-left: 30px"> ការទូទាត់ប្រាក់</span></h4></div>
		
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				ភាគី”ខ” ត្រូវទូទាត់ប្រាក់ថ្លៃទិញ-លក់ជូនភាគី”ក” តាមចំនួន និងកាលបរិច្ឆេទនៃកិច្ចសន្យា។ ភាគីទាំងពីរបានឯកភាពគ្នាតាមលក្ខខណ្ខដូចខាងក្រោម និង ឧបសម្ព័ន្ធ នៃកិច្ចសន្យា៖
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;text-decoration: underline;">ដំណាក់កាលទី ១៖</span>	ភាគី”ខ” យល់ព្រមប្រគល់ប្រាក់ចំនួន USD2,000 (ពីរពាន់ដុល្លារអាមេរិកគត់) ឲ្យ	ទៅ 	ភាគី”ក” នៅថ្ងៃចុះកិច្ចសន្យានេះ សំរាប់ជាការកក់ប្រាក់ទ្រនាប់ដៃ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;text-decoration: underline;">ដំណាក់កាលទី២៖</span> 	ភាគី”ខ” យល់ព្រមបង់ប្រាក់កក់បន្ថែម បង្ត្រប់៣០% (សាមសិបភាគរយ) ស្មើនឹងចំនួន USD …………………….. (...........................................) (អាចបង់ម្តង១០% (ដប់ភាគរយ) នៅរៀងរាល់ដើមខែ)។ 
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;text-decoration: underline;">ដំណាក់កាលទី៣៖</span> 	ទឹកប្រាក់នៅសល់ចំនួន ៧០% (ចិតសិបភាគរយ) ស្មើនឹងចំនួនចំនួន USD ………….. (..................................................) ភាគី”ខ”យល់ព្រមបង់រំលោះតាមរយៈការយល់ព្រមតាមវិធីបង់ប្រាក់របស់ភាគី”ក” (យោងតាមឧបសម្ព័ន្ធ នៃកិច្ចសន្យា)ឬ បង់ជាមួយធានាគារខាងក្រៅ។ 
			</p>
		</div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ៤៖</u>	<span style="margin-left: 30px"> សិទ្ធិ និង កាតព្វកិច្ចរបស់ភាគី”ក”</span></h4></div>
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៤.១</span>	ភាគី”ក” ធានាសាងសង់ផ្ទះវីឡាទោលជូនភាគី”ខ” តាមគំនូសផ្ទះគំរូ និង សាងសង់ផ្ទះឲ្យរួចរាល់ក្នុង
រយៈពេល………..ខែ គិតពីថ្ងៃចុះកិច្ចសន្យា លើកលែងក្នុងករណីប្រធានស័ក្កដូចជា៖ ទឹកជំនន់ រញ្ជួយដី វិបត្តិនយោបាយ អស្ថេរភាពសង្គមកើតឡើង ដែលហេតុការណ៍ទាំងនេះ បណ្ដាលឲ្យមានការរាំងស្ទះដល់ការសាងសង់ ។
			</p>
		</div>
		
		
	</body>
</html>
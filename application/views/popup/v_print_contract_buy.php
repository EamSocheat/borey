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
				ដោយ <b><b>ភាគី”ក”</b></b>  ជាម្ចាស់សំណង់ ក្រុមហ៊ុន <b>ហ្គាឡាក់ស៊ី១១</b> សម្រាប់ លក់ជូនអតិថិជនជា <b>ភាគី”ខ”</b> មានបំណងចង់ទិញផ្ទះ <b>ភាគី”ក”</b>។
			</p>
		</div>
		<div style="text-align: center;margin-top: -10px"><h4>ភាគីទាំងពីរឯកភាពតាមប្រការដូចខាងក្រោមៈ</h4></div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ១៖</u>	<span style="margin-left: 30px"> ទំហំដី និង ផ្ទះ</span></h4></div>
		
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<b>ភាគី”ក”</b> យល់ព្រមលក់ ហើយ<b>ភាគី”ខ”</b>យល់ព្រមទិញពី<b>ភាគី”ក”</b> នូវផ្ទះប្រភេទ វីឡាកូនទោល ដែលមានដីទំហំ ..m និងផ្ទះទំហំសរុប ..m2 ដែលមានទទឹង..m បណ្ដោយ...m ផ្ទះលេខ…………ប្លុកV-…… ប្រភេទផ្ទះ... ស្ថិតនៅក្នុងទីតាំងរបស់<b>ភាគី”ក”</b> នៅជិតផ្លូវ ២១៧ ភូមិដូង សង្កាត់ស្ពានថ្ម ខណ្ឌដង្កោ រាជធានីភ្នំពេញ ។ តាមប្លង់គោលភ្ជាប់ជូនខាងលើ (ភាគី “ក” រក្សាសិទ្ធិកែប្រែប្លង់គោលតាមករណីជាក់ស្ដែង)
			</p>
		</div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ២៖</u>	<span style="margin-left: 30px"> តម្លៃផ្ទះ</span></h4></div>
		
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<b>ភាគី”ក”</b> យល់ព្រមលក់ដី និងផ្ទះប្រភេទវីឡាទោល ខាងលើជូន <b>ភាគី”ខ”</b> ក្នុងតំលៃព្រមព្រៀងចំនួន USD ……………. (......................................................................)។
			</p>
		</div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ៣៖</u>	<span style="margin-left: 30px"> ការទូទាត់ប្រាក់</span></h4></div>
		
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<b>ភាគី”ខ”</b> ត្រូវទូទាត់ប្រាក់ថ្លៃទិញ-លក់ជូន<b>ភាគី”ក”</b> តាមចំនួន និងកាលបរិច្ឆេទនៃកិច្ចសន្យា។ ភាគីទាំងពីរបានឯកភាពគ្នាតាមលក្ខខណ្ខដូចខាងក្រោម និង ឧបសម្ព័ន្ធ នៃកិច្ចសន្យា៖
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;text-decoration: underline;">ដំណាក់កាលទី ១៖</span>	<b>ភាគី”ខ”</b> យល់ព្រមប្រគល់ប្រាក់ចំនួន USD2,000 (ពីរពាន់ដុល្លារអាមេរិកគត់) ឲ្យ	ទៅ 	<b>ភាគី”ក”</b> នៅថ្ងៃចុះកិច្ចសន្យានេះ សំរាប់ជាការកក់ប្រាក់ទ្រនាប់ដៃ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;text-decoration: underline;">ដំណាក់កាលទី២៖</span> 	<b>ភាគី”ខ”</b> យល់ព្រមបង់ប្រាក់កក់បន្ថែម បង្ត្រប់៣០% (សាមសិបភាគរយ) ស្មើនឹងចំនួន USD …………………….. (...........................................) (អាចបង់ម្តង១០% (ដប់ភាគរយ) នៅរៀងរាល់ដើមខែ)។ 
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;text-decoration: underline;">ដំណាក់កាលទី៣៖</span> 	ទឹកប្រាក់នៅសល់ចំនួន ៧០% (ចិតសិបភាគរយ) ស្មើនឹងចំនួនចំនួន USD ………….. (..................................................) <b>ភាគី”ខ”</b>យល់ព្រមបង់រំលោះតាមរយៈការយល់ព្រមតាមវិធីបង់ប្រាក់របស់<b>ភាគី”ក”</b> (យោងតាមឧបសម្ព័ន្ធ នៃកិច្ចសន្យា)ឬ បង់ជាមួយធានាគារខាងក្រៅ។ 
			</p>
		</div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ៤៖</u>	<span style="margin-left: 30px"> សិទ្ធិ និង កាតព្វកិច្ចរបស់<b>ភាគី”ក”</b></span></h4></div>
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៤.១</span>	<b>ភាគី”ក”</b> ធានាសាងសង់ផ្ទះវីឡាទោលជូន<b>ភាគី”ខ”</b> តាមគំនូសផ្ទះគំរូ និង សាងសង់ផ្ទះឲ្យរួចរាល់ក្នុង
រយៈពេល………..ខែ គិតពីថ្ងៃចុះកិច្ចសន្យា លើកលែងក្នុងករណីប្រធានស័ក្កដូចជា៖ ទឹកជំនន់ រញ្ជួយដី វិបត្តិនយោបាយ អស្ថេរភាពសង្គមកើតឡើង ដែលហេតុការណ៍ទាំងនេះ បណ្ដាលឲ្យមានការរាំងស្ទះដល់ការសាងសង់ ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៤.២</span>	<b>ភាគី”ក”</b> ត្រូវធានារយៈពេល ១ឆ្នាំ ចំពោះករណីជញ្ជាំង ប្រេះស្រាំ ប្រព័ន្ធលូ និង ប្រព័ន្ធទឹកស្ទះ ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៤.៣</span>	ករណី <b>ភាគី”ក”</b> មិនបានសាងសង់ផ្ទះវីឡាទោលជូន<b>ភាគី”ខ”</b> តាមកាលកំណត់ខាងលើទេនោះ <b>ភាគី”ក”</b> 	យល់ព្រមបង់ប្រាក់ពិន័យចំនួន USD300(បីរយដុល្លារ) ក្នុងមួយខែរហូតដល់ផ្ទះសាងសង់រួចរាល់។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៤.៤</span>	<b>ភាគី”ក”</b> អះអាងថា ផ្ទះវីឡាទោលដែលបានលក់ខាងលើ ជាកម្មសិទ្ធិស្របច្បាប់របស់ខ្លួនយ៉ាងពិតប្រាកដ 	ដោយពុំមានពាក់ព័ន្ធ និង ផលប្រយោជន៍រូបវន្ត ឬ នីតិបុគ្គលណាមួយឡើយ ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៤.៥</span>	<b>ភាគី”ក”</b> ទទួលខុសត្រូវក្នុងការកាត់ប្លង់បំបែកក្បាលដីជូន<b>ភាគី”ខ”</b> ដោយសោហ៊ុយចំណាយជាបន្ទុក	របស់<b>ភាគី”ក”</b> ។
			</p>
		</div>
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ៥៖</u>	<span style="margin-left: 30px"> សិទ្ធិកាតព្វកិច្ចរបស់ភាគី ”ខ”</span></h4></div>
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.១</span>	ភាគី”ខ” ពុំមានសិទ្ធិកែប្រែប្លង់សាងសង់ ឬ សាងសង់បន្ថែមខុសពី ផ្ទះគំរូឡើយទោះបីជាក្រោយពេល	ភាគី”ក” ប្រគល់ផ្ទះវីឡាទោលជូនភាគី”ខ” រួចហើយក៏ដោយ ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.២</span>	ក្នុងកំឡុងពេលអនុវត្តន៍កិច្ចសន្យានេះ ភាគី”ខ” អាចលក់ រឺផ្ទេរកិច្ចសន្យានេះអោយអតិថិជនណាមួយ 	“លុះត្រាតែផ្ទះបានសាងសង់រួចរាល់ជាស្ថាពរ” ដោយភាគី”ខ” ត្រូវបំពេញបែបបទលក់រឺ ផ្ទេរសិទ្ធិចំពោះមុខ  	ភាគី”ក” ជាមុខសិន។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៣</span>	ភាគី”ខ” ត្រូវទទួលខុសត្រូវបន្ទុកបង់សោហ៊ុយក្នុងការលក់ ឬផ្ទេរកិច្ចសន្យាចំនួនUSD500(ប្រាំរយ	ដុល្លារ) ជូន ភាគី”ក” អតិថិជនដែលទទួលបានសិទ្ធិបន្តត្រូវអនុវត្តន៍តាមកិច្ចសន្យានេះទាំងស្រុង។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៤</span>	<b>ភាគី”ក”</b> អះអាងថា ផ្ទះវីឡាទោលដែលបានលក់ខាងលើ ជាកម្មសិទ្ធិស្របច្បាប់របស់ខ្លួនយ៉ាងពិតប្រាកដ 	ដោយពុំមានពាក់ព័ន្ធ និង ផលប្រយោជន៍រូបវន្ត ឬ នីតិបុគ្គលណាមួយឡើយ ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៥</span>	ភាគី”ខ” តូ្រវធ្វើការទូទាត់ប្រាក់តាមប្រព័ន្ធធនាគារ ឬ ឯកជន តាមមធ្យោបាយសមស្រប	ណាមួយ	ប្រសិនបើមានការស្នើសុំពី ភាគី”ក” អ្នកតំណាងរបស់ភាគី”ខ” ឬ អតិថិជនណាមួយដែលយក	ប្រាក់ទូទាត់	នៃកិច្ចសន្យានេះត្រូវសន្មត់ថាធ្វើការទូទាត់ដើម្បីប្រយោជន៍ទាំងស្រុងរបស់ភាគី”ខ” ។
			</p>
			
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៦</span>	ភាគី”ខ” ត្រូវទូទាត់ប្រាក់បង់រំលោះអោយទាន់ពេលវេលា និងកាលកំណត់។
			</p>
			
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៧</span>	ក្នុងករណីដែល ភាគី”ខ” ខកខាន ឫ យឺតយ៉ាវក្នុងការទូទាត់ជូន ភាគី”ក” នោះភាគី”ខ” ត្រូវបង់ប្រាក់ពិន័យដូចខាងក្រោម៖
				<ul>
					<li>បើលើសកំណត់ ៥ថ្ងៃ រហូតដល់៣០ថ្ងៃពិន័យ៣%</li>
					<li>បើលើស ៣០ថ្ងៃ រហូតដល់ ៩០ថ្ងៃ ពិន័យ៥%នៃប្រាក់ដែលមិនទាន់បានបង់ (ប្រចាំខែ)។ ការយឺតយ៉ាវ ឫការខកខាន នេះមិនត្រូវលើសពី៩០ ថ្ងៃឡើយ។</li>
				</ul>
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៨</span>	ក្នុងករណីដែល ភាគី”ខ” មិនបានបង់ប្រាក់ លើសពី ៩០ថ្ងៃ ជូន ភាគី”ក” នោះ ភាគី”ខ” យល់ព្រមប្រគាល់ផ្ទះ និងដី ដែលបានទិញស្របតាមកិច្ចសន្យាលក់ទិញផ្ទះ ជូនក្រុមហ៊ុន ហ្គាឡាក់ស៊ី១១ វិញ។ ហើយក្រុមហ៊ុន ហ្គាឡាក់ស៊ី១១ មានសិទ្ធចាត់ចែងអចលនទ្រព្យដោយស្របច្បាប់។ ភាគី”ខ” សុខចិត្តយល់ព្រមមិនប្ដឹងទាមទារ ឫតវ៉ាជាដាច់ខាត។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.៩</span>	ភាគី”ខ” តូ្រវធ្វើការទូទាត់ប្រាក់តាមប្រព័ន្ធធនាគារ ឬ ឯកជន តាមមធ្យោបាយសមស្រប	ណាមួយ	ប្រសិនបើមានការស្នើសុំពី ភាគី”ក” អ្នកតំណាងរបស់ភាគី”ខ” ឬ អតិថិជនណាមួយដែលយក	ប្រាក់ទូទាត់	នៃកិច្ចសន្យានេះត្រូវសន្មត់ថាធ្វើការទូទាត់ដើម្បីប្រយោជន៍ទាំងស្រុងរបស់ភាគី”ខ” ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៥.១០</span>	ភាគី”ខ” ត្រូវគោរពតាមបទបញ្ជាផ្ទៃក្នុង និង គោលការណ៍រួមរបស់គំរោង រួមទាំងការគ្រប់គ្រងរបស់ 	ក្រុមហ៊ុន ហ្គាឡាក់ស៊ី១១។
			</p>
			
		</div>
		
		
		<div style="text-align: left;margin-top: -10px"><h4><u>ប្រការ ៦៖</u>	<span style="margin-left: 30px"> អនុភាពនៃកិច្ចសន្យា</span></h4></div>
		<div style="margin-top: -10px;margin-left: 40px">
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.១</span>	ភាគីទាំងពីរបានអានរាល់ខ្លឹមសារទាំងអស់ នៃកិច្ចសន្យានេះហើយសន្យាគោរពអោយបានរាល់ខ្លឹម	សារ	ទាំងអស់នៃកិច្ចសន្យាបើភាគីណាមួយមិនគោរព និងត្រូវទទួលខុសត្រូវចំពោះមុខច្បាប់ជាធរមាន ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.២</span>	កិច្ចសន្យានេះធ្វើឡើង ដោយស័្មគ្រចិត្ត រវាងភាគីទាំងពីរ ដោយឥតមានការបង្ខិតបង្ខំ ឬគំរាមកំហែង ពី	ភាគីណាមួយ ។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.៣</span>	ការជូនដំណឹងទៅភាគីទាំងពីរ ត្រូវផ្ញើរទៅអាស័យដ្ឋានដូចបញ្ជាក់ខាងលើ ឬតាមការបញ្ជូន	លិខិតដោយផ្ទាល់ និង តាមការជូនដំណឹងតាមរយៈទូរស័ព្ទទំនាក់ទំនងខាងលើ ។ 
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.៤</span>	កិច្ចសន្យានេះធ្វើឡើងចំនួន 03 ច្បាប់មាន 04 ទំព័រដោយរក្សាទុកនៅ ៖
				<ul>
					<li>ភាគី”ក” ចំនួន 01ច្បាប់ </li>
					<li>ភាគី”ខ” ចំនួន 01ច្បាប់ និង</li>
					<li>មេធាវីភាគី (ក) ចំនួន 01ច្បាប់ មានតំលៃស្មើៗគ្នា ។</li>
				</ul>
			</p>
			
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.៥</span>	ភាគីទាំងពីរសុខចិត្តផ្ដិតមេដៃស្តាំទុកជាភស្តុតាងនៅចំពោះមុខមេធាវីភាគី”ក”។
			</p>
			<p style="font-size: 15px;">
				<span style="margin-right: 10px;font-weight: bold;">៦.៦</span>	កិច្ចសន្យាលក់ទិញ ផ្ទះ នេះមានប្រសិទ្ធិភាពចាប់ពីថ្ងៃផ្ដិតមេដៃនេះតទៅ។
			</p>
		</div>
		<div style="margin-top: 100px;">
			<table class="tbl-head">
				<tr>
					<td style="width: 50%;font-weight: normal;padding-left: 100px;"></td>
					<td style="width: 50%;font-weight: normal;padding-left: 0px;">រាជធានីភ្នំពេញ ថ្ងៃទី…………ខែ…………ឆ្នាំ………… </td>
					
				</tr>
				<tr style="height: 50px;">
					
				</tr>
				<tr>
					<td style="width: 50%;font-weight: normal;padding-left: 100px;">ស្នាមមេដៃស្តាំភាគី(ខ)</td>
					<td style="width: 50%;font-weight: normal;padding-left: 100px;">ស្នាមមេដៃស្តាំភាគី(ក)</td>
					
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
					<td style="width: 50%;padding-left: 100px;"><?php echo $OUT_REC[0]->cus_nm_kh;?></td>
					<td style="width: 50%;padding-left: 125px;"><h4>ហេង ពិសិដ្ឋ</h4></td>
				</tr>
				<tr>
					<td style="width: 50%;padding-left: 100px;"></td>
					<td style="width: 50%;padding-left: 70px;"><h4>តំណាងក្រុមហ៊ុន ហ្គាឡាក់ស៊ី១១</h4></td>
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
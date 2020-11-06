version 16.0
set more off

gl data   "D:\projects\IFC\second_round\data\modified" 
gl tables "D:\projects\IFC\second_round\tables\fds" 

use "$data\assessment_result_FDs_long.dta", clear


tab region year

*begin: Volume of inputs sold:

lab var inputs_sold_gk_total "Number of chicks sold"

recode inputs_sold_gk_total /* 
*/ (0/5000=0 "0-5 Thausand")   /*
*/ (5001/10000=1 "5-10 Thausand") /*
*/ (10001/15000=2 "10-15 Thausand")  /*
*/ (15001/20000=3 "15-20 Thausand") /*
*/ (20001/1800000=4 "20+ Thausand") , gen(inputs_sold_gk_total_cat)

order inputs_sold_gk_total_cat, before(inputs_sold_gk_total)
  
tabout year using "$tables\volume_inputs_sold.xls" , /*
	*/ c(sum inputs_sold_gk_total sum inputs_sold_gk_farm /*
	*/sum inputs_sold_gk_gov_agent sum inputs_sold_gk_poult_agent /*
	*/ sum inputs_sold_gk_vpoult_agent sum inputs_sold_gk_other) /*
	*/ sum format(1c) replace

tabout inputs_sold_gk_total_cat year using "$tables\volume_inputs_sold.xls" , /*
	*/ c(N inputs_sold_gk_total) sum format(1c) append


tabout year using "$tables\volume_inputs_sold.xls" , /*
	*/ c(N inputs_sold_gk_total N inputs_sold_gk_farm /*
	*/ N inputs_sold_gk_gov_agent N inputs_sold_gk_poult_agent /*
	*/ N inputs_sold_gk_vpoult_agent N inputs_sold_gk_other) /*
	*/ sum format(1c) append

	
tabout year using "$tables\volume_inputs_sold.xls" , /*
	*/ c(mean inputs_sold_gk_total mean inputs_sold_gk_farm /*
	*/ mean inputs_sold_gk_gov_agent mean inputs_sold_gk_poult_agent /*
	*/ mean inputs_sold_gk_vpoult_agent mean inputs_sold_gk_other) /*
	*/ sum format(1c) append
	
*end: Volume of sales of inputs

     

*begin: Annual Turnover (sales revenues): 
recode sales_turnover_total /* 
*/ (0/100000=0 "0-100 Thausand")   /*
*/ (100001/1000000=1 "10 Thausand-1 Million") /*
*/ (1000001/10000000=2 "1-10 Million")  /*
*/ (10000001/27900000=3 "10+ Million") , gen(sales_turnover_total_cat)

tabout year using "$tables\annual_turnover_all.xls" , /*
	*/ c(sum sales_turnover_total sum sales_turnover_farm /*
	*/sum sales_turnover_gov_agent sum sales_turnover_poult_agent /*
	*/ sum sales_turnover_vpoult_agent sum sales_turnover_other) /*
	*/ sum format(1c) replace

tabout sales_turnover_total_cat year using "$tables\annual_turnover_all.xls" , /*
	*/ c(N sales_turnover_total) /*
	*/ sum format(1c) append

tabout year using "$tables\annual_turnover_all.xls" , /*
	*/ c(N sales_turnover_total N sales_turnover_farm /*
	*/ N sales_turnover_gov_agent N sales_turnover_poult_agent /*
	*/ N sales_turnover_vpoult_agent N sales_turnover_other) /*
	*/ sum format(1c) append
	
tabout year using "$tables\annual_turnover_all.xls" , /*
	*/ c(mean sales_turnover_total mean sales_turnover_farm /*
	*/ mean sales_turnover_gov_agent mean sales_turnover_poult_agent /*
	*/ mean sales_turnover_vpoult_agent mean sales_turnover_other) /*
	*/ sum format(1c) append

*end: Annual Turnove: 
	
*begin: Unique number of farmers sold to (= number of farmers reached):

tabout year using "$tables\uniq_farmers.xls" , /*
	*/ c(sum num_unique_farmer) /*
	*/ sum format(1c) replace
	
recode num_unique_farmer /* 
*/ (0/100=0 "0-1 hundred")   /*
*/ (101/200=1 "1-2 hundred") /*
*/ (201/300=2 "2-3 hundred")  /*
*/ (301/400=3 "3-4 hundred") /*
*/ (401/500=4 "4-5 hundred") /*
*/ (501/600=5 "5-6 hundred") /*
*/ (601/700=6 "6-7 hundred") /*
*/ (701/800=7 "7-8 hundred") /*
*/ (801/900=8 "8-9 hundred") /*
*/ (901/1000=9 "9-10 hundred") /*
*/ (1001/17470=10 "greater than 10 hundred") , gen(num_unique_farmer_cat)

order num_unique_farmer_cat, after(num_unique_farmer)

tabout num_unique_farmer_cat year using "$tables\uniq_farmers.xls" , /*
	*/ c(sum num_unique_farmer) /*
	*/ sum format(1c) append
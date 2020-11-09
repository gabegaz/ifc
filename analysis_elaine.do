version 16.0
set more off

gl data   "D:\projects\IFC\second_round\data\modified" 
gl tables "D:\projects\IFC\second_round\tables" 

gl codes "D:\projects\IFC\second_round\codes" 


do "$codes\cleaning_elaine.do"

///////////////////////First Round///////////////////////////
use "$data\assessment_result_PAs_sr_long.dta", clear
keep pa_id-year prod_cycle- sold_to_unique_farmers
gen round=2

append using "$data\assessment_result_PAs_fr_long2.dta"

*begin: Number of day-old-chicks production cycles per year:
    *note: share and average computed from the excel file exported

lab var prod_cycle "Production Cycle"
//hist prod_cycle //check the distribution to categorize prod_cycle

recode prod_cycle (0/1=0 "at least 1 prod cycles")   /*
*/ (2/3=1 "2-3 prod cycles")  /*
*/ (4/8=2 "4-8 prod cycles")  /*
*/ (9/10=3 "9-10 prod  cycles"), gen(prod_cycle_cat)

order prod_cycle_cat, after(prod_cycle)

tabout prod_cycle_cat year using "$tables\prod_cycle_fr.xls" if round==1, /*
	*/ c(sum prod_cycle) sum format(1c) replace
	
tabout prod_cycle_cat year using "$tables\prod_cycle_fr.xls" if round==1, /*
	*/ c(N prod_cycle) sum format(1c) append

tabout prod_cycle_cat year using "$tables\prod_cycle_fr.xls" if round==1, /*
	*/ c(mean prod_cycle) sum format(1c) append


	
recode prod_cycle (0=0 "No prod cycle")   /*
*/ (1=1 "1 prod cycle")  /*
*/ (2=2 "2 prod cycles")  /*
*/ (3=3 "3 prod cycles")  /*
*/ (4=4 "4 prod cycles")  /*
*/ (5=5 "5 prod cycles")  /*
*/ (6/7=6 "6-7 cycles")  /*
*/ (8/10=7 "8+ cycles"), gen(prod_cycle_cat2)

order prod_cycle_cat2, after(prod_cycle_cat)

tabout prod_cycle_cat2 year using "$tables\prod_cycle_fr2.xls" if round==1, /*
	*/ c(sum prod_cycle) sum format(1c) replace
	
tabout prod_cycle_cat2 year using "$tables\prod_cycle_fr2.xls" if round==1, /*
	*/ c(N prod_cycle) sum format(1c) append

	
	/*
tabout prod_cycle_cat2 year using "$tables\prod_cycle2.xls" if prod_cycle_cat2 > 5, /*
	*/ c(sum prod_cycle) sum format(1c) append
	
tabout prod_cycle_cat2 year using "$tables\prod_cycle2.xls" if prod_cycle_cat2 > 5, /*
	*/ c(N prod_cycle) sum format(1c) append
*/
*end: Number of day-old-chicks production cycles per year:




*begin: Number of chicks sold by year:

lab var num_chicks_sold_total "Number of chicks sold"
//check the distribution to categorize prod_cycle
//hist num_chicks_sold_total


recode num_chicks_sold_total /* 
*/ (0/1000=0 "0-1 thausand")   /*
*/ (1001/2000=1 "1-2 thausand") /*
*/ (2001/3000=2 "2-3 thausand")  /*
*/ (3001/4000=3 "3-4 thausand") /*
*/ (4001/5000=4 "4-5 thausand") /*
*/ (5001/6000=5 "5-6 thausand") /*
*/ (6001/7000=6 "6-7 thausand") /*
*/ (7001/8000=7 "7-8 thausand") /*
*/ (8001/9000=8 "8-9 thausand") /*
*/ (9001/10000=9 "9-10 thausand") /*
*/ (10001/100200=10 "greater than 10 thausand") , gen(num_chicks_sold_total_cat)

order num_chicks_sold_total_cat, before(num_chicks_sold_total)


    
tabout year using "$tables\num_chicks_sold_fr.xls" if round==1, /*
	*/ c(sum num_chicks_sold_total sum num_chicks_sold_farm /*
	*/sum num_chicks_sold_gov_agent sum num_chicks_sold_trader /*
	*/ sum num_chicks_sold_vill_agents sum num_chicks_sold_other) /*
	*/ sum format(1c) replace

tabout num_chicks_sold_total_cat year using "$tables\num_chicks_sold_fr.xls" if round==1, /*
	*/ c(N num_chicks_sold_total) sum format(1c) append


tabout year using "$tables\num_chicks_sold_fr.xls" if round==1, /*
	*/ c(N num_chicks_sold_total N num_chicks_sold_farm /*
	*/ N num_chicks_sold_gov_agent N num_chicks_sold_trader /*
	*/ N num_chicks_sold_vill_agents N num_chicks_sold_other) /*
	*/ sum format(1c) append

	
tabout year using "$tables\num_chicks_sold_fr.xls" if round==1, /*
	*/ c(mean num_chicks_sold_total mean num_chicks_sold_farm /*
	*/ mean num_chicks_sold_gov_agent mean num_chicks_sold_trader /*
	*/ mean num_chicks_sold_vill_agents mean num_chicks_sold_other) /*
	*/ sum format(1c) append
	
*end: Number of chicks sold by year:



*begin: Annual Turnover (sales revenues): 

recode turn_over_total /* 
*/ (0/100000=0 "0-1 hundred thausand")   /*
*/ (10001/200000=1 "1-2 hundred thausand") /*
*/ (20001/300000=2 "2-3 hundred thausand")  /*
*/ (30001/400000=3 "3-4 hundred thausand") /*
*/ (40001/500000=4 "4-5 hundred thausand") /*
*/ (50001/600000=5 "5-6 hundred thausand") /*
*/ (60001/700000=6 "6-7 hundred thausand") /*
*/ (70001/800000=7 "7-8 hundred thausand") /*
*/ (80001/900000=8 "8-9 hundred thausand") /*
*/ (90001/1000000=9 "9-10 hundred thausand") /*
*/ (100001/6513000=10 "greater than 10 hundred thausand") , gen(turn_over_total_cat)


tabout year using "$tables\annual_turnover_fr.xls" if round==1, /*
	*/ c(sum turn_over_total sum turn_over_farm /*
	*/sum turn_over_gov_agent sum turn_over_trader /*
	*/ sum turn_over_vill_agents sum turn_over_other) /*
	*/ sum format(1c) replace

tabout turn_over_total_cat year using "$tables\annual_turnover_fr.xls" if round==1, /*
	*/ c(N turn_over_total) /*
	*/ sum format(1c) append

tabout year using "$tables\annual_turnover_fr.xls" if round==1, /*
	*/ c(N turn_over_total N turn_over_farm /*
	*/ N turn_over_gov_agent N turn_over_trader /*
	*/ N turn_over_vill_agents N turn_over_other) /*
	*/ sum format(1c) append
	
*end: Annual Turnove: 
/*
*begin:Annual Turnover, cost of goods sold and gross profit
tabout year using "$tables\turnover_cost_profit_fr.xls", /*
	*/ c(sum annual_turnover) /*
	*/ sum format(1c) replace

tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(N annual_turnover) /*
	*/ sum format(1c) append
	
	
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(sum cost_goods_sold) /*
	*/ sum format(1c) append
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(N cost_goods_sold) /*
	*/ sum format(1c) append

	
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(sum gross_profit) /*
	*/ sum format(1c) append
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(N gross_profit) /*
	*/ sum format(1c) append	
*end:Annual Turnover, cost of goods sold and gross profit
*/
	
	
*begin: Unique number of farmers sold to (= number of farmers reached):

tabout year using "$tables\uniq_farmers_fr.xls" if round==1, /*
	*/ c(sum sold_to_unique_farmers) /*
	*/ sum format(1c) replace

	
tabout year using "$tables\uniq_farmers_fr.xls" if round==1, /*
	*/ c(N num_chicks_sold_farm) /*
	*/ sum format(1c) append

recode sold_to_unique_farmers /* 
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
*/ (1001/5500=10 "greater than 10 hundred") , gen(sold_to_unique_farmers_cat)

order sold_to_unique_farmers_cat, after(sold_to_unique_farmers)

tabout sold_to_unique_farmers_cat year using "$tables\uniq_farmers_fr.xls" if round==1, /*
	*/ c(sum sold_to_unique_farmers) /*
	*/ sum format(1c) append
	
////////////////additional tables as per comment/////////////	

tabout sold_to_unique_farmers_cat year using "$tables\uniq_farmers_fr.xls" if round==1, /*
	*/ c(N sold_to_unique_farmers) sum format(1c) append

*end: Unique number of farmers sold to (= number of farmers reached):



///for the comment

foreach var of varlist num_chicks_sold_farm-num_chicks_sold_other {
      replace `var'=. if `var'==0 
}


tabout year using "$tables\num_chicks_sold_fr.xls" if round==1, /*
	*/ c(N num_chicks_sold_total N num_chicks_sold_farm /*
	*/ N num_chicks_sold_gov_agent N num_chicks_sold_trader /*
	*/ N num_chicks_sold_vill_agents N num_chicks_sold_other) /*
	*/ sum format(1c) append

	
	
	
/////////////////////////////Second Round/////////////////////////////////
use "$data\assessment_result_PAs_sr_long.dta", clear
keep pa_id-year prod_cycle- sold_to_unique_farmers
gen round=2
append using "$data\assessment_result_PAs_fr_long2.dta"



*begin: Number of day-old-chicks production cycles per year:
    *note: share and average computed from the excel file exported

lab var prod_cycle "Production Cycle"
//hist prod_cycle //check the distribution to categorize prod_cycle

recode prod_cycle (0/1=0 "at least 1 prod cycles")   /*
*/ (2/3=1 "2-3 prod cycles")  /*
*/ (4/8=2 "4-8 prod cycles")  /*
*/ (9/10=3 "9-10 prod  cycles") /*
*/ (11/49=4 "11+ cycles"), gen(prod_cycle_cat)

order prod_cycle_cat, after(prod_cycle)

tabout prod_cycle_cat year using "$tables\prod_cycle_sr.xls" if round==2, /*
	*/ c(sum prod_cycle) sum format(1c) replace
	
tabout prod_cycle_cat year using "$tables\prod_cycle_sr.xls" if round==2, /*
	*/ c(N prod_cycle) sum format(1c) append

tabout prod_cycle_cat year using "$tables\prod_cycle_sr.xls" if round==2, /*
	*/ c(mean prod_cycle) sum format(1c) append


	
recode prod_cycle (0=0 "No prod cycle")   /*
*/ (1=1 "1 prod cycle")  /*
*/ (2=2 "2 prod cycles")  /*
*/ (3=3 "3 prod cycles")  /*
*/ (4=4 "4 prod cycles")  /*
*/ (5=5 "5 prod cycles")  /*
*/ (6/7=6 "6-7 cycles")  /*
*/ (8/10=7 "8-10 cycles") /*
*/ (11/49=8 "11+ cycles"), gen(prod_cycle_cat2)

order prod_cycle_cat2, after(prod_cycle_cat)

tabout prod_cycle_cat2 year using "$tables\prod_cycle_sr2.xls" if round==2, /*
	*/ c(sum prod_cycle) sum format(1c) replace
	
tabout prod_cycle_cat2 year using "$tables\prod_cycle_sr2.xls" if round==2, /*
	*/ c(N prod_cycle) sum format(1c) append

	
	/*
tabout prod_cycle_cat2 year using "$tables\prod_cycle2.xls" if prod_cycle_cat2 > 5, /*
	*/ c(sum prod_cycle) sum format(1c) append
	
tabout prod_cycle_cat2 year using "$tables\prod_cycle2.xls" if prod_cycle_cat2 > 5, /*
	*/ c(N prod_cycle) sum format(1c) append
*/
*end: Number of day-old-chicks production cycles per year:




*begin: Number of chicks sold by year:

lab var num_chicks_sold_total "Number of chicks sold"
//check the distribution to categorize prod_cycle
//hist num_chicks_sold_total

recode num_chicks_sold_total /* 
*/ (0/1000=0 "0-1 thausand")   /*
*/ (1001/2000=1 "1-2 thausand") /*
*/ (2001/3000=2 "2-3 thausand")  /*
*/ (3001/4000=3 "3-4 thausand") /*
*/ (4001/5000=4 "4-5 thausand") /*
*/ (5001/6000=5 "5-6 thausand") /*
*/ (6001/7000=6 "6-7 thausand") /*
*/ (7001/8000=7 "7-8 thausand") /*
*/ (8001/9000=8 "8-9 thausand") /*
*/ (9001/10000=9 "9-10 thausand") /*
*/ (10001/2500180=10 "greater than 10 thausand") , gen(num_chicks_sold_total_cat)

order num_chicks_sold_total_cat, before(num_chicks_sold_total)


    
tabout year using "$tables\num_chicks_sold_sr.xls" if round==2, /*
	*/ c(sum num_chicks_sold_total sum num_chicks_sold_farm /*
	*/sum num_chicks_sold_gov_agent sum num_chicks_sold_trader /*
	*/ sum num_chicks_sold_vill_agents sum num_chicks_sold_other) /*
	*/ sum format(1c) replace

tabout num_chicks_sold_total_cat year using "$tables\num_chicks_sold_sr.xls" if round==2, /*
	*/ c(N num_chicks_sold_total) sum format(1c) append


tabout year using "$tables\num_chicks_sold_sr.xls" if round==2, /*
	*/ c(N num_chicks_sold_total N num_chicks_sold_farm /*
	*/ N num_chicks_sold_gov_agent N num_chicks_sold_trader /*
	*/ N num_chicks_sold_vill_agents N num_chicks_sold_other) /*
	*/ sum format(1c) append

	
tabout year using "$tables\num_chicks_sold_sr.xls" if round==2, /*
	*/ c(mean num_chicks_sold_total mean num_chicks_sold_farm /*
	*/ mean num_chicks_sold_gov_agent mean num_chicks_sold_trader /*
	*/ mean num_chicks_sold_vill_agents mean num_chicks_sold_other) /*
	*/ sum format(1c) append
	
*end: Number of chicks sold by year:



*begin: Annual Turnover (sales revenues): 
recode turn_over_total /* 
*/ (0/100000=0 "0-1 hundred thausand")   /*
*/ (10001/200000=1 "1-2 hundred thausand") /*
*/ (20001/300000=2 "2-3 hundred thausand")  /*
*/ (30001/400000=3 "3-4 hundred thausand") /*
*/ (40001/500000=4 "4-5 hundred thausand") /*
*/ (50001/600000=5 "5-6 hundred thausand") /*
*/ (60001/700000=6 "6-7 hundred thausand") /*
*/ (70001/800000=7 "7-8 hundred thausand") /*
*/ (80001/900000=8 "8-9 hundred thausand") /*
*/ (90001/1000000=9 "9-10 hundred thausand") /*
*/ (100001/3.41e+07=10 "greater than 10 hundred thausand") , gen(turn_over_total_cat)


tabout year using "$tables\annual_turnover_sr.xls" if round==2, /*
	*/ c(sum turn_over_total sum turn_over_farm /*
	*/sum turn_over_gov_agent sum turn_over_trader /*
	*/ sum turn_over_vill_agents sum turn_over_other) /*
	*/ sum format(1c) replace

tabout turn_over_total_cat year using "$tables\annual_turnover_sr.xls" if round==2, /*
	*/ c(N turn_over_total) /*
	*/ sum format(1c) append

tabout year using "$tables\annual_turnover_sr.xls" if round==2, /*
	*/ c(N turn_over_total N turn_over_farm /*
	*/ N turn_over_gov_agent N turn_over_trader /*
	*/ N turn_over_vill_agents N turn_over_other) /*
	*/ sum format(1c) append
	
*end: Annual Turnove: 
/*
*begin:Annual Turnover, cost of goods sold and gross profit
tabout year using "$tables\turnover_cost_profit_sr.xls", /*
	*/ c(sum annual_turnover) /*
	*/ sum format(1c) replace

tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(N annual_turnover) /*
	*/ sum format(1c) append
	
	
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(sum cost_goods_sold) /*
	*/ sum format(1c) append
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(N cost_goods_sold) /*
	*/ sum format(1c) append

	
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(sum gross_profit) /*
	*/ sum format(1c) append
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(N gross_profit) /*
	*/ sum format(1c) append	
*end:Annual Turnover, cost of goods sold and gross profit
*/
	
	
*begin: Unique number of farmers sold to (= number of farmers reached):

tabout year using "$tables\uniq_farmers_sr.xls" if round==2, /*
	*/ c(sum sold_to_unique_farmers) /*
	*/ sum format(1c) replace

	
tabout year using "$tables\uniq_farmers_sr.xls" if round==2, /*
	*/ c(N num_chicks_sold_farm) /*
	*/ sum format(1c) append

recode sold_to_unique_farmers /* 
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
*/ (1001/17470=10 "greater than 10 hundred") , gen(sold_to_unique_farmers_cat)

order sold_to_unique_farmers_cat, after(sold_to_unique_farmers)

tabout sold_to_unique_farmers_cat year using "$tables\uniq_farmers_sr.xls" if round==2, /*
	*/ c(sum sold_to_unique_farmers) /*
	*/ sum format(1c) append
	
////////////////additional tables as per comment/////////////	

tabout sold_to_unique_farmers_cat year using "$tables\uniq_farmers_sr.xls" if round==2, /*
	*/ c(N sold_to_unique_farmers) sum format(1c) append

*end: Unique number of farmers sold to (= number of farmers reached):



///for the comment

foreach var of varlist num_chicks_sold_farm-num_chicks_sold_other {
      replace `var'=. if `var'==0 
}


tabout year using "$tables\num_chicks_sold_sr.xls" if round==2, /*
	*/ c(N num_chicks_sold_total N num_chicks_sold_farm /*
	*/ N num_chicks_sold_gov_agent N num_chicks_sold_trader /*
	*/ N num_chicks_sold_vill_agents N num_chicks_sold_other) /*
	*/ sum format(1c) append

	
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////Round 1 and 2/////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
use "$data\assessment_result_PAs_sr_long.dta", clear
keep pa_id-year prod_cycle- sold_to_unique_farmers
gen round=2
append using "$data\assessment_result_PAs_fr_long2.dta"


*begin: Number of day-old-chicks production cycles per year:
    *note: share and average computed from the excel file exported

lab var prod_cycle "Production Cycle"
//hist prod_cycle //check the distribution to categorize prod_cycle


recode prod_cycle (0/1=0 "at least 1 prod cycles")   /*
*/ (2/3=1 "2-3 prod cycles")  /*
*/ (4/8=2 "4-8 prod cycles")  /*
*/ (9/10=3 "9-10 prod  cycles") /*
*/ (11/49=4 "11+ cycles"), gen(prod_cycle_cat)


order prod_cycle_cat, after(prod_cycle)

tabout prod_cycle_cat year using "$tables\prod_cycle_all.xls" , /*
	*/ c(sum prod_cycle) sum format(1c) replace
	
tabout prod_cycle_cat year using "$tables\prod_cycle_all.xls" , /*
	*/ c(N prod_cycle) sum format(1c) append

tabout prod_cycle_cat year using "$tables\prod_cycle_all.xls" , /*
	*/ c(mean prod_cycle) sum format(1c) append



recode prod_cycle (0=0 "No prod cycle")   /*
*/ (1=1 "1 prod cycle")  /*
*/ (2=2 "2 prod cycles")  /*
*/ (3=3 "3 prod cycles")  /*
*/ (4=4 "4 prod cycles")  /*
*/ (5=5 "5 prod cycles")  /*
*/ (6/7=6 "6-7 cycles")  /*
*/ (8/10=7 "8-10 cycles") /*
*/ (11/49=8 "11+ cycles"), gen(prod_cycle_cat2)


order prod_cycle_cat2, after(prod_cycle_cat)

tabout prod_cycle_cat2 year using "$tables\prod_cycle_all2.xls" , /*
	*/ c(sum prod_cycle) sum format(1c) replace
	
tabout prod_cycle_cat2 year using "$tables\prod_cycle_all2.xls" , /*
	*/ c(N prod_cycle) sum format(1c) append

	
	/*
tabout prod_cycle_cat2 year using "$tables\prod_cycle2.xls" if prod_cycle_cat2 > 5, /*
	*/ c(sum prod_cycle) sum format(1c) append
	
tabout prod_cycle_cat2 year using "$tables\prod_cycle2.xls" if prod_cycle_cat2 > 5, /*
	*/ c(N prod_cycle) sum format(1c) append
*/
*end: Number of day-old-chicks production cycles per year:




*begin: Number of chicks sold by year:

lab var num_chicks_sold_total "Number of chicks sold"
//check the distribution to categorize prod_cycle
//hist num_chicks_sold_total

recode num_chicks_sold_total /* 
*/ (0/1000=0 "0-1 thausand")   /*
*/ (1001/2000=1 "1-2 thausand") /*
*/ (2001/3000=2 "2-3 thausand")  /*
*/ (3001/4000=3 "3-4 thausand") /*
*/ (4001/5000=4 "4-5 thausand") /*
*/ (5001/6000=5 "5-6 thausand") /*
*/ (6001/7000=6 "6-7 thausand") /*
*/ (7001/8000=7 "7-8 thausand") /*
*/ (8001/9000=8 "8-9 thausand") /*
*/ (9001/10000=9 "9-10 thausand") /*
*/ (10001/2500180=10 "greater than 10 thausand") , gen(num_chicks_sold_total_cat)

order num_chicks_sold_total_cat, before(num_chicks_sold_total)


    
tabout year using "$tables\num_chicks_sold_all.xls" , /*
	*/ c(sum num_chicks_sold_total sum num_chicks_sold_farm /*
	*/sum num_chicks_sold_gov_agent sum num_chicks_sold_trader /*
	*/ sum num_chicks_sold_vill_agents sum num_chicks_sold_other) /*
	*/ sum format(1c) replace

tabout num_chicks_sold_total_cat year using "$tables\num_chicks_sold_all.xls" , /*
	*/ c(N num_chicks_sold_total) sum format(1c) append


tabout year using "$tables\num_chicks_sold_all.xls" , /*
	*/ c(N num_chicks_sold_total N num_chicks_sold_farm /*
	*/ N num_chicks_sold_gov_agent N num_chicks_sold_trader /*
	*/ N num_chicks_sold_vill_agents N num_chicks_sold_other) /*
	*/ sum format(1c) append

	
tabout year using "$tables\num_chicks_sold_all.xls" , /*
	*/ c(mean num_chicks_sold_total mean num_chicks_sold_farm /*
	*/ mean num_chicks_sold_gov_agent mean num_chicks_sold_trader /*
	*/ mean num_chicks_sold_vill_agents mean num_chicks_sold_other) /*
	*/ sum format(1c) append
	
*end: Number of chicks sold by year:



*begin: Annual Turnover (sales revenues): 
recode turn_over_total /* 
*/ (0/100000=0 "0-1 hundred thausand")   /*
*/ (10001/200000=1 "1-2 hundred thausand") /*
*/ (20001/300000=2 "2-3 hundred thausand")  /*
*/ (30001/400000=3 "3-4 hundred thausand") /*
*/ (40001/500000=4 "4-5 hundred thausand") /*
*/ (50001/600000=5 "5-6 hundred thausand") /*
*/ (60001/700000=6 "6-7 hundred thausand") /*
*/ (70001/800000=7 "7-8 hundred thausand") /*
*/ (80001/900000=8 "8-9 hundred thausand") /*
*/ (90001/1000000=9 "9-10 hundred thausand") /*
*/ (100001/3.41e+07=10 "greater than 10 hundred thausand") , gen(turn_over_total_cat)


tabout year using "$tables\annual_turnover_all.xls" , /*
	*/ c(sum turn_over_total sum turn_over_farm /*
	*/sum turn_over_gov_agent sum turn_over_trader /*
	*/ sum turn_over_vill_agents sum turn_over_other) /*
	*/ sum format(1c) replace

tabout turn_over_total_cat year using "$tables\annual_turnover_all.xls" , /*
	*/ c(N turn_over_total) /*
	*/ sum format(1c) append

tabout year using "$tables\annual_turnover_all.xls" , /*
	*/ c(N turn_over_total N turn_over_farm /*
	*/ N turn_over_gov_agent N turn_over_trader /*
	*/ N turn_over_vill_agents N turn_over_other) /*
	*/ sum format(1c) append
	
*end: Annual Turnove: 
/*
*begin:Annual Turnover, cost of goods sold and gross profit
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(sum annual_turnover) /*
	*/ sum format(1c) replace

tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(N annual_turnover) /*
	*/ sum format(1c) append
	
	
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(sum cost_goods_sold) /*
	*/ sum format(1c) append
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(N cost_goods_sold) /*
	*/ sum format(1c) append

	
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(sum gross_profit) /*
	*/ sum format(1c) append
tabout year using "$tables\turnover_cost_profit.xls", /*
	*/ c(N gross_profit) /*
	*/ sum format(1c) append	
*end:Annual Turnover, cost of goods sold and gross profit
*/
	
	
*begin: Unique number of farmers sold to (= number of farmers reached):

tabout year using "$tables\uniq_farmers_all.xls" , /*
	*/ c(sum sold_to_unique_farmers) /*
	*/ sum format(1c) replace

	
tabout year using "$tables\uniq_farmers_all.xls" , /*
	*/ c(N num_chicks_sold_farm) /*
	*/ sum format(1c) append

recode sold_to_unique_farmers /* 
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
*/ (1001/17470=10 "greater than 10 hundred") , gen(sold_to_unique_farmers_cat)

order sold_to_unique_farmers_cat, after(sold_to_unique_farmers)

tabout sold_to_unique_farmers_cat year using "$tables\uniq_farmers_all.xls" , /*
	*/ c(sum sold_to_unique_farmers) /*
	*/ sum format(1c) append
	
////////////////additional tables as per comment/////////////	

tabout sold_to_unique_farmers_cat year using "$tables\uniq_farmers_all.xls" , /*
	*/ c(N sold_to_unique_farmers) sum format(1c) append

*end: Unique number of farmers sold to (= number of farmers reached):



///for the comment

foreach var of varlist num_chicks_sold_farm-num_chicks_sold_other {
      replace `var'=. if `var'==0 
}


tabout year using "$tables\num_chicks_sold_all.xls" , /*
	*/ c(N num_chicks_sold_total N num_chicks_sold_farm /*
	*/ N num_chicks_sold_gov_agent N num_chicks_sold_trader /*
	*/ N num_chicks_sold_vill_agents N num_chicks_sold_other) /*
	*/ sum format(1c) append

gl output "D:\projects\IFC\second_round\data\modified"
gl tables "D:\projects\IFC\second_round\tables\gender"

use "$output\assessment_result_PAs_all_wide.dta", clear

*begin: Basic charactersistics of poultry agents:

tabout region contact_gender using "$tables\basic_characteristics_gender.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout contact_designation contact_gender using  "$tables\basic_characteristics_gender.xls", ///
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append 

tabout contact_educ_cat contact_gender using "$tables\basic_characteristics_gender.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout legal_form contact_gender using  "$tables\basic_characteristics_gender.xls", ///
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append 

*end: Basic characteristics

       

*begin : Fig 1...
graph bar mgmt_capability_score inst_competency_score   /*
*/ bus_knowledge_score mark_potential_score  /*
*/ fin_management_score env_compliance_score  /*
*/ average_score, over(contact_gender) /*
*/ legend(label(1 "Mgm't Capabilities") /*
*/ label(2 "Instit. Competency & Strength") /*	
*/ label(3 "Business Knowledge") /*	
*/ label(4 "Marketing Pot. & Opportunities") /*
*/ label(5 "Fin. Mgm't & Opportunities")	/*
*/ label(6 "Environmental Compliance") /*
*/ label(7 "Average Scores") symxsize(10) symysize(2)) /*
*/ ytitle("Scores (%)") /*
*/ blabel(bar, position(inside) format(%9.2f) color(white))
*end : Fig 1....







*begin: statistical tests of scores
foreach v of varlist mgmt_capability_score- average_score {
ttest `v'=0.50 if contact_gender==0
 } 
 
 
 
 
 
 
foreach v of varlist mgmt_capability_score- average_score {
ttest `v', by(contact_gender)
 }   
*end: statistical tests of scores


///////////////////////////////////////////////////////////////////////////
use "$output\assessment_result_PAs_all_long.dta", clear

lab var prod_cycle "Production Cycle"
//hist prod_cycle //check the distribution to categorize prod_cycle

recode prod_cycle (0/1=0 "1-2 cycles")   /*
*/ (2/3=1 "2-3 cycles")  /*
*/ (4/8=2 "4-8 cycles")  /*
*/ (9/10=3 "9-10 cycles") /*
*/ (11/49=4 "11+ cycles"), gen(prod_cycle_cat)

order prod_cycle_cat, after(prod_cycle)

tabout contact_gender prod_cycle_cat if year==2016 /*
*/ using "$tables\prod_cycle_gender.xls", c(sum prod_cycle) sum format(1c) replace	

tabout contact_gender prod_cycle_cat if year==2017 /*
*/ using "$tables\prod_cycle_gender.xls", c(sum prod_cycle) sum format(1c) append	

tabout contact_gender prod_cycle_cat if year==2018 /*
*/ using "$tables\prod_cycle_gender.xls", c(sum prod_cycle) sum format(1c) append	

*end: Number of day-old-chicks production cycles per year


*begin:Annual Turnover, cost of goods sold and gross profit
	
tabout year contact_gender using "$tables\number_chicken_gender.xls" if contact_gender!=3, /*
	*/ c(sum num_chicks_sold_total) /*
	*/ sum format(1c) replace

tabout year contact_gender using "$tables\number_chicken_gender.xls" if contact_gender!=3, /*
	*/ c(N num_chicks_sold_total) /*
	*/ sum format(1c) append	

*end:Annual Turnover, cost of goods sold and gross profit



*begin:Annual Turnover, cost of goods sold and gross profit
	
tabout year contact_gender using "$tables\sales_gender.xls" if contact_gender!=3, /*
	*/ c(sum turn_over_total) /*
	*/ sum format(1c) replace

tabout year contact_gender using "$tables\sales_gender.xls" if contact_gender!=3, /*
	*/ c(N turn_over_total) /*
	*/ sum format(1c) append	

*end:Annual Turnover, cost of goods sold and gross profit



*begin:Annual Turnover, cost of goods sold and gross profit
	
tabout year contact_gender using "$tables\gross_profit_gender.xls" if contact_gender!=3, /*
	*/ c(sum gross_profit) /*
	*/ sum format(1c) replace
tabout year contact_gender using "$tables\gross_profit_gender.xls" if contact_gender!=3, /*
	*/ c(N gross_profit) /*
	*/ sum format(1c) append	
*end:Annual Turnover, cost of goods sold and gross profit




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


order num_chicks_sold_total_cat, after(num_chicks_sold_total)

tabout year contact_gender using "$tables\num_chicks_sold_gender.xls" if contact_gender!=3, /*
	*/ c(sum num_chicks_sold_total sum num_chicks_sold_farmer /*
	*/sum num_chicks_sold_govt sum num_chicks_sold_trader /*
	*/ sum num_chicks_sold_poultry sum num_chicks_sold_other) /*
	*/ sum format(1c) replace

tabout num_chicks_sold_total_cat year using "$tables\num_chicks_sold_gender.xls" if contact_gender!=3, /*
	*/ c(N num_chicks_sold_total) sum format(1c) append

tabout year contact_gender using "$tables\num_chicks_sold_gender.xls" if contact_gender!=3, /*
	*/ c(N num_chicks_sold_total N num_chicks_sold_farmer /*
	*/ N num_chicks_sold_govt N num_chicks_sold_trader /*
	*/ N num_chicks_sold_poultry N num_chicks_sold_other) /*
	*/ sum format(1c) append

*end: Number of chicks sold by year:
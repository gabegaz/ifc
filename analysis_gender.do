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



*begin: employement by PAs
tabout region using "$tables\employment_gender.xls", /*
	*/ c(sum employment_male sum employment_female) /*
	*/ sum format(1c) replace

tabout region using "$tables\employment_gender.xls", /*
	*/ c(mean employment_male mean employment_female) /*
	*/ sum format(1c) append

*end: employment by PAs


//////////////////////beign: access to finance//////////////////////////////


*access to finance by region


tabout contact_gender agency_access_loan using "$tables\financial_access_overall.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout contact_gender informal_access_loan using "$tables\financial_access_overall.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender agency_lender_type using "$tables\financial_access_overall.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender informal_lender_type using "$tables\financial_access_overall.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender using "$tables\financial_access_overall.xls", /*
	*/ c(N  agency_amount /*
	*/ mean  agency_amount/*
	*/ median  agency_amount/*
	*/ N  informal_amount /*
	*/ mean  informal_amount/*
	*/ median  informal_amount)/*
	*/ sum format(1c) append



tabout contact_gender agency_access_loan using "$tables\financial_access_region.xls" if region==1, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout contact_gender agency_access_loan using "$tables\financial_access_region.xls" if region==3, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender agency_access_loan using "$tables\financial_access_region.xls" if region==4, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender agency_access_loan using "$tables\financial_access_region.xls" if region==7, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append


tabout contact_gender informal_access_loan using "$tables\financial_access_region.xls" if region==1, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender informal_access_loan using "$tables\financial_access_region.xls" if region==3, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender informal_access_loan using "$tables\financial_access_region.xls" if region==4, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender informal_access_loan using "$tables\financial_access_region.xls" if region==7, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append
////


////////////
tabout contact_gender agency_lender_type using "$tables\financial_lender_region.xls" if region==1, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout contact_gender agency_lender_type using "$tables\financial_lender_region.xls" if region==3, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender agency_lender_type using "$tables\financial_lender_region.xls" if region==4, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender agency_lender_type using "$tables\financial_lender_region.xls" if region==7, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append


tabout contact_gender informal_lender_type using "$tables\financial_lender_region.xls" if region==1, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender informal_lender_type using "$tables\financial_lender_region.xls" if region==3, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender informal_lender_type using "$tables\financial_lender_region.xls" if region==4, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender informal_lender_type using "$tables\financial_lender_region.xls" if region==7, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append
////



tabout contact_gender using "$tables\finance_borrowed.xls" if region==1, /*
	*/ c(N  agency_amount /*
	*/ mean  agency_amount/*
	*/ median  agency_amount/*
	*/ N  informal_amount /*
	*/ mean  informal_amount/*
	*/ median  informal_amount)/*
	*/ sum format(1c) replace

tabout contact_gender using "$tables\finance_borrowed.xls" if region==3, /*
	*/ c(N  agency_amount /*
	*/ mean  agency_amount/*
	*/ median  agency_amount/*
	*/ N  informal_amount /*
	*/ mean  informal_amount/*
	*/ median  informal_amount)/*
	*/ sum format(1c) append

	
tabout contact_gender using "$tables\finance_borrowed.xls" if region==4, /*
	*/ c(N  agency_amount /*
	*/ mean  agency_amount/*
	*/ median  agency_amount/*
	*/ N  informal_amount /*
	*/ mean  informal_amount/*
	*/ median  informal_amount)/*
	*/ sum format(1c) append

tabout contact_gender using "$tables\finance_borrowed.xls" if region==7, /*
	*/ c(N  agency_amount /*
	*/ mean  agency_amount/*
	*/ median  agency_amount/*
	*/ N  informal_amount /*
	*/ mean  informal_amount/*
	*/ median  informal_amount)/*
	*/ sum format(1c) append

	
	
	
	
*challenges
tabout contact_gender finance_challenge1 using "$tables\finance_challenge_overall.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace


tabout contact_gender finance_challenge1 using "$tables\finance_challenge_region.xls" if region==1, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout contact_gender finance_challenge1 using "$tables\finance_challenge_region.xls" if region==3, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender finance_challenge1 using "$tables\finance_challenge_region.xls" if region==4, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout contact_gender finance_challenge1 using "$tables\finance_challenge_region.xls" if region==7, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

////////////////////////////end:access to finance///////////////////////////




//////////////////begin: training/////////////////////////////

*overall for all
tabout train_given_by contact_gender  using "$tables\training_overall.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout train_satisfaction contact_gender using "$tables\training_overall.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout  train_decision contact_gender using "$tables\training_overall.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append


*training provider

tabout train_given_by contact_gender  using "$tables\training_provider_region.xls" if region==1, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout train_given_by contact_gender using "$tables\training_provider_region.xls" if region==3, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout train_given_by contact_gender using "$tables\training_provider_region.xls" if region==4, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout train_given_by contact_gender using "$tables\training_provider_region.xls" if region==7, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

*satisfaction

tabout train_satisfaction contact_gender using "$tables\training_satisfaction_region.xls" if region==1, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout train_satisfaction contact_gender using "$tables\training_satisfaction_region.xls" if region==3, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout train_satisfaction contact_gender using "$tables\training_satisfaction_region.xls" if region==4, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout train_satisfaction contact_gender using "$tables\training_satisfaction_region.xls" if region==7, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append


*decision maker

tabout  train_decision contact_gender using "$tables\training_decision_region.xls" if region==1, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout train_decision contact_gender using "$tables\training_decision_region.xls" if region==3, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout train_decision contact_gender using "$tables\training_decision_region.xls" if region==4, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout train_decision contact_gender using "$tables\training_decision_region.xls" if region==7, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

//////////////////end: training/////////////////////////////

////////////begin:business advice//////////////
tabout get_business_advice contact_gender using "$tables\business_advice_overall.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace


tabout get_business_advice contact_gender using "$tables\business_advice_region.xls" if region==1, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout get_business_advice contact_gender using "$tables\business_advice_region.xls" if region==3, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout get_business_advice contact_gender using "$tables\business_advice_region.xls" if region==4, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout get_business_advice contact_gender using "$tables\business_advice_region.xls" if region==7, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

////////////end:business advice//////////////

////////////begin:market//////////////
tabout access_poultry_mart contact_gender using "$tables\market_access_overall.xls", /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout access_poultry_mart contact_gender using "$tables\market_access_region.xls" if region==1, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) replace

tabout  access_poultry_mart contact_gender using "$tables\market_access_region.xls" if region==3, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout  access_poultry_mart contact_gender  using "$tables\market_access_region.xls" if region==4, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

tabout  access_poultry_mart contact_gender  using "$tables\market_access_region.xls" if region==7, /// 
c(freq row col) f(0c 1p 1p) clab(_ _ _) layout(rb) h3(nil) append

////////////end:market//////////////






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


*Correlation of Sales/Profit with legal formation
gen association=1 if legal_formation==1
replace association=0 if legal_formation==3
lab def association 0 "Sole Propriotorship" 1 "Association"
lab values association association

cd "D:\projects\IFC\second_round\tables\gender"
asdoc ttest turn_over_total, by(association) replace

use "D:\projects\IFC\first_round\output\main_scores_additional_long.dta", clear

gen association=1 if legal_form==1
replace association=0 if legal_form==4
lab def association 0 "Sole Propriotorship" 1 "Association"
lab values association association

asdoc ttest gross_profit, by(association) rowappend

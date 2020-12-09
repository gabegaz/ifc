version 16.0
set more off

gl output "D:\projects\IFC\second_round\data\modified" 
gl output "D:\projects\IFC\second_round\data\modified" 
gl codes "D:\projects\IFC\second_round\codes" 

import excel "$output\assessment_result_PAs_fr.xlsx", sheet("PAs_fr") firstrow clear

gen round=1

foreach x of varlist agency_lender_type /* 
*/ type_assessed avail_generator avail_water /* 
*/ avail_electricity avail_input_store  /*
*/ contact_designation zone duration  /*
*/ avail_heating start_time telephone  /*
*/ legal_formation woreda contact_educ  /*
*/ contact_person email country  /*
*/ agency_access_loan have_tin have_license /* 
*/ informal_access_loan name_assessor /* 
*/ pa_id business_name year_estabilished  /*
*/ contact_gender region end_time  /*
*/ informal_lender_type {
replace `x'="." if `x'==""
}

reshape long /*
*/ prod_cycle  /*
*/ num_chicks_sold_farm  /* 
*/ num_chicks_sold_gov_agent  /* 
*/ num_chicks_sold_trader  /* 
*/ num_chicks_sold_vill_agents  /* 
*/ num_chicks_sold_other  /* 
*/ num_chicks_sold_total  /* 
*/ turn_over_farm   /*
*/ turn_over_gov_agent  /* 
*/ turn_over_trader   /*
*/ turn_over_vill_agents  /* 
*/ turn_over_other   /*
*/ turn_over_total   /*
*/ sold_to_unique_farmers, i(pa_id) j(year)

order region year, after(pa_id)


////////////////////////////////////
/* no clear information is provided why celss in the excel file are empty
After after discussions wiht Elaine and Serena, the following was decided 

*/

//generate two variables which equal the sum of the number of chickens/sales of chickens for farmers, goverment etc
//this helps compare the total numbers reported by the agents

egen num_total = rsum(num_chicks_sold_farm- num_chicks_sold_other)
egen sales_total = rsum(turn_over_farm- turn_over_other)
 

/*---------------------------------------------------------------------
replace observations based on the above condition

    if the sum of number of chicks or value of chicks sold equal to total reported:
	      and if obs of those variables (num/sales to farmers, government etc) are missing:
		      then they should be replaced with zeros
	otherwise 
	     they should remain zero
---------------------------------------------------------------------*/

foreach var of varlist num_chicks_sold_farm- num_chicks_sold_other {
      replace `var'=0 if num_total==num_chicks_sold_total & `var'==. 
}


foreach var of varlist turn_over_farm- turn_over_other {
  replace `var' = 0 if sales_total==turn_over_total & `var'==.
}

drop num_total sales_total

//Checking eqaulity of total sales revenue with sales to off-taker

egen sales_total = rsum(turn_over_farm- turn_over_other)
replace sales_total=. if turn_over_total==.
gen diff = sales_total- turn_over_total


//Not equal for one poultry agent(id=320): it is replaced with the sum of each
*turn_over_total	sold_to_unique_farmers	sales_total	diff
*979000	            300	                    313200	-665800
*3 others with insignificant difference

replace turn_over_total=sales_total if sales_total!=turn_over_total
drop sales_total diff


////////////////////////
//these numbers are assinged (3 for Amhara, 4 for Oromia etc.)so that the data can easly be scaled 
do "$codes\utils\labelling_r1.do"

order pa_id region

save "$output\assessment_result_PAs_fr_long.dta", replace

reshape wide

order pa_id region prod*18 prod*17 prod*16 num_chicks*2018 turn_over*2018 /*
*/ sold_to_unique_farmers2018 num_chicks*2017 turn_over*2017 /*
*/ sold_to_unique_farmers2017 num_chicks*2016 turn_over*2016 sold_to_unique_farmers2016

save "$output\assessment_result_PAs_fr_wide.dta", replace



/////////////////////////////////ROUND 2////////////////////////////////////////////

import excel "$output\assessment_result_PAs_sr.xlsx", sheet("PAs_sr") firstrow clear
gen round=2

foreach x of varlist finance_challenge_other  /*
*/ contact_gender agency_lender_type type_assessed   /*
*/ avail_water avail_generator avail_electricity   /*
*/ avail_input_store name_assessor avail_heating   /*
*/ train_given_by woreda source_prot_inputs   /*
*/ legal_formation telephone zone email   /*
*/ contact_educ have_tin have_license   /*
*/ informal_access_loan country   /*
*/ water_supply_children water_supply_woman  /* 
*/ water_supply_man water_supply_all   /*
*/ agency_access_loan train_decision   /*
*/ contact_designation informal_lender_type  /* 
*/ train_satisfaction finance_challenge1   /*
*/ contact_person finance_challenge3   /*
*/ finance_challenge4 finance_challenge2   /*
*/ code pa_id business_name get_business_advice  /* 
*/ hh_head_owner region year_estabilished   /*
*/ duration end_time start_time access_poultry_mart {
replace `x'="." if `x'==""
}



*there is one PA with production cycle of 8000 in 2018
replace prod_cycle2018=. if pa_id=="0415"

reshape long /*
*/ prod_cycle  /*
*/ num_chicks_sold_farm  /* 
*/ num_chicks_sold_gov_agent  /* 
*/ num_chicks_sold_trader  /* 
*/ num_chicks_sold_vill_agents  /* 
*/ num_chicks_sold_other  /* 
*/ num_chicks_sold_total  /* 
*/ turn_over_farm   /*
*/ turn_over_gov_agent  /* 
*/ turn_over_trader   /*
*/ turn_over_vill_agents  /* 
*/ turn_over_other   /*
*/ turn_over_total   /*
*/ sold_to_unique_farmers, i(pa_id) j(year)

order region year, after(pa_id)


////////////////////////////////////
/* no clear information is provided why celss in the excel file are empty
After after discussions wiht Elaine and Serena, the following was decided 

*/

//generate two variables which equal the sum of the number of chickens/sales of chickens for farmers, goverment etc
//this helps compare the total numbers reported by the agents

egen num_total = rsum(num_chicks_sold_farm- num_chicks_sold_other)
egen sales_total = rsum(turn_over_farm- turn_over_other)
 

/*---------------------------------------------------------------------
replace observations based on the above condition

    if the sum of number of chicks or value of chicks sold equal to total reported:
	      and if obs of those variables (num/sales to farmers, government etc) are missing:
		      then they should be replaced with zeros
	otherwise 
	     they should remain zero
---------------------------------------------------------------------*/

foreach var of varlist num_chicks_sold_farm- num_chicks_sold_other {
      replace `var'=0 if num_total==num_chicks_sold_total & `var'==. 
}


foreach var of varlist turn_over_farm- turn_over_other {
  replace `var' = 0 if sales_total==turn_over_total & `var'==.
}

drop num_total sales_total

//Checking eqaulity of total sales revenue with sales to off-taker

egen sales_total = rsum(turn_over_farm- turn_over_other)
replace sales_total=. if turn_over_total==.
gen diff = sales_total- turn_over_total


//There are 17 PAs with a difference in reported and computed(summed) sales turnover
replace turn_over_total=sales_total if sales_total!=turn_over_total
drop sales_total diff


////////////////////////
do "$codes\utils\labelling_r2.do"
drop finance_challenge_other

order pa_id region

save "$output\assessment_result_PAs_sr_long.dta", replace

reshape wide

order pa_id region prod*18 prod*17 prod*16 num_chicks*2018 turn_over*2018 /*
*/ sold_to_unique_farmers2018 num_chicks*2017 turn_over*2017 /*
*/ sold_to_unique_farmers2017 num_chicks*2016 turn_over*2016 sold_to_unique_farmers2016

save "$output\assessment_result_PAs_sr_wide.dta", replace





use "$output\assessment_result_PAs_fr_wide.dta", clear
append using "$output\assessment_result_PAs_sr_wide.dta", force
order pa_id region round
 
do "$codes\utils\labelling_scores.do"
save "$output\assessment_result_PAs_all_wide.dta", replace

use "$output\assessment_result_PAs_fr_long.dta", clear
append using "$output\assessment_result_PAs_sr_long.dta", force
order pa_id region round 
do "$codes\utils\labelling_scores.do"
do "$codes\utils\variable_label_long.do"

save "$output\assessment_result_PAs_all_long.dta", replace



///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
////////////////////////Feed Dealers///////////////////////
///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

import excel "$output\assessment_result_FDs.xlsx", sheet("FDs") firstrow clear

foreach x of varlist business_name- agency_lender_type /* 
*/ informal_access_loan- finance_challenge_other /*
*/ inputs_purchase_cycle2017 inputs_sold_gk_farm2018 /*
*/ inputs_sold_gk_total2018 sales_turnover_farm2018 /*
*/ inputs_sold_gk_vpoult_agent2018 /*
*/ sales_turnover_total2018 sales_turnover_vpoult_agent2018 {
replace `x'="." if `x'==""
}

foreach x of varlist informal_amount /*
*/ employment_male /*
*/ employment_female /*
*/ employment_total /*
*/ informal_amount /*
*/ inputs_sold_gk_farm2018 /*
*/ inputs_sold_gk_vpoult_agent2018 /*
*/ inputs_sold_gk_total2018 /*
*/ sales_turnover_farm2018 /*
*/ sales_turnover_gov_agent2017 /*
*/ inputs_purchase_cycle2017 /*
*/ sales_turnover_vpoult_agent2018 /*
*/ sales_turnover_total2018 {

destring `x', replace
}

reshape long /* 
*/ inputs_purchase_cycle /*
*/ inputs_sold_gk_farm /*
*/ inputs_sold_gk_gov_agent /* 
*/ inputs_sold_gk_poult_agent  /*
*/ inputs_sold_gk_vpoult_agent  /*
*/ inputs_sold_gk_other /*
*/ inputs_sold_gk_total  /*
*/ sales_turnover_farm  /*
*/ sales_turnover_gov_agent  /*
*/ sales_turnover_poult_agent  /*
*/ sales_turnover_vpoult_agent  /*
*/ sales_turnover_other /*
*/ sales_turnover_total  /*
*/ num_unique_farmer, i(pa_id) j(year)

order region year, after(pa_id)

egen vol_total = rsum(inputs_sold_gk_farm- inputs_sold_gk_other)
egen sales_total = rsum(sales_turnover_farm- sales_turnover_other)

 
 foreach var of varlist inputs_sold_gk_farm- inputs_sold_gk_other {
      replace `var'=0 if vol_total==sales_turnover_total & `var'==. 
}


foreach var of varlist sales_turnover_farm- sales_turnover_other {
  replace `var' = 0 if sales_total==sales_turnover_total & `var'==.
}

drop vol_total sales_total

egen vol_total = rsum(inputs_sold_gk_farm- inputs_sold_gk_other)
egen sales_total = rsum(sales_turnover_farm- sales_turnover_other)

replace vol_total=. if inputs_sold_gk_total==.
replace sales_total=. if sales_turnover_total==.

*checking differences total and reported
gen vol_diff = vol_total- inputs_sold_gk_total
gen sales_diff = sales_total- sales_turnover_total
drop vol_diff sales_diff vol_total sales_total
*result: no differences

save "$output\assessment_result_FDs_long.dta", replace




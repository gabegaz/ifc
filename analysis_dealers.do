version 16.0
set more off

gl data   "D:\projects\IFC\second_round\data\modified" 
gl tables "D:\projects\IFC\second_round\tables\fds" 

import excel "$data\assessment_result_FDs.xlsx", sheet("FDs") firstrow clear


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
*/ sales_turnover_vpoult_agent2018 /*
*/ sales_turnover_total2018 {

destring `x', replace
}

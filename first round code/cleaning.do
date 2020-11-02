version 16.0
set more off

gl output "D:\projects\IFC\output" 
import excel "$output\additional_extracted.xlsx", sheet("Sheet1") firstrow clear

drop A

reshape long /*
*/ prod_cycle  /*
*/ num_chicks_sold_total /* 
*/ num_chicks_sold_farmer  /*
*/ num_chicks_sold_govt  /*
*/ num_chicks_sold_trader  /*
*/ num_chicks_sold_poultry  /*
*/ num_chicks_sold_other /*
*/ sales_chicks_sold_total  /*
*/ sales_chicks_sold_farmer  /*
*/ sales_chicks_sold_govt  /*
*/ sales_chicks_sold_trader /*
*/ sales_chicks_sold_poultry  /*
*/ sales_chicks_sold_other /*
*/ num_uniq_farm  , i(id) j(year)

order year, after(region)


////////////////////////////////////
/* no clear information is provided why celss in the excel file are empty
After after discussions wiht Elaine and Serena, the following was decided 

*/

//generate two variables which equal the sum of the number of chickens/sales of chickens for farmers, goverment etc
//this helps compare the total numbers reported by the agents

egen num_total = rsum(num_chicks_sold_farmer num_chicks_sold_govt num_chicks_sold_trader num_chicks_sold_poultry num_chicks_sold_other)
egen sales_total = rsum(sales_chicks_sold_farmer sales_chicks_sold_govt sales_chicks_sold_trader sales_chicks_sold_poultry sales_chicks_sold_other)


/*---------------------------------------------------------------------
replace observations based on the above condition

    if the sum of number of chicks or value of chicks sold equal to total reported:
	      and if obs of those variables (num/sales to farmers, government etc) are missing:
		      then they should be replaced with zeros
	otherwise 
	     they should remain zero
---------------------------------------------------------------------*/

foreach var of varlist num_chicks_sold_farmer-num_chicks_sold_other {
      replace `var'=0 if num_total==num_chicks_sold_total & `var'==. 
}


foreach var of varlist sales_chicks_sold_farmer-sales_chicks_sold_other {
  replace `var' = 0 if sales_total==sales_chicks_sold_total & `var'==.
}

drop num_total sales_total

//Checking eqaulity of total sales revenue with sales to off-taker

egen sales_total = rsum(sales_chicks_sold_farmer- sales_chicks_sold_other)
replace sales_total=. if sales_chicks_sold_total==.
gen diff = sales_total- sales_chicks_sold_total

//Not equal for one poultry agent(id=320): it is replaced with the sum of each
replace sales_chicks_sold_total=sales_total if sales_total!=sales_chicks_sold_total
drop sales_total diff


////////////////////////
//these numbers are assinged (3 for Amhara, 4 fo Oromia etc.)so that the data can easly be scaled 
gen region_label = 3 if region=="Amhara" 
replace region_label = 4 if region=="Oromia"
replace region_label = 7 if region=="SNNPR"

lab def region_label 3 "Amhara" 4 "Oromia" 7 "SNNP"
lab values region_label region_label
label variable region_label "region label"

drop region
rename region_label region
order id region

save "$output\additional_cleaned_long.dta", replace

reshape wide

order id region prod*18 prod*17 prod*16 num_chicks*2018 sales_chicks*2018 /*
*/ num_uniq_farm2018 num_chicks*2017 sales_chicks*2017 /*
*/ num_uniq_farm2017 num_chicks*2016 sales_chicks*2016 num_uniq_farm2016
save "$output\additional_cleaned_wide.dta", replace



/////////////////////main dataset //////////////////////////////////
*revenue, cost, profit, gender etc

import excel "$output\main_extracted.xlsx", sheet("Sheet1") firstrow clear
drop A
rename id_no id

gen region_label = 3 if region=="Amhara" 
replace region_label = 4 if region=="Oromia "
replace region_label = 7 if region=="SNNPR"

lab def region_label 3 "Amhara" 4 "Oromia" 7 "SNNP"
lab values region_label region_label
label variable region_label "region label"

drop region
rename region_label region
order id region

replace zone="North Shewa_Amhara" if zone == "North Shewa" & region == 3
replace zone="North Shewa_Oromia" if zone == "North Shewa" & region == 4

replace zone="East Shewa_Amhara" if zone == "East Shewa" & region == 3
replace zone="East Shewa_Oromia" if zone == "East Shewa" & region == 4

gen zone_lab = 1 if zone=="Bale"
replace zone_lab=2 if zone=="Buno Bedelle" 
replace zone_lab=3 if zone=="East Arsi" 
replace zone_lab=4 if zone=="West Arsi" 
replace zone_lab=5 if zone=="East Shewa_Oromia"
replace zone_lab=6 if zone=="North Shewa_Oromia" 
replace zone_lab=7 if zone=="South West Shewa" 
replace zone_lab=8 if zone=="West Shewa" 
replace zone_lab=9 if zone=="East Wollega" 
replace zone_lab=10 if zone=="Jimma"
replace zone_lab=11 if zone=="East Shewa_Amhara" 
replace zone_lab=12 if zone=="North Shewa_Amhara" 
replace zone_lab=13 if zone=="Gurage"   
replace zone_lab=14 if zone=="Hadiya" 
replace zone_lab=15 if zone=="Sidama"
replace zone_lab=16 if zone=="Silte" 
replace zone_lab=17 if zone=="Wolaita"


lab def zone_lab 1 "Bale" 2 "Buno Bedelle" 3 "East Arsi" 4 "West Arsi" 5 "East Shewa_Oromia" /*
*/  6 "North Shewa_Oromia" 7 "South West Shewa" 8 "West Shewa" 9 "East Wollega" 10 "Jimma"/*
*/ 11 "East Shewa_Amhara" 12 "North Shewa_Amhara" 13 "Gurage"   14 "Hadiya" 15 "Sidama" /*
*/ 16 "Silte" 17 "Wolaita"

lab values zone_lab zone_lab

encode contact_des, gen(contact_des2)
encode contact_gender, gen(contact_gender2)
encode legal_form, gen(legal_form2)
drop contact_des contact_gender legal_form

rename (contact_des2 contact_gender2 legal_form2) (contact_des contact_gender legal_form)

gen education_level_cat=0 if education_level=="None/Informal Education"
replace education_level_cat=1 if education_level=="Primary & Junior  Secondary" 
replace education_level_cat=2 if education_level=="High School" 
replace education_level_cat=3 if education_level=="Certificate" 
replace education_level_cat=4 if education_level=="Diploma" 
replace education_level_cat=5 if education_level=="Bachelors" 
replace education_level_cat=6 if education_level=="Masters" 
replace education_level_cat=7 if education_level=="DVM"


lab def education_level_cat /* 
*/ 0 "None/Informal Education" /* 
*/ 1 "Primary & Junior  Secondary" /* 
*/ 2 "High School" /* 
*/ 3 "Certificate" /* 
*/ 4 "Diploma" /* 
*/ 5 "Bachelors" /* 
*/ 6 "Masters" /* 
*/ 7 "DVM"

lab values education_level_cat education_level_cat

save "$output\main_cleaned_wide.dta", replace

reshape long /*

*/ annual_turnover /*
*/ cost_goods_sold /*
*/ gross_profit, i(id) j(year)

////////////////

save "$output\main_cleaned_long.dta", replace


*scores
import excel "$output\scores_extracted.xlsx", sheet("Sheet1") firstrow clear
drop A
order id region
tab region

//these numbers are assinged (3 for Amhara, 4 fo Oromia etc.)so that the data can easly be scaled 
gen region_label = 3 if region=="Amhara" 
replace region_label = 4 if region=="Oromia"
replace region_label = 7 if region=="SNNP"

lab def region_label 3 "Amhara" 4 "Oromia" 7 "SNNP"
lab values region_label region_label
label variable region_label "region label"

drop region
rename region_label region
order id region
tab region

save "$output\scores_cleaned.dta", replace

merge 1:1 id using "$output\additional_cleaned_wide.dta", nogen
merge 1:1 id using "$output\main_cleaned_wide.dta"
drop _merge

//note: there are 72 poultry agents whose information in the additional data was not found
order id region



save "$output\main_scores_additional_wide.dta", replace



use "$output\additional_cleaned_long.dta", clear
//this is newly extracted to get gross_revenue, cost of goods sold and gross profit
merge 1:1 id year using "$output\main_cleaned_long.dta", nogen
merge m:1 id using "$output\scores_cleaned.dta"

lab var year Year 
lab var prod_cycle  "Production cycle" 
lab var num_chicks_sold_total  "Total number of chicks sold"
lab var num_chicks_sold_farmer   "Number of chicks sold to farmers"
lab var num_chicks_sold_govt   "Number of chicks sold to government"
lab var num_chicks_sold_trader   "Number of chicks sold to trader"
lab var num_chicks_sold_poultry   "Number of chicks sold to poultry agnets"
lab var num_chicks_sold_other   "Number of chicks sold to others"
lab var sales_chicks_sold_total   "Total sales revenue in Birr"
lab var sales_chicks_sold_farmer   "Sales value in Birr from farmer"
lab var sales_chicks_sold_govt   "Sales value in Birr from government"
lab var sales_chicks_sold_trader   "Sales value in Birr from trader"
lab var sales_chicks_sold_other   "Sales value in Birr from other"
lab var num_uniq_farm  "NUmber of unique farmers reached out"

lab var annual_turnover "Total annual turnover-main dataset (BIrr)"
lab var cost_goods_sold "Total cost of goods sold (Birr)"
lab var gross_profit "Gross profit (Birr)"
save "$output\main_scores_additional_long.dta", replace




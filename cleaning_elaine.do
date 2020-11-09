version 16.0
set more off

gl output "D:\projects\IFC\second_round\data\modified" 
gl first_round "D:\projects\IFC\first_round\output"

//////////////ROUND 1  to make the rounds consistent////////////////////
use "$first_round\additional_cleaned_long.dta", clear
merge 1:1 id year using "$first_round\main_cleaned_long.dta" 
rename id pa_id
keep pa_id- num_uniq_farm
gen round=1

rename(num_chicks_sold_total  /*
*/ num_chicks_sold_farmer  /*
*/ num_chicks_sold_govt  /*
*/ num_chicks_sold_trader  /*
*/ num_chicks_sold_poultry  /*
*/ num_chicks_sold_other  /*
*/ sales_chicks_sold_total  /*
*/ sales_chicks_sold_farmer  /*
*/ sales_chicks_sold_govt  /*
*/ sales_chicks_sold_trader  /*
*/ sales_chicks_sold_poultry /* 
*/ sales_chicks_sold_other /*
*/ num_uniq_farm) (num_chicks_sold_total  /*
*/ num_chicks_sold_farm  /* 
*/ num_chicks_sold_gov_agent  /* 
*/ num_chicks_sold_trader  /* 
*/ num_chicks_sold_vill_agents  /* 
*/ num_chicks_sold_other  /* 
*/ turn_over_total   /*
*/ turn_over_farm   /*
*/ turn_over_gov_agent  /* 
*/ turn_over_trader   /*
*/ turn_over_vill_agents  /* 
*/ turn_over_other   /*
*/ sold_to_unique_farmers)
save "$output\assessment_result_PAs_fr_long2.dta", replace  

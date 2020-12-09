version 16.0
set more off

gl data   "D:\projects\IFC\second_round\data\modified" 
gl tables "D:\projects\IFC\second_round\tables\alemu" 



**Regression 


use "$data\assessment_result_PAs_all_long.dta", clear

tab region, gen(region)
tab legal_formation, gen(legal_formation)
tab avail_electricity, gen(avail_electricity)
gen lnnum_chicks_sold_total= ln(num_chicks_sold_total)
gen lnturn_over_total= ln(turn_over_total)

reg lnnum_chicks_sold_total /*
  */  mgmt_capability_score inst_competency_score bus_knowledge_score /*
  */  mark_potential_score fin_management_score env_compliance_score /*
  */  employment_total agency_access_loan informal_access_loan contact_gender /*
  */  region1 region2 region3 legal_formation2 legal_formation3 avail_electricity1

est store model_1


reg lnturn_over_total /*
  */  mgmt_capability_score inst_competency_score bus_knowledge_score /*
  */  mark_potential_score fin_management_score env_compliance_score /*
  */  employment_total agency_access_loan informal_access_loan contact_gender /*
  */  region1 region2 region3 legal_formation2 legal_formation3 avail_electricity1

est store model_2

outreg2 [model_1 model_2] using "$tables\Sales.rtf", /*
*/ label bdec(2) ctitle()  ti(Table 1 : Total Sales) replace






///////////////////////////////////////////////////////
tab education, gen(education)
tab experience, gen(experience)
tab training, gen(training)

reg average_score /*
  */  employment_total agency_access_loan informal_access_loan contact_gender /*
  */  region1 region2 region3 legal_formation2 legal_formation3 avail_electricity1

est store model_1

outreg2 [model_1 model_2] using "$tables\scores.rtf", /*
*/ label bdec(2) ctitle()  ti(Table 1 : Average Scores) replace





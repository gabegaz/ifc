gen region2 =1 if region =="Tigrai"
replace region2 = 3 if region=="Amhara" 
replace region2 = 4 if region=="Oromia "
replace region2 = 7 if region=="SNNPR"
lab def region2 1 "Tigrai" 3 "Amhara" 4 "Oromia" 7 "SNNP"
lab values region2 region2
label variable region2 "region label"

replace contact_gender="Female" if contact_gender=="Female "

replace contact_gender="Male" if contact_gender=="Male/Female " & pa_id=="0993"
replace contact_gender="Female" if contact_gender=="Male/Female " & pa_id=="0994"

replace contact_gender="Male" if pa_id=="0717"
replace contact_gender="Male" if pa_id=="1053"


replace contact_gender="Male" if contact_gender=="Male "
gen contact_gender2=0 if contact_gender=="Female"
replace contact_gender2=1 if contact_gender=="Male"
lab define contact_gender2 0 "Female" 1 "Male"
lab values contact_gender2 contact_gender2





replace contact_designation="." if contact_designation=="                              "
gen contact_designation2 = 1 if contact_designation=="General Manager "
replace contact_designation2 = 2 if contact_designation=="Owner Manager"
replace contact_designation2 = 3 if contact_designation=="Representative "
lab define contact_designation2 1 "General Manager" 2 "Owner Manager" 3 "Represenative"
lab val contact_designation2 contact_designation2

gen legal_formation2=1 if legal_formation=="Association"
replace legal_formation2=2 if legal_formation=="Private Limited Company"
replace legal_formation2=3 if legal_formation=="Sole Proprietorship"
replace legal_formation2=4 if legal_formation=="Other"
lab define legal_formation2 1 "Association" 2 "Private Limited Company" 3 "Sole Proprietorship" 4 "Other"
lab values legal_formation2 legal_formation2

replace have_license="Yes" if have_license=="yes"
replace have_tin="Yes" if have_tin=="yes"

gen have_license2 = 0 if have_license=="No"
replace have_license2 = 1 if have_license=="Yes"
lab define  have_license2 0 "No" 1 "Yes"
lab values have_license2 have_license2

gen have_tin2 = 0 if have_tin=="No"
replace have_tin2 = 1 if have_tin=="Yes"
lab define  have_tin2 0 "No" 1 "Yes"
lab values have_tin2 have_tin2


replace avail_water="Available" if avail_water=="available"
gen avail_water2=1 if  avail_water=="Available "
replace avail_water2=0 if avail_water=="Not Available "
lab def avail_water2 0 "Not Available" 1 "Available"
lab values avail_water2 avail_water2

gen avail_input_store2=1 if  avail_input_store=="Available "
replace avail_input_store2=0 if avail_input_store=="Not Available "
lab def avail_input_store2 0 "Not Available" 1 "Available"
lab values avail_input_store2 avail_input_store2

gen avail_electricity2=1 if  avail_electricity=="Available "
replace avail_electricity2=0 if avail_electricity=="Not Available "
lab def avail_electricity2 0 "Not Available" 1 "Available"
lab values avail_electricity2 avail_electricity2

replace avail_generator="Not Available " if avail_generator=="No" 
gen avail_generator2=1 if  avail_generator=="Available "
replace avail_generator2=0 if avail_generator=="Not Available "
lab def avail_generator2 0 "Not Available" 1 "Available"
lab values avail_generator2 avail_generator2

gen avail_heating2=1 if  avail_heating=="Always in use"
replace avail_heating2=0 if avail_heating=="Not in use "
replace avail_heating2=2 if avail_heating=="Some times in use "
lab def avail_heating2 0 "Not in use" 1 "Always in use" 2 "Some times in use"
lab values avail_heating2 avail_heating2


replace agency_access_loan="No" if agency_access_loan=="NO" 
gen agency_access_loan2 = 0 if agency_access_loan=="No"
replace agency_access_loan2 = 1 if agency_access_loan=="Yes"
lab define  agency_access_loan2 0 "No" 1 "Yes"
lab values agency_access_loan2 agency_access_loan2

gen agency_lender_type2 = 0 if agency_lender_type=="Microfinance "
replace agency_lender_type2 = 1 if agency_lender_type=="Bank "
lab define  agency_lender_type2 0 "Microfinance" 1 "Bank"
lab values agency_lender_type2 agency_lender_type2

replace informal_access_loan="No" if informal_access_loan=="NO" 
gen informal_access_loan2 = 0 if informal_access_loan=="No"
replace informal_access_loan2 = 1 if informal_access_loan=="Yes"
lab define  informal_access_loan2 0 "No" 1 "Yes"
lab values informal_access_loan2 informal_access_loan2


gen informal_lender_type2 = 0 if informal_lender_type=="Family"
replace informal_lender_type2 = 1 if informal_lender_type=="Friends "
replace informal_lender_type2 = 2 if informal_lender_type=="Others (Equb, Local lender…)"
lab define  informal_lender_type2 0 "Family" 1 "Friends" 2 "Others"
lab values informal_lender_type2 informal_lender_type2

replace contact_educ="Primary & junior High school"  if contact_educ=="Primary & Junior  Secondary  "
gen contact_educ_cat=0 if contact_educ=="None/Informal Education "
replace contact_educ_cat=1 if contact_educ=="Primary & junior High school" 
replace contact_educ_cat=2 if contact_educ=="High School" 
replace contact_educ_cat=3 if contact_educ=="Certificate" 
replace contact_educ_cat=4 if contact_educ=="Diploma" 
replace contact_educ_cat=5 if contact_educ=="Bachelors" 
replace contact_educ_cat=6 if contact_educ=="Masters" 
replace contact_educ_cat=7 if contact_educ=="DVM"

lab def contact_educ_cat /* 
*/ 0 "None/Informal Education " /* 
*/ 1 "Primary & Junior  Secondary" /* 
*/ 2 "High School" /* 
*/ 3 "Certificate" /* 
*/ 4 "Diploma" /* 
*/ 5 "Bachelors" /* 
*/ 6 "Masters" /* 
*/ 7 "DVM"

lab values contact_educ_cat contact_educ_cat

replace train_given_by="Government " if train_given_by=="Government  "
replace train_given_by="Government " if train_given_by=="GOVERNMENT"
replace train_given_by="No training received" if train_given_by=="No Training "
replace train_given_by="No training received" if train_given_by=="Received no Training"
replace train_given_by="No training received" if train_given_by=="Received no Training "
replace train_given_by="No training received" if train_given_by=="Received no training"
replace train_given_by="No training received" if train_given_by=="Received no Training "
replace train_given_by="TVET" if train_given_by=="Techniquena Muya"
gen train_given_by2=0 if train_given_by=="Government"
replace train_given_by2=1 if train_given_by=="EthioChicken"
replace train_given_by2=2 if train_given_by=="Farmer Association"
replace train_given_by2=3 if train_given_by=="TVET"
replace train_given_by2=4 if train_given_by=="NGO"
replace train_given_by2=5 if train_given_by=="No training received "
lab def train_given_by2 0 "Government" 1 "EthioChicken" 2 "Farmer Association" 3 "TVET" 4 "NGO" 5 "No Training Received"
lab values train_given_by2 train_given_by2


gen train_satisfaction2=0 if train_satisfaction=="High"
replace train_satisfaction2=1 if train_satisfaction=="Satisfied"
replace train_satisfaction2=2 if train_satisfaction=="Neither satisfied nor dissatisfied"
replace train_satisfaction2=3 if train_satisfaction=="Not satisfied"
lab def train_satisfaction2 0 "Highly satisfied" 1 "Satisfied" 2 "Neither satisfied nor dissatisfied" 3 "Not satisfied"
lab values train_satisfaction2 train_satisfaction2

replace train_decision="Association/PLC Management " if train_decision=="Association /PLC Management "
gen train_decision2=0 if train_decision=="Association/PLC Management "
replace train_decision2=1 if train_decision=="Technikna MUYA"
replace train_decision2=2 if train_decision=="Jointly with Spouse "
replace train_decision2=3 if train_decision=="Owner /Self"
replace train_decision2=4 if train_decision=="Spouse /Father/Brother/ Sister"
lab def train_decision2 0 "Association/PLC Management" 1 "TVET" 2 "Jointly with Spouse" 3 "Owner/Self" 4 "Spouse/Father/Sister"
lab values train_decision2 train_decision2

replace water_supply_man="Yes" if water_supply_man=="YES"
replace water_supply_man="Yes" if water_supply_man=="yes"
gen water_supply_man2=0 if water_supply_man=="No"
replace water_supply_man2=1 if water_supply_man=="Yes"
lab def water_supply_man2 0 "No" 1 "Yes"
lab values water_supply_man2 water_supply_man2

replace water_supply_woman="Yes" if water_supply_woman=="YES"
replace water_supply_woman="Yes" if water_supply_woman=="yes"
gen water_supply_woman2=0 if water_supply_man=="No"
replace water_supply_woman2=1 if water_supply_man=="Yes"
lab def water_supply_woman2 0 "No" 1 "Yes"
lab values water_supply_woman2 water_supply_woman2

gen water_supply_children2=0 if water_supply_man=="No"
replace water_supply_children2=1 if water_supply_man=="Yes"
lab def water_supply_children2 0 "No" 1 "Yes"
lab values water_supply_children2 water_supply_children2

gen water_supply_all2=0 if water_supply_man=="No"
replace water_supply_all2=1 if water_supply_man=="Yes"
lab def water_supply_all2 0 "No" 1 "Yes"
lab values water_supply_all2 water_supply_children2


gen source_prot_inputs2=0 if source_prot_inputs == "Dealers"
replace source_prot_inputs2=1 if source_prot_inputs == "EthioChicken  "
replace source_prot_inputs2=2 if source_prot_inputs == "EthioChicken and Dealer"
replace source_prot_inputs2=3 if source_prot_inputs == "Government "
replace source_prot_inputs2=4 if source_prot_inputs == "Government & Dealers"
replace source_prot_inputs2=5 if source_prot_inputs == "Other Poultry Agents"
replace source_prot_inputs2=6 if source_prot_inputs == "All"
lab def source_prot_inputs2 0 "Dealers" 1 "EthioChicken" 2 "EthioChicken and Dealer" 3 "Government" 4 "Government and Dealer" 5 "Other Poultry Agents" 6 "All"
lab values source_prot_inputs2 source_prot_inputs2

gen get_business_advice2=0 if get_business_advice=="Cooperative"
replace  get_business_advice2=1 if get_business_advice=="EthioChicken "
replace get_business_advice2=2 if get_business_advice=="EthioChicken & Gov. Animal Health/Pro.."
replace get_business_advice2=3 if get_business_advice=="Extension Workers"
replace get_business_advice2=4 if get_business_advice=="Family  "
replace get_business_advice2=5 if get_business_advice=="Farmer Group"
replace get_business_advice2=6 if get_business_advice=="Friends & Neighbor"
replace get_business_advice2=7 if get_business_advice=="Gov. Animal Health/Production Worker"
replace get_business_advice2=8 if get_business_advice=="Private DVM"

lab def get_business_advice2 0 "Cooperatives" 1 "EthioChicken" 2 "EthioChicken/Government Animal Health/Pros." /*
*/ 3 "Extension workers" 4 "Family" 5 "Farmer Group" 6 "Friends and Neighbor" /*
*/ 7 "Gov. Animal Health/Production Worker" 8 "Private DVM"
lab values get_business_advice2 get_business_advice2

replace access_poultry_mart="Seasonal" if access_poultry_mart=="Seasonal "
gen access_poultry_mart2=0 if access_poultry_mart=="No"
replace access_poultry_mart2=1 if access_poultry_mart=="Seasonal"
replace access_poultry_mart2=2 if access_poultry_mart=="Yes"
lab def access_poultry_mart2 0 "No access" 1 "Seasonal access" 2 "Have access"
lab val access_poultry_mart2 access_poultry_mart2

replace finance_challenge1="No Challenge " if finance_challenge1=="No challenge"
gen finance_challenge12=0 if finance_challenge1=="Limitation of Decision Making Power"
replace finance_challenge12=1 if finance_challenge1=="No Record Keeping Skill "
replace finance_challenge12=2 if finance_challenge1=="No/Limited Access to Finance "
replace finance_challenge12=3 if finance_challenge1=="Problem of Liquidity "
replace finance_challenge12=4 if finance_challenge1=="No Challenge "
lab def finance_challenge12 0 "Limitation of Decision Making Power" 1 "No Record Keeping Skill" 2 "No/Limited Access to Finance" 3 "Problem of Liquidity" 4 "No Challenge"
lab values finance_challenge12 finance_challenge12


replace finance_challenge2="No Challenge " if finance_challenge2=="No challenge"
replace finance_challenge2="No Challenge " if finance_challenge2=="No problem"
gen finance_challenge22=0 if finance_challenge2=="Limitation of Decision Making Power"
replace finance_challenge22=1 if finance_challenge2=="No Record Keeping Skill "
replace finance_challenge22=2 if finance_challenge2=="No/Limited Access to Finance "
replace finance_challenge22=3 if finance_challenge2=="Problem of Liquidity "
replace finance_challenge22=4 if finance_challenge2=="No Challenge "
lab def finance_challenge22 0 "Limitation of Decision Making Power" 1 "No Record Keeping Skill" 2 "No/Limited Access to Finance" 3 "Problem of Liquidity" 4 "No Challenge"
lab values finance_challenge22 finance_challenge22

replace finance_challenge3="No Challenge " if finance_challenge3=="No challenge"
gen finance_challenge32=0 if finance_challenge3=="Limitation of Decision Making Power"
replace finance_challenge32=1 if finance_challenge3=="No Record Keeping Skill "
replace finance_challenge32=2 if finance_challenge3=="No/Limited Access to Finance "
replace finance_challenge32=3 if finance_challenge3=="Problem of Liquidity "
replace finance_challenge32=4 if finance_challenge3=="No Challenge "
lab def finance_challenge32 0 "Limitation of Decision Making Power" 1 "No Record Keeping Skill" 2 "No/Limited Access to Finance" 3 "Problem of Liquidity" 4 "No Challenge"
lab values finance_challenge32 finance_challenge32

replace finance_challenge4="No Challenge " if finance_challenge4=="No challenge"
gen finance_challenge42=0 if finance_challenge4=="Limitation of Decision Making Power"
replace finance_challenge42=1 if finance_challenge4=="No Record Keeping Skill "
replace finance_challenge42=2 if finance_challenge4=="No/Limited Access to Finance "
replace finance_challenge42=3 if finance_challenge4=="Problem of Liquidity "
replace finance_challenge42=4 if finance_challenge4=="No Challenge "
lab def finance_challenge42 0 "Limitation of Decision Making Power" 1 "No Record Keeping Skill" 2 "No/Limited Access to Finance" 3 "Problem of Liquidity" 4 "No Challenge"
lab values finance_challenge42 finance_challenge42

drop region contact_gender have_license have_tin /*
*/ contact_designation legal_formation /*
*/ avail_water avail_input_store /*
*/ avail_electricity avail_generator avail_heating /*
*/ agency_access_loan agency_lender_type /*
*/ informal_access_loan informal_lender_type /*
*/ contact_educ train_given_by train_satisfaction /*
*/ train_decision water_supply_man water_supply_woman /*
*/ water_supply_children water_supply_all /*
*/ source_prot_inputs get_business_advice /*
*/ access_poultry_mart finance_challenge1 /*
*/ finance_challenge2 finance_challenge3 /*
*/ finance_challenge4

rename (region2 contact_gender2 have_license2 have_tin2 /*
*/ contact_designation2 legal_formation2 /*
*/ avail_water2 avail_input_store2 /*
*/ avail_electricity2 avail_generator2 avail_heating2 /*
*/ agency_access_loan2 agency_lender_type2 /*
*/ informal_access_loan2 informal_lender_type2 /*
*/ train_given_by2 train_satisfaction2 /*
*/ train_decision2 water_supply_man2 water_supply_woman2 /*
*/ water_supply_children2 water_supply_all2 /*
*/ source_prot_inputs2 get_business_advice2 /*
*/ access_poultry_mart2 finance_challenge12 /*
*/ finance_challenge22 finance_challenge32 /*
*/ finance_challenge42) /*
*/ (region contact_gender have_license have_tin /*
*/ contact_designation legal_formation /*
*/ avail_water avail_input_store /*
*/ avail_electricity avail_generator avail_heating /*
*/ agency_access_loan agency_lender_type /*
*/ informal_access_loan informal_lender_type /*
*/ train_given_by train_satisfaction /*
*/ train_decision water_supply_man water_supply_woman /*
*/ water_supply_children water_supply_all /*
*/ source_prot_inputs get_business_advice /*
*/ access_poultry_mart finance_challenge1 /*
*/ finance_challenge2 finance_challenge3 /*
*/ finance_challenge4)


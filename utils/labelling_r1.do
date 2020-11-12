gen region2 =1 if region =="Tigrai"
replace region2 = 3 if region=="Amhara" 
replace region2 = 4 if region=="Oromia "
replace region2 = 7 if region=="SNNPR"

lab def region2 1 "Tigrai" 3 "Amhara" 4 "Oromia" 7 "SNNP"
lab values region2 region2
label variable region2 "region label"

gen contact_gender2=0 if contact_gender=="Female "
replace contact_gender2=1 if contact_gender=="Male "
lab define contact_gender2 0 "Female" 1 "Male"
lab values contact_gender2 contact_gender2

gen have_license2 = 0 if have_license=="No"
replace have_license2 = 1 if have_license=="Yes"
lab define  have_license2 0 "No" 1 "Yes"
lab values have_license2 have_license2

gen have_tin2 = 0 if have_tin=="No"
replace have_tin2 = 1 if have_tin=="Yes"
lab define  have_tin2 0 "No" 1 "Yes"
lab values have_tin2 have_tin2

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

gen avail_generator2=1 if  avail_generator=="Available "
replace avail_generator2=0 if avail_generator=="Not Available "
lab def avail_generator2 0 "Not Available" 1 "Available"
lab values avail_generator2 avail_generator2

gen avail_heating2=1 if  avail_heating=="Always in use"
replace avail_heating2=0 if avail_heating=="Not in use "
replace avail_heating2=2 if avail_heating=="Some times in use "
lab def avail_heating2 0 "Not in use" 1 "Always in use" 2 "Some times in use"
lab values avail_heating2 avail_heating2

gen agency_access_loan2 = 0 if agency_access_loan=="No"
replace agency_access_loan2 = 1 if agency_access_loan=="Yes"
lab define  agency_access_loan2 0 "No" 1 "Yes"
lab values agency_access_loan2 agency_access_loan2

gen agency_lender_type2 = 0 if agency_lender_type=="Microfinance "
replace agency_lender_type2 = 1 if agency_lender_type=="Bank "
lab define  agency_lender_type2 0 "Microfinance" 1 "Bank"
lab values agency_lender_type2 agency_lender_type2

replace informal_access_loan="Yes" if informal_access_loan=="yes"
gen informal_access_loan2 = 0 if informal_access_loan=="No"
replace informal_access_loan2 = 1 if informal_access_loan=="Yes"
lab define  informal_access_loan2 0 "No" 1 "Yes"
lab values informal_access_loan2 informal_access_loan2

gen informal_lender_type2 = 0 if informal_lender_type=="Family"
replace informal_lender_type2 = 1 if informal_lender_type=="Friends "
replace informal_lender_type2 = 2 if informal_lender_type=="Others"
lab define  informal_lender_type2 0 "Family" 1 "Friends" 2 "Others"
lab values informal_lender_type2 informal_lender_type2

gen contact_educ_cat=0 if contact_educ=="None/Informal Education"
replace contact_educ_cat=1 if contact_educ=="Primary & Junior  Secondary" 
replace contact_educ_cat=2 if contact_educ=="High School" 
replace contact_educ_cat=3 if contact_educ=="Certificate" 
replace contact_educ_cat=4 if contact_educ=="Diploma" 
replace contact_educ_cat=5 if contact_educ=="Bachelors" 
replace contact_educ_cat=6 if contact_educ=="Masters" 
replace contact_educ_cat=7 if contact_educ=="DVM"

lab def contact_educ_cat /* 
*/ 0 "None/Informal Education" /* 
*/ 1 "Primary & Junior  Secondary" /* 
*/ 2 "High School" /* 
*/ 3 "Certificate" /* 
*/ 4 "Diploma" /* 
*/ 5 "Bachelors" /* 
*/ 6 "Masters" /* 
*/ 7 "DVM"
lab values contact_educ_cat contact_educ_cat


drop region contact_gender have_license have_tin /*
*/ contact_designation legal_formation /*
*/ avail_water avail_input_store /*
*/ avail_electricity avail_generator avail_heating /*
*/ agency_access_loan agency_lender_type /*
*/ informal_access_loan informal_lender_type /*
*/ contact_educ

rename (region2 contact_gender2 have_license2 have_tin2 /*
*/ contact_designation2 legal_formation2 /*
*/ avail_water2 avail_input_store2 /*
*/ avail_electricity2 avail_generator2 avail_heating2 /*
*/ agency_access_loan2 agency_lender_type2 /*
*/ informal_access_loan2 informal_lender_type2) /*
*/ (region contact_gender have_license have_tin /*
*/ contact_designation legal_formation /*
*/ avail_water avail_input_store /*
*/ avail_electricity avail_generator2 avail_heating /*
*/ agency_access_loan agency_lender_type /*
*/ informal_access_loan informal_lender_type)

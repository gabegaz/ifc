# -*- coding: utf-8 -*-
"""
Created on Thu Mar  5 10:56:11 2020

@author: Getachew
"""

from openpyxl import load_workbook
#openpyxl.__version__
# 3.0.0

import pandas as pd
pd.__version__
#1.0.1

import numpy as np
np.__version__
#'1.16.5'

import pandas as pd
import re


#####################################################3
def get_data_pa_main_fr(file_path, files):
    [
    pa_id,
    ###
    ###
    #File:
    #Sheet: BIETH
    name_assessor,
    date,
    start_time,  
    end_time,
    duration,
    type_assessed,
    country,
    code,
    business_name,
    legal_formation,
    region,
    zone,
    woreda,
    telephone,
    email,
    contact_person,
    contact_designation,
    contact_gender,
    contact_educ,
    #hh_head_owner,
    #train_given_by,
    #train_satisfaction,
    #train_decision,
    have_license,
    have_tin,
    year_estabilished,
    employment_male, 
    employment_female, 
    employment_total,
    avail_water, 
    avail_input_store, 
    avail_electricity, 
    avail_generator, 
    avail_heating, 
    #water_supply_man, 
    #water_supply_woman, 
    #water_supply_children, 
    #water_supply_all,
    #source_prot_inputs,
    #get_business_advice, 
    #access_poultry_mart, 
    agency_access_loan, 
    agency_lender_type,
    agency_amount, 
    informal_access_loan, 
    informal_lender_type, 
    informal_amount,
    #finance_challenge1, 
    #finance_challenge2, 
    #finance_challenge3,
    #finance_challenge4,
    #finance_challenge_other,
    ###
    ###
    #File:
    #Sheet:QETH
    education,
    experience, 
    training, 
    staffing,    
    customer_service,   
    housing,   
    poultry_prtection_inputs,    
    feed_and_feeding,
    water_source_use, 
    chicken_breed_quality,   
    poultry_pests,
    farm_hygen,    
    annual_plan,    
    income_source,  
    financial_reliability,    
    competition, 
    promotion,    
    price_risk, 
    supply_shortage,   
    working_capital, 
    financial_records,    
    environmental_threats,
    mitigation_emvironmental, 
    health_and_safety,
    ###
    ###
    #File:
    #Sheet:Additional Info
    #prod_cycle2018, 
    #prod_cycle2017, 
    #prod_cycle2016,
    #num_chicks_sold_farm2018, 
    #num_chicks_sold_gov_agent2018,
    #num_chicks_sold_trader2018, 
    #num_chicks_sold_vill_agents2018,
    #num_chicks_sold_other2018, 
    #num_chicks_sold_total2018,    
    #turn_over_farm2018, 
    #turn_over_gov_agent2018,
    #turn_over_trader2018, 
    #turn_over_vill_agents2018,
    #turn_over_other2018, 
    #turn_over_total2018,    
    #sold_to_unique_farmers2018,
    #num_chicks_sold_farm2017, 
    #num_chicks_sold_gov_agent2017,
    #num_chicks_sold_trader2017, 
    #num_chicks_sold_vill_agents2017,
    #num_chicks_sold_other2017, 
    #num_chicks_sold_total2017,    
    #turn_over_farm2017, 
    #turn_over_gov_agent2017,
    #turn_over_trader2017, 
    #turn_over_vill_agents2017,
    #turn_over_other2017, 
    #turn_over_total2017,    
    #sold_to_unique_farmers2017,
    #num_chicks_sold_farm2016, 
    #num_chicks_sold_gov_agent2016,
    #num_chicks_sold_trader2016, 
    #num_chicks_sold_vill_agents2016,
    #num_chicks_sold_other2016, 
    #num_chicks_sold_total2016, 
    #turn_over_farm2016,
    #turn_over_gov_agent2016,
    #turn_over_trader2016,
    #turn_over_vill_agents2016,
    #turn_over_other2016,
    #turn_over_total2016,
    #sold_to_unique_farmers2016,
    ###
    ###
    #File:
    #Sheet:RETH-EN
    mgmt_capability_score,
    inst_competency_score,
    bus_knowledge_score,
    mark_potential_score,
    fin_management_score,
    env_compliance_score,
    average_score
    ]= ([] for i in range(68))
    
    ##################################################
    for file in files:
        match = re.search(r'\d*', file)
        pa_id.append(match.group())       
        workbook = load_workbook(file_path+file, data_only=True)  
        ###                 
        worksheet = workbook['BIETH1']
        print(f'File: {file} ...')
        print('Sheet: BIETH ...')   
        name_assessor_obj=worksheet['G6']
        date_obj=worksheet['A10']
        start_time_obj=worksheet['B10']
        end_time_obj=worksheet['C10']
        duration_obj=worksheet['D10']
        type_assessed_obj=worksheet['E9']
        country_obj=worksheet['G9']
        code_obj=worksheet['H9']
        business_name_obj=worksheet['C14']
        legal_formation_obj=worksheet['C15']
        region_obj=worksheet['C16']
        zone_obj=worksheet['C17']
        woreda_obj=worksheet['C18']
        telephone_obj=worksheet['C19']
        email_obj=worksheet['C20']
        contact_person_obj=worksheet['G14']
        contact_designation_obj=worksheet['H14']
        contact_gender_obj=worksheet['G15']
        contact_educ_obj=worksheet['G16']
        #hh_head_owner_obj=worksheet['G19']
        #train_given_by_obj=worksheet['C24']
        #train_satisfaction_obj=worksheet['F24']
        #train_decision_obj=worksheet['G24']
        have_license_obj=worksheet['C25']
        have_tin_obj=worksheet['C26']
        year_estabilished_obj=worksheet['G24']
        employment_male_obj=worksheet['B32']
        employment_female_obj=worksheet['C32']
        employment_total_obj=worksheet['D32']
        avail_water_obj=worksheet['H28']
        avail_input_store_obj=worksheet['H29']
        avail_electricity_obj=worksheet['H30']
        avail_generator_obj=worksheet['H31']
        avail_heating_obj=worksheet['H32']
        #water_supply_man_obj=worksheet['C40']
        #water_supply_woman_obj=worksheet['F40']
        #water_supply_children_obj=worksheet['G40']
        #water_supply_all_obj=worksheet['H40']
        #source_prot_inputs_obj=worksheet['A43']
        #get_business_advice_obj=worksheet['C43']
        #access_poultry_mart_obj=worksheet['F43']
        agency_access_loan_obj=worksheet['C43']
        agency_lender_type_obj=worksheet['F43']
        agency_amount_obj=worksheet['H43']
        informal_access_loan_obj=worksheet['C44']
        informal_lender_type_obj=worksheet['F44']
        informal_amount_obj=worksheet['H44']
        #finance_challenge1_obj=worksheet['A49']
        #finance_challenge2_obj=worksheet['C49']
        #finance_challenge3_obj=worksheet['E49']
        #finance_challenge4_obj=worksheet['G49']
        #finance_challenge_other_obj=worksheet['D50']
        ###
        worksheet = workbook['QETH1']
        print(f'File: {file} ...')
        print('Sheet: QETH1 ...')   
        education_obj=worksheet['F14']
        experience_obj=worksheet['F20']
        training_obj=worksheet['F26']
        staffing_obj=worksheet['F33']
        customer_service_obj=worksheet['F39']
        housing_obj=worksheet['F55']
        poultry_prtection_inputs_obj=worksheet['F61']
        feed_and_feeding_obj=worksheet['F67']
        water_source_use_obj=worksheet['F73']
        chicken_breed_quality_obj=worksheet['F79']
        poultry_pests_obj=worksheet['F85']
        farm_hygen_obj=worksheet['F104']
        annual_plan_obj=worksheet['F134']
        income_source_obj=worksheet['F141']
        financial_reliability_obj=worksheet['F148']
        competition_obj=worksheet['F158']
        promotion_obj=worksheet['F170']
        price_risk_obj=worksheet['F177']
        supply_shortage_obj=worksheet['F183']
        working_capital_obj=worksheet['F205']
        financial_records_obj=worksheet['F211']
        environmental_threats_obj=worksheet['F221']
        mitigation_emvironmental_obj=worksheet['F227']
        health_and_safety_obj=worksheet['F234']
        ###
        #worksheet = workbook['Additional Info']
        #print(f'File: {file} ...')
        #print('Sheet: Additional Info ...')   
        #prod_cycle2018_obj=worksheet['C14']
        #prod_cycle2017_obj=worksheet['D14']
        #prod_cycle2016_obj=worksheet['E14']       
        #num_chicks_sold_farm2018_obj=worksheet['C19']
        #num_chicks_sold_gov_agent2018_obj=worksheet['D19']
        #num_chicks_sold_trader2018_obj=worksheet['E19']
        #num_chicks_sold_vill_agents2018_obj=worksheet['F19']
        #num_chicks_sold_other2018_obj=worksheet['G19']
        #num_chicks_sold_total2018_obj=worksheet['H19']       
        #turn_over_farm2018_obj=worksheet['C20']
        #turn_over_gov_agent2018_obj=worksheet['D20']
        #turn_over_trader2018_obj=worksheet['E20']
        #turn_over_vill_agents2018_obj=worksheet['F20']
        #turn_over_other2018_obj=worksheet['G20']
        #turn_over_total2018_obj=worksheet['H20']       
        #sold_to_unique_farmers2018_obj=worksheet['G21']       
        #num_chicks_sold_farm2017_obj=worksheet['C25']
        #num_chicks_sold_gov_agent2017_obj=worksheet['D25']
        #num_chicks_sold_trader2017_obj=worksheet['E25']
        #num_chicks_sold_vill_agents2017_obj=worksheet['F25']
        #num_chicks_sold_other2017_obj=worksheet['G25']
        #num_chicks_sold_total2017_obj=worksheet['H25']       
        #turn_over_farm2017_obj=worksheet['C26']
        #turn_over_gov_agent2017_obj=worksheet['D26']
        #turn_over_trader2017_obj=worksheet['E26']
        #turn_over_vill_agents2017_obj=worksheet['F26']
        #turn_over_other2017_obj=worksheet['G26']
        #turn_over_total2017_obj=worksheet['H26']       
        #sold_to_unique_farmers2017_obj=worksheet['G27']       
        #num_chicks_sold_farm2016_obj=worksheet['C31']
        #num_chicks_sold_gov_agent2016_obj=worksheet['D31']
        #num_chicks_sold_trader2016_obj=worksheet['E31']
        #num_chicks_sold_vill_agents2016_obj=worksheet['F31']
        #num_chicks_sold_other2016_obj=worksheet['G31']
        #num_chicks_sold_total2016_obj=worksheet['H31']     
        #turn_over_farm2016_obj=worksheet['C32']
        #turn_over_gov_agent2016_obj=worksheet['D32']
        #turn_over_trader2016_obj=worksheet['E32']
        #turn_over_vill_agents2016_obj=worksheet['F32']
        #turn_over_other2016_obj=worksheet['G32']
        #turn_over_total2016_obj=worksheet['H32']     
        #sold_to_unique_farmers2016_obj=worksheet['G33']
        ###
        worksheet = workbook['RETH1']
        print(f'File: {file} ...')
        print('Sheet:  RETH1 ...')
        mgmt_capability_score_obj=worksheet['E15']
        inst_competency_score_obj=worksheet['E16']
        bus_knowledge_score_obj=worksheet['E17']
        mark_potential_score_obj=worksheet['E18']
        fin_management_score_obj=worksheet['E19']
        env_compliance_score_obj=worksheet['E20']
        average_score_obj=worksheet['E21']


        #########################################
        ###
        ###
        #File:
        #Sheet: BIETH
        name_assessor.append(name_assessor_obj.value)
        date.append(date_obj.value)
        start_time.append(start_time_obj.value)  
        end_time.append(end_time_obj.value)
        duration.append(duration_obj.value)
        type_assessed.append(type_assessed_obj.value)
        country.append(country_obj.value)
        code.append(code_obj.value)
        business_name.append(business_name_obj.value)
        legal_formation.append(legal_formation_obj.value)
        region.append(region_obj.value)
        zone.append(zone_obj.value)
        woreda.append(woreda_obj.value)
        telephone.append(telephone_obj.value)
        email.append(email_obj.value)
        contact_person.append(contact_person_obj.value)
        contact_designation.append(contact_designation_obj.value)
        contact_gender.append(contact_gender_obj.value)
        contact_educ.append(contact_educ_obj.value)
        #hh_head_owner.append(hh_head_owner_obj.value)
        #train_given_by.append(train_given_by_obj.value)
        #train_satisfaction.append(train_satisfaction_obj.value)
        #train_decision.append(train_decision_obj.value)
        have_license.append(have_license_obj.value)
        have_tin.append(have_tin_obj.value)
        year_estabilished.append(year_estabilished_obj.value)
        employment_male.append(employment_male_obj.value) 
        employment_female.append(employment_female_obj.value) 
        employment_total.append(employment_total_obj.value)
        avail_water.append(avail_water_obj.value) 
        avail_input_store.append(avail_input_store_obj.value) 
        avail_electricity.append(avail_electricity_obj.value) 
        avail_generator.append(avail_generator_obj.value) 
        avail_heating.append(avail_heating_obj.value) 
        #water_supply_man.append(water_supply_man_obj.value) 
        #water_supply_woman.append(water_supply_woman_obj.value) 
        #water_supply_children.append(water_supply_children_obj.value) 
        #water_supply_all.append(water_supply_all_obj.value)
        #source_prot_inputs.append(source_prot_inputs_obj.value)
        #get_business_advice.append(get_business_advice_obj.value) 
        #access_poultry_mart.append(access_poultry_mart_obj.value) 
        agency_access_loan.append(agency_access_loan_obj.value) 
        agency_lender_type.append(agency_lender_type_obj.value)
        agency_amount.append(agency_amount_obj.value) 
        informal_access_loan.append(informal_access_loan_obj.value) 
        informal_lender_type.append(informal_lender_type_obj.value) 
        informal_amount.append(informal_amount_obj.value)
        #finance_challenge1.append(finance_challenge1_obj.value) 
        #finance_challenge2.append(finance_challenge2_obj.value) 
        #finance_challenge3.append(finance_challenge3_obj.value)
        #finance_challenge4.append(finance_challenge4_obj.value)
        #finance_challenge_other.append(finance_challenge_other_obj.value)
        ###
        ###
        #File:
        #Sheet:QETH
        education.append(education_obj.value) 
        experience.append(experience_obj.value) 
        training.append(training_obj.value) 
        staffing.append(staffing_obj.value) 
        customer_service.append(customer_service_obj.value) 
        housing.append(housing_obj.value)
        poultry_prtection_inputs.append(poultry_prtection_inputs_obj.value) 
        feed_and_feeding.append(feed_and_feeding_obj.value)
        water_source_use.append(water_source_use_obj.value) 
        chicken_breed_quality.append(chicken_breed_quality_obj.value) 
        poultry_pests.append(poultry_pests_obj.value)
        farm_hygen.append(farm_hygen_obj.value) 
        annual_plan.append(annual_plan_obj.value) 
        income_source.append(income_source_obj.value)  
        financial_reliability.append(financial_reliability_obj.value) 
        competition.append(competition_obj.value) 
        promotion.append(promotion_obj.value) 
        price_risk.append(price_risk_obj.value) 
        supply_shortage.append(supply_shortage_obj.value)
        working_capital.append(working_capital_obj.value) 
        financial_records.append(financial_records_obj.value) 
        environmental_threats.append(environmental_threats_obj.value)
        mitigation_emvironmental.append(mitigation_emvironmental_obj.value) 
        health_and_safety.append(health_and_safety_obj.value)
        ###
        ###
        #File:
        #Sheet:Additional Info
        #prod_cycle2018.append(prod_cycle2018_obj.value) 
        #prod_cycle2017.append(prod_cycle2017_obj.value) 
        #prod_cycle2016.append(prod_cycle2016_obj.value)
        #num_chicks_sold_farm2018.append(num_chicks_sold_farm2018_obj.value) 
        #num_chicks_sold_gov_agent2018.append(num_chicks_sold_gov_agent2018_obj.value)
        #num_chicks_sold_trader2018.append(num_chicks_sold_trader2018_obj.value) 
        #num_chicks_sold_vill_agents2018.append(num_chicks_sold_vill_agents2018_obj.value)
        #num_chicks_sold_other2018.append(num_chicks_sold_other2018_obj.value) 
        #num_chicks_sold_total2018.append(num_chicks_sold_total2018_obj.value)    
        #turn_over_farm2018.append(turn_over_farm2018_obj.value) 
        #turn_over_gov_agent2018.append(turn_over_gov_agent2018_obj.value)
        #turn_over_trader2018.append(turn_over_trader2018_obj.value) 
        #turn_over_vill_agents2018.append(turn_over_vill_agents2018_obj.value)
        #turn_over_other2018.append(turn_over_other2018_obj.value) 
        #turn_over_total2018.append(turn_over_total2018_obj.value)    
        #sold_to_unique_farmers2018.append(sold_to_unique_farmers2018_obj.value)
        #num_chicks_sold_farm2017.append(num_chicks_sold_farm2017_obj.value) 
        #num_chicks_sold_gov_agent2017.append(num_chicks_sold_gov_agent2017_obj.value)
        #num_chicks_sold_trader2017.append(num_chicks_sold_trader2017_obj.value) 
        #num_chicks_sold_vill_agents2017.append(num_chicks_sold_vill_agents2017_obj.value)
        #num_chicks_sold_other2017.append(num_chicks_sold_other2017_obj.value) 
        #num_chicks_sold_total2017.append(num_chicks_sold_total2017_obj.value)    
        #turn_over_farm2017.append(turn_over_farm2017_obj.value) 
        #turn_over_gov_agent2017.append(turn_over_gov_agent2017_obj.value)
        #turn_over_trader2017.append(turn_over_trader2017_obj.value) 
        #turn_over_vill_agents2017.append(turn_over_vill_agents2017_obj.value)
        #turn_over_other2017.append(turn_over_other2017_obj.value) 
        #turn_over_total2017.append(turn_over_total2017_obj.value)    
        #sold_to_unique_farmers2017.append(sold_to_unique_farmers2017_obj.value)
        #num_chicks_sold_farm2016.append(num_chicks_sold_farm2016_obj.value) 
        #num_chicks_sold_gov_agent2016.append(num_chicks_sold_gov_agent2016_obj.value)
        #num_chicks_sold_trader2016.append(num_chicks_sold_trader2016_obj.value) 
        #num_chicks_sold_vill_agents2016.append(num_chicks_sold_vill_agents2016_obj.value)
        #num_chicks_sold_other2016.append(num_chicks_sold_other2016_obj.value) 
        #num_chicks_sold_total2016.append(num_chicks_sold_total2016_obj.value)      
        #turn_over_farm2016.append(turn_over_farm2016_obj.value)
        #turn_over_gov_agent2016.append(turn_over_gov_agent2016_obj.value)
        #turn_over_trader2016.append(turn_over_trader2016_obj.value)
        #turn_over_vill_agents2016.append(turn_over_vill_agents2016_obj.value)
        #turn_over_other2016.append(turn_over_other2016_obj.value)
        #turn_over_total2016.append(turn_over_total2016_obj.value)
        #sold_to_unique_farmers2016.append(sold_to_unique_farmers2016_obj.value)
        ###	    
        ###
        #File:
        #Sheet:RETH-EN	
        mgmt_capability_score.append(mgmt_capability_score_obj.value)
        inst_competency_score.append(inst_competency_score_obj.value)
        bus_knowledge_score.append(bus_knowledge_score_obj.value)
        mark_potential_score.append(mark_potential_score_obj.value)
        fin_management_score.append(fin_management_score_obj.value)
        env_compliance_score.append(env_compliance_score_obj.value)
        average_score.append(average_score_obj.value)
    
        
    data = {}
	    ###			
	    ###			
	    #File:			
	    #Sheet: BIETH
    data['pa_id'] = pa_id					
    data['name_assessor'] = name_assessor
    data['date'] = date
    data['start_time'] = start_time 
    data['end_time'] = end_time
    data['duration'] = duration
    data['type_assessed'] = type_assessed
    data['country'] = country
    data['code'] = code
    data['business_name'] = business_name
    data['legal_formation'] = legal_formation
    data['region'] = region
    data['zone'] = zone
    data['woreda'] = woreda
    data['telephone'] = telephone
    data['email'] = email
    data['contact_person'] = contact_person
    data['contact_designation'] = contact_designation
    data['contact_gender'] = contact_gender
    data['contact_educ'] = contact_educ
    #data['hh_head_owner'] = hh_head_owner
    #data['train_given_by'] = train_given_by
    #data['train_satisfaction'] = train_satisfaction
    #data['train_decision'] = train_decision
    data['have_license'] = have_license
    data['have_tin'] = have_tin
    data['year_estabilished'] = year_estabilished
    data['employment_male'] = employment_male
    data['employment_female'] = employment_female
    data['employment_total'] = employment_total
    data['avail_water'] = avail_water
    data['avail_input_store'] = avail_input_store
    data['avail_electricity'] = avail_electricity
    data['avail_generator'] = avail_generator
    data['avail_heating'] = avail_heating
    #data['water_supply_man'] = water_supply_man
    #data['water_supply_woman'] = water_supply_woman
    #data['water_supply_children'] = water_supply_children
    #data['water_supply_all'] = water_supply_all
    #data['source_prot_inputs'] = source_prot_inputs
    #data['get_business_advice'] = get_business_advice
    #data['access_poultry_mart'] = access_poultry_mart
    data['agency_access_loan'] = agency_access_loan
    data['agency_lender_type'] = agency_lender_type
    data['agency_amount'] = agency_amount
    data['informal_access_loan'] = informal_access_loan
    data['informal_lender_type'] = informal_lender_type
    data['informal_amount'] = informal_amount
    #data['finance_challenge1'] = finance_challenge1
    #data['finance_challenge2'] = finance_challenge2
    #data['finance_challenge3'] = finance_challenge3
    #data['finance_challenge4'] = finance_challenge4
    #data['finance_challenge_other'] = finance_challenge_other
	    ###			
	    ###			
	    #File:			
	    #Sheet:QETH			
    data['education'] = education
    data['experience'] = experience
    data['training'] = training
    data['staffing'] = staffing
    data['customer_service'] = customer_service
    data['housing'] = housing
    data['poultry_prtection_inputs'] = poultry_prtection_inputs
    data['feed_and_feeding'] = feed_and_feeding
    data['water_source_use'] = water_source_use
    data['chicken_breed_quality'] = chicken_breed_quality
    data['poultry_pests'] = poultry_pests
    data['farm_hygen'] = farm_hygen
    data['annual_plan'] = annual_plan
    data['income_source'] = income_source 
    data['financial_reliability'] = financial_reliability
    data['competition'] = competition
    data['promotion'] = promotion
    data['price_risk'] = price_risk
    data['supply_shortage'] = supply_shortage
    data['working_capital'] = working_capital
    data['financial_records'] = financial_records
    data['environmental_threats'] = environmental_threats
    data['mitigation_emvironmental'] = mitigation_emvironmental
    data['health_and_safety'] = health_and_safety
	    ###			
	    ###			
	    #File:			
	    #Sheet:Additional Info			
    #data['prod_cycle2018'] = prod_cycle2018
    #data['prod_cycle2017'] = prod_cycle2017
    #data['prod_cycle2016'] = prod_cycle2016
    #data['num_chicks_sold_farm2018'] = num_chicks_sold_farm2018
    #data['num_chicks_sold_gov_agent2018'] = num_chicks_sold_gov_agent2018
    #data['num_chicks_sold_trader2018'] = num_chicks_sold_trader2018
    #data['num_chicks_sold_vill_agents2018'] = num_chicks_sold_vill_agents2018
    #data['num_chicks_sold_other2018'] = num_chicks_sold_other2018
    #data['num_chicks_sold_total2018'] = num_chicks_sold_total2018   
    #data['turn_over_farm2018'] = turn_over_farm2018
    #data['turn_over_gov_agent2018'] = turn_over_gov_agent2018
    #data['turn_over_trader2018'] = turn_over_trader2018
    #data['turn_over_vill_agents2018'] = turn_over_vill_agents2018
    #data['turn_over_other2018'] = turn_over_other2018
    #data['turn_over_total2018']	= turn_over_total2018   
    #data['sold_to_unique_farmers2018'] = sold_to_unique_farmers2018
    #data['num_chicks_sold_farm2017'] = num_chicks_sold_farm2017
    #data['num_chicks_sold_gov_agent2017'] = num_chicks_sold_gov_agent2017
    #data['num_chicks_sold_trader2017'] = num_chicks_sold_trader2017
    #data['num_chicks_sold_vill_agents2017'] = num_chicks_sold_vill_agents2017
    #data['num_chicks_sold_other2017'] = num_chicks_sold_other2017
    #data['num_chicks_sold_total2017'] = num_chicks_sold_total2017   
    #data['turn_over_farm2017'] = turn_over_farm2017
    #data['turn_over_gov_agent2017'] = turn_over_gov_agent2017
    #data['turn_over_trader2017'] = turn_over_trader2017
    #data['turn_over_vill_agents2017'] = turn_over_vill_agents2017
    #data['turn_over_other2017'] = turn_over_other2017
    #data['turn_over_total2017'] = turn_over_total2017   
    #data['sold_to_unique_farmers2017'] = sold_to_unique_farmers2017
    #data['num_chicks_sold_farm2016'] = num_chicks_sold_farm2016
    #data['num_chicks_sold_gov_agent2016'] = num_chicks_sold_gov_agent2016
    #data['num_chicks_sold_trader2016'] = num_chicks_sold_trader2016
    #data['num_chicks_sold_vill_agents2016'] = num_chicks_sold_vill_agents2016
    #data['num_chicks_sold_other2016'] = num_chicks_sold_other2016
    #data['num_chicks_sold_total2016']  =  num_chicks_sold_total2016     
    #data['turn_over_farm2016'] = turn_over_farm2016
    #data['turn_over_gov_agent2016'] = turn_over_gov_agent2016
    #data['turn_over_trader2016'] = turn_over_trader2016
    #data['turn_over_vill_agents2016']=turn_over_vill_agents2016
    #data['turn_over_other2016']=turn_over_other2016
    #data['turn_over_total2016']=turn_over_total2016
    #data['sold_to_unique_farmers2016'] = sold_to_unique_farmers2016
	    ###			
	    ###			
	    #File:			
	    #Sheet:RETH-EN			
    data['mgmt_capability_score'] = mgmt_capability_score
    data['inst_competency_score'] = inst_competency_score
    data['bus_knowledge_score'] = bus_knowledge_score
    data['mark_potential_score'] = mark_potential_score
    data['fin_management_score'] = fin_management_score
    data['env_compliance_score'] = env_compliance_score
    data['average_score'] = average_score
    
    df = pd.DataFrame.from_dict(data)   
    return df
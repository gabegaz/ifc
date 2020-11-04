# -*- coding: utf-8 -*-
"""
Created on Thu Mar  5 10:56:11 2020

@author: Getachew
"""

#this script was written to automate data entry of ethio-chicken data from excel files

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



def get_data_fd_sr2(file_path, files):
    [
    pa_id,
    #worksheet = workbook['BIETH']
    #print(f'Working on file: {file} ...')
    #print('Sheet: BIETH ...')
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
    hh_head_owner,
    train_given_by,
    train_satisfaction,
    train_decision,
    have_license,
    have_tin,
    year_estabilished,
    employment_male,
    employment_female,
    employment_total,
    avail_water,
    avail_input_store,
    avail_electricity,
    get_business_advice,
    access_poultry_mart,
    agency_access_loan,
    agency_lender_type,
    agency_amount,
    informal_access_loan, 
    informal_lender_type, 
    informal_amount,
    finance_challenge1, 
    finance_challenge2, 
    finance_challenge3,
    finance_challenge4,
    finance_challenge_other,
    #worksheet = workbook['QETH']
    #print(f'Working on file: {file} ...')
    #print('Sheet: QETH ...')
    level_educ,
    experience_years,
    received_training,
    staffing,
    customer_service,
    feed_type,
    feed_handling,
    feed_store,
    store_sanitation,
    quality_control,
    annual_plan,
    income_source,
    business_sustainablity,
    competition,
    promotion,
    price_risk,
    supply_shortage,
    working_capital,
    financial_records,
    environmental_threat,
    mitigation_method,
    health_risk,
    #worksheet = workbook['QETH']
    #print(f'Working on file: {file} ...')
    #print('Sheet: QETH ...')
    inputs_purchase_cycle2018,
    inputs_purchase_cycle2017,
    inputs_purchase_cycle2016,
    inputs_sold_gk_farm2018,
    inputs_sold_gk_gov_agent2018,
    inputs_sold_gk_poult_agent2018,
    inputs_sold_gk_vpoult_agent2018,
    inputs_sold_gk_other2018,
    inputs_sold_gk_total2018,
    sales_turnover_farm2018,
    sales_turnover_gov_agent2018,
    sales_turnover_poult_agent2018,
    sales_turnover_vpoult_agent2018,
    sales_turnover_other2018,
    sales_turnover_total2018,
    num_unique_farmer2018,
    inputs_sold_gk_farm2017,
    inputs_sold_gk_gov_agent2017,
    inputs_sold_gk_poult_agent2017,
    inputs_sold_gk_vpoult_agent2017,
    inputs_sold_gk_other2017,
    inputs_sold_gk_total2017,
    sales_turnover_farm2017,
    sales_turnover_gov_agent2017,
    sales_turnover_poult_agent2017,
    sales_turnover_vpoult_agent2017,
    sales_turnover_other2017,
    sales_turnover_total2017,
    num_unique_farmer2017,
    inputs_sold_gk_farm2016,
    inputs_sold_gk_gov_agent2016,
    inputs_sold_gk_poult_agent2016,
    inputs_sold_gk_vpoult_agent2016,
    inputs_sold_gk_other2016,
    inputs_sold_gk_total2016,
    sales_turnover_farm2016,
    sales_turnover_gov_agent2016,
    sales_turnover_poult_agent2016,
    sales_turnover_vpoult_agent2016,
    sales_turnover_other2016,
    sales_turnover_total2016,
    num_unique_farmer2016,    
    #worksheet = workbook['RETH-EN']
    #print(f'Working on file: {file} ...')
    #print('Sheet: RETH-EN ...')
    mgmt_capability_score,
    inst_competency_score,
    bus_knowledge_score,
    mark_potential_score,
    fin_management_score,
    env_compliance_score,
    average_score
    ]= ([] for i in range(117))
    

    for file in files:
        match = re.search(r'\d*', file)
        pa_id.append(match.group())
        
        workbook = load_workbook(file_path+file, data_only=True)

        worksheet=workbook['BIETH']
        print(f'Working on file: {file} ...')
        print('Sheet: BIETH ...')     
        name_assessor_obj  = worksheet['G6']
        date_obj  = worksheet['A10']
        start_time_obj  = worksheet['B10']
        end_time_obj  = worksheet['C10']
        duration_obj  = worksheet['D10']
        type_assessed_obj  = worksheet['F9']
        country_obj  = worksheet['G9']
        code_obj  = worksheet['H9']
        business_name_obj  = worksheet['C15']
        legal_formation_obj  = worksheet['C16']
        region_obj  = worksheet['C17']
        zone_obj  = worksheet['C18']
        woreda_obj  = worksheet['C19']
        telephone_obj  = worksheet['C20']
        email_obj  = worksheet['C21']
        contact_person_obj  = worksheet['G15']
        contact_designation_obj  = worksheet['H15']
        contact_gender_obj  = worksheet['G16']
        contact_educ_obj  = worksheet['G17']
        hh_head_owner_obj  = worksheet['G19']
        train_given_by_obj  = worksheet['C24']
        train_satisfaction_obj  = worksheet['F24']
        train_decision_obj  = worksheet['G24']
        have_license_obj  = worksheet['C31']
        have_tin_obj  = worksheet['C32']
        year_estabilished_obj  = worksheet['G31']
        employment_male_obj  = worksheet['A36']
        employment_female_obj  = worksheet['B36']
        employment_total_obj  = worksheet['C36']
        avail_water_obj  = worksheet['H34']
        avail_input_store_obj  = worksheet['H35']
        avail_electricity_obj  = worksheet['H36']
        get_business_advice_obj  = worksheet['A40']
        access_poultry_mart_obj  = worksheet['F40']
        agency_access_loan_obj  = worksheet['C42']
        agency_lender_type_obj  = worksheet['F42']
        agency_amount_obj  = worksheet['H42']
        informal_access_loan_obj  = worksheet['C43']
        informal_lender_type_obj  = worksheet['F43']
        informal_amount_obj  = worksheet['H43']
        finance_challenge1_obj  = worksheet['A46']
        finance_challenge2_obj  = worksheet['C46']
        finance_challenge3_obj  = worksheet['E46']
        finance_challenge4_obj  = worksheet['G46']
        finance_challenge_other_obj  = worksheet['C47']
        worksheet=workbook['QETH']
        print(f'Working on file: {file} ...')
        print('Sheet: QETH ...')     
        level_educ_obj  = worksheet['F14']
        experience_years_obj  = worksheet['F20']
        received_training_obj  = worksheet['F26']
        staffing_obj  = worksheet['F33']
        customer_service_obj  = worksheet['F39']
        feed_type_obj  = worksheet['F49']
        feed_handling_obj  = worksheet['F55']
        feed_store_obj  = worksheet['F62']
        store_sanitation_obj  = worksheet['F68']
        quality_control_obj  = worksheet['F75']
        annual_plan_obj  = worksheet['F85']
        income_source_obj  = worksheet['F92']
        business_sustainablity_obj  = worksheet['F99']
        competition_obj  = worksheet['F109']
        promotion_obj  = worksheet['F115']
        price_risk_obj  = worksheet['F122']
        supply_shortage_obj  = worksheet['F128']
        working_capital_obj  = worksheet['F138']
        financial_records_obj  = worksheet['F144']
        environmental_threat_obj  = worksheet['F154']
        mitigation_method_obj  = worksheet['F160']
        health_risk_obj  = worksheet['F167']
        worksheet=workbook['Additional Info']
        print(f'Working on file: {file} ...')
        print('Sheet: Additional Info ...')     
        inputs_purchase_cycle2018_obj  = worksheet['C15']
        inputs_purchase_cycle2017_obj  = worksheet['D15']
        inputs_purchase_cycle2016_obj  = worksheet['E15']    
        inputs_sold_gk_farm2018_obj  = worksheet['C20']
        inputs_sold_gk_gov_agent2018_obj  = worksheet['D20']
        inputs_sold_gk_poult_agent2018_obj  = worksheet['E20']
        inputs_sold_gk_vpoult_agent2018_obj  = worksheet['F20']
        inputs_sold_gk_other2018_obj  = worksheet['G20']
        inputs_sold_gk_total2018_obj  = worksheet['H20']    
        sales_turnover_farm2018_obj  = worksheet['C21']
        sales_turnover_gov_agent2018_obj  = worksheet['D21']
        sales_turnover_poult_agent2018_obj  = worksheet['E21']
        sales_turnover_vpoult_agent2018_obj  = worksheet['F21']
        sales_turnover_other2018_obj  = worksheet['G21']
        sales_turnover_total2018_obj  = worksheet['H21']    
        num_unique_farm2018_obj  = worksheet['G22']
        inputs_sold_gk_farm2017_obj  = worksheet['C26']
        inputs_sold_gk_gov_agent2017_obj  = worksheet['D26']
        inputs_sold_gk_poult_agent2017_obj  = worksheet['E26']
        inputs_sold_gk_vpoult_agent2017_obj  = worksheet['F26']
        inputs_sold_gk_other2017_obj  = worksheet['G26']
        inputs_sold_gk_total2017_obj  = worksheet['H26']    
        sales_turnover_farm2017_obj  = worksheet['C27']
        sales_turnover_gov_agent2017_obj  = worksheet['D27']
        sales_turnover_poult_agent2017_obj  = worksheet['E27']
        sales_turnover_vpoult_agent2017_obj  = worksheet['F27']
        sales_turnover_other2017_obj  = worksheet['G27']
        sales_turnover_total2017_obj  = worksheet['H27']    
        num_unique_farm2017_obj  = worksheet['G28']
        inputs_sold_gk_farm2016_obj  = worksheet['C32']
        inputs_sold_gk_gov_agent2016_obj  = worksheet['D32']
        inputs_sold_gk_poult_agent2016_obj  = worksheet['E32']
        inputs_sold_gk_vpoult_agent2016_obj  = worksheet['F32']
        inputs_sold_gk_other2016_obj  = worksheet['G32']
        inputs_sold_gk_total2016_obj  = worksheet['H32'] 
        sales_turnover_farm2016_obj  = worksheet['C33']
        sales_turnover_gov_agent2016_obj  = worksheet['D33']
        sales_turnover_poult_agent2016_obj  = worksheet['E33']
        sales_turnover_vpoult_agent2016_obj  = worksheet['F33']
        sales_turnover_other2016_obj  = worksheet['G33']
        sales_turnover_total2016_obj  = worksheet['H33'] 
        num_unique_farm2016_obj  = worksheet['G34']
        worksheet=workbook['RETH-EN']
        print(f'Working on file: {file} ...')
        print('Sheet: RETH-EN ...')     
        mgmt_capability_score_obj  = worksheet['E15']
        inst_competency_score_obj  = worksheet['E16']
        bus_knowledge_score_obj  = worksheet['E17']
        mark_potential_score_obj  = worksheet['E18']
        fin_management_score_obj  = worksheet['E19']
        env_compliance_score_obj  = worksheet['E20']
        average_score_obj  = worksheet['E21']









        #worksheet worksheet
        #print(f'Working on file: {file} ...')
        #print('Sheet: BIETH ...')
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
        hh_head_owner.append(hh_head_owner_obj.value) 
        train_given_by.append(train_given_by_obj.value) 
        train_satisfaction.append(train_satisfaction_obj.value) 
        train_decision.append(train_decision_obj.value) 
        have_license.append(have_license_obj.value) 
        have_tin.append(have_tin_obj.value) 
        year_estabilished.append(year_estabilished_obj.value) 
        employment_male.append(employment_male_obj.value) 
        employment_female.append(employment_female_obj.value) 
        employment_total.append(employment_total_obj.value) 
        avail_water.append(avail_water_obj.value) 
        avail_input_store.append(avail_input_store_obj.value) 
        avail_electricity.append(avail_electricity_obj.value) 
        get_business_advice.append(get_business_advice_obj.value) 
        access_poultry_mart.append(access_poultry_mart_obj.value) 
        agency_access_loan.append(agency_access_loan_obj.value) 
        agency_lender_type.append(agency_lender_type_obj.value) 
        agency_amount.append(agency_amount_obj.value) 
        informal_access_loan.append( informal_access_loan_obj.value) 
        informal_lender_type.append( informal_lender_type_obj.value) 
        informal_amount.append(informal_amount_obj.value) 
        finance_challenge1.append( finance_challenge1_obj.value) 
        finance_challenge2.append( finance_challenge2_obj.value) 
        finance_challenge3.append(finance_challenge3_obj.value) 
        finance_challenge4.append(finance_challenge4_obj.value) 
        finance_challenge_other.append(finance_challenge_other_obj.value) 
        #worksheet worksheet
        #print(f'Working on file: {file} ...')
        #print('Sheet: QETH ...')
        level_educ.append(level_educ_obj.value) 
        experience_years.append(experience_years_obj.value) 
        received_training.append(received_training_obj.value) 
        staffing.append(staffing_obj.value) 
        customer_service.append(customer_service_obj.value) 
        feed_type.append(feed_type_obj.value) 
        feed_handling.append(feed_handling_obj.value) 
        feed_store.append(feed_store_obj.value) 
        store_sanitation.append(store_sanitation_obj.value) 
        quality_control.append(quality_control_obj.value) 
        annual_plan.append(annual_plan_obj.value) 
        income_source.append(income_source_obj.value) 
        business_sustainablity.append(business_sustainablity_obj.value) 
        competition.append(competition_obj.value) 
        promotion.append(promotion_obj.value) 
        price_risk.append(price_risk_obj.value) 
        supply_shortage.append(supply_shortage_obj.value) 
        working_capital.append(working_capital_obj.value) 
        financial_records.append(financial_records_obj.value) 
        environmental_threat.append(environmental_threat_obj.value) 
        mitigation_method.append(mitigation_method_obj.value) 
        health_risk.append(health_risk_obj.value) 
        #worksheet worksheet
        #print(f'Working on file: {file} ...')
        #print('Sheet: QETH ...') 
        inputs_purchase_cycle2018.append(inputs_purchase_cycle2018_obj.value) 
        inputs_purchase_cycle2017.append(inputs_purchase_cycle2017_obj.value) 
        inputs_purchase_cycle2016.append(inputs_purchase_cycle2016_obj.value) 
        inputs_sold_gk_farm2018.append(inputs_sold_gk_farm2018_obj.value) 
        inputs_sold_gk_gov_agent2018.append(inputs_sold_gk_gov_agent2018_obj.value) 
        inputs_sold_gk_poult_agent2018.append(inputs_sold_gk_poult_agent2018_obj.value) 
        inputs_sold_gk_vpoult_agent2018.append(inputs_sold_gk_vpoult_agent2018_obj.value) 
        inputs_sold_gk_other2018.append(inputs_sold_gk_other2018_obj.value) 
        inputs_sold_gk_total2018.append(inputs_sold_gk_total2018_obj.value) 
        sales_turnover_farm2018.append(sales_turnover_farm2018_obj.value) 
        sales_turnover_gov_agent2018.append(sales_turnover_gov_agent2018_obj.value) 
        sales_turnover_poult_agent2018.append(sales_turnover_poult_agent2018_obj.value) 
        sales_turnover_vpoult_agent2018.append(sales_turnover_vpoult_agent2018_obj.value) 
        sales_turnover_other2018.append(sales_turnover_other2018_obj.value) 
        sales_turnover_total2018.append(sales_turnover_total2018_obj.value) 
        num_unique_farmer2018.append(num_unique_farm2018_obj.value)    
        inputs_sold_gk_farm2017.append(inputs_sold_gk_farm2017_obj.value) 
        inputs_sold_gk_gov_agent2017.append(inputs_sold_gk_gov_agent2017_obj.value) 
        inputs_sold_gk_poult_agent2017.append(inputs_sold_gk_poult_agent2017_obj.value) 
        inputs_sold_gk_vpoult_agent2017.append(inputs_sold_gk_vpoult_agent2017_obj.value) 
        inputs_sold_gk_other2017.append(inputs_sold_gk_other2017_obj.value) 
        inputs_sold_gk_total2017.append(inputs_sold_gk_total2017_obj.value) 
        sales_turnover_farm2017.append(sales_turnover_farm2017_obj.value) 
        sales_turnover_gov_agent2017.append(sales_turnover_gov_agent2017_obj.value) 
        sales_turnover_poult_agent2017.append(sales_turnover_poult_agent2017_obj.value) 
        sales_turnover_vpoult_agent2017.append(sales_turnover_vpoult_agent2017_obj.value) 
        sales_turnover_other2017.append(sales_turnover_other2017_obj.value) 
        sales_turnover_total2017.append(sales_turnover_total2017_obj.value) 
        num_unique_farmer2017.append(num_unique_farm2017_obj.value)    
        inputs_sold_gk_farm2016.append(inputs_sold_gk_farm2016_obj.value) 
        inputs_sold_gk_gov_agent2016.append(inputs_sold_gk_gov_agent2016_obj.value) 
        inputs_sold_gk_poult_agent2016.append(inputs_sold_gk_poult_agent2016_obj.value) 
        inputs_sold_gk_vpoult_agent2016.append(inputs_sold_gk_vpoult_agent2016_obj.value) 
        inputs_sold_gk_other2016.append(inputs_sold_gk_other2016_obj.value) 
        inputs_sold_gk_total2016.append(inputs_sold_gk_total2016_obj.value) 
        sales_turnover_farm2016.append(sales_turnover_farm2016_obj.value) 
        sales_turnover_gov_agent2016.append(sales_turnover_gov_agent2016_obj.value) 
        sales_turnover_poult_agent2016.append(sales_turnover_poult_agent2016_obj.value) 
        sales_turnover_vpoult_agent2016.append(sales_turnover_vpoult_agent2016_obj.value) 
        sales_turnover_other2016.append(sales_turnover_other2016_obj.value) 
        sales_turnover_total2016.append(sales_turnover_total2016_obj.value) 
        num_unique_farmer2016.append(num_unique_farm2016_obj.value)
        #worksheet worksheet
        #print(f'Working on file: {file} ...')
        #print('Sheet: RETH-EN ...')
        mgmt_capability_score.append(mgmt_capability_score_obj.value) 
        inst_competency_score.append(inst_competency_score_obj.value) 
        bus_knowledge_score.append(bus_knowledge_score_obj.value) 
        mark_potential_score.append(mark_potential_score_obj.value) 
        fin_management_score.append(fin_management_score_obj.value) 
        env_compliance_score.append(env_compliance_score_obj.value)
        average_score.append(average_score_obj.value)
 
    data = {}
    
    data["pa_id"]=pa_id
    
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
    data['hh_head_owner'] = hh_head_owner
    data['train_given_by'] = train_given_by
    data['train_satisfaction'] = train_satisfaction
    data['train_decision'] = train_decision
    data['have_license'] = have_license
    data['have_tin'] = have_tin
    data['year_estabilished'] = year_estabilished
    data['employment_male'] = employment_male
    data['employment_female'] = employment_female
    data['employment_total'] = employment_total
    data['avail_water'] = avail_water
    data['avail_input_store'] = avail_input_store
    data['avail_electricity'] = avail_electricity
    data['get_business_advice'] = get_business_advice
    data['access_poultry_mart'] = access_poultry_mart
    data['agency_access_loan'] = agency_access_loan
    data['agency_lender_type'] = agency_lender_type
    data['agency_amount'] = agency_amount
    data['informal_access_loan']  = informal_access_loan 
    data['informal_lender_type']  = informal_lender_type 
    data['informal_amount'] = informal_amount
    data['finance_challenge1']  = finance_challenge1 
    data['finance_challenge2']  = finance_challenge2 
    data['finance_challenge3'] = finance_challenge3
    data['finance_challenge4'] = finance_challenge4
    data['finance_challenge_other'] = finance_challenge_other
    #worksheet workbook['QETH']
    #print(f'Working on file: {file} ...')
    #print('Sheet: QETH ...')
    data['level_educ'] = level_educ
    data['experience_years'] = experience_years
    data['received_training'] = received_training
    data['staffing'] = staffing
    data['customer_service'] = customer_service
    data['feed_type'] = feed_type
    data['feed_handling'] = feed_handling
    data['feed_store'] = feed_store
    data['store_sanitation'] = store_sanitation
    data['quality_control'] = quality_control
    data['annual_plan'] = annual_plan
    data['income_source'] = income_source
    data['business_sustainablity'] = business_sustainablity
    data['competition'] = competition
    data['promotion'] = promotion
    data['price_risk'] = price_risk
    data['supply_shortage'] = supply_shortage
    data['working_capital'] = working_capital
    data['financial_records'] = financial_records
    data['environmental_threat'] = environmental_threat
    data['mitigation_method'] = mitigation_method
    data['health_risk'] = health_risk
    #worksheet workbook['QETH']
    #print(f'Working on file: {file} ...')
    #print('Sheet: QETH ...')
    data['inputs_purchase_cycle2018'] = inputs_purchase_cycle2018
    data['inputs_purchase_cycle2017'] = inputs_purchase_cycle2017
    data['inputs_purchase_cycle2016'] = inputs_purchase_cycle2016
    data['inputs_sold_gk_farm2018'] = inputs_sold_gk_farm2018
    data['inputs_sold_gk_gov_agent2018'] = inputs_sold_gk_gov_agent2018
    data['inputs_sold_gk_poult_agent2018'] = inputs_sold_gk_poult_agent2018
    data['inputs_sold_gk_vpoult_agent2018'] = inputs_sold_gk_vpoult_agent2018
    data['inputs_sold_gk_other2018'] = inputs_sold_gk_other2018
    data['inputs_sold_gk_total2018'] = inputs_sold_gk_total2018
    data['sales_turnover_farm2018'] = sales_turnover_farm2018
    data['sales_turnover_gov_agent2018'] = sales_turnover_gov_agent2018
    data['sales_turnover_poult_agent2018'] = sales_turnover_poult_agent2018
    data['sales_turnover_vpoult_agent2018'] = sales_turnover_vpoult_agent2018
    data['sales_turnover_other2018'] = sales_turnover_other2018
    data['sales_turnover_total2018'] = sales_turnover_total2018
    data['num_unique_farmer2018'] = num_unique_farmer2018
    data['inputs_sold_gk_farm2017'] = inputs_sold_gk_farm2017
    data['inputs_sold_gk_gov_agent2017'] = inputs_sold_gk_gov_agent2017
    data['inputs_sold_gk_poult_agent2017'] = inputs_sold_gk_poult_agent2017
    data['inputs_sold_gk_vpoult_agent2017'] = inputs_sold_gk_vpoult_agent2017
    data['inputs_sold_gk_other2017'] = inputs_sold_gk_other2017
    data['inputs_sold_gk_total2017'] = inputs_sold_gk_total2017
    data['sales_turnover_farm2017'] = sales_turnover_farm2017
    data['sales_turnover_gov_agent2017'] = sales_turnover_gov_agent2017
    data['sales_turnover_poult_agent2017'] = sales_turnover_poult_agent2017
    data['sales_turnover_vpoult_agent2017'] = sales_turnover_vpoult_agent2017
    data['sales_turnover_other2017'] = sales_turnover_other2017
    data['sales_turnover_total2017'] = sales_turnover_total2017
    data['num_unique_farmer2017'] = num_unique_farmer2017
    data['inputs_sold_gk_farm2016'] = inputs_sold_gk_farm2016
    data['inputs_sold_gk_gov_agent2016'] = inputs_sold_gk_gov_agent2016
    data['inputs_sold_gk_poult_agent2016'] = inputs_sold_gk_poult_agent2016
    data['inputs_sold_gk_vpoult_agent2016'] = inputs_sold_gk_vpoult_agent2016
    data['inputs_sold_gk_other2016'] = inputs_sold_gk_other2016
    data['inputs_sold_gk_total2016'] = inputs_sold_gk_total2016
    data['sales_turnover_farm2016'] = sales_turnover_farm2016
    data['sales_turnover_gov_agent2016'] = sales_turnover_gov_agent2016
    data['sales_turnover_poult_agent2016'] = sales_turnover_poult_agent2016
    data['sales_turnover_vpoult_agent2016'] = sales_turnover_vpoult_agent2016
    data['sales_turnover_other2016'] = sales_turnover_other2016
    data['sales_turnover_total2016'] = sales_turnover_total2016
    data['num_unique_farmer2016'] = num_unique_farmer2016
    #worksheet workbook['RETH-EN']
    #print(f'Working on file: {file} ...')
    #print('Sheet: RETH-EN ...')
    data['mgmt_capability_score'] = mgmt_capability_score
    data['inst_competency_score'] = inst_competency_score
    data['bus_knowledge_score'] = bus_knowledge_score
    data['mark_potential_score'] = mark_potential_score
    data['fin_management_score'] = fin_management_score
    data['env_compliance_score'] = env_compliance_score
    data['average_score'] = average_score
    
    df = pd.DataFrame.from_dict(data) 
    return df

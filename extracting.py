# -*- coding: utf-8 -*-
"""
Created on Thu Mar  5 10:56:11 2020

@author: Getachew
"""

import pandas as pd
pd.__version__
#1.1.3
import numpy as np

from os import listdir
from os.path import isfile, join
import os, sys

from get_data_pa_sr1 import get_data_pa_sr1
from get_data_pa_sr2 import get_data_pa_sr2
from get_data_pa_main_fr import get_data_pa_main_fr
from get_data_pa_add_fr import get_data_pa_add_fr



modified = 'D:/projects/IFC/second_round/data/modified/'

oromia="D:/projects/IFC/second_round/data/original/1.1.1 Assessment Result Final- PAs- Oromia/"
amhara="D:/projects/IFC/second_round/data/original/1.1.2 Assessment Result Final- PAs- Amhara/"
tigray="D:/projects/IFC/second_round/data/original/1.1.4 Assessment Result Final- PAs- Tigray/"
snnpr1="D:/projects/IFC/second_round/data/original/1.1.3 Assessment Result Final- PAs- SNNPR1/"
snnpr2="D:/projects/IFC/second_round/data/original/1.1.3 Assessment Result Final- PAs- SNNPR2/"

all_main_fr = \
'D:/projects/IFC/first_round/data/IFC Final- Bright/1. Assessment Result Final/4. Three regions combined/'
all_add_fr = \
'D:/projects/IFC/first_round/data/Additional Questionnaire -PAs - II- Modified/'





##############################################################################

files_oromia = [f for f in listdir(oromia) if isfile(join(oromia, f))]
files_amhara = [f for f in listdir(amhara) if isfile(join(amhara, f))]
files_tigray = [f for f in listdir(tigray) if isfile(join(tigray, f))]
files_snnpr1 = [f for f in listdir(snnpr1) if isfile(join(snnpr1, f))]
files_snnpr2 = [f for f in listdir(snnpr2) if isfile(join(snnpr2, f))]

files_all_main_fr = [f for f in listdir(all_main_fr) if isfile(join(all_main_fr, f))]
files_all_add_fr = [f for f in listdir(all_add_fr) if isfile(join(all_add_fr, f))]


##############################################################################################
df_oromia = get_data_pa_sr1(oromia, files_oromia)
df_amhara = get_data_pa_sr2(amhara, files_amhara)
df_tigray = get_data_pa_sr2(tigray, files_tigray)
df_snnpr1 = get_data_pa_sr1(snnpr1, files_snnpr1)
df_snnpr2 = get_data_pa_sr2(snnpr2, files_snnpr2)

df_all_sr = df_oromia.append(df_amhara, ignore_index=True)
df_all_sr = df_all_sr.append(df_tigray, ignore_index=True)
df_all_sr = df_all_sr.append(df_snnpr1, ignore_index=True)
df_all_sr = df_all_sr.append(df_snnpr2, ignore_index=True)

df_all_sr2 = df_all_sr.copy()

for col in df_all_sr2.columns:
    df_all_sr2[col] = df_all_sr2[col].replace('N/A', np.NaN)
    
for col in df_all_sr2.columns:    
    df_all_sr2[col] = df_all_sr2[col].replace('NA', np.NaN)

for col in df_all_sr2.columns:
    df_all_sr2.fillna(value=np.nan, inplace=True)

df_all_sr2['contact_designation'] = df_all_sr2['contact_designation'].str.replace('(', '')
df_all_sr2['contact_designation'] = df_all_sr2['contact_designation'].str.replace(')', '')

df_all_sr2['employment_male'] = df_all_sr2['employment_male'].replace('O', 0)
df_all_sr2['employment_female'] = df_all_sr2['employment_female'].replace('O', 0)

df_all_sr2['agency_amount'] = df_all_sr2['agency_amount'].replace('Unwilling to tell ', np.NaN)
df_all_sr2['agency_amount'] = df_all_sr2['agency_amount'].replace('unwilling to tell', np.NaN)
df_all_sr2['agency_amount'] = df_all_sr2['agency_amount'].replace(' ', '')

df_all_sr2['prod_cycle2017'] = df_all_sr2['prod_cycle2017'].replace('Egg', np.NaN)

df_all_sr2['prod_cycle2018'] = df_all_sr2['prod_cycle2018'].replace('Egg', np.NaN)
df_all_sr2['prod_cycle2018'] = df_all_sr2['prod_cycle2018'].replace("She couldn't remember", np.NaN)

df_all_sr2['prod_cycle2016'] = df_all_sr2['prod_cycle2016'].replace('Egg', np.NaN)
df_all_sr2['prod_cycle2016'] = df_all_sr2['prod_cycle2016'].replace("She couldn't remember", np.NaN)


df_all_sr2['turn_over_farm2017'] = df_all_sr2['turn_over_farm2017'].replace(' ', '')


df_all_sr2['num_chicks_sold_farm2018'] = df_all_sr2['num_chicks_sold_farm2018'].replace("Because of delivery, she stopped to work", np.NaN)
df_all_sr2['num_chicks_sold_farm2018'] = df_all_sr2['num_chicks_sold_farm2018'].replace("Because of political instability there was a gap in 2018", np.NaN)
df_all_sr2['num_chicks_sold_farm2017'] = df_all_sr2['num_chicks_sold_farm2017'].replace(' ', '')


df_all_sr2['sold_to_unique_farmers2018'] = df_all_sr2['sold_to_unique_farmers2018'].replace("460, safety net beneficiaties ", 460)
df_all_sr2['sold_to_unique_farmers2017'] = df_all_sr2['sold_to_unique_farmers2017'].replace("430, these are safety net beneficiaries", 460)


##############################################################################################

df_all_main_fr = get_data_pa_main_fr(all_main_fr, files_all_main_fr)
df_all_add_fr = get_data_pa_add_fr(all_add_fr, files_all_add_fr)
df_all_main_fr2 = df_all_main_fr.copy()
df_all_add_fr2 = df_all_add_fr.copy()


for col in df_all_main_fr2.columns:
    df_all_main_fr2[col] = df_all_main_fr2[col].replace('N/A', np.NaN)
    
for col in df_all_main_fr2.columns:    
    df_all_main_fr2[col] = df_all_main_fr2[col].replace('NA', np.NaN)
 
df_all_main_fr2['contact_designation'] = df_all_main_fr2['contact_designation'].str.replace('(', '')
df_all_main_fr2['contact_designation'] = df_all_main_fr2['contact_designation'].str.replace(')', '')
  
df_all_main_fr2.sort_values(by=['pa_id'], inplace=True)

#cleaning zone strings
df_all_main_fr2['zone'].value_counts()

df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('North Sewa', 'North Shewa')
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('E/Wollega', 'E. Wollega')
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('E. Wollega', 'East Wollega')
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('East Shoa', 'East Shewa')
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('South Wes Shewa', 'South West Shewa')
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('South West Shoa', 'South West Shewa')
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('W. Shewa', 'West Shewa')
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('West Shoa', 'West Shewa')
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('Wolayita', 'Wolaita')
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('Sidamo', 'Sidama')
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('West Arisi', 'West Arsi')
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('DB', 'North Shewa')

df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.replace('Finfine Vicinity', 'West Shewa')
   
df_all_main_fr2['zone'] = df_all_main_fr2['zone'].str.rstrip()
df_all_main_fr2['contact_educ'] = df_all_main_fr2['contact_educ'].str.rstrip()

df_all_add_fr2['pa_id'].value_counts()
df_all_add_fr2.dtypes
df_all_add_fr2['pa_id'] = df_all_add_fr2['pa_id'].str.zfill(width=4)
    
# handling missing values with num_chicks_sold_other2017

df_all_add_fr2['num_chicks_sold_other2017'].value_counts()
df_all_add_fr2['num_chicks_sold_other2017'] = df_all_add_fr2['num_chicks_sold_other2017'].replace('to hotels', np.NaN) 
df_all_add_fr2.sort_values(by=['pa_id'], inplace=True)


df_all_main_fr2.to_excel(modified+'assessment_result_PAs_main_fr.xlsx', 
                sheet_name='PAs_main_fr', index=False)

df_all_add_fr2.to_excel(modified+'assessment_result_PAs_add_fr.xlsx', 
                sheet_name='PAs_add_fr', index=False)

df_all_fr=df_all_main_fr2.merge(df_all_add_fr2, how='inner', 
                      left_on='pa_id', right_on='pa_id')

df_all_fr.to_excel(modified+'assessment_result_PAs_fr.xlsx', 
                sheet_name='PAs_fr', index=False)

df_all_sr2.to_excel(modified+'assessment_result_PAs_sr.xlsx', 
                sheet_name='PAs_sr', index=False)

##############################################################################################




# ########################Feed Dealers########################################
sys.path.append(os.chdir('D:/projects/IFC/second_round/codes/utils'))
from get_data_fd_sr1 import get_data_fd_sr1
from get_data_fd_sr2 import get_data_fd_sr2

fd1 = 'D:/projects/IFC/second_round/data/original/1.2. Assessment Result Final- FDs1/'
fd2 = 'D:/projects/IFC/second_round/data/original/1.2. Assessment Result Final- FDs2/'
files_fd1 = [f for f in listdir(fd1) if isfile(join(fd1, f))]
files_fd2 = [f for f in listdir(fd2) if isfile(join(fd2, f))]

df_fd1 = get_data_fd_sr1(fd1, files_fd1)
df_fd2 = get_data_fd_sr2(fd2, files_fd2)

df_fd = df_fd1.append(df_fd2, ignore_index=True)

df_fd2 =df_fd.copy() 
#df_fd2['employment_male'] = df_fd2['employment_male'].replace(' ', 'np.NaN')
#df_fd2['employment_female'] = df_fd2['employment_female'].replace(' ', '')
#df_fd2['employment_total'] = df_fd2['employment_total'].replace(' ', '')

  
df_fd2.to_excel(modified+'assessment_result_FDs.xlsx', 
                 sheet_name='FDs', index=False)
 

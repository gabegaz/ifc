# -*- coding: utf-8 -*-
"""
Created on Thu Mar  5 10:56:11 2020

@author: Getachew
"""

#this script was written to automate data entry of ethio-chicken data from excel files

import pandas as pd
pd.__version__
#1.1.3
import numpy as np

from os import listdir
from os.path import isfile, join
import os, sys

sys.path.append(os.chdir('D:/projects/IFC/second_round/codes'))
from utils import get_data1, get_data2, get_data_fd1, get_data_fd2

oromia="D:/projects/IFC/second_round/data/original/1.1.1 Assessment Result Final- PAs- Oromia/"
amhara="D:/projects/IFC/second_round/data/original/1.1.2 Assessment Result Final- PAs- Amhara/"
tigray="D:/projects/IFC/second_round/data/original/1.1.4 Assessment Result Final- PAs- Tigray/"
snnpr1="D:/projects/IFC/second_round/data/original/1.1.3 Assessment Result Final- PAs- SNNPR1/"
snnpr2="D:/projects/IFC/second_round/data/original/1.1.3 Assessment Result Final- PAs- SNNPR2/"

fd_all1 = 'D:/projects/IFC/second_round/data/original/1.2. Assessment Result Final- FDs1/'
fd_all2 = 'D:/projects/IFC/second_round/data/original/1.2. Assessment Result Final- FDs2/'

modified = 'D:/projects/IFC/second_round/data/modified/'

#####################################################3

files_fd1 = [f for f in listdir(fd_all1) if isfile(join(fd_all1, f))]
files_fd2 = [f for f in listdir(fd_all2) if isfile(join(fd_all2, f))]

files_oromia = [f for f in listdir(oromia) if isfile(join(oromia, f))]
files_amhara = [f for f in listdir(amhara) if isfile(join(amhara, f))]
files_tigray = [f for f in listdir(tigray) if isfile(join(tigray, f))]

files_snnpr1 = [f for f in listdir(snnpr1) if isfile(join(snnpr1, f))]
files_snnpr2 = [f for f in listdir(snnpr2) if isfile(join(snnpr2, f))]

df_oromia = get_data1(oromia, files_oromia)
df_amhara = get_data2(amhara, files_amhara)

#Note on Tigray: 
#same data structure as Amhara
#1096-Merese Gebrekiros-Hintalowejerat.xlsx has a problem
df_tigray = get_data2(tigray, files_tigray)

df_snnpr1 = get_data1(snnpr1, files_snnpr1)
df_snnpr2 = get_data2(snnpr2, files_snnpr2)

df_all = df_oromia.append(df_amhara, ignore_index=True)
df_all = df_all.append(df_tigray, ignore_index=True)
df_all = df_all.append(df_snnpr1, ignore_index=True)
df_all = df_all.append(df_snnpr2, ignore_index=True)


df_all['contact_designation'] = df_all['contact_designation'].str.replace('(', '')
df_all['contact_designation'] = df_all['contact_designation'].str.replace(')', '')

################################
df_all2 = df_all.copy()

for col in df_all2.columns:
    df_all2[col] = df_all2[col].replace('N/A', np.NaN)
    
for col in df_all2.columns:    
    df_all2[col] = df_all2[col].replace('NA', np.NaN)

for col in df_all2.columns:
    df_all2.fillna(value=np.nan, inplace=True)

df_all2['employment_male'] = df_all2['employment_male'].replace('O', 0)
df_all2['employment_female'] = df_all2['employment_female'].replace('O', 0)

df_all2['agency_amount'] = df_all2['agency_amount'].replace('Unwilling to tell ', np.NaN)
df_all2['agency_amount'] = df_all2['agency_amount'].replace('unwilling to tell', np.NaN)
df_all2['agency_amount'] = df_all2['agency_amount'].replace(' ', '')

df_all2['prod_cycle2017'] = df_all2['prod_cycle2017'].replace('Egg', np.NaN)

df_all2['prod_cycle2018'] = df_all2['prod_cycle2018'].replace('Egg', np.NaN)
df_all2['prod_cycle2018'] = df_all2['prod_cycle2018'].replace("She couldn't remember", np.NaN)

df_all2['turn_over_farm2017'] = df_all2['turn_over_farm2017'].replace(' ', '')


df_all2['num_chicks_sold_farm2018'] = df_all2['num_chicks_sold_farm2018'].replace("Because of delivery, she stopped to work", np.NaN)
df_all2['num_chicks_sold_farm2018'] = df_all2['num_chicks_sold_farm2018'].replace("Because of political instability there was a gap in 2018", np.NaN)
df_all2['num_chicks_sold_farm2017'] = df_all2['num_chicks_sold_farm2017'].replace(' ', '')


df_all2['sold_to_unique_farmers2018'] = df_all2['sold_to_unique_farmers2018'].replace("460, safety net beneficiaties ", 460)
df_all2['sold_to_unique_farmers2017'] = df_all2['sold_to_unique_farmers2017'].replace("430, these are safety net beneficiaries", 460)


# =============================================================================
# for col in df_all2.columns:
#     df_all2[col] = df_all2[col].replace('None', ' np.NaN')
# 
# =============================================================================

df_all2.to_excel(modified+'assessment_result_PAs.xlsx', 
                sheet_name='PAs', index=False)




#str_var = list(df_all.select_dtypes(include=['object']).columns)

#df_all.to_stata(modified+'assessment_result_PAs.dta', 
#                convert_strl=str_var,
#                version=119)
##########################end PAs ##################################




########################Feed Dealers########################################

df_fd_all1 = get_data_fd1(fd_all1, files_fd1)
df_fd_all2 = get_data_fd2(fd_all2, files_fd2)

df_fd_all = df_fd_all1.append(df_fd_all2, ignore_index=True)

df_fd_all['contact_designation'] = df_fd_all['contact_designation'].str.replace('(', '')
df_fd_all['contact_designation'] = df_fd_all['contact_designation'].str.replace(')', '')


for col in df_fd_all.columns:
    df_fd_all[col] = df_fd_all[col].replace('N/A', np.NaN)
    
for col in df_fd_all.columns:    
    df_fd_all[col] = df_fd_all[col].replace('NA', np.NaN)

for col in df_fd_all.columns:
    df_fd_all.fillna(value=np.nan, inplace=True)

for col in df_fd_all.columns:    
    df_fd_all[col] = df_fd_all[col].replace('none', np.NaN)
    
df_fd_all.sort_values(by=['pa_id'])

df_fd_all.to_excel(modified+'assessment_result_FDs.xlsx', 
                sheet_name='FDs', index=False)


# =============================================================================
# with pd.ExcelWriter(modified+'assessment_result.xlsx') as writer:
#     df_all.to_excel(writer, sheet_name='PAs', index=False)
#     df_fd_all.to_excel(writer, sheet_name='FDs', index=False)
# 
# =============================================================================

############################################################################

# -*- coding: utf-8 -*-
"""
Created on Thu Mar  5 10:56:11 2020

@author: Getachew
"""

#this script was written to automate data entry of ethio-chicken data from excel files

import openpyxl
openpyxl.__version__
# 3.0.0

import pandas as pd
pd.__version__
#1.0.1

import numpy as np
np.__version__
#'1.16.5'

from os import listdir
from os.path import isfile, join

import re

data = \
'D:/projects/IFC/data/Additional Questionnaire -PAs - II- Modified/Additional Questionnaire -PAs - II- Modified/'

id = []
region = []
prod_cycle2018 = []
prod_cycle2017 = []
prod_cycle2016 =[]


#2018
num_chicks_sold_total2018 =[]
num_chicks_sold_farmer2018 =[]
num_chicks_sold_govt2018 =[]
num_chicks_sold_trader2018 =[]
num_chicks_sold_poultry2018 =[]
num_chicks_sold_other2018 =[]

sales_chicks_sold_total2018 =[]
sales_chicks_sold_farmer2018 =[]
sales_chicks_sold_govt2018 =[]
sales_chicks_sold_trader2018 =[]
sales_chicks_sold_poultry2018 =[]
sales_chicks_sold_other2018 =[]

num_uniq_farm2018 = [] 

#2017
num_chicks_sold_total2017 =[]
num_chicks_sold_farmer2017 =[]
num_chicks_sold_govt2017 =[]
num_chicks_sold_trader2017 =[]
num_chicks_sold_poultry2017 =[]
num_chicks_sold_other2017 =[]

sales_chicks_sold_total2017 =[]
sales_chicks_sold_farmer2017 =[]
sales_chicks_sold_govt2017 =[]
sales_chicks_sold_trader2017 =[]
sales_chicks_sold_poultry2017 =[]
sales_chicks_sold_other2017 =[]

num_uniq_farm2017 = [] 

#2016
num_chicks_sold_total2016 =[]
num_chicks_sold_farmer2016 =[]
num_chicks_sold_govt2016 =[]
num_chicks_sold_trader2016 =[]
num_chicks_sold_poultry2016 =[]
num_chicks_sold_other2016 =[]

sales_chicks_sold_total2016 =[]
sales_chicks_sold_farmer2016 =[]
sales_chicks_sold_govt2016 =[]
sales_chicks_sold_trader2016 =[]
sales_chicks_sold_poultry2016 =[]
sales_chicks_sold_other2016 =[]

num_uniq_farm2016 = [] 


######################################################
files = [f for f in listdir(data) if isfile(join(data, f))]

for file in files:
    file_book = openpyxl.load_workbook(data+file, data_only=True)
    sheet = file_book.active
    print("Working on:  ", file)
    
    match = re.search(r'\d*', file)
    id.append(match.group())
    
    region_obj = sheet['I3']   
    prod_cycle2018_obj = sheet['D5']
    prod_cycle2017_obj = sheet['E5']    
    prod_cycle2016_obj = sheet['F5']
    
   #2018    
    num_chicks_sold_total2018_obj = sheet['D10']
    num_chicks_sold_farmer2018_obj = sheet['E10']
    num_chicks_sold_govt2018_obj = sheet['F10']
    num_chicks_sold_trader2018_obj = sheet['G10']
    num_chicks_sold_poultry2018_obj = sheet['H10']
    num_chicks_sold_other2018_obj = sheet['I10']

    sales_chicks_sold_total2018_obj = sheet['D11']
    sales_chicks_sold_farmer2018_obj = sheet['E11']
    sales_chicks_sold_govt2018_obj = sheet['F11']
    sales_chicks_sold_trader2018_obj = sheet['G11']
    sales_chicks_sold_poultry2018_obj = sheet['H11']
    sales_chicks_sold_other2018_obj = sheet['I11']
    
    num_uniq_farm2018_obj = sheet['G14']

    
   #2017
    num_chicks_sold_total2017_obj = sheet['D18']
    num_chicks_sold_farmer2017_obj = sheet['E18']
    num_chicks_sold_govt2017_obj = sheet['F18']
    num_chicks_sold_trader2017_obj = sheet['G18']
    num_chicks_sold_poultry2017_obj = sheet['H18']
    num_chicks_sold_other2017_obj = sheet['I18']

    sales_chicks_sold_total2017_obj = sheet['D19']
    sales_chicks_sold_farmer2017_obj = sheet['E19']
    sales_chicks_sold_govt2017_obj = sheet['F19']
    sales_chicks_sold_trader2017_obj = sheet['G19']
    sales_chicks_sold_poultry2017_obj = sheet['H19']
    sales_chicks_sold_other2017_obj = sheet['I19']
    
    num_uniq_farm2017_obj = sheet['G22']

   #2016
    num_chicks_sold_total2016_obj = sheet['D26']
    num_chicks_sold_farmer2016_obj = sheet['E26']
    num_chicks_sold_govt2016_obj = sheet['F26']
    num_chicks_sold_trader2016_obj = sheet['G26']
    num_chicks_sold_poultry2016_obj = sheet['H26']
    num_chicks_sold_other2016_obj = sheet['I26']

    sales_chicks_sold_total2016_obj = sheet['D27']
    sales_chicks_sold_farmer2016_obj = sheet['E27']
    sales_chicks_sold_govt2016_obj = sheet['F27']
    sales_chicks_sold_trader2016_obj = sheet['G27']
    sales_chicks_sold_poultry2016_obj = sheet['H27']
    sales_chicks_sold_other2016_obj = sheet['I27']
    
    num_uniq_farm2016_obj = sheet['G30']

   #appending
    region.append(region_obj.value)
    prod_cycle2016.append(prod_cycle2016_obj.value)
    prod_cycle2017.append(prod_cycle2017_obj.value)
    prod_cycle2018.append(prod_cycle2018_obj.value)

   #2018
    num_chicks_sold_total2018.append(num_chicks_sold_total2018_obj.value)
    num_chicks_sold_farmer2018.append(num_chicks_sold_farmer2018_obj.value)
    num_chicks_sold_govt2018.append(num_chicks_sold_govt2018_obj.value)
    num_chicks_sold_trader2018.append(num_chicks_sold_trader2018_obj.value)
    num_chicks_sold_poultry2018.append(num_chicks_sold_poultry2018_obj.value)
    num_chicks_sold_other2018.append(num_chicks_sold_other2018_obj.value)
    
    sales_chicks_sold_total2018.append(sales_chicks_sold_total2018_obj.value)
    sales_chicks_sold_farmer2018.append(sales_chicks_sold_farmer2018_obj.value)
    sales_chicks_sold_govt2018.append(sales_chicks_sold_govt2018_obj.value)
    sales_chicks_sold_trader2018.append(sales_chicks_sold_trader2018_obj.value)
    sales_chicks_sold_poultry2018.append(sales_chicks_sold_poultry2018_obj.value)
    sales_chicks_sold_other2018.append(sales_chicks_sold_other2018_obj.value)
    
    num_uniq_farm2018.append(num_uniq_farm2018_obj.value)
     
   #2017
    num_chicks_sold_total2017.append(num_chicks_sold_total2017_obj.value)
    num_chicks_sold_farmer2017.append(num_chicks_sold_farmer2017_obj.value)
    num_chicks_sold_govt2017.append(num_chicks_sold_govt2017_obj.value)
    num_chicks_sold_trader2017.append(num_chicks_sold_trader2017_obj.value)
    num_chicks_sold_poultry2017.append(num_chicks_sold_poultry2017_obj.value)
    num_chicks_sold_other2017.append(num_chicks_sold_other2017_obj.value)
    
    sales_chicks_sold_total2017.append(sales_chicks_sold_total2017_obj.value)
    sales_chicks_sold_farmer2017.append(sales_chicks_sold_farmer2017_obj.value)
    sales_chicks_sold_govt2017.append(sales_chicks_sold_govt2017_obj.value)
    sales_chicks_sold_trader2017.append(sales_chicks_sold_trader2017_obj.value)
    sales_chicks_sold_poultry2017.append(sales_chicks_sold_poultry2017_obj.value)
    sales_chicks_sold_other2017.append(sales_chicks_sold_other2017_obj.value)
    
    num_uniq_farm2017.append(num_uniq_farm2017_obj.value)
   
    
    #2016
    num_chicks_sold_total2016.append(num_chicks_sold_total2016_obj.value)
    num_chicks_sold_farmer2016.append(num_chicks_sold_farmer2016_obj.value)
    num_chicks_sold_govt2016.append(num_chicks_sold_govt2016_obj.value)
    num_chicks_sold_trader2016.append(num_chicks_sold_trader2016_obj.value)
    num_chicks_sold_poultry2016.append(num_chicks_sold_poultry2016_obj.value)
    num_chicks_sold_other2016.append(num_chicks_sold_other2016_obj.value)
    
    sales_chicks_sold_total2016.append(sales_chicks_sold_total2016_obj.value)
    sales_chicks_sold_farmer2016.append(sales_chicks_sold_farmer2016_obj.value)
    sales_chicks_sold_govt2016.append(sales_chicks_sold_govt2016_obj.value)
    sales_chicks_sold_trader2016.append(sales_chicks_sold_trader2016_obj.value)
    sales_chicks_sold_poultry2016.append(sales_chicks_sold_poultry2016_obj.value)
    sales_chicks_sold_other2016.append(sales_chicks_sold_other2016_obj.value)
    
    num_uniq_farm2016.append(num_uniq_farm2016_obj.value)

   
data = {}

#identifiers
data['id']= id  
data['region'] = region

data['prod_cycle2018'] = prod_cycle2018
data['prod_cycle2017'] = prod_cycle2017
data['prod_cycle2016'] = prod_cycle2016

#2018
data['num_chicks_sold_total2018'] = num_chicks_sold_total2018
data['num_chicks_sold_farmer2018'] = num_chicks_sold_farmer2018
data['num_chicks_sold_govt2018'] = num_chicks_sold_govt2018
data['num_chicks_sold_trader2018'] = num_chicks_sold_trader2018
data['num_chicks_sold_poultry2018'] = num_chicks_sold_poultry2018
data['num_chicks_sold_other2018'] = num_chicks_sold_other2018

data['sales_chicks_sold_total2018'] = sales_chicks_sold_total2018
data['sales_chicks_sold_farmer2018'] = sales_chicks_sold_farmer2018
data['sales_chicks_sold_govt2018'] = sales_chicks_sold_govt2018
data['sales_chicks_sold_trader2018'] = sales_chicks_sold_trader2018
data['sales_chicks_sold_poultry2018'] = sales_chicks_sold_poultry2018
data['sales_chicks_sold_other2018'] = sales_chicks_sold_other2018

data['num_uniq_farm2018'] = num_uniq_farm2018


#2017
data['num_chicks_sold_total2017'] = num_chicks_sold_total2017
data['num_chicks_sold_farmer2017'] = num_chicks_sold_farmer2017
data['num_chicks_sold_govt2017'] = num_chicks_sold_govt2017
data['num_chicks_sold_trader2017'] = num_chicks_sold_trader2017
data['num_chicks_sold_poultry2017'] = num_chicks_sold_poultry2017
data['num_chicks_sold_other2017'] = num_chicks_sold_other2017

data['sales_chicks_sold_total2017'] = sales_chicks_sold_total2017
data['sales_chicks_sold_farmer2017'] = sales_chicks_sold_farmer2017
data['sales_chicks_sold_govt2017'] = sales_chicks_sold_govt2017
data['sales_chicks_sold_trader2017'] = sales_chicks_sold_trader2017
data['sales_chicks_sold_poultry2017'] = sales_chicks_sold_poultry2017
data['sales_chicks_sold_other2017'] = sales_chicks_sold_other2017

data['num_uniq_farm2017'] = num_uniq_farm2017

#2016
data['num_chicks_sold_total2016'] = num_chicks_sold_total2016
data['num_chicks_sold_farmer2016'] = num_chicks_sold_farmer2016
data['num_chicks_sold_govt2016'] = num_chicks_sold_govt2016
data['num_chicks_sold_trader2016'] = num_chicks_sold_trader2016
data['num_chicks_sold_poultry2016'] = num_chicks_sold_poultry2016
data['num_chicks_sold_other2016'] = num_chicks_sold_other2016

data['sales_chicks_sold_total2016'] = sales_chicks_sold_total2016
data['sales_chicks_sold_farmer2016'] = sales_chicks_sold_farmer2016
data['sales_chicks_sold_govt2016'] = sales_chicks_sold_govt2016
data['sales_chicks_sold_trader2016'] = sales_chicks_sold_trader2016
data['sales_chicks_sold_poultry2016'] = sales_chicks_sold_poultry2016
data['sales_chicks_sold_other2016'] = sales_chicks_sold_other2016

data['num_uniq_farm2016'] = num_uniq_farm2016

df = pd.DataFrame.from_dict(data) 


df['region'].value_counts()
df['region'] = df['region'].str.replace(' ', '')

df['id'].value_counts()
df.dtypes
df['id'] = df['id'].str.zfill(width=4)
    
# handling missing values with num_chicks_sold_other2017

df['num_chicks_sold_other2017'].value_counts()
df['num_chicks_sold_other2017'] = df['num_chicks_sold_other2017'].replace('to hotels', np.NaN) 
df.sort_values(by=['id'], inplace=True)

df.to_excel("D:/projects/IFC/output/additional_extracted.xlsx") 
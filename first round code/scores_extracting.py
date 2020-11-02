# -*- coding: utf-8 -*-
"""

Created on Thu Mar  5 10:56:11 2020

@author: Getachew

"""

#this script was written to automate data entry of ethio-chicken data from excel files
 
import pandas as pd
pd.__version__

#1.0.1

files = 'D:/projects/IFC/data/IFC Final- Bright/IFC Final- Bright/2. Agregate Result Final/'

col_titles = [
        'id', 'empty', 'mgmt_capability2019',
        'inst_comptn_strength2019', 'business_knowledge2019',
        'marketing_pot_opportunity2019', 'fin_mgmt_opportunity2019',
        'env_compliance2019', 'average2019'
    ]

########################
oromia_scores = pd.read_excel(files+'1. Agrigate Result - Oromia.xlsx',
                     sheet_name=0, usecols="F:JY", skiprows=6,
                     nrows=9, header=None)

oromia_scores = oromia_scores.transpose()

oromia_scores.columns = col_titles
oromia_scores = oromia_scores.drop(['empty'], axis=1)
oromia_scores['region'] = 'Oromia' 


########################
amhara_scores = pd.read_excel(files+'2. Agrigate Result- Amhara.xlsx',
                     sheet_name=0, usecols="F:AM", skiprows=6,
                     nrows=9, header=None)
amhara_scores = amhara_scores.transpose()

amhara_scores.columns = col_titles
amhara_scores = amhara_scores.drop(['empty'], axis=1)
amhara_scores['region'] = 'Amhara' 


########################

########################

snnp_scores = pd.read_excel(files+'3. Agrigate Result - SNNPR.xlsx',
                     sheet_name=0, usecols="F:CM", skiprows=6,
                     nrows=9, header=None)
snnp_scores = snnp_scores.transpose()

snnp_scores.columns = col_titles
snnp_scores = snnp_scores.drop(['empty'], axis=1)
snnp_scores['region'] = 'SNNP' 

#############################

scores = oromia_scores.append(amhara_scores)
scores = scores.append(snnp_scores)
scores['average_score2019'] = scores[['mgmt_capability2019',
        'inst_comptn_strength2019', 'business_knowledge2019',
        'marketing_pot_opportunity2019', 'fin_mgmt_opportunity2019',
        'env_compliance2019']].mean(axis=1)
scores = scores.drop(['average2019'], axis=1)

#handling float id identifier
scores.dtypes

scores['id'] = scores['id'].astype(int)
scores['id'] = scores['id'].astype(str)
scores['id'] = scores['id'].str.zfill(width=4)

scores.to_excel("D:/projects/IFC/output/scores_extracted.xlsx")
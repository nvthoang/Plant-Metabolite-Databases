#Import library
from rdkit import Chem
from mordred import Calculator, descriptors, Lipinski
import pandas as pd
import numpy as np

# Load data
DB_SMILE = pd.read_csv('Database_SMILE.csv') # Inseart the name of database in csv file
DB_extracted_list = DB_SMILE.values.tolist()
DB_SMILE_list = []

# Extract data from list-of-list
for compound in DB_extracted_list:
        DB_SMILE_list.append(compound[0])

# Create descriptor calculator with all descriptors
calc = Calculator(descriptors, ignore_3D=True, version='1.0.0')
len(calc.descriptors)

# Calculate a list of molecule
mols1 = []
for smile in DB_SMILE_list:
    mols1.append(Chem.MolFromSmiles(smile))
print(len(mols1))

mols2 = []
for smile in mols1:
    if smile  != None:
        mols2.append(smile)
print(len(mols1))


# Run as Pandas dataframe
Descriptor_full = calc.pandas(mols2) #Should run small number of compound

# Extract a certain column
Descriptor_full['SMR'] # Druglike Descriptor: nHBDon, nHBAcc, MW, SlogP, SMR, TopoPSA,                

# Export to csv file
Descriptor_full.to_csv('Database_Descriptor.csv', encoding='utf-8', index=False)

# Load dataframe of descriptors
DB_full_descriptor = pd.read_csv('Database_Descriptor.csv') # Inseart the name of database in csv file

# Extract column in dataframe
DB_druglike_descriptor = DB_full_descriptor[['nHBDon', 'nHBAcc', 'MW', 'SLogP', 'SMR', 'TopoPSA']]

# Export to csv file
DB_druglike_descriptor.to_csv('Database_Druglike_Descriptor.csv', encoding='utf-8', index=False)

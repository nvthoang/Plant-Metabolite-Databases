# Load data
DB_druglike = read.csv('~/DB_druglike.csv', header = T)
head(DB_druglike)

# Violin plot
library(ggplot2)

## Partition Coefficient
SLogP = ggplot(DB_druglike, aes(x = DB, y = SLogP, fill = DB)) + 
  geom_violin(trim=FALSE) + 
  geom_hline(yintercept=c(-0.4,5.6), linetype="dashed", color = "red", size = 0.7) + 
  labs(x = 'Database', y = 'Partition Coefficient (LogP)') + 
  theme_minimal()

## Surface Molar Refractivity  
SMR = ggplot(DB_druglike, aes(x = DB, y = SMR, fill = DB)) + 
  geom_violin(trim=FALSE) + 
  geom_hline(yintercept=c(40,130), linetype="dashed", color = "red", size = 0.7) +
  labs(x = 'Database', y = 'Surface Molar Refractivity (SMR)')+
  theme_minimal()

## Molecular Weight
MW = ggplot(DB_druglike, aes(x = DB_druglike, y = MW, fill = DB)) + 
  geom_violin(trim=FALSE) + 
  geom_hline(yintercept=c(180,500), linetype="dashed", color = "red", size = 0.7) +
  labs(x = 'Database', y = 'Molecular Weight (Daltons)') +
  theme_minimal()

## Topological Polar Surface Area
TopoPSA = ggplot(DB_druglike, aes(x = DB, y = TopoPSA, fill = DB)) + 
  geom_violin(trim=FALSE) + 
  geom_hline(yintercept= 140, linetype="dashed", color = "red", size = 0.7) +
  labs(x = 'Database', y = 'Topological Polar Surface Area (TPSA)')+
  theme_minimal()

## Number of Hydrogen Bond Donors
nHBDon = ggplot(DB_druglike, aes(x = DB, y = nHBDon, fill = DB)) + 
  geom_violin(trim=FALSE) + 
  geom_hline(yintercept= 5, linetype="dashed", color = "red", size = 0.7) +
  labs(x = 'Database', y = 'Number of Hydrogen Bond Donors (nHBDon)')+
  theme_minimal()

## Number of Hydrogen Bond Donors
nHBAcc = ggplot(DB_druglike, aes(x = DB, y = nHBAcc, fill = DB)) + 
  geom_violin(trim=FALSE) + 
  geom_hline(yintercept= 10, linetype="dashed", color = "red", size = 0.7) +
  labs(x = 'Database', y = 'Number of Hydrogen Bond Acceptors (nHBAcc)')+
  theme_minimal()

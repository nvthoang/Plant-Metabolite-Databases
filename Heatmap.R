# Load data
hm_data = read.csv('~/data_heatmap.csv', header = T)
row.names(hm_data) = hm_data[,1]
hm_data = hm_data[,-1]
colnames(hm_data) = row.names(hm_data)
dim(hm_data)
head(hm_data)

# Reshape data
library(reshape2)
melted_hm_data = melt(hm_data)
melted_hm_data

DB_Corr = rep(row.names(hm_data), time = length(hm_data))
melted_hm_data = data.frame(melted_hm_data, DB_Corr)
melted_hm_data = melted_hm_data[,c(1,3,2)]
colnames(melted_hm_data) = c("DB_Base", "DB_Corr", "Value")

# Set factor type
melted_hm_data$DB_Base = factor(melted_hm_data$DB_Base)
melted_hm_data$DB_Corr = factor(melted_hm_data$DB_Corr, levels = row.names(hm_data))

# Heatmap
library(ggplot2)
ggplot(data = melted_hm_data, aes(x = DB_Base, y = DB_Corr)) + geom_tile(aes(fill = Value),colour = "white") +
  scale_fill_gradient(low = "#AED581", high = "#E91E63") + 
  labs( x ="Database (Base)", y = "Database (Corresponding)", fill = 'Overlaping rate') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

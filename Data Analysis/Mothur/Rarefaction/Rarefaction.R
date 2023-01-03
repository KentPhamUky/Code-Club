#Script Name: Rarefaction
#Last Author: Kent P.
#Last Edit Date: 27Dec2022

#This script is used to interpret the rarefaction file output by mothur

library(tidyverse) #For reading in summary file and ggplot2
library(reshape2) #For converting rarefaction dataset into tall format

setwd("C:/Users/kdph224/Documents/GitHub/Code-Club/Data Analysis/Mothur/Rarefaction") #Change to your working directory where files are stored
rawdataset <- read_tsv(file="Example.rarefaction", col_types = cols(numsampled=col_character())) #Read in your summary file containing alpha diversity

df_sub <- select(rawdataset, -contains("lci-")) #Removes lci- columns
df <- select(df_sub, -contains("hci-")) #Removes hci- columns


df <- melt(df ,  id.vars = 'numsampled', variable.name = 'Sample') #Converts rarefaction table into tall format for graphing



plot <- ggplot(data = df, aes(x=numsampled, y=value, color = Sample)) + #Plots rarefaction
  geom_point()
plot

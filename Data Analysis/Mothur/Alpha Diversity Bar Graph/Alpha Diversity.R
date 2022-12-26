#Script Name: Alpha Diversity
#Last Author: Kent P.
#Last Edit Date: 26Dec2022

#This script is used to create a simple bar chart displaying alpha diversity of 

library(tidyverse) #For reading in summary file and ggplot2

setwd("D:/GitHub/Code-Club/Data Analysis/Mothur/Alpha Diversity Bar Graph") #Change to your working directory where files are stored
dataset <- read_tsv(file="Alpha diversity.summary", col_types = cols(group=col_character())) #Read in your summary file containing alpha diversity


#Inverse Simpson alpha diversity
InvSimpplot = ggplot(data = dataset, aes(x= group, y=invsimpson)) +
  geom_bar(stat="identity")
InvSimpplot  
  
#Shannon alpha diversity
Shannonplot = ggplot(data = dataset, aes(x= group, y=shannon)) +
  geom_bar(stat="identity")
Shannonplot  

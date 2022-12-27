#Script Name: Rarefaction
#Last Author: Kent P.
#Last Edit Date: 27Dec2022

#This script is used to interpret the rarefaction file output by mothur

library(tidyverse) #For reading in summary file and ggplot2
library(dplyr) #For Processing dataset

setwd("D:/GitHub/Code-Club/Data Analysis/Mothur/Rarefaction") #Change to your working directory where files are stored
rawdataset <- read_tsv(file="Example.rarefaction", col_types = cols(numsampled=col_character())) #Read in your summary file containing alpha diversity

df_sub <- select(rawdataset, -contains("lci-"))
df <- select(df_sub, -contains("hci-"))

plot <- ggplot(data = df, aes(x=numsampled, y=))
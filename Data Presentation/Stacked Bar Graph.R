#Script Name: Stacked Bar Graph
#Last Author: Kent P.
#Last Edit Date: 3Jan2023

#Stacked Bar Graph template with ggplot2 (dataset = name of your dataset; X = Independent variable, Y= Dependent variable)

library(tidyverse)


# Stacked
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="stack", stat="identity")

# Stacked + percent
ggplot(data, aes(fill=condition, y=value, x=specie)) + 
  geom_bar(position="fill", stat="identity")
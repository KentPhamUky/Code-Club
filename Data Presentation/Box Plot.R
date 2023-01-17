#Script Name: Box plot
#Last Author: Kent P.
#Last Edit Date: 17Jan2023

#Box plot template with ggplot2

library(tidyverse)


# Create the dataset or load the dataset 
# for the chart
Dataset <- c(17, 32, 8, 53, 1,45,56,678,23,34)
Dataset

# loading data set and storing it in ds variable
ds <- read.csv(
  "c://crop//archive//Crop_recommendation.csv", header = TRUE)

# create a boxplot by using geom_boxplot() function
# of ggplot2 package
crop=ggplot(data=ds, mapping=aes(x=label, y=temperature))+geom_boxplot()
crop
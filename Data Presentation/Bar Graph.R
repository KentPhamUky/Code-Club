#Script Name: Bar Graph
#Last Author: Kent P.
#Last Edit Date: 3Jan2023

#Bar chart template with ggplot2 (dataset = name of your dataset; X = Independent variable, Y= Dependent variable)

library(tidyverse)
plot <- ggplot(data=dataset, aes(x = X, y = Y, color = X, fill = X)) + #Assign your dataset and variables to ggplot. Can change color/fill for a second factor. Can use hexadecimal code for color ie blue = #0000FF
  geom_bar(stat="identity", width = 1, position = position_dodge()) + #Create a bar plot and set bar width. Remove", position = position_dodge()" to create stacked bar chart or when only 1 factor
  theme(legend.position = "top") +
  labs(title = "Title", subtitle = "subtitle", x = "X variable", y = "Y variable", 
       caption = "Caption", tag = "tag") + #Add label text
  theme(
      axis.text.y = element_text(colour = "black", size = 12, face = "bold"), #Adjust Y axis text
      axis.text.x = element_text(colour = "black", size = 12, face = "bold"), #Adjust X axis text
      legend.text = element_text(size = 20, face ="bold", colour ="black"), #Adjust legend text
      legend.position = "right", axis.title.y = element_text(face = "bold", size = 14), #Can also use "left", "top", "bottom", "none"
      axis.title.x = element_text(face = "bold", size = 14, colour = "black"), #Adjust title text
      legend.title = element_text(size = 14, colour = "black", face = "bold"), #Adjust legend title text
      panel.background = element_blank(), panel.border = element_rect(colour = "black", fill = NA, size = 1.2), #adjust
      legend.key=element_blank #Remove fill space around legend
      ) 
  
  
  
  
  
#Example plot
library(tidyverse) #load in ggplot2 through tidyverse
data(PlantGrowth) #example dataset

  
  plotplant <- ggplot(data=PlantGrowth, aes(x = group, y = weight, color = group, fill = group)) + #Assign your dataset and variables to ggplot. Can change color/fill for a second factor. Can use hexadecimal code for color ie blue = #0000FF
    geom_bar(stat="identity", width = .75, position = position_dodge()) + #Create a bar plot and set bar width. Remove", position = position_dodge()" to create stacked bar chart 
    theme(
      axis.text.y = element_text(colour = "black", size = 12, face = "bold"), #Adjust Y axis text
      axis.text.x = element_text(colour = "black", size = 12, face = "bold"), #Adjust X axis text
      legend.text = element_text(size = 20, face ="bold", colour ="black"), #Adjust legend text
      legend.position = "right", axis.title.y = element_text(face = "bold", size = 14), #Can also use "left", "top", "bottom", "none"
      axis.title.x = element_text(face = "bold", size = 14, colour = "black"), #Adjust title text
      legend.title = element_text(size = 14, colour = "black", face = "bold") #Adjust legend title text
    ) +
    labs(title = "Plant growth weight", subtitle = "Changes in plant weight due to treatment", x = "Treatment", y = "Weight (lbs)", 
         caption = "dataset from datasets package", tag = "A") #Add label text
plotplant

#Script Name: NMDS for mothur
#Last Author: Kent P.
#Last Edit Date: 19Dec2022

#The following script is used to load in the mothur NMDS axes files and plot the data
#You will need an axes file as well as a metadata file to group your samples
#Make sure column title of the samples is named "group" to match with the NMDS.axes file

#The following script is meant to run with the provided axes and metadata file named "NMDS.axes" and "metadata.xlsx"


library(tidyverse) #Used for ggplot2 and to read in tsv file
library(readxl) #Used to read in metadata file
library(broom) #Used to tidy data outputs
library(plyr) #Used to group data

setwd("C:/Users/kdph224/Documents/GitHub/Code-Club/Data Analysis/Mothur/Beta Diversity NMDS") #Change to your working directory where files are stored
metadata <- read_excel(path="metadata.xlsx") #Read in your metadata
nmds <- read_tsv(file="NMDS.axes", col_types = cols(group=col_character())) #Read in your nmds file


metadata_nmds <- inner_join(metadata, nmds, by=c('group')) #Combine axes and metadata file
as.factor(metadata_nmds$treatment) #Set your groupings as a factor



hull_make <- metadata_nmds %>% #Creates a hull or connects the edges of your points
  group_by(treatment, site) %>% #Change treatment to whatever you want to group the hulls by. You can add multiple groups by separating with a comma
  slice(chull(axis1, axis2))



plot <- 
  ggplot(metadata_nmds, aes(x = axis1, y = axis2, 
        color = as.factor(treatment), shape = site))+ #Use color and shape for your groupings
  geom_point(size = 4) +
  theme(axis.text.y = element_text(colour = "black", size = 12, face = "bold"), 
        axis.text.x = element_text(colour = "black", face = "bold", size = 12), 
        legend.text = element_text(size = 20, face ="bold", colour ="black"), 
        legend.position = "right", axis.title.y = element_text(face = "bold", size = 14), 
        axis.title.x = element_text(face = "bold", size = 14, colour = "black"), 
        legend.title = element_text(size = 14, colour = "black", face = "bold"),
        plot.title = element_text(size=20, hjust = 0.5),
        panel.background = element_blank(),
          panel.border = element_rect(colour = "black", fill = NA, size = 1.2),
        legend.key=element_blank()) +  
  labs(x = "NMDS1",  y = "NMDS2", colour = "Treatment", shape = "Site") + #Change axes labels and legend labels
  geom_polygon(data = hull_make, alpha = 0.2, #alpha is used to set opacity of hull
        aes(fill = treatment, colour = treatment ), show.legend = FALSE)  + #set fill and colour to grouping
  ggtitle("2020 Wheat Rhizosphere Microbial Community")  #Set name of figure

plot
ggsave("NMDS.tiff", height = 8, width = 10, units = "in") #Save the plot in a form it can be used




#Additional code for figure:
annotate(geom="text", x= -.30, y=-.35, label="Stress = 0.145 \n Rsq = 0.911", #Use to add any annotation needed to figure
         color="red", size = 6) 
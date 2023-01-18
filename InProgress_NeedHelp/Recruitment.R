#------------------------------------------------------------------------------#
# Title: FTF Vegetation Species Recruitment
# Author: Scott Culbert
# Contact: sgcu223@uky.edu
# Created: Octobr 26, 2022
# Last updated: October 26, 2022
#------------------------------------------------------------------------------#
require(ggplot2)
require(dplyr)
#Run First----

#Color-blind palette
cbp2 <- c("#000000", "#E69F00", "#56B4E9", "#009E73","#F0E442", "#0072B2", "#D55E00", "#CC79A7")

overstory_all <- read.csv(file = 'C:/Users/User/Documents/School Documents/FTF/Analysis/Data Files/Overstory_AllYears_Final.csv', 
                          header = T)

#Remove 2013 Data
overstory_all <-overstory_all %>%
  filter(Year != 2013)

#Remove erroneous columns
overstory_all<-
  overstory_all %>%
  select(-(X))%>%
  select(-(X.1))

#Create DBH Size Classes
overstory_all$DBH_Class <- as.factor(ifelse(between(overstory_all$DBH, 2, 10),  "Small",
                                     ifelse(between(overstory_all$DBH, 10.001 , 20),  "Mid",
                                     ifelse(between(overstory_all$DBH, 20.001, 100),  "Overstory", NA))))

#Create Plot-level Summaries
plot_summary<-
overstory_all%>%
  group_by(Year, 
           Plot, 
           DBH_Class,
           Species)%>%
  summarise(BA = sum(Basal.Area)*20, 
            Density = n()*20)


#Add pyrophyte/mesophyte
plot_summary$Group <-as.factor(ifelse(plot_summary$Species == "RM","Mesophytic",
                                      ifelse(plot_summary$Species == "YP", "Mesophytic",
                                             ifelse(plot_summary$Species == "AB", "Mesophytic",
                                                    ifelse(plot_summary$Species == "SBIR", "Mesophytic",
                                                           ifelse(plot_summary$Species == "SM", "Mesophytic",
                                                                  ifelse(plot_summary$Species == "CMG", "Mesophytic",
                                                                         ifelse(plot_summary$Species == "BG", "Intermediate",
                                                                                ifelse(plot_summary$Species == "DS", "Intermediate",
                                                                                       ifelse(plot_summary$Species == "FD", "Intermediate",
                                                                                              ifelse(plot_summary$Species == "WA", "Intermediate",
                                                                                                     ifelse(plot_summary$Species == "OV", "Intermediate",
                                                                                                            ifelse(plot_summary$Species == "SAS", "Intermediate",
                                                                                                                   ifelse(plot_summary$Species == "BO", "Pyrophytic",
                                                                                                                          ifelse(plot_summary$Species == "SO", "Pyrophytic",
                                                                                                                                 ifelse(plot_summary$Species == "CO", "Pyrophytic",
                                                                                                                                        ifelse(plot_summary$Species == "NRO", "Pyrophytic",
                                                                                                                                               ifelse(plot_summary$Species == "WO", "Pyrophytic",
                                                                                                                                                      ifelse(plot_summary$Species == "VP", "Intermediate",
                                                                                                                                                             ifelse(plot_summary$Species == "PP", "Pyrophytic",
                                                                                                                                                                    ifelse(plot_summary$Species == "SLP", "Pyrophytic",
                                                                                                                                                                           ifelse(plot_summary$Species == "Pine", "Pyrophytic",
                                                                                                                                                                                  ifelse(plot_summary$Species == "SW", "Mesophytic",
                                                                                                                                                                                         ifelse(plot_summary$Species == "PH", "Pyrophytic",
                                                                                                                                                                                                ifelse(plot_summary$Species == "MH", "Pyrophytic",
                                                                                                                                                                                                       ifelse(plot_summary$Species == "CHST", "Pyrophytic",
                                                                                                                                                                                                              ifelse(plot_summary$Species == "BTAS", "Pyrophytic",
                                                                                                                                                                                                                     ifelse(plot_summary$Species == "BL", "Pyrophytic",
                                                                                                                                                                                                                            ifelse(plot_summary$Species == "WP", "Mesophytic",
                                                                                                                                                                                                                                   ifelse(plot_summary$Species == "MNL", "Pyrophytic",
                                                                                                                                                                                                                                          ifelse(plot_summary$Species == "Oak", "Pyrophytic",
                                                                                                                                                                                                                                                 NA)))))))))))))))))))))))))))))))

class_summary <- plot_summary%>%
  group_by(Year, 
           Plot, 
           Group, 
           DBH_Class)%>%
  summarise(total.BA = sum(BA), 
            total.Density = sum(Density))
class_summary<-class_summary%>%
  filter(Group != "NA")

#Add CBI if Needed
class_summary$CBI <-as.factor(ifelse(class_summary$Plot == "17",  NA,
                                    ifelse(class_summary$Plot == '18', NA,
                                           ifelse(class_summary$Plot == '28',  .29,
                                                  ifelse(class_summary$Plot == '29', .16,
                                                         ifelse(class_summary$Plot == '30', NA,
                                                                ifelse(class_summary$Plot == '7', .16,
                                                                       ifelse(class_summary$Plot == '8', .36,
                                                                              ifelse(class_summary$Plot == '19', .4,
                                                                                     ifelse(class_summary$Plot == '20', .7,
                                                                                            ifelse(class_summary$Plot == '1', .82,
                                                                                                   ifelse(class_summary$Plot == '6', 1.2,
                                                                                                          ifelse(class_summary$Plot == '9', 1.2,
                                                                                                                 ifelse(class_summary$Plot == '11', 1.4,
                                                                                                                        ifelse(class_summary$Plot == '12', 1.5,
                                                                                                                               ifelse(class_summary$Plot == '15', .8,
                                                                                                                                      ifelse(class_summary$Plot == '16', .9,
                                                                                                                                             ifelse(class_summary$Plot == '21', 1,
                                                                                                                                                    ifelse(class_summary$Plot == '22', .9,
                                                                                                                                                           ifelse(class_summary$Plot == '24', 1,
                                                                                                                                                                  ifelse(class_summary$Plot == '26', 1.2,
                                                                                                                                                                         ifelse(class_summary$Plot == '2', 2.4,
                                                                                                                                                                                ifelse(class_summary$Plot == '3', 2.3,
                                                                                                                                                                                       ifelse(class_summary$Plot == '4', 2.5,
                                                                                                                                                                                              ifelse(class_summary$Plot == '5', 2,
                                                                                                                                                                                                     ifelse(class_summary$Plot == '10', 2.4,
                                                                                                                                                                                                            ifelse(class_summary$Plot == '13', 1.7,
                                                                                                                                                                                                                   ifelse(class_summary$Plot == '14', 2,
                                                                                                                                                                                                                          ifelse(class_summary$Plot == '23', 1.6,
                                                                                                                                                                                                                                 ifelse(class_summary$Plot == '25', 2.5,
                                                                                                                                                                                                                                        ifelse(class_summary$Plot == '27', 2.2,
                                                                                                                                                                                                                                               ifelse(class_summary$Plot == 'R1', 0,
                                                                                                                                                                                                                                                      ifelse(class_summary$Plot == "R2", 0,
                                                                                                                                                                                                                                                            NA)))))))))))))))))))))))))))))))))

class_summary <- 
class_summary%>%
  filter(DBH_Class != "Small")
write.csv(class_summary, 
          file = 'C:/Users/User/Documents/School Documents/FTF/Analysis/Data Files/Recruit.csv')
#Recruitment Analysis----
year12df <- subset(class_summary, Year == "2022")
year6df <-subset(class_summary, Year == "2016")
year1df <-subset(class_summary, Year == "2011")

output_df = data.frame(Plot = rep(NA), Group = rep(NA), DBH_Class = rep(NA), total.Density = rep(NA), CBI = rep(NA))

for(i in length(year12df)){
   if((year12df$Plot[i] == year6df$Plot[i]) & (year12df$Group[i] == year6df$Group[i]) & (year12df$DBH_Class[i] == year6df$DBH_Class[i]))
    {
     recruit.Density = year12df$total.Density - year6df$total.Density
    }
   temp = cbind(recruit.Density, output_df)
}



#length?
#



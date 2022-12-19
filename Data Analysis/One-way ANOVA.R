#Script Name: One-way ANOVA
#Last Author: Kent P.
#Last Edit Date: 14Dec2022


#template one-way anova with base r
#"Y" = dependent variable; "X" = independent variable; "datasetname" = importated dataset
exampleaov <- aov(Y ~ X, data = datasetname)
summary(exampleaov)

#Example one-way anova
library(datasets)
data(iris)
speciesaov <- aov(Sepal.Length ~ Species, data=iris)
summary(speciesaov)



#Note: If you have a numerical independent variable, convert it to a factor with following code
dataset$columnname <- as.factor(dataset$columnname)

#example
iris$Petal.Width <- as.factor(iris$Petal.Width)

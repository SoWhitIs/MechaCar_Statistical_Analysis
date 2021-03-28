#Deliverable 1: Linear Regression to Predict MPG

# Import Libraries
library(tidyverse)
library(dplyr)

# Read CSV file into dataframe
mechacar_mpg <-read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors=F)
#check dataframe
head(mechacar_mpg)

# Perform Linear Regression using lm() function
# pass in all six variables, dataframe as data parameter
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,  data=mechacar_mpg)

# Determine the p-value and r-squared value for linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,  data=mechacar_mpg))

# Deliverable 2: Visualizations for the Trip Analysis
# Summary Statistics on Suspension

# Read CSV file to dataframe
suspension_coil <-read.csv(file= 'Suspension_Coil.csv', check.names=F, stringsAsFactors=F)
#check dataframe
head(suspension_coil)

# Create total_summary dataframe using summarize() function on PSI Column
 total_summary <-suspension_coil %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Variance_PSI=var(PSI), SD_PSI=sd(PSI), .groups= 'keep')
 
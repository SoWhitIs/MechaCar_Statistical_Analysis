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
# Summary Statistics on Suspension (PSI)

# Read CSV file to dataframe
suspension_coil <-read.csv(file= 'Suspension_Coil.csv', check.names=F, stringsAsFactors=F)
#check dataframe
head(suspension_coil)

# Create total_summary dataframe using summarize() function on PSI Column
total_summary <-suspension_coil %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Variance_PSI=var(PSI), SD_PSI=sd(PSI), .groups= 'keep')
 
# Create lots_summary dataframe using group_by() group each manufacturing lot and summarize()
lot_summary <-suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Variance_PSI=var(PSI), SD_PSI=sd(PSI), .groups= 'keep')


# Deliverable 3:T-Tests on Suspension Coils
# T-test to determine statistically difference across all manufacturing lots from the population mean(mu)of 1500 PSI
 t.test(suspension_coil$PSI,mu=1500)
 
# Determine if the PSI for each manufacturing lot is statistically different from population mean (mu) 1500, subset() function
  # Lot 1
 t.test(subset(suspension_coil, Manufacturing_Lot=="Lot1")$PSI, mu=1500)
  # Lot 2
 t.test(subset(suspension_coil, Manufacturing_Lot=="Lot2")$PSI, mu=1500)
  # Lot 3
 t.test(subset(suspension_coil, Manufacturing_Lot=="Lot3")$PSI, mu=1500)
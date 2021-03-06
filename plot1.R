## Exploratory Data Analysis Course Project 1
# Plot 1
# @dillonchewwx, 30012021

# Load Data
library(tidyverse)
data<-read_csv2("../household_power_consumption.txt")

library(lubridate)
## Clean up data
cleaneddata<-data %>% 
  filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
  replace(is.na(.),0) %>%
  mutate(Time=strptime(paste0(Date, " ", Time), ("%d/%m/%Y %H:%M:%S"))) %>%
  select(2:9) %>%
  mutate(across(where(is.character), as.numeric))

# Base plot here
png("plot1.png")
hist(cleaneddata$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", 
     col="red"
)
dev.off()


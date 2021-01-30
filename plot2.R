## Exploratory Data Analysis Course Project 1
# Plot 2
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

# Base Plot Here
png("plot2.png")
plot(cleaneddata$Time, cleaneddata$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(cleaneddata$Time, cleaneddata$Global_active_power)
dev.off()

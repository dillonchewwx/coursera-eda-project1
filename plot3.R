## Exploratory Data Analysis Course Project 1
# Plot 3
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
png("plot3.png")
plot(cleaneddata$Time, cleaneddata$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(cleaneddata$Time, cleaneddata$Sub_metering_1, col="black")
lines(cleaneddata$Time, cleaneddata$Sub_metering_2, col="red")
lines(cleaneddata$Time, cleaneddata$Sub_metering_3, col="blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1)
dev.off()

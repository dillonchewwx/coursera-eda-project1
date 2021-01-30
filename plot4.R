## Exploratory Data Analysis Course Project 1
# Plot 4
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
png("plot4.png")
par(mfrow=c(2,2))
plot(cleaneddata$Time, cleaneddata$Global_active_power, type="n", xlab="", ylab="Global Active Power")
lines(cleaneddata$Time, cleaneddata$Global_active_power)
plot(cleaneddata$Time, cleaneddata$Voltage/1000, type="n", xlab="datetime", ylab="Voltage")
lines(cleaneddata$Time, cleaneddata$Voltage/1000)
plot(cleaneddata$Time, cleaneddata$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(cleaneddata$Time, cleaneddata$Sub_metering_1, col="black")
lines(cleaneddata$Time, cleaneddata$Sub_metering_2, col="red")
lines(cleaneddata$Time, cleaneddata$Sub_metering_3, col="blue")
legend("topright", legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=1, cex=1, bty="n")
plot(cleaneddata$Time, cleaneddata$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(cleaneddata$Time, cleaneddata$Global_reactive_power)
dev.off()

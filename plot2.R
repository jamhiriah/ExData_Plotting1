# Assuming rawdata is unzipped and put in the working directory
# Set working directory
setwd("/Users/Jam/Desktop/Coursera/04/ExData_Plotting1")

# Required packages
library(data.table)
library(lubridate)

# read the raw table and limit to 2 days

householdpowerconsumption<-read.table('./household_power_consumption.txt',header=TRUE,
                                      sep=';',na.strings='?')

# get the data from the dates 2007-02-01 and 2007-02-02
subpowerconsumption<-householdpowerconsumption[householdpowerconsumption$Date=='1/2/2007' | householdpowerconsumption$Date=='2/2/2007',]

# combine Date + Time
subpowerconsumption$DateTime<-dmy(subpowerconsumption$Date)+hms(subpowerconsumption$Time)

# open device
png(filename='plot2.png',width=480,height=480,units='px')
# plot data
plot(subpowerconsumption$DateTime,subpowerconsumption$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')
# turn off device
x<-dev.off()

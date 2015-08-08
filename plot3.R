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
png(filename='plot3.png',width=480,height=480,units='px')

# plot data
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(subpowerconsumption$DateTime,subpowerconsumption$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(subpowerconsumption$DateTime,subpowerconsumption$Sub_metering_2,col=lncol[2])
lines(subpowerconsumption$DateTime,subpowerconsumption$Sub_metering_3,col=lncol[3])

# add legend
legend('topright',legend=lbls,col=lncol,lty='solid')

# turn off device
x<-dev.off()
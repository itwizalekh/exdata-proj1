rm(list=ls());
setwd("C:/Misc/R_work/data");

DataSet <- subset(read.table("household_power_consumption.txt", sep = ";",header=TRUE),
                  as.Date(Date,  format="%d/%m/%Y") == as.Date("2007-02-01") | as.Date(Date,  format="%d/%m/%Y") == as.Date("2007-02-02"));

png("plot2.png");

DataSet$dttm <- strptime(paste(DataSet$Date, DataSet$Time), format = "%d/%m/%Y %H:%M:%S")
with(DataSet, plot(dttm, Global_active_power, type = "l", xlab="", ylab="Global active power (kilowatts)"))

dev.off();


rm(list=ls())
setwd("C:/Misc/R_work/data");

# Instead of reading the entire dataset in memory, and then subsetting...
#DataSet <- read.table("household_power_consumption.txt", sep = ";",header=TRUE);
#DataSet$Date <- as.Date(DataSet$Date,  format="%d/%m/%Y");
#DataSet <- subset(DataSet, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"));

# ... subsetting the dataset on the fly
DataSet <- subset(read.table("household_power_consumption.txt", sep = ";",header=TRUE),
                  as.Date(Date,  format="%d/%m/%Y") == as.Date("2007-02-01") | as.Date(Date,  format="%d/%m/%Y") == as.Date("2007-02-02"));

png("plot1.png");
hist(as.numeric(as.character(DataSet$Global_active_power))
     , col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power");

dev.off();


# rm(list=ls())
#setwd("C:/Misc/R_work/data");
DataSet <- subset(read.table("household_power_consumption.txt", sep = ";",header=TRUE),
                  as.Date(Date,  format="%d/%m/%Y") == as.Date("2007-02-01") | as.Date(Date,  format="%d/%m/%Y") == as.Date("2007-02-02"));

png("plot3.png");

DataSet$dttm <- strptime(paste(DataSet$Date, DataSet$Time), format = "%d/%m/%Y %H:%M:%S")
with(DataSet, 
     plot(dttm,
          as.numeric(as.character(DataSet$Sub_metering_1)), 
          type = "l", xlab="", ylab="Energy sub metering"
          )
     );

with(DataSet, 
     points(
       dttm, 
       as.numeric(as.character(DataSet$Sub_metering_2)),  
       type = "l", col = "red"
       )
     );

with(DataSet, 
     points(
       dttm, 
       as.numeric(as.character(DataSet$Sub_metering_3)),  
       type = "l", col = "blue"
     )
);

legend("topright", 
       lty=c(1,1,1), 
       lwd=c(2.5,2.5),
       col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ) 

dev.off();

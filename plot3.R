setwd("C:/Users/07115/Desktop/Cousera/Week1 Assignment")
plot3 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
plot3$Date <- as.Date(plot3$Date,"%d/%m/%Y")
plot3 <- subset(plot3,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
plot3 <- plot3[complete.cases(plot1),]
dateT <- paste(plot3$Date,plot3$Time)
dateT <- setNames(dateT, "DateTime")
plot3 <- plot3[ ,!(names(plot3) %in% c("Date","Time"))]
plot3 <- cbind(dateT, plot3)
plot3$dateT <- as.POSIXct(dateT)
with(plot3,
{
  plot(Sub_metering_1~dateT, type="l",ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateT,col='Red')
  lines(Sub_metering_3~dateT,col='Blue')
  
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=520, height=520)
dev.off()
setwd("C:/Users/07115/Desktop/Cousera/Week1 Assignment")
plot2 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
plot2$Date <- as.Date(plot2$Date,"%d/%m/%Y")
plot2 <- subset(plot2,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
plot2 <- plot2[complete.cases(plot1),]
dateT <- paste(plot2$Date,plot2$Time)
dateT <- setNames(dateT, "DateTime")
plot2 <- plot2[ ,!(names(plot2) %in% c("Date","Time"))]
plot2 <- cbind(dateT, plot2)
plot2$dateT <- as.POSIXct(dateT)
plot(plot2$Global_active_power~plot2$dateT, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
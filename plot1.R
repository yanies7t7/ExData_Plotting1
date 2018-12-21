setwd("C:/Users/07115/Desktop/Cousera/Week1 Assignment")
plot1 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
plot1$Date <- as.Date(plot1$Date,"%d/%m/%Y")
plot1 <- subset(plot1,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
plot1 <- plot1[complete.cases(plot1),]
dateT <- paste(plot1$Date,plot1$Time)
dateT <- setNames(dateT, "DateTime")
plot1 <- plot1[ ,!(names(plot1) %in% c("Date","Time"))]
plot1 <- cbind(dateT, plot1)
plot1$dateT <- as.POSIXct(dateT)
hist(plot1$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
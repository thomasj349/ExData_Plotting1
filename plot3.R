data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

datetime <- paste(data$Date, data$Time)

datetime <- setNames(datetime, "DateTime")

data <- data[ ,!(names(data) %in% c("Date","Time"))]

data$datetime <- as.POSIXct(datetime)

plot(data$Sub_metering_1~data$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2~data$datetime, col = "red")
lines(data$Sub_metering_3~data$datetime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)

dev.copy(png, "plot3.png",width=480, height=480 )
dev.off()

dev.off()

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./data/plot.zip")
unzip("./data/plot.zip", exdir  ="./data")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

datetime <- paste(data$Date, data$Time)

datetime <- setNames(datetime, "DateTime")

data <- data[ ,!(names(data) %in% c("Date","Time"))]

data$datetime <- as.POSIXct(datetime)

hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png, "plot1.png", width=480, height=480)

dev.off()

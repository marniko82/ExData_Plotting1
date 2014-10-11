setwd("C:/Users/Nikolici/Desktop/ExploDataAnalysis")

#Data preparation
#read source file, extract needed dates, convert dates and times to appropriate format
#convert numeric values to numeric, vhange ? with NA
#script assumes data is in working directory
#date and time pasted into a new variable

data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
subset <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
subset$DateTime <- strptime(paste(subset$Date, subset$Time), format="%d/%m/%Y %H:%M:%S")
subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))
subset$Global_reactive_power <- as.numeric(as.character(subset$Global_reactive_power))
subset$Voltage <- as.numeric(as.character(subset$Voltage))
subset$Global_intensity <- as.numeric(as.character(subset$Global_intensity))
subset$Sub_metering_1 <- as.numeric(as.character(subset$Sub_metering_1))
subset$Sub_metering_2 <- as.numeric(as.character(subset$Sub_metering_2))
subset$Sub_metering_3 <- as.numeric(as.character(subset$Sub_metering_3))

#plot histogram of Global active power
hist(subset$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

#save as png
dev.copy(png, file="plot1.png")
dev.off()

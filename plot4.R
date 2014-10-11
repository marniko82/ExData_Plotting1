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

#set up parameters for plotting of multiple graphs
par(mfrow=c(2,2))

#plot Global active power vs time
plot(subset$DateTime,subset$Global_active_power, type="n", xlab="",main="", ylab="Global Active Power (kilowatts)")
lines(subset$DateTime,subset$Global_active_power)

#plot Voltage vs time
plot(subset$DateTime,subset$Voltage, type="n", xlab="datetime",main="", ylab="Voltage")
lines(subset$DateTime,subset$Voltage)

#plot sub metering; metering 1 chosen for y axis as it contains the maximum value of all sub meterings
plot(subset$DateTime,subset$Sub_metering_1, type="n", xlab="",main="", ylab="Energy sub metering")
lines(subset$DateTime,subset$Sub_metering_1, col="black")
lines(subset$DateTime,subset$Sub_metering_2, col="red")
lines(subset$DateTime,subset$Sub_metering_3, col="blue")
legend("topright",inset=0.11,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6, bty="n",pch=c(NA,NA,NA),lwd=1, lty=c(1,1,1),col=c("black","red","blue"))

#plot Global reactive power vs time
plot(subset$DateTime,subset$Global_reactive_power, type="n", xlab="",main="", ylab="Global Reactive Power (kilowatts)")
lines(subset$DateTime,subset$Global_reactive_power)


#save as png
dev.copy(png, file="plot4.png")
dev.off()

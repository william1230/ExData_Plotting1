## Read data from file and subset data for 1/2/2007 & 2/2/2007
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Converting the data type
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

## Set plotting device to PNG plot line graph
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## First graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

## Second graph
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

## Third graph
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

## Forth graph
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()

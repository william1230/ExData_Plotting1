## Read data from file and subset data for 1/2/2007 & 2/2/2007
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Set plotting device to PNG plot histogram
png("plot1.png", width=480, height=480)
hist(as.numeric(subSetData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

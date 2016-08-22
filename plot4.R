#reading whole dataset
fulldata <- read.delim("household_power_consumption.txt", sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

#Datetime conversions
fulldata$strptime <- strptime(paste(fulldata$Date, fulldata$Time), "%d/%m/%Y %H:%M:%S")

#Subsetting only 2 days worth of data
date_begin <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
date_end <- strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")
twodays <- subset(fulldata, fulldata$strptime>=date_begin & fulldata$strptime<date_end)

#Opening the device and plotting
png(filename="plot4.png", width = 480, height = 480)
par(mfrow=c(2, 2))

#First plot
plot(twodays$strptime, twodays$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab=NA)

#Second plot
plot(twodays$strptime, twodays$Voltage , ylab="Voltage", type="l", xlab="datetime")

#Third plot
plot(twodays$strptime, twodays$Sub_metering_1, type="n", xlab=NA, ylab="Energy sub metering")
lines(twodays$strptime, twodays$Sub_metering_1,type="l")
lines(twodays$strptime, twodays$Sub_metering_2,type="l", col="red")
lines(twodays$strptime, twodays$Sub_metering_3,type="l", col="blue")
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c("solid", "solid", "solid"))

#Fourth plot
plot(twodays$strptime, twodays$Global_reactive_power , ylab="Global_reactive_power", type="l", xlab="datetime", lwd=1)
dev.off()
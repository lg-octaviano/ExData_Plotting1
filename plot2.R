#reading whole dataset
fulldata <- read.delim("household_power_consumption.txt", sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")

#Datetime conversions
fulldata$strptime <- strptime(paste(fulldata$Date, fulldata$Time), "%d/%m/%Y %H:%M:%S")

#Subsetting only 2 days worth of data
date_begin <- strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")
date_end <- strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S")
twodays <- subset(fulldata, fulldata$strptime>=date_begin & fulldata$strptime<date_end)

#Opening the device and plotting
png(filename="plot2.png", width = 480, height = 480)
plot(twodays$strptime, twodays$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab=NA)
dev.off()
source("readData.R")

subset <- getSubset()
timestamp <- strptime(paste(subset$Date, subset$Time), format="%Y-%m-%d %H:%M:%S")
globalActivePower <- as.numeric(subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(timestamp, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
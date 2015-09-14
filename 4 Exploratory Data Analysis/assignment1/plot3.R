source("readData.R")

subset <- getSubset()
timestamp <- strptime(paste(subset$Date, subset$Time), "%Y-%m-%d %H:%M:%S") 
globalActivePower <- as.numeric(subset$Global_active_power)
subMetering1 <- as.numeric(subset$Sub_metering_1)
subMetering2 <- as.numeric(subset$Sub_metering_2)
subMetering3 <- as.numeric(subset$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(timestamp, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(timestamp, subMetering2, type="l", col="red")#adding
lines(timestamp, subMetering3, type="l", col="blue")#adding
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=par("lwd"))
dev.off()
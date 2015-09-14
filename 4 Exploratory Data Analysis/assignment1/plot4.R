source("readData.R")

# get each variable
subset <- getSubset()
timestamp <- strptime(paste(subset$Date, subset$Time), "%Y-%m-%d %H:%M:%S") 
globalActivePower <- as.numeric(subset$Global_active_power)
globalReactivePower <- as.numeric(subset$Global_reactive_power)
voltage <- as.numeric(subset$Voltage)
subMetering1 <- as.numeric(subset$Sub_metering_1)
subMetering2 <- as.numeric(subset$Sub_metering_2)
subMetering3 <- as.numeric(subset$Sub_metering_3)

# creating png
png("plot4.png", width=480, height=480)

# 2*2 plots
par(mfrow = c(2, 2))

# 1) timestamp, globalActivePower
plot(timestamp, globalActivePower, type="l", xlab="", ylab="Global Active Power")

# 2) timestamp, globalActivePower
plot(timestamp, voltage, type="l", xlab="datetime", ylab="Voltage")

# 3) timestamp, subMetering1 subMetering2 subMetering3
plot(timestamp, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(timestamp, subMetering2, type="l", col="red")
lines(timestamp, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=par("lwd"), col=c("black", "red", "blue"), bty="n")

# 4) timestamp, globalReactivePower
plot(timestamp, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
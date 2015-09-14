source("readData.R")

subset <- getSubset()
globalActivePower <- as.numeric(subset$Global_active_power)
png(filename="plot1.png", width=480, height=480)
hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
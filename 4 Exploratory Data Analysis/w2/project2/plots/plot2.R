plots.dir <- file.path("plots")
source(file.path(plots.dir, "readData.R"))
readData()

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

BaltimoreNEI <- NEI[NEI$fips=="24510",]

## agregation
BaltimoreEmissionByYear <- aggregate(Emissions ~ year, BaltimoreNEI, FUN=sum)

## plot
png(file.path(plots.dir, 'plot2.png'), width=480, height=480)
with(BaltimoreEmissionByYear, 
     barplot(height=Emissions, names.arg=year, 
             xlab='Years', ylab='Total Emissions (Tons)', 
             main='Total Emission from PM2.5 ~ Year (Baltimore)'))
dev.off()
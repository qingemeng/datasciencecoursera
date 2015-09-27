library(ggplot2)
source('readData.R')
readData()

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

## merge data
NEIsubset <- subset(NEI, fips == "24510" & type=='ON-ROAD')
mergedData <- merge(NEIsubset, SCC, by="SCC")

## subset
subset <- mergedData[grepl("vehicle", mergedData$SCC.Level.Two, ignore.case=T),]

## aggregate
BaltimoreMoterVeheicleRelatedEmissionsByYear <- aggregate(Emissions ~ year, subset, FUN=sum)

## plot
png('plot5.png', width=480, height=480)

g <- ggplot(BaltimoreMoterVeheicleRelatedEmissionsByYear, aes(year, Emissions))
g <- g  +
    geom_bar(stat='identity', fill = "steelblue") +
    xlab('Years') +
    ylab(expression('Total Emissions (Tons)')) +
    ggtitle('Total Emission from Motor Vehicle Sources ~ Year (Baltimore)')

print(g)
dev.off()
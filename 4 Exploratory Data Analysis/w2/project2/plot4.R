library(ggplot2)
source('readData.R')
readData()

# Across the United States, 
# how have emissions from coal combustion-related sources changed from 1999–2008?

## merge data
mergedData <- merge(NEI, SCC, by="SCC")

## subset
subset <- mergedData[grepl('coal', mergedData$Short.Name, ignore.case=T),]

## aggregate
coalRelatedEmissionsByYear <- aggregate(Emissions ~ year, subset, FUN=sum)

## plot
png('plot4.png', width=480, height=480)

g <- ggplot(coalRelatedEmissionsByYear, aes(year, Emissions/10^6))
g <- g  +
    geom_bar(stat='identity', fill = "steelblue") +
    xlab('Years') +
    ylab(expression('Total Emissions (Million Tons)')) +
    ggtitle('Total Emission from Coal Combustion-related Sources ~ Year (US)')

print(g)
dev.off()
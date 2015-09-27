library(ggplot2)
plots.dir <- file.path("plots")
source(file.path(plots.dir, "readData.R"))
readData()

# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

## merge data
NEIsubset <- subset(NEI, (fips == "24510" | fips == "06037") & type=='ON-ROAD')
mergedData <- merge(NEIsubset, SCC, by="SCC")

## subset
subset <- mergedData[grepl("vehicle", mergedData$SCC.Level.Two, ignore.case=T),]

## aggregate
moterVeheicleEmissionsByYearAndFips <- aggregate(Emissions ~ year + fips, subset, FUN=sum)
moterVeheicleEmissionsByYearAndFips$fips[moterVeheicleEmissionsByYearAndFips$fips=="24510"] <- "Baltimore City"
moterVeheicleEmissionsByYearAndFips$fips[moterVeheicleEmissionsByYearAndFips$fips=="06037"] <- "Los Angeles County"

## plot
png(file.path(plots.dir, 'plot6.png'), width=960, height=480)

g <- ggplot(moterVeheicleEmissionsByYearAndFips, aes(year, Emissions, fill=fips))
g <- g  +
    facet_grid(. ~ fips) +
    geom_bar(stat='identity', aes(fill=year)) +
    xlab('Years') +
    ylab(expression('Total Emissions (Tons)')) +
    ggtitle('Total Emission from Motor Vehicle Sources ~ Year (Baltimore vs Los Angeles County)')

print(g)
dev.off()
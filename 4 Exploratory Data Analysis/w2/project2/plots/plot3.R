library(ggplot2)

plots.dir <- file.path("plots")
source(file.path(plots.dir, "readData.R"))
readData()

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

BaltimoreNEI <- NEI[NEI$fips=="24510",]

## agregation
BaltimoreEmissionByYearAndType <- aggregate(Emissions ~ year + type, BaltimoreNEI, FUN=sum)

## plot
png(file.path(plots.dir, 'plot3.png'), width=640, height=480)

g <- ggplot(BaltimoreEmissionByYearAndType, aes(year, Emissions, color=type))
g <- g  +
    geom_line() +
    xlab('Years') +
    ylab(expression('Total Emissions (Tons)')) +
    ggtitle('Total Emission from PM2.5 ~ Year and Type(Baltimore)')

print(g)
dev.off()
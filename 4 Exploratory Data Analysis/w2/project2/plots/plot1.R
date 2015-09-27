plots.dir <- file.path("plots")
source(file.path(plots.dir, "readData.R"))
readData()

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from
# all sources for each of the years 1999, 2002, 2005, and 2008.

## aggregation
emissionByYear <- aggregate(Emissions ~ year, NEI, FUN=sum)

## plot
png(file.path(plots.dir, 'plot1.png'), width=480, height=480)
with(emissionByYear, 
     barplot(height=Emissions/10^6, names.arg=year, 
             xlab='Years', ylab='Total Emissions (Million Tons)', 
             main='Total Emission from PM2.5 ~ Year'))
dev.off()
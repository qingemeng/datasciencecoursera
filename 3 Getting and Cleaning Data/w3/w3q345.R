fileSourceGDP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileSourceGDP, destfile="FGDP.csv", method="curl")

fileSourceEDU <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileSourceEDU, destfile="EDU.csv", method="curl")

gdp <- read.csv("FGDP.csv")
edu <- read.csv("EDU.csv")

names(gdp)
names(gdp) <- c("short.code", "ranking", "X.1", "full.name", "gdp", "X.4", "X.5", "X.6", "X.7", "X.8" )
names(edu)
head(gdp)
head(edu)
# X = CountryCode
gdpclean<-gdp[5:194,]
mergedData=as.data.frame(merge(gdpclean,edu,by.x="short.code",by.y="CountryCode"))
names(mergedData)
#View(mergedData)
nrow(mergedData)
# 189 matches
sortedDF <- mergedData[order(as.numeric(as.character(mergedData$ranking)), decreasing=T),]
#head(sortedDF,5)
#tail(sortedDF,1)
sortedDF$full.name[13]
# St. Kitts and Nevis
# end of q3

mergedData$ranking <- as.numeric(as.character(mergedData$ranking))
summary(mergedData[mergedData$Income.Group=="High income: OECD",])
summary(mergedData[mergedData$Income.Group=="High income: nonOECD",])
# end of q4

quantile(mergedData$ranking,probs=c(0.2,0.4,0.6,0.8,1), na.rm=T)

install.packages("Hmisc")
library(Hmisc)
mergedData$rankGroup<-cut2(mergedData$ranking,g=5)
table(mergedData$Income.Group,mergedData$rankGroup)
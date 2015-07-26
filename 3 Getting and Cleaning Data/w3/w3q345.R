fileSourceGDP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileSourceGDP, destfile="FGDP.csv", method="curl")

fileSourceEDU <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileSourceEDU, destfile="EDU.csv", method="curl")

gdp <- read.csv("FGDP.csv")
edu <- read.csv("EDU.csv")

X=CountryCode
names(gdp)
names(edu)
head(gdp)
head(edu)

gdpclean<-gdp[5:194,]
mergedData=as.data.frame(merge(gdpclean,edu,by.x="X",by.y="CountryCode"))
mergedData$Gross.domestic.product.2012 = as.numeric(as.character(mergedData$Gross.domestic.product.2012))
summary(mergedData[mergedData$Income.Group=="High income: OECD",])

quantile(mergedData$Gross.domestic.product.2012,probs=c(0.2,0.4,0.6,0.8,1))
install.packages("Hmisc")
library(Hmisc)
mergedData$gdp=cut2(mergedData$Gross.domestic.product.2012,g=5)
table(mergedData$Income.Group,mergedData$gdp)


# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
# download.file(fileUrl, destfile="gdp.csv", method="curl")
gdp <- read.csv("gdp.csv")

#View(gdp)
cleanedData <- gsub(",", "",gdp[5:194,]$X.3)
cleanedData2 <- gsub(" ","", cleanedData)
mean <- mean(as.numeric(cleanedData), na.rm=T)

# Q3
countryNames <- gdp[5:194,]$X.2
indexes <- grep("^United", countryNames)
count <- length(indexes)
count
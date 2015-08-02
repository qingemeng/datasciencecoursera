fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="gdpq4.csv", method="curl")
gdp <- read.csv("gdpq4.csv")
cleanedGdp <- gdp[5:194, c(1,2,4,5)]
colnames(cleanedGdp) <- c("CountryCode", "Ranking", "Economy", "GDP")

# View(cleanedGdp)

fileEDUUril <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileEDUUril, destfile="eduq4.csv", method="curl")
edu <- read.csv(file="eduq4.csv")
# View(edu)
names(edu)
mergedData <- merge(cleanedGdp, edu, by="CountryCode", all=T)
head(mergedData)
#View(mergedData)
names(mergedData)
names(mergedData) <- tolower(names(mergedData))

specialNote <- mergedData$special.notes
length(grep("Fiscal year end: June", specialNote))

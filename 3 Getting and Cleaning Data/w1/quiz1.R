#q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="q1.csv", method="curl")
dateDownloaded <- date()
q1Data <- read.csv("q1.csv")
#View(q1Data)
r <- q1Data[q1Data$VAL==24 & !is.na(q1Data$VAL),]
nrow(r)

#q2
#Tidy data has one variable per column.

#q3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile="q2.xlsx", method="curl")
dateDownloaded3 <- date()
install.packages("xlsx")
library(xlsx)
dat <- read.xlsx("q2.xlsx", sheetIndex=1, rowIndex=8:23, colIndex=7:15)
sum(dat$Zip*dat$Ext,na.rm=T) 

#q4
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", destfile="q4.xml", method="curl")
install.packages("XML")
library(XML)
doc <- xmlTreeParse(file="q4.xml", useInternalNodes=T)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
#rootNode[[1]][[1]]
zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
typeof(zipcodes)
length(zipcodes[zipcodes==as.character(21231)])

#q5
install.packages("data.table")
library(data.table)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile="q5.csv", method="curl")
DT <- fread("q5.csv")
DT[,mean(pwgtp15),by=SEX]

library(sqldf)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "w3q1.csv", method = "curl")
dateDownloaded <- date()
acs <- read.table("./w3q1.csv",sep=",",header=TRUE)
head(acs)
# households on greater than 10 acres who sold more than $10,000 worth of agriculture products
# ACR=3 AND AGS=6
agricultureLogical<-(acs$ACR==3 & acs$AGS==6)
which(agricultureLogical)
# class(agricultureLogical)
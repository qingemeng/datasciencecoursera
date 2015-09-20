library(sqldf)
setwd("/Users/gemengqin/Documents/dev/datasciencecoursera/3 Getting and Cleaning Data/w2")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url, destfile="q2.csv", method="curl")
acs <- read.csv("q2.csv")
sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select distinct AGEP from acs")
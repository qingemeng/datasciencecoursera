fileSource <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv";
download.file(fileSource, destfile="survey.csv", method="curl")
housingData <- read.csv("survey.csv")
splitNames <- strsplit(names(housingData), "wgtp")
splitNames[[123]] # ""   "15"
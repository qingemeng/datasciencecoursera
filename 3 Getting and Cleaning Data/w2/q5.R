url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url, destfile="q5.for", method="curl")
data5 <- read.fwf("q5.for", widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
sum <- sum(data5[,4])
sum

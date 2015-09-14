# setwd("../../exdata")
getSubset <- function()
{
    fileZip = "exdata_plotting1.zip"
    fileTxt <- "household_power_consumption.txt"
    # if file doesn't exit, download, unzip
    if(!file.exists(fileZip))
    {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                      destfile="exdata_plotting1.zip", 
                      method="curl")
        unz(fileZip, fileTxt)
    }
    
    # read only data 2007-02-01 and 2007-02-02
    DT <- read.table(fileTxt, header=T, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
    DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")
    startDate <- as.Date("01/02/2007", format="%d/%m/%Y")
    endDate <- as.Date("02/02/2007", format="%d/%m/%Y")
    subset <- DT[DT$Date >= startDate & DT$Date <= endDate, ]
}
readData <- function()
{ 
    ## download data
    if(!file.exists('NEI_data.zip'))
    {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="NEI_data.zip", method="curl")
        download.date <- date()
        unzip("NEI_data.zip")
    }
    
    ## read data and make it global variables
    if(!exists("NEI"))
    {
        NEI <<- readRDS("summarySCC_PM25.rds")
    }
    if(!exists("SCC"))
    {        
        SCC <<- readRDS("Source_Classification_Code.rds")
    }
}
readData <- function()
{ 
    ## download data
    data.dir <- file.path("NEI_data")
    if(!dir.exists(data.dir))
    {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="NEI_data.zip", method="curl")
        download.date <- date()
        unzip("NEI_data.zip", exdir="NEI_data")
    }
    
    ## read data and make it global variables
    if(!exists("NEI"))
    {
        NEI <<- readRDS(file.path(data.dir, "summarySCC_PM25.rds"))
    }
    if(!exists("SCC"))
    {        
        SCC <<- readRDS(file.path(data.dir, "Source_Classification_Code.rds"))   
    }
}

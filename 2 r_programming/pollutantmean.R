pollutantmean <- function(directory, pollutant, id = 1:332)
{
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".   
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    ## read all csv files as a list
    data.selected <- readCSVs(directory,id)


    ## calculate mean of target data
    round(calculateMean(data.selected, pollutant), 3)    
}

readCSVs <- function( directory, id )
{
    files.names <- list.files( directory, pattern="*.csv")
    files.fullNames <- file.path(directory, files.names)    
    seltectedFiles.contents <- lapply(files.fullNames[id], read.csv)
}

calculateMean <- function(dataSets, pollutant)
{
    pollutantCol <- sapply(dataSets, FUN = function(x) x[ ,pollutant])
    flattened <- unlist(pollutantCol) 
    mean(flattened, na.rm = TRUE)
}

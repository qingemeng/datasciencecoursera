complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    data.selected <- readCSVs(directory,id)
    
    filteredCases <- lapply(data.selected, FUN=function(x) x[complete.cases(x), ])
    nobs <- sapply(filteredCases, nrow)
    
    data.frame(id,nobs)
}

readCSVs <- function( directory, id )
{
    files.names <- list.files( directory, pattern="*.csv")
    files.fullNames <- file.path(directory, files.names)    
    seltectedFiles.contents <- lapply(files.fullNames[id], read.csv)
}

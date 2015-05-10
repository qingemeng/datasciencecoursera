corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    source("complete.R")
    corrNum <- numeric(0)
    
    completeData <- complete("specdata")
    
    valid.Ids <- completeData[completeData$nobs > threshold, ]$id
    valid.data <- readCSVs(directory, valid.Ids)

    corrNum <- sapply( valid.data, function(each) cor(each$nitrate, each$sulfate, use="pairwise.complete.obs"))
    if(length(corrNum) != 0)
    {
        #round(corrNum, 5)
        corrNum
    }
    else
        numeric(0)
}
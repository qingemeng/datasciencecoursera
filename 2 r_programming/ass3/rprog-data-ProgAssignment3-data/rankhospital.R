rankhospital <- function(state, outcome, num = "best")
{
    if(num == "best")
    {
        source("best.R")
        return(best(state, outcome))
    }
    
    if(num == "worst")
    {
        source("worst.R")
        return(worst(state, outcome))
    }

    ## const
    STATE <- 7
    HOSPITAL.NAME = 2
    OUTCOMES <- c("heart attack", "heart failure", "pneumonia")
    INDEXES <- c(11, 17, 23)
    
    indexTable <- data.frame(OUTCOMES, INDEXES)
    
    ## Read outcome data
    data = read.csv("outcome-of-care-measures.csv")
    
    ## Check that state and outcome are valid
    validState <- sapply(data[,7], function(x) any(x == state))
    if (all(validState != TRUE))
    {
        stop("invalid state")
    }
    
    validOutcome <- sapply(OUTCOMES, function(x) any(x == outcome))
    if (all(validOutcome != TRUE))
    {
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    index <- indexTable[indexTable$OUTCOMES == outcome,]$INDEXES
    #print(index)
    dataState <- data[validState,]
    #return(dataState)
    if(num > nrow(dataState))
        return(NA)
    #return(dataState)
    rates <- data[validState,][,index]
    #return(as.double(as.character(rates)))
    
    order <- order(as.double(as.character(rates)))
    sorted <- sort(as.double(as.character(rates)))
    rangeId <- which(dataState[order[num],][,index] == sorted)
    
    #return(minRate)
    #print(dataState[,index])
    #return(rank)
    
    sameValue<- dataState[order[num],][,index] == dataState[,index]
    #print(order[61])
    
    sortedHospital = sort(as.character(dataState[sameValue,]$Hospital.Name))
    
    if(length(rangeId) < 2)
        return(as.character(dataState[num,]$Hospital.Name)[1])

    resultTable <- data.frame(rankId = rangeId, hospital = sortedHospital)
    #print(resultTable)
    as.character(resultTable[resultTable$rankId == num,]$hospital)[1]   
    
}
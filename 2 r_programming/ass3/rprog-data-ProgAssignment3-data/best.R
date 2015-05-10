
best <- function(state, outcome) 
{
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
    rates <- data[validState,][,index]
    #return(rates)
    
    minRate <- min(as.double(as.character(rates)), na.rm=TRUE)
    #return(minRate)
    #print(dataState[,index])
    #return(minRate)
    
    record <- dataState[as.double(as.character(dataState[,index])) == minRate,]#$Hospital.Name[1]
    record <- record[!is.na(record$Hospital.Name),]
    #return(record)
    sort(as.character(record$Hospital.Name))[1]
    #findLowestestRateHospital(dataState,rates)
    #$Hospital.Name[1]
}


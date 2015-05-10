rankall <- function(outcome, num = "best") {
    ## const
    STATE <- 7
    HOSPITAL.NAME = 2
    OUTCOMES <- c("heart attack", "heart failure", "pneumonia")
    INDEXES <- c(11, 17, 23)
    
    indexTable <- data.frame(OUTCOMES, INDEXES)
    
    ## Read outcome data
    data = read.csv("outcome-of-care-measures.csv")
    
    validOutcome <- sapply(OUTCOMES, function(x) any(x == outcome))
    if (all(validOutcome != TRUE))
    {
        stop("invalid outcome")
    }
    groups <- split(data, data[,STATE])
    #print(groups)
    states <- names(groups)
    #print(states)
    
    ## For each state, find the hospital of the given rank
    if(num == "best")
    {
        source("best.R")
        hospitals <- lapply(groups, function(x) best(x[,STATE], outcome))
        data.frame(hospital = unlist(hospitals), state = states)
    }
    
    if(num == "worst")
    {
        source("worst.R")
        hospitals <- lapply(groups, function(x) worst(x[,STATE], outcome))
        data.frame(hospital = unlist(hospitals), state = states)
    }
    
    source("rankhospital.R")

    hospitals <- lapply(groups, function(x) rankhospital(x[,STATE], outcome, num))
    data.frame(hospital = unlist(hospitals), state = states)
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
}
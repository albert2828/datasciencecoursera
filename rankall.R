library(dplyr)
rankall <- function(outcome, num = "best") {
      ## Read outcome data
      outcome_data <- read.csv("outcome-of-care-measures.csv", 
                               na.strings = "Not Available", stringsAsFactors = FALSE)
      outcome_names <- c("heart attack", "heart failure", "pneumonia")
      
      ## Check that outcome is valid
      
      if(is.element(outcome,outcome_names)==FALSE){
            stop("invalid outcome")
      }
      
      ## For each state, find the hospital of the given rank
      if(outcome == outcome_names[1]){
            col_num <- 11
      }
      
      if(outcome == outcome_names[2]){
            col_num <- 17
      }
      
      if(outcome == outcome_names[3]){
            col_num <- 23
      }
      
      my_data <- subset(outcome_data, select = c(2,7, col_num))
      my_data <- arrange(my_data, my_data[,2], my_data[,3], my_data[,1])
      state <- unique(my_data$State)
      
      if(num == "best"){
         hospital <- sapply(split(my_data,my_data$State),function(x)x[1,1])
      }
      
      if(num == "worst"){
         hospital <- sapply(split(my_data, my_data$State), 
                                       function(x)x[sum(complete.cases(x[,2])),1])
      }
      
      if(is.numeric(num)==TRUE){
         hospital <- sapply(split(my_data,my_data$State),function(x)x[num,1])
      }
      
      ## Return a data frame with the hospital names and the
      ## (abbreviated) state name
      
      ranked_hos <- data.frame(hospital,state)
      ranked_hos
}
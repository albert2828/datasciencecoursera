library(dplyr)
rankall <- function(outcome, num = "best") {
      ## Read outcome data
      outcome_data <- read.csv("outcome-of-care-measures.csv", 
                               na.strings = "Not Available", stringsAsFactors = FALSE)
      outcome_names <- c("heart attack", "heart failure", "pneumonia")
      
      ## Check that state and outcome are valid
      
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
      state <- unique(my_data$State)
      
      for (i in length(state_names)) {
            hospital <- c()
            st <- state[i]
            my_data_2 <- subset(my_data, State == st)
            available <- sum(complete.cases(my_data_2[,2]))
            
            if(num == "best"){
                  r <- my_data_2[1,1]
            }
            
            if(num == "worst"){
                  r <- my_data_2[available,1]
            }
            
            if(is.numeric(num)==TRUE & num>available){
                  r <- NA
            }
            
            if(is.numeric(num)==TRUE){
                  r <- my_data_2[num,1]
            }
            
            hospital <- c(hospital,r)
            hospital
      }
      
      ## Return a data frame with the hospital names and the
      ## (abbreviated) state name
      
      
      ran_hos <- data.frame(state,hospital)
      ran_hos
}
library(dplyr)
rankhospital <- function(state, outcome, num){
      
  ## Read outcome data   
      outcome_data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available")
      outcome_names <- c("heart attack", "heart failure", "pneumonia")
  
  
  ## Check that state and outcome are valid
      if(is.element(state,outcome_data$State)==FALSE){
          stop("invalid state")
        } 
  
      if(is.element(outcome,outcome_names)==FALSE){
          stop("invalid outcome")
      }
      
      ## Return hospital name in that state with the given rank
      ## 30-day death rate
      
      if(outcome == outcome_names[1]){
        col_num <- 11
      }
      
      if(outcome == outcome_names[2]){
        col_num <- 17
      }
      
      if(outcome == outcome_names[3]){
        col_num <- 23
      }
      
      my_data <- subset(outcome_data, State == state, select = c(2,col_num))
      my_data_2 <- arrange(my_data, my_data[,2], my_data[,1])
      available <- sum(complete.cases(my_data[,2]))
      
      if(num == "best"){
        ranked <- my_data_2[1,1]
      }
      
      if(num == "worst"){
        ranked <- my_data_2[available,1]
      }
      
      if(is.numeric(num)==TRUE & num>available){
        message("num is greater than observations")
        return(NA)
      }
      
      if(is.numeric(num)==TRUE){
        ranked <- my_data_2[num,1]
      }
      
      ranked
}
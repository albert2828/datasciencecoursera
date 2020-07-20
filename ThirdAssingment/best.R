best <- function(state, outcome){
      
      if(is.element(state,outcome_2$State)==FALSE){
            stop("invalid state")
      } 
      
      if(is.element(outcome,outcome_names)==FALSE){
            stop("invalid outcome")
      }
      
      my_data <- subset(outcome_2, State == state, select = c("hospital",outcome))
      my_data <- arrange(my_data, my_data[,2], my_data[,1])
      da_best <- my_data[1,1]
      da_best
}
complete <- function(directory, id =1:332){
      nobs <- c()
      for (i in id) {
            if(i < 10){
                  path <- paste(directory, "/", 0, 0, i,".csv", sep = "")
            }
            else if (i>= 10 & i < 100){
                  path <- paste(directory, "/", 0, i,".csv", sep = "")
            }
            else {
                  path <- paste(directory, "/", i,".csv", sep = "")
            }
            cobs<- sum(complete.cases(read.csv(path)))
            nobs <- c(nobs, cobs)
      }
      completecases <- data.frame(id, nobs)
      completecases
}

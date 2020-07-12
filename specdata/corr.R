corr <- function(directory, threshold = 0){
   correlations <- c()
   for (i in 1:332) {
      my_data <- complete(directory, i )
      if(threshold < my_data[["nobs"]] & i <10){
         sulfate <- read.csv(paste(directory, "/", 0, 0, i,".csv", sep = ""))[["sulfate"]]
         nitrate <- read.csv(paste(directory, "/", 0, 0, i,".csv", sep = ""))[["nitrate"]]
         correlations1 <- cor(sulfate,nitrate, use = "complete.obs")
         correlations <- c(correlations,correlations1)
      }
      else if(threshold < my_data[["nobs"]] & i >=10 & i<100){
         sulfate <- read.csv(paste(directory, "/", 0, i,".csv", sep = ""))[["sulfate"]]
         nitrate <- read.csv(paste(directory, "/", 0, i,".csv", sep = ""))[["nitrate"]]
         correlations1 <- cor(sulfate,nitrate,  use = "complete.obs")
         correlations <- c(correlations,correlations1)
      }
      else if(threshold < my_data[["nobs"]] & i >=100){
         sulfate <- read.csv(paste(directory, "/", i,".csv", sep = ""))[["sulfate"]]
         nitrate <- read.csv(paste(directory, "/", i,".csv", sep = ""))[["nitrate"]]
         correlations1 <- cor(sulfate,nitrate,  use = "complete.obs")
         correlations <- c(correlations,correlations1)
      }
   }
   correlations
}
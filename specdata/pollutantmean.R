pollutantmean <- function(directory , pollutant , id = 1:332){
      my_data <- c()
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
            my_data <- c(my_data,read.csv(path)[[pollutant]]) 
      }
      my_data
      mean(my_data, na.rm = TRUE)
}

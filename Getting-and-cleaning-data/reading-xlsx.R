library(openxlsx) #xlsx package is not working

if(!file.exists("data")){
      dir.create("data")
}

fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./data/cameras.xlsx", mode = "wb")

datedownladed <- date()

cameraData <- read.xlsx(".data/cameras.xlsx", sheetIndex = 1, header= TRUE) # sheetIndex indicate where the data is
head(cameraData)

colIndex <- 2:3
rowIndex <- 1:4


##extract specific columns and rows (with xlsx package)
cameraDataSubset <- read.xlsx(".data/cameras.xlsx", sheet = 1, 
                              cols = colIndex, rows = rowIndex) 

write.xlsx #writes an Excel file with similar arguments

read.xlsx2() #faster than read.xlsx (but is from xlsx package)

#there is an "XLConnect" paackage with more options


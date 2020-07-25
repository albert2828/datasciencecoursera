library(openxlsx) #xlsx package is not working

if(!file.exists("data")){
      dir.create("data")
}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, destfile = "./data/natural_gas.xlsx", mode = "wb")

rowIndex <- 18:23
colIndex <- 7:15

dat <- read.xlsx("natural_gas.xlsx",sheet = 1,rows = rowIndex, cols = colIndex)
sum(dat$Zip*dat$Ext,na.rm = T)

library(XML)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
library(RCurl)
xData <- getURL(fileURL)
doc <- xmlTreeParse(xData,useInternal = TRUE)
rootNode <- xmlRoot(doc)

zipcode <-xpathSApply(rootNode, "//zipcode", xmlValue)
zp <- zipcode=="21231"
sum(zp)


#reading xml

library(XML)

library(RCurl)

fileUrl <- "https://www.w3schools.com/xml/simple.xml"

xData <- getURL(fileUrl) ##the getURL() of Rcurl helps fetch the https 
                        ##URL which can be then parsed by xml

doc <- xmlTreeParse(xData,useInternal = TRUE)

rootNode <- xmlRoot(doc)

xmlName(rootNode)

rootNode[[1]]

xmlSApply(rootNode,xmlValue) #Programatticly extract parts of the file

xpathSApply(rootNode, "//name", xmlValue) #get the items on the menu and prices

xpathSApply(rootNode, "//price", xmlValue)


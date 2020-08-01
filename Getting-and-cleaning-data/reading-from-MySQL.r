library(DBI)
library(RMariaDB)

ucscDB <- dbConnect(RMariaDB::MariaDB(), user="genome",
                    host="genome-mysql.cse.ucsc.edu") #Connection to Data Base
result <-  dbGetQuery(ucscDB, "show databases;") 
dbDisconnect(ucscDB) #Always disconnect

hg19 <- dbConnect(RMariaDB::MariaDB(), user="genome", db="hg19",
                     host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]


dbListFields(hg19, "affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

## Select and specific subset

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- dbFetch(query)
quantile(affyMis$misMatches)

affyMisSmall <- dbFetch(query, n=10)
dbClearResult(query)

dbDisconnect(hg19)
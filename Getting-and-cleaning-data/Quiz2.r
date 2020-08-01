## Getting and Cleaing Dada - Quiz 2
# Question 1

#install.packages("jsonlite")
library(jsonlite)
#install.packages("httpuv")
library(httpuv)
#install.packages("httr")
library(httr)

# Can be github, linkedin etc depending on application
oauth_endpoints("github")

# Change based on what you 
myapp <- oauth_app(appname = "github",
                   key = "c84dbb014e6492811035",
                   secret = "f94b72454889d094db7d405dc07527a0e5ce534d")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

# Take action on http error
#? stop_for_satus 
# "Converts http errors to R errors or warnings 
# - these should always be used whenever you're creating requests inside a function, 
# so that the user knows why a request has failed."

stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))

# Subset data.frame
gitDF[gitDF$full_name == "jtleek/datasharing", "created_at"] 


# Question 2

Americancomsurv_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

## Checking for and creating directories
if(!file.exists("data")){
      dir.create("data")
}
download.file(Americancomsurv_url, destfile = "./data/acs.csv", method = "curl")
dateDownloaded <- date()
dateDownloaded
setwd("data")
acs <- read.csv("acs.csv")

install.packages("sqldf")
library(sqldf)
library(DBI)

sqldf("select pwgtp1 from acs where AGEP <50")

# Question 3
sqldf("select distinct AGEP from acs")

# Question 4

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode
chara<- htmlCode[c(10, 20, 30, 100)]
nchar(chara)

# Question 5
install.packages("readr")
library(readr)

x <- read_fwf(
      file="https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for",   
      skip=4,
      fwf_widths(c(12, 7, 4, 9, 4, 9, 4, 9, 4)))
sum(x[4])

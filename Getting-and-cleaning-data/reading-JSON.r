#http:en.wikipedia.org/wiki/JSON

library(jsonlite)

jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")

names(jsonData)

myjSON <- toJSON(iris, pretty = TRUE) #Export to JSON
cat(myjSON)

iris2 <- fromJSON(myjSON)


## http//wwww.json.org/
## http://www.r-bloggers.com/new-package-jsonlite-a-smarter-jason-encoderdecoder/
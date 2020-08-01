library(httr)

myapp = oauth_app("twitter",
                  key = "yourcustomerKeyHere", secret="yourcustumerSecretHere")
sig = sign_oauth1.0(myapp,
                    token = "yourTokenHere",
                    token_secret = "yourTokenSecretHere")
homeTL = GET("http://api.twitter.com/1.1/statuses/home_timeline.json", sig)

## Converting to Json

library(jsonlite)

json1 = content(homTL)
json2 = jsonlite::fromJSON(toJson(json1))
json2[1,1:4]
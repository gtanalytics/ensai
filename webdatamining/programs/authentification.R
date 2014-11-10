
# Authetification
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
library(twitteR)

requestURL <- "https://api.twitter.com/oauth/request_token"
authURL  = "https://api.twitter.com/oauth/authorize"
accessURL= "https://api.twitter.com/oauth/access_token"
consumerKey ="41aJSZAJJj7G4fPVwwPLcg"
consumerSecret ="LVWbhrH5JpEwrwbUHfBMJsOtSKY1i8Ffc1IWnMpk48"
Access_token  = "2270851728-FrfnShWpLIJCFZgrKpPks1cE3aBoisUWpN6srTE"
Access_token_secret	="3LeYsUbQ5v1oyvk5Lw6N3jujCvazRe9dR0iO15xvNsmO8"
myacc <- OAuthFactory$new(consumerKey=consumerKey,
                          consumerSecret=consumerSecret,
                          requestURL=requestURL,
                          accessURL=accessURL, 
                          authURL=authURL)
myacc$handshake(cainfo = paste0(dir(),"/cacert.pem") , ssl.verifypeer = FALSE )
registerTwitterOAuth(myacc)
save(list="myacc", file="twitteR_credentials.RData")

library(devtools)
install_github("twitteR", username="geoffjentry")
library(twitteR)

install.packages("C:/Users/gtchinde/Downloads/logiciels/twitteR-master", repos = NULL, type="source")
library(twitteR)
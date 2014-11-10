# Authetification
# Librairies

# library(devtools)
# install_github("twitteR", username="geoffjentry")
# library(twitteR)
# install.packages("C:/Users/gtchinde/Downloads/logiciels/twitteR-master", repos = NULL, type="source")
# library(twitteR)


library(twitteR)
library(httr)

# requestURL <- "https://api.twitter.com/oauth/request_token"
# authURL  = "https://api.twitter.com/oauth/authorize"
# accessURL= "https://api.twitter.com/oauth/access_token"

consumerKey ="qbSB7fB2cZLUIc6ybXcMWeSH9"
consumerSecret ="fB2NYhochNFTRLEfiiTQsJsnUAzXqnMztMnfG0El9JBS0xlYj1"
access_token  = "2270851728-o5hipPTRTYgTOAV6LPAeiuHeRzKQODbOPV6Yg3q"
access_token_secret	="cmt8aZxc0CEvUk4jfgtSAmbg0Wg6rbaqbVg3uqZzsjb1s"

# Set up authentification to twitter
setup_twitter_oauth(consumer_key = consumerKey,consumer_secret = consumerSecret)
setup_twitter_oauth(consumer_key = consumerKey,consumer_secret = consumerSecret,
                    access_token=access_token, access_secret=access_token_secret)
# 
# 
# registerTwitterOAuth(myacc)
# save(list="myacc", file="twitteR_credentials.RData")


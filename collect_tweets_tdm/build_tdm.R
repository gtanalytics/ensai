#### Collecter des tweets et construire des TDM ####
# Date : Septembre 2014
# Auteur : GjT
# ------------------------------------------------ #

# On commence par des problèmes de proxy : comme toujours dès qu'on attaque le web à partir d'une entreprise sécurisée
#Sys.getenv("http_proxy")
#Sys.setenv(http_proxy="http://proxyconf.pj.fr/bc/proxy.js")
#options(RCurlOptions = list(verbose = TRUE,proxy = "http://proxyconf.pj.fr/bc/proxy.js"))

# Library
#install.packages("twitteR",dep=T)
library("twitteR", lib.loc="D:/myApp/R-3.1.1/library")
library(twitteR)
library(tm)
library(dplyr,quietly = TRUE)

# Authentification
load("twitteR_credentials.RData")
twitteR::registerTwitterOAuth(myacc)
# Récupération des tweets

tweets <- searchTwitter("#techitdays", n = 1000,cainfo="cacert.pem")j,z
tweets_so <- searchTwitter("solocal", n = 1000,cainfo="cacert.pem")
tweets_a_pj= searchTwitter("@pagesjaunes", n = 100,cainfo="cacert.pem")
# Exemple de tweets récupérés
tweets[1:5]
tweets_a_pj[1:5]

# Construire un dataframe à partir de la liste de tweets (tableau XL lignes|colonnes)
tweets_df <- do.call("rbind", lapply(tweets, as.data.frame))
tweets_dfso <- do.call("rbind", lapply(tweets_so, as.data.frame))
tweets_a_pj_df <- do.call("rbind", lapply(tweets_a_pj, as.data.frame))

# Back up en cas de connexion défaillante

write.table(tweets_df, "tweets_df.csv",sep=';') ; 
write.table(tweets_a_pj_df, "tweets_a_pj.csv",sep=';')
write.table(tweets_dfx, "tweets_so.csv",sep=';')

# Quelques infos sur les données récupérées
str(tweets_dfx)
length(unique(tweets_dfx$screenName)) # how many different twitter users
dim(tweets_dfx)

# Statistiques sur les utilisateurs
users = as.data.frame(table(tweets_dfx$screenName))

# Statistiques sur les mots les plus employés

# Préparation du corpus


prepare_text = function(x){
  x = sapply(tweets, function(x) x$getText())
#   x = tolower(x)
#   # remove rt
#   x = gsub("rt", "", x)
#   # remove at
  x = gsub("@\\w+", "", x)
#   # remove punctuation
#   x = gsub("[[:punct:]]", "", x)
#   # remove numbers
#   x = gsub("[[:digit:]]", "", x)
#   # remove links http
  x = gsub("http\\w+", "", x)
#   # remove tabs
#   x = gsub("[ |\t]{2,}", "", x)
#   # remove blank spaces at the beginning
#   x = gsub("^ ", "", x)
#   # remove blank spaces at the end
#   x = gsub(" $", "", x)
  #x=sapply(x,function(row) iconv(row,to='UTF-8'))
  return(x)
}
text_clean = prepare_text(tweets)
# Avant
tweets_df$text[1:5]
# Après
text_clean[1:5]

# Construire une tdm pour savoir ce qui se dit de Pages Jaunes

text_to_tdm = function(text){
  library(tm)
  corpus = Corpus(VectorSource(text)) 
  tdm = TermDocumentMatrix(
    corpus,
    control = list(
      removePunctuation = TRUE,
      stopwords = stopwords("fr"),
      removeNumbers = TRUE, tolower = TRUE) # sécurité si notre traitement manuel n'a pas fonctionné !
  )
}

tdm_pj = text_to_tdm(text_clean)

# A quoi cela ressemble?
inspect(tdm_pj[5:15,1:12])

# Les termes les plus fréquents

findFreqTerms(tdm,3)

# Les termes les plus liés entre eux 
findAssocs(tdm, "digital", corlimit=0.3)

# Les mots les plus fréquents
tdm_matrix = as.matrix(tdm)
wordcloud = data.frame(words= row.names(tdm_matrix),frequency=rowSums(tdm_matrix))
wordcloud = filter(wordcloud,frequency>=3)
head(arrange(wordcloud,desc(frequency)))

# Fréquence des mots les plus joués
wf =filter(wordcloud, frequency>=mean(wordcloud$frequency))
wf <- transform(wf, words = reorder(words, frequency))

library(ggplot2) ; library(ggthemes)
p <- ggplot(wf, aes(words, frequency))
p <- p + geom_bar(stat="identity",color="#DF0101",fill="#E6E6E6") +coord_flip()
p+theme_gdocs()+labs(title= "Mots les plus fréquents\ndans les tweets sur Pages Jaunes \n")

# Wordcloud

set.seed(142)
library(wordcloud)
wordcloud(wordcloud$words, wordcloud$frequency, scale=c(3, .1),
          colors=brewer.pal(6, "Dark2"))


### -------------------- Merci ----------------------------------

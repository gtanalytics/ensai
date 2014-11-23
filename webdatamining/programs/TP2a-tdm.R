#### Collecter des tweets et construire des TDM ####
# Date : Novembre 2014
# Auteur : GjT
# ------------------------------------------------ #

# Library
library(twitteR)
library(tm)
library(dplyr,quietly = TRUE)
library(XML)

# Authentification
load("twitteR_credentials.RData")
twitteR::registerTwitterOAuth(myacc)
# Récupération des tweets

tweets <- searchTwitter("pages jaunes", n = 1000,cainfo="cacert.pem")
tweets_so <- searchTwitter("solocal", n = 1000,cainfo="cacert.pem")
tweets_a_pj= searchTwitter("@pagesjaunes", n = 100,cainfo="cacert.pem")

# Exemple de tweets récupérés
tweets[1:5]
tweets_a_pj[1:5]

# Construire un dataframe à partir de la liste de tweets (tableau XL lignes|colonnes)
tweets_df <- do.call("rbind", lapply(tweets, as.data.frame))

# Statistiques sur les utilisateurs
users = as.data.frame(table(tweets_dfx$screenName))

# Fonctions les plus courantes de préparation du texte
prepare_text = function(x){
  x = tolower(x)
  x= gsub("rt", "", x)
  x = gsub("@\\w+", "", x)
  # remove punctuation
  x = gsub("[[:punct:]]", "", x)
  # remove numbers
  x = gsub("[[:digit:]]", "", x)
  # remove links http
  x = gsub("http\\w+", "", x)
  # remove tabs
  x = gsub("[ |\t]{2,}", "", x)
  # remove blank spaces at the beginning
  x = gsub("^ ", "", x)
  # remove blank spaces at the end
  x = gsub(" $", "", x)
  x=sapply(x,function(row) iconv(row,to='UTF-8'))
  return(x)
}

# Définition de l'URL
url_king = "http://www.let.rug.nl/usa/documents/1951-/martin-luther-kings-i-have-a-dream-speech-august-28-1963.php"

# Lecture du contenu de l'URL
king = readHTMLList(url_king)
doc_king = htmlTreeParse(url_king, useInternal=TRUE) # on parse le texte
discours = xpathApply(doc_king, '//p', xmlValue)
discours = unlist(discours) # transforme la liste en vecteur pour se ramener à l'objet de base de R


### 2) Etape 1 : pre-processing : nettoyage du texte 

# On enlève la poncutation
tmp = gsub("[[:punct:]]", "", discours)

# On enlève les "/n", les "/r"
tmp = gsub("\n", "", tmp)
tmp = gsub("\r", " ", tmp)

# On met tout en majuscule
tmp = tolower(tmp)


### 3) Etape 2 : comptage simple

# On rassemble les éléments en un seul
discoursComplet = paste(tmp, collapse=" ")
# table(discoursComplet) # la fonction table n'est pas adaptée à un corpus ! 

# On sépare le texte par mot : chaque mot est un élément
split = strsplit(discoursComplet, " ")
# On compte combien de fois apparait chaque mot
count = as.data.frame(table(split))
# On trie par ordre décroissant du nombre d'apparition
count = arrange(count,desc(Freq))

head(count)

# Utilisation de la librairie tm pour la manipulation des corpus
# La fonction prend en entrée un texte et renvoie une Term Doc Matrix
text_to_tdm = function(text){
  library(tm)
  corpus = Corpus(VectorSource(text)) 
  tdm = TermDocumentMatrix(
    corpus,
    control = list(
      removePunctuation = TRUE,
      stopwords = stopwords("en"), # Mots vide
      removeNumbers = TRUE, tolower = TRUE) # sécurité si notre traitement manuel n'a pas fonctionné !
  )
}
# Discours = discours récupéré
## Applications
text_tdm = text_to_tdm(discoursComplet)
print(text_tdm)

# A quoi cela ressemble?
head(inspect(text_tdm))
tail(inspect(text_tdm))
# Les termes les plus fréquents
findFreqTerms(text_tdm,10)
# Les termes les plus liés entre eux 
findAssocs(text_tdm, "day",corlimit = 0.01)

mat = as.matrix(text_tdm)%>% as.data.frame(.)
head(mat)
mat$word= row.names(mat)
mat$frequency = mat[,1]
mat = mat%>%select(word,frequency)%>%arrange(desc(frequency))

# Un autre système de pondération

text_to_tdm2 = function(text){
  library(tm)
  corpus = Corpus(VectorSource(text)) 
  tdm = TermDocumentMatrix(
    corpus,
    control = list(
      removePunctuation = TRUE,
      weighting =function(x) weightTfIdf(x),
      stopwords = stopwords("en"),
      removeNumbers = TRUE, tolower = TRUE) 
  )
}

text_tdm2 = text_to_tdm2(discours)
mat2 = as.matrix(text_tdm2)%>% as.data.frame(.)
mat2$word= row.names(mat2)
mat2$frequency = mat2[,1]
mat2 = mat2%>%select(word,frequency)%>%arrange(desc(frequency))

# Exercice de fin de TP : Représenter graphiquement les 10-15mots qui reviennent le plus?
# Aide : 
library(ggplot2) ; library(ggthemes)
threesold = 15
df_15freq <- arrange(mat,desc(frequency)) %>%
  head(threesold)

p <- ggplot(df_15freq, aes(word, frequency))
p <- p + geom_bar(stat="identity",fill="pink") +coord_flip()
p+labs(x="terms",y="Frequency",title="Histo des termes les plus utillisés")+theme_gdocs()

# Nuage de tags Wordcloud
install.packages('wordcloud')
library(wordcloud)
set.seed(142)
library(wordcloud)
wordcloud(mat$word, mat$frequency, scale=c(3, .1),
          colors=brewer.pal(6, "Dark2"))


### -------------------- Merci ----------------------------------

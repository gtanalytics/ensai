# Collecter les tweets et Construire une TDM
Gj Tchinde - Séminaire DT - TechItDays  

## Intro

La collecte d'informations sur le web passe en général par une logique de crawling, scrapping et d'API. Dans ce tutoriel, nous montrons comment se connecter à l'API de twitter pour récupérer des tweets et construire une term-document-matrix

## Définitions

### Crawler 
Robot d'indexation qui permet de parcourir le web de manière automatique. Faire un web crawler revient en général à collecter le contenu sur le web à des fins d'indexation et in fine, d'analyse

### Scrapper
On utilise souvent les mots scrapping et crawling de manière indistincte. Le web scraping est une technique d'extraction du contenu de sites Web, via un script ou un programme, dans le but de le transformer pour permettre son utilisation dans un autre contexte. 

Ainsi, pour nous, l'action de crawler et de scrapper sera identique.

### API

En informatique, une interface de programmation (souvent désignée par le terme API pour Application Programming Interface) est un ensemble normalisé de classes, de méthodes ou de fonctions qui sert de façade par laquelle un logiciel offre des services à d'autres logiciels. Elle est offerte par une bibliothèque logicielle ou un service web, le plus souvent accompagnée d'une description qui spécifie comment des programmes consommateurs peuvent se servir des fonctionnalités du programme fournisseur (source wikipedia).

L'objectif est de fournir une porte d'accès à une fonctionnalité en cachant les détails de la mise en uvre.

### Compte développeur Twitter

Un compte développeur chez Twitter permet de se connecter à Twitter et de récupérer les tweets.

[Cette vidéo](https://www.youtube.com/watch?v=YuJUtOfcKfo) montre en deux minutes comment procéder pour se créer un compte développeur.

Créer une application sur le site des développeurs de twitter, [dev.twitter.com](dev.twitter.com) générer 4 valeurs-clé appelées Consumer key, Consumer secret, Access token, et Access token secret qui seront utilisées pour authentifier et envoyer nos requêtes faites à partir de R.

### Term-Document-Matrix

Une matrice de matrice document terme ou terme-document est une matrice au sens mathématique du terme qui décrit la fréquence des termes qui aparaissent dans une collection de documents. 

Dans une tdm(term-document-matrix), les lignes correspondent aux documents de la collection et les colonnes correspondent à des termes. Il existe différents systèmes pour déterminer la valeur que chaque entrée de la matrice doit prendre. le plus répandu est la mesure tf-idf( Term Frequency-Inverse Document Frequency), mais aussi, tf(Term Frequency).

Ces tdm sont très utiles dans le traitement du langage naturel.

## R et Twitter : Quelques fonctions clés

### Installer les librairies essentielles dans R

Il existe plusieurs libairies dans R qui permettent de se connecter à l'API de twitter, de récupérer des tweets, et de les analyser.

les libairies les plus courantes sont `twitteR`, `streamR`

### Installer les librairies essentielles dans R

```r
> install.packages("ROAuth")
> install.packages("twitteR")
> install.packages("tm") # Bibliothèque de textmining qui contient plusieurs fonctions, notamment, celles permettant de réaliser des term-doc-matrix
```


### Se connecter à l'API de Twitter depuis R

```r
> download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
> library(twitteR)
> requestURL <- "https://api.twitter.com/oauth/request_token"
> authURL  = "https://api.twitter.com/oauth/authorize"
> accessURL= "https://api.twitter.com/oauth/access_token"
> consumerKey ="xxxx"
> consumerSecret ="xxxxxx"
> myacc <- OAuthFactory$new(consumerKey=consumerKey,
>                           consumerSecret=consumerSecret,
>                           requestURL=requestURL,
>                           accessURL=accessURL, 
>                           authURL=authURL)
> myacc$handshake(cainfo = paste0(dir(),"/cacert.pem") , ssl.verifypeer = FALSE )
> registerTwitterOAuth(myacc)
> save(list="myacc", file="twitteR_credentials.RData")
```

La fonction `save(list="myacc", file="twitteR_credentials.RData")` permet de se passer de l'authentification à chaque fois que l'on a besoin de se connecter à l'API. Il s'agit d'enrégistrer ces informations de connexion et d'en faire usage par une simple fonction `load()` et ainsi, d'éviter de diffuser son mot de passe en clair.


### Collecter les tweets à partir de R

> Etape 1 : S'authentifier


```r
> # Library
> library(twitteR)
> library(tm)
> # Authentification
> load("twitteR_credentials.RData")
> registerTwitterOAuth(myacc)
```

> Etape 2 : Récupérer des tweets


```r
> tweets <- searchTwitter("pages jaunes", n = 1000,cainfo="cacert.pem")
> tweets_so <- searchTwitter("solocal", n = 1000,cainfo="cacert.pem")
> tweets_a_pj= searchTwitter("@pagesjaunes", n = 100,cainfo="cacert.pem")
> # Exemple de tweets récupérés
> tweets[1:5]
> tweets_a_pj[1:5]
```

## Construire une TDM

Dans une tdm(term-document-matrix), les lignes correspondent aux documents de la collection et les colonnes correspondent à des termes. Il existe différents systèmes pour déterminer la valeur que chaque entrée de la matrice doit prendre.

> Etape 3

Mettre tous les tweets dans un tableau lignes/colonnes


```r
> # Construire un dataframe à partir de la liste de tweets (tableau XL lignes|colonnes)
> tweets_df <- do.call("rbind", lapply(tweets, as.data.frame))
> tweets_dfso <- do.call("rbind", lapply(tweets_so, as.data.frame))
> tweets_a_pj_df <- do.call("rbind", lapply(tweets_a_pj, as.data.frame))
```

On peut consulter grâce à des fonctions de la librairie `twitteR` des premières informations sur les tweets de manière rapide


```r
> # Quelques infos sur les données récupérées
> str(tweets_dfx)
> length(unique(tweets_dfx$screenName)) # how many different twitter users
> dim(tweets_dfx)
```

> Etape 4 : Constituer un corpus à partir de tous les tweets et en faire une analyse textuelle pour extraire du sens


```r
> # Statistiques sur les mots les plus employés
> 
> # Préparation du corpus
> 
> prepare_text = function(x){
>   x = sapply(tweets, function(x) x$getText())
> #   x = tolower(x)
> #   # remove rt
> #   x = gsub("rt", "", x)
> #   # remove at
>   x = gsub("@\\w+", "", x)
> #   # remove punctuation
> #   x = gsub("[[:punct:]]", "", x)
> #   # remove numbers
> #   x = gsub("[[:digit:]]", "", x)
> #   # remove links http
>   x = gsub("http\\w+", "", x)
> #   # remove tabs
> #   x = gsub("[ |\t]{2,}", "", x)
> #   # remove blank spaces at the beginning
> #   x = gsub("^ ", "", x)
> #   # remove blank spaces at the end
> #   x = gsub(" $", "", x)
>   #x=sapply(x,function(row) iconv(row,to='UTF-8'))
>   return(x)
> }
> text_clean = prepare_text(tweets)
> # Avant
> tweets_df$text[1:5]
> # Après
> text_clean[1:5]
```

> Etape 5 : Construire une Term-document Matrix

Afin d'avoir en ligne tous les mots du corpus et en colonnes leur nombre d'occurences dans chaque tweets

```r
> # Construire une tdm pour savoir ce qui se dit de Pages Jaunes
> 
> text_to_tdm = function(text){
>   library(tm)
>   corpus = Corpus(VectorSource(text)) 
>   tdm = TermDocumentMatrix(
>     corpus,
>     control = list(
>       removePunctuation = TRUE,
>       stopwords = stopwords("fr"),
>       removeNumbers = TRUE, tolower = TRUE) # sécurité si notre traitement manuel n'a pas fonctionné !
>   )
> }
> 
> tdm_pj = text_to_tdm(text_clean)
```

### Quelques fonctions pour se ballader dans les tdm


```r
> # A quoi cela ressemble?
> inspect(tdm_pj[8:20,3:15])
> 
> # Les termes les plus fréquents
> 
> findFreqTerms(tdm,3)
> 
> # Les termes les plus liés entre eux 
> findAssocs(tdm, "digital", corlimit=0.3)
```

> Etape 6 : Vizualisation


```r
> # Les mots les plus fréquents
> tdm_matrix = as.matrix(tdm)
> wordcloud = data.frame(words= row.names(tdm_matrix),frequency=rowSums(tdm_matrix))
> wordcloud = filter(wordcloud,frequency>=3)
> head(arrange(wordcloud,desc(frequency)))
> 
> # Fréquence des mots les plus joués
> wf =filter(wordcloud, frequency>=mean(wordcloud$frequency))
> wf <- transform(wf, words = reorder(words, frequency))
> 
> library(ggplot2) ; library(ggthemes)
> p <- ggplot(wf, aes(words, frequency))
> p <- p + geom_bar(stat="identity",color="#DF0101",fill="#E6E6E6") +coord_flip()
> p+theme_gdocs()+labs(title= "Mots les plus fréquents\ndans les tweets sur Pages Jaunes \n")
```

On peut aussi visualiser en réaliser directement les nuages de mots


```r
> # Wordcloud
> 
> set.seed(142)
> library(wordcloud)
> wordcloud(wordcloud$words, wordcloud$frequency, scale=c(3, .1),
>           colors=brewer.pal(6, "Dark2"))
```

## Contacts

[Gj Tchinde](gtchinde@pagesjaunes.fr) | SCoT | Ioda | 2014

Follow me on [Wordpress](http://sciencendata.wordpress.com)

Follow me on [Github](http://github.com/gtanalytics)

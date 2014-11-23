# TP1
GjT  
10 Nov 2014  

TP 2b : TDM + Clustering + Indices Statistiques
====

### Objectifs 

A la fin de ce Travail pratiques, vous devrez  savoir : 

* Une fois de plus : utiliser l'aide Google, Stackoverflow 
* Construire une TDM
* Classifier les termes d'un document en utilisant les techniques de kmeans
* Evaluer la proximité des documents à partir d'indices statistiques


### Construction d'une TDM

#### Récupération des informations


```r
load("../references/twitteR_credentials.RData")
twitteR::registerTwitterOAuth(myacc)
text1 = searchTwitteR("bigdata", n=100)
text2 = searchTwitteR("hadoop",n=100)
text3 = searchTwitteR("rstats",n=100)
text4 = searchTwitteR("ensai",n=100)
```

#### Mise en forme de l'information

```r
text1_df = twListToDF(text1)
save(text1_df,file = "./text1.RData")
text2_df = twListToDF(text2)
save(text2_df,file = "./text2.RData")
text3_df = twListToDF(text3)
save(text3_df,file = "./text3.RData")
text4_df = twListToDF(text4)
save(text4_df,file = "./text4.RData")
```

#### Mettre en forme le texte 1

```r
library(twitteR)
```

```
## Loading required package: ROAuth
## Loading required package: RCurl
## Loading required package: bitops
## Loading required package: digest
## Loading required package: rjson
```

```r
library(tm)
```

```
## Loading required package: NLP
```

```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:twitteR':
## 
##     id, location
## 
## The following object is masked from 'package:stats':
## 
##     filter
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
load("./data_backup/text1.RData")
corpus_bigdata <- Corpus(VectorSource(text1_df$text))
corpus_bigdata <- tm_map(corpus_bigdata, PlainTextDocument)
corpus_bigdata <- tm_map(corpus_bigdata,content_transformer(tolower))
# remove punctuation
corpus_bigdata <- tm_map(corpus_bigdata, removePunctuation)
# remove numbers
corpus_bigdata <- tm_map(corpus_bigdata, removeNumbers)
# remove URLs
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x)
corpus_bigdata <- tm_map(corpus_bigdata, removeURL)
# remove stopwords from corpus
corpus_bigdata <- tm_map(corpus_bigdata, removeWords, stopwords("en"))
for (i in(1:5)) 
  print(corpus_bigdata[[i]])
```

```
## [1] "im online сome seе meеeeе  bigdata lazy sensitive desmarcados cutchogue"
## [1] "rt camacconsulting bigdata top priority   case  predictiveanalytics  analytics datascience"
## [1] "  bigdata mean  marketers  via logicdigital"
## [1] "rt fultojp maroonresearch bigdata companies agree farmers    information  npr   agtech fb"
## [1] "rt becakulugys top world dating sitе onlinе frеe just sexy girls  bigdata sanjuan diosestaconmigooo sipofh"
```

```r
# On peut essayer de compter le nombre de fois qu'apparait un terme
data_count <- tm_map(corpus_bigdata, grep, pattern = "\\<data")
print(sum(unlist(data_count)))
```

```
## [1] 43
```

```r
#tdm <- TermDocumentMatrix(x = corpus_bigdata)
```



```r
text_to_tdm2 = function(text){
  library(tm)
  corpus = Corpus(VectorSource(text)) 
  tdm = TermDocumentMatrix(
    corpus,
    control = list(
      removePunctuation = TRUE,
      #weighting =function(x) weightTfIdf(x),
      stopwords = stopwords("en"),
      removeNumbers = TRUE, tolower = TRUE) 
  )
}

tdm = text_to_tdm2(corpus_bigdata)
tdm
```

```
## <<TermDocumentMatrix (terms: 488, documents: 100)>>
## Non-/sparse entries: 966/47834
## Sparsity           : 98%
## Maximal term length: 58
## Weighting          : term frequency (tf)
```


#### Inspecter les éléments de la tdm
Quelques fonctions utiles pour mieux comprendre comment sont structurées les TDM

```r
#head(inspect(tdm))
# Les termes les plus fréquents
findFreqTerms(tdm,10)
```

```
## [1] "analytics" "big"       "bigdata"   "data"      "privacy"   "via"
```

```r
# Les termes les plus liés entre eux 
findAssocs(tdm, "bigdata",corlimit = 0.1)
```

```
##                bigdata
## bigdatacareers    0.37
## career            0.37
## careers           0.37
## city              0.37
## comp              0.37
## developer         0.37
## group             0.37
## java              0.37
## path              0.37
## york              0.37
## alerts            0.28
## audits            0.28
## bigdataclub       0.28
## cloud             0.28
## mondaq            0.28
## registration      0.28
## news              0.20
```

#### Visualisation

Les librairies pour visualiser les données ne sont pas forcément sur le [cran](cran.r-project.org)


```r
source("http://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")
```


```r
library(graph)
library(Rgraphviz)
```

```
## Loading required package: grid
## 
## Attaching package: 'Rgraphviz'
## 
## The following object is masked from 'package:twitteR':
## 
##     name
```

```r
freq.terms <- findFreqTerms(tdm, lowfreq = 7)
plot(tdm, term = freq.terms, corThreshold = 0.12, weighting = T)
```

![](./TP2b_files/figure-html/unnamed-chunk-7-1.png) 

#### Clustering


```r
tdm2 <- removeSparseTerms(tdm, sparse = 0.98)
m2 <- as.matrix(tdm2)
# cluster terms
distMatrix <- dist(scale(m2))
fit <- hclust(distMatrix, method = "ward.D2")
hcd = as.dendrogram(fit)
# alternative way to get a dendrogram
plot(hcd,type = "triangle")
```

![](./TP2b_files/figure-html/unnamed-chunk-8-1.png) 


Voilà. C'est terminé. A votre tour !



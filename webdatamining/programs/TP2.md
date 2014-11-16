# TP1
GjT  
10 Nov 2014  

TP 2 : Construction d'une Term-Document Matrix
====

### Objectifs 

A la fin de ce Travail pratiques, vous devrez  savoir : 

* Utiliser l'aide Google, Stackoverflow
* Comprendre les concepts de : Pre-processing : Stemmatisation, Lemmatisation, 
* Construire une TDM



### Ouvrer la vignette du package tm et le garder sous la main

### Récupération d'information du WEB


```r
library(XML)
u = "http://en.wikipedia.org/wiki/List_of_countries_by_population"
tables = readHTMLTable(u)
names(tables)
tables[[2]]
tmp = tables[[2]]

# On va directement lire la deuxième table
doc = htmlParse(u)
tableNodes = getNodeSet(doc, "//table")
tb = readHTMLTable(tableNodes[[2]])
```

* Récupérer sur Internet a cette @ : [http://www.let.rug.nl/usa/documents/1951-/martin-luther-kings-i-have-a-dream-speech-august-28-1963.php](http://www.let.rug.nl/usa/documents/1951-/martin-luther-kings-i-have-a-dream-speech-august-28-1963.php) l'un des discours les plus célèbres du monde

### Construction d'une TDM

Dans une tdm(term-document-matrix), les lignes correspondent aux documents de la collection et les colonnes correspondent à des termes. Il existe différents systèmes pour déterminer la valeur que chaque entrée de la matrice doit prendre. le plus répandu est la mesure tf-idf( Term Frequency-Inverse Document Frequency), mais aussi, tf(Term Frequency).

#### Etape 1 : Pre-processing

Le pre-processing consiste a effectuer des opérations simples d'élaguage du texte pour ne garder que des informations textuelles :
* Enlever la poncutation 
* S'affranchir de la casse
* Enlever les caractère spéciaux

Exemple


```r
> prepare_text = function(x){
+   x = sapply(tweets, function(x) x$getText())
+ #   x = tolower(x)
+ #   # remove rt
+ #   x = gsub("rt", "", x)
+ #   # remove at
+   x = gsub("@\\w+", "", x)
+ #   # remove punctuation
+ #   x = gsub("[[:punct:]]", "", x)
+ #   # remove numbers
+ #   x = gsub("[[:digit:]]", "", x)
+ #   # remove links http
+   x = gsub("http\\w+", "", x)
+ #   # remove tabs
+ #   x = gsub("[ |\t]{2,}", "", x)
+ #   # remove blank spaces at the beginning
+ #   x = gsub("^ ", "", x)
+ #   # remove blank spaces at the end
+ #   x = gsub(" $", "", x)
+   #x=sapply(x,function(row) iconv(row,to='UTF-8'))
+   return(x)
+ }
> text_clean = prepare_text(tweets)
```

#### Etape 2 : Comptage simple

* Nous allons utiliser les fonctions de base du langage R pour effectuer quelques comptages statistiques simples
* Nous allons procéder à la lemmatisation des mots (recherche de la racine d'un mot)
* installer le packages RTextTools

> Créer une matrice de mots avec leur fréquence d'apparition dans le discours

Inspirez vous ici : [http://rformining.blogspot.fr/2013/05/mining-last-french-presidential-debate.html](http://rformining.blogspot.fr/2013/05/mining-last-french-presidential-debate.html)



#### Etape 3 : utilisation du package tm

* Nous allons utiliser les fonctions de la librairie `tm` afin de réaliser les mêmes traitements que précédemment
* Ouvrir la vignette et se familiariser avec les principales fonctions : [http://cran.r-project.org/web/packages/tm/vignettes/tm.pdf](http://cran.r-project.org/web/packages/tm/vignettes/tm.pdf)
* Construire une TDM et cherchez les liens entre les mots



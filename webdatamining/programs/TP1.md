# TP1
GjT  
10 Nov 2014  

TP 1 : Introduction à R pour le webmining
====

### Objectifs 

A la fin de ce Travail pratiques, vous devrez : 

* Avoir installé R
* Avoir installé toutes les librairies relative aux webmining avec toutes leur dépendances
* Connaître les bases de la programmation en R (lecture, écriture, fonction simple)
* Collecter les informations du WEB
* Utiliser l'aide Google, Stackoverflow
* Pre-processing : Stemmatisation, Lemmatisation, 
* Parsing HTML, XML, 
* Tokenization

### Installer R

### Installer les librairies de webmining et

* Se connecter sur github : [www.github.com/gtanalytics](www.github.com/gtanalytics)
* Récupérer les librairies de webmining
* Se créer un compte de developpeur TwitteR. 

### Bases de la programmation en R
R est une grosse calculatrice. La majorité des personnes qui viennent d'un langage de bas niveau comme le C, le Fortran et le C++ le disent. Avec raison (en partie), car on écrit dans R comme on le ferait sur une calculatrice


```r
> 2+2
```

```r
> exp(10)
```


```r
> sum(1:10)/10
```

```r
> sqrt(10)/2 + log10(2)
```

On verra par la suite que l'opérateur d'assignation <- pouvait très bien être remplacé par une égalité sans que cela ne pertube l'exécution des scripts.

```r
> x= seq(0,1000,1)
> y = sqrt(x)
> plot(x,y,col="red",type='l')
```




```r
> 2+2
```

```
## [1] 4
```

```r
> exp(10)
```

```
## [1] 22026
```

```r
> sum(1:10)/10
```

```
## [1] 5.5
```

```r
> sqrt(10)/2 + log10(2)
```

```
## [1] 1.882
```

Fréderic faisait remarquer que R lui faisait penser à une grosse calculatrice de classe préparatoire, notamment parce que la déclaration des variables a une structure conventionnelle très minimale. On verra par la suite que l'opérateur d'assignation <- pouvait très bien être remplacé par une égalité sans que cela ne pertube l'exécution des scripts.



```r
> x= seq(0,1000,1)
> y = sqrt(x)
> plot(x,y,col="red",type='l')
```

R est un langage de script aussi, bien qu'il soit très peu utilisé de cette façon. On peut écrire des fonctions et les réutilisez, appeler des programmes dans d'autres programmes, etc...

Son coeur est écrit en Fortran et il n'est pas rare de voir certains puristes y avoir recours (avec le C), lorsqu'il s'agit d'optimiser la mémoire.

#### Opérations Basiques

R travaille sur les vecteurs. C'est l'unité de base du langage. Un vecteur est une matrice à une dimension. Le vecteur, symboolisé par c est l'opérateur basique du langage : 


```r
> x = c(1,2,3,4,5)
> print(x)
```

```r
> y = sqrt(x)
> print(y)
```


```r
> x+y
```


```r
> x/y
```


Assigner signifie donner une valeur à une variable. C'est une opération classique en programmation, mais un des gros avantages de R est que l'on est pas obligé de lui donner le type d'une variable pour qu'il l'interprète. 


```r
> x = 10 ; print(x)
```

```r
> {
+   x = 1:20 ; x
+   y = x**2
+   print(y)
+ }
```
Pour connaitre le type d'une variable, on utilise l'instruction class


```r
> x =10
> class(x)
```

```r
> xl = list(a=rnorm(10), b= letters, c= as.factor(c(1,3)))
> class(xl)
```

```r
> lapply(xl, class)
```

> * Nommage & Conventions

Les caractères permis pour les noms d'objets sont les lettres minuscules. Selon l'environnement linguistique de l'ordinateur, il peut être permis d'utiliser des lettres accentuées, mais cette pratique est fortement découragée puisqu'elle risque de nuire à la portabilité du code.

- Les noms d'objets ne peuvent commencer par un chi???re. S'ils commencent par un point, le second caractère ne peut être un chi???re.

- R est sensible à la casse. delta, Delta, DELTA sont trois objets différents. ma recommandation est de toujours **Utiliser toujours les minuscules**

- Comme dans tous les langages, certains mots sont réservés : mean, Pi,t,sd, etc...

> * Quelques variables importantes et opérations de bases

Il est d'usage de laisser certians mots clés au langage. R ne fait pas exception :


```r
> T
```
L'aide

```r
> help(matrix)
> ?apply
> ?mode
> vignette()
```


> * Matrices et tableaux

R étant un langage spécialisé pour les calculs mathématiques, il supporte tout naturellement et de manière intuitive - à une exception près, comme nous le verrons - les matrices et, plus généralement, les tableaux à plusieurs dimensions. Je ne parlerai pas de tableaux ici, mais on peut consulter l'aide sur les arrays.

Une matrice est un vecteur avec un attribut dim de longueur 2. Cela change implicitement la classe de l'objet pour "matrix" et, de ce fait, le mode d'affichage de l'objet ainsi que son interaction avec plusieurs opérateurs et fonctions.


```r
> mat = matrix(1:10, nrow = 5,ncol = 2, byrow = T)
> print(mat)
```


```r
> rbind(mat,1:2)
```

```r
> # Produit matriciel  !
> mat * mat
```

```r
> # Notez la différence
> mat %*% t(mat)
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    5   11   17   23   29
## [2,]   11   25   39   53   67
## [3,]   17   39   61   83  105
## [4,]   23   53   83  113  143
## [5,]   29   67  105  143  181
```

> * Les listes

La liste est sans doute l'objet le plus intéressant de R. On peut tout y mettre. Regardez par exemple :


```r
> myList <- list(team = "Ioda Team", df = data.frame(logs=c("google","yahoo"),nbclic = c(1,2)),dim = c(1,2,4),x = letters[1:5])
> print(myList)
```
Une liste peut donc contenir des données de type différents et cela ne pose (à priori) aucun problème. 

L'accès à des éléments d'une liste se fait par le [[]] lorsqu'on veut l'élément correspondant à une position donnée. Sinon, cela reste un vecteur comme un autre, et myList[1] donne le résultat que l'on imagine : le premier élément de la liste



```r
> # Premier élément de la liste
> myList[[1]]
```

```r
> # Deuxième élément
> myList[2]
```

```r
> # Appel par étiquette
> myList$df
```

```
##     logs nbclic
## 1 google      1
## 2  yahoo      2
```

> * Les data.frame

S'il y a un langage qui a popularisé la notion de dataframe, c'est bien R. Repris aujourd'hui par quasiment tous les langages dans plusieurs environnements (dont récemment Python Pandas). J'ai même entendu les personnes utilisant SAS reprendre ce vocable et pourtant s'il y a bien quelque chose de plus éloigné d'un data.frame c'est la manière dont SAS stocke les data.frame.

- Un data frame est une liste de classe "data.frame" dont tous les éléments sont de la même longueur (ou comptent le même nombre de lignes si les éléments sont des matrices).

- Il est généralement représenté sous la forme d'un tableau à deux dimensions. Chaque élément de la liste sous-jacente correspond à une colonne.

- Bien que visuellement similaire à une matrice un data frame est plus général puisque les colonnes peuvent être de modes différents ; pensons à un tableau avec des noms (mode character) dans une colonne et des notes (mode numeric) dans une autre.

- On crée un data frame avec la fonction data.frame ou, pour convertir un autre type d'objet en data frame, avec as.data.frame.

- Le data frame peut être indicé à la fois comme une liste et comme une matrice.

**A retenir : C'est quasiment l'élément central de l'analyse et de l'exploration mathématique/statistique avec R**



```r
> df<- data.frame(letters = letters[1:10], stat = rnorm(10), indices = sample(letters,10))
> print(df)
```

```r
> # sélectionner les 3 premières lignes
> df[1:3,]
```

```r
> # Sélectionner par les noms des variables
> df[,c("stat","indices")]
```

```r
> # Opérations logiques
> df[,df$stat>0]
```

```r
> #Opérations matricielles
> dim(df)
```

> * Quelques fonctions à connaitre pour la manipulation des data.frame


```r
> # Premiers éléments
> head(df)
```


```r
> # résumé statistique d'un df
> summary(df)
```

```r
> # Extraction élégante d'informations
> subset(df,stat >=0.5)
```

```r
> # Nom des variables d'un df
> names(df)
```

```r
> # Dimension d'un data.frame
> dim(df)
```


> * Quelques fonctions utiles à la manipulation des données (c'est vrai pour les df comme pour tout le reste)


```r
> # Générer une suite de nombre
> seq(from = 1,to = 50,by = 5) ; 1:10
```

```r
> # Répétition de valeurs
> rep(5)
```

```r
> # Trier
> sort(df$stat)
```

```r
> # Elements unique d'un vecteur
> unique(c(1,1,4,3,2,1,4,6))
```


```r
> # Recherche des éléments selon une condition dans un vecteur
> vec = c(1,2,7,10,4,-1,-6,2)
> vec[vec<0]
```

```r
> # Max, min, moyenne
> max(vec) ; min(vec); mean(vec)
```

```r
> # Appartenance ensembliste
> 1 %in% vec
```

```r
> # Arrondi
> round(2.34567,2)
```

```r
> floor(3.98)
```

```r
> # Opérations mathématiques basiques
> {vec = rnorm(10,2,4) ; 
+  print (vec)
+  }
```

```r
> #Somme, Produit
> sum(vec) ;prod(vec)
```


```r
> #Statistiques simples
> sd(vec) ; var(vec) ; range(vec); median(vec) ; quantile(vec) ; cumsum(vec)
```

```r
> mat <- matrix(rnorm(12),3,4)
> mat
```

```r
> # somme sur les lignes
> rowSums(mat)
```

```r
> # Transposée
> t(mat)
```

Quelques exemples d'utilisations des structures de boucles

```r
> # for
> vec = seq(2,10,2)
> for(i in vec) print(1:i)
```


```r
> for(n in c(2,5,10,20,50)) {
+    x <- stats::rnorm(n)
+    cat(n, ": ", sum(x^2), "\n", sep = "")
+ }
```


```r
> vec = rnorm(5,1,3)
> ifelse(vec>2,"sup à 2","inf à 2")
```

Si on avait voulu faire cette fonction en utilisant for, on aurait écrit

```r
> vec = rnorm(5,1,3)
> j=c()
> for(i in 1:length(vec))
+   if (vec[i]>2) j[i] <- 'sup à 2' else j[i] <- 'inf à 2'
> print(j)
```

**Voici sans doute l'une des forces du langage : Une vraie structure mathématique vectorizable**

> * Elements de base de la programmation

R est un langage de programmation, mais **Oubliez les structures conditionelles** : if, for, while, etc... Elles existent mais sont en réalité très peu utilisées dans la programmation en R. Pourquoi? Parce que l'élément de base du langage est un vecteur et qu'il est plus commode d'utiliser des opérateurs vectorizables pour appliquer une fonction sur tous les éléments d'un tableau que de le parcourir un à un

Les fonctions en R ont la structure suivante.


```r
> # Une fonction simple
> f = function(arg1,arg2=2)
+   {
+   return(arg1*arg2)
+   }
> f(2,9)
```


Bien entendu, une fonction est en général plus complexe et peut même comme dans beaucoup de langage vite devenir illisible. Il faut dont toujours garder à l'esprit qu'une fonction doit rendre service et la construire sur le principe input =>output

Quelques fonctions à essayer de comprendre pour être sur de comprendre le résultat final.

Notez bien : Une fonction R peut retourner n'importe quel type connu de R


```r
> # installer automatiquement les packages
> packages<-function(x){
>   x<-as.character(match.call()[[2]])
>   if (!require(x,character.only=TRUE)){
>     install.packages(pkgs=x,repos="http://cran.r-project.org")
>     require(x,character.only=TRUE)
>   }
> }
> 
> recherchesAcronymes <- function(dat, ncar=5, sw=tm::stopwords("french"), typeDistance="osa")
> {
>   tmp = dplyr::select(dat)
>   tmp = subset(tmp, (reformulation_plus_frequente!= "NULL"))
>   tmp = subset(tmp, nb_mots>=3)
>   library(tm)
>   firstLetter <-function(str)
>   {
>     tmpx = gsub(pattern="[[:punct:]]",replacement=" ",x=str)
>     tmpx= unlist(strsplit(tmpx,c(" ","'")))
>     tmpx = tmpx[!tmpx %in% sw]
>     first=paste(substr(tmpx,1,1),sep="",collapse="")
>     first= gsub(pattern="é","e",first)
>     return(first)
>   }
>   tmp$firstLetter = sapply(tmp$quiquoi_plus_frequent,firstLetter)
>   library(stringdist)
>   tmp$lev= stringdist(tmp$reformulation_plus_frequente,tmp$firstLetter,typeDistance)
>   library(plyr)
>   tmpx = arrange(tmp,lev)
>   acronymes <- subset(tmpx, lev<=2)
>   return(acronymes)
>   }
```

### Récupération de tweets

### Pre-processing : Stemmatisation, Lemmatisation, Tokenization





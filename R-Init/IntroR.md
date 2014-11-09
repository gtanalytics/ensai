# Data Friday  : A quick introduction to R
GjT - Ioda Team  
Tuesday, July 15, 2014  

Introduction à R
------------------------------------------------------------------------------------
R est l'outil de Data open source le plus cité au monde d'après la dernière enquête de Rexer Analytics. Ce week-end encore, un tweet le citait comme le langage mathématique avec un haut degré d'abstraction le plus complet (kdnugget).C'est un environnement intégré de manipulation de données, de calcul et de préparation de graphiques. Toutefois, ce n'est pas seulement un «autre» environnement statistique (comme SPSS ou SAS, par exemple), ni un enviromment purement de Machine Learning (SparK, Mahout, etc), mais aussi un
langage de programmation complet et autonome qui propose les fonctionnalités **les plus avancées au monde autour de la manipulation de la donnée et de la modélisation en Data Science ou en Statistiques computationelles**

Ce tutoriel est une introduction à R, de ses concepts basiques hérités de sa vocation initiale (donner au mathématicien un degré d'abstraction pour se concentrer sur les théories et les méthodes) jusqu'au niveau le plus avancé aujourd'hui, le calcul paralèlle dans un environnement Big Data.

Bien qu'il ait vocation à donner une introduction littérale des bases de la programmation avec R, on ne fera pas l'économie d'un vrai apprentissage du langage et d'un vrai manuel (s'il existe !)

Dans cette première itération, nous n'allons pas jusqu'à la notion de calcul parallèle, le format ne s'y prête pas. Mais néanmoins, nous abordons les grandes notions et introduisons quelques bibliothèques qui bien qu'ajoutées au langage par une communauté active, n'en finissent pas moins de devenir de véritables standards de manipulations. 

Je me suis appuyé pour réaliser ce tutoriel exclusivement sur des forums de discussions, des expériences personnelles et je ne saurais donc remercier une contribution particulière si ce n'est toute la communauté [cran](cran.r-project.org) et la R Mailling List à laquelle je suis abonné depuis bientôt 8 ans.

Quelques erreurs peuvent s'être glissé dans ce document de travail et selon la formule habituelle, ces erreurs sont entièrement celles des autres !

### R 

Huit choses essentielles à retenir à propos de R :

- Il est open source
- R n'est pas RStudio
- L'ancètre de R est S-plus (dont personne ne parle plus aujourd'hui)
- R est un langage interprété (contrairement au C ou C++ qui sont compilés )
- Avec R, les notions de mathématiques, particulièrement de calcul matriciel sont **importantes**
- On ne fait pas de boucles avec R
- R demande un haut niveau d'abstraction
- R est le langage le plus cité sur stackoverflow

L'aide en ligne et les tutoriels foisonnent. Quelques uns

<http://fr.openclassrooms.com/informatique/cours/effectuez-vos-etudes-statistiques-avec-r>

<http://cran.r-project.org/doc/contrib/Paradis-rdebuts_fr.pdf>

<https://www.youtube.com/playlist?list=PLOU2XLYxmsIK9qQfztXeybpHvru-TrqAP>

Mais de façon générale, il est plus simple d'entrer dans R, comme dans n'importe quel langage de programmation par une question et de dérouler ensuite selon un modèle de test &learn


Premiers pas :
------------------------------------------------------------------------------------

R est une grosse calculatrice. La majorité des personnes qui viennent d'un langage de bas niveau comme le C, le Fortran et le C++ le disent. Avec raison (en partie), car on écrit dans R comme on le ferait sur une calculatrice


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

![plot of chunk unnamed-chunk-2](./coursR_files/figure-html/unnamed-chunk-2.png) 

R est un langage de script aussi, bien qu'il soit très peu utilisé de cette façon. On peut écrire des fonctions et les réutilisez, appeler des programmes dans d'autres programmes, etc...

Son coeur est écrit en Fortran et il n'est pas rare de voir certains puristes y avoir recours (avec le C), lorsqu'il s'agit d'optimiser la mémoire.

### Opérations Basiques

R travaille sur les vecteurs. C'est l'unité de base du langage. Un vecteur est une matrice à une dimension. Le vecteur, symboolisé par c est l'opérateur basique du langage : 


```r
> x = c(1,2,3,4,5)
> print(x)
```

```
## [1] 1 2 3 4 5
```

```r
> y = sqrt(x)
> print(y)
```

```
## [1] 1.000 1.414 1.732 2.000 2.236
```

```r
> x+y
```

```
## [1] 2.000 3.414 4.732 6.000 7.236
```

```r
> x/y
```

```
## [1] 1.000 1.414 1.732 2.000 2.236
```

```r
> pi
```

```
## [1] 3.142
```

> * Opération d'assignation et regroupement d'opérations

Assigner signifie donner une valeur à une variable. C'est une opération classique en programmation, mais un des gros avantages de R est que l'on est pas obligé de lui donner le type d'une variable pour qu'il l'interprète. 


```r
> x = 10 ; print(x)
```

```
## [1] 10
```

```r
> x <- 10 ; x
```

```
## [1] 10
```

```r
> {
+   x = 1:20 ; x
+   y = x**2
+   print(y)
+ }
```

```
##  [1]   1   4   9  16  25  36  49  64  81 100 121 144 169 196 225 256 289
## [18] 324 361 400
```
Pour connaitre le type d'nue variable, on utilise l'instruction class


```r
> x =10
> class(x)
```

```
## [1] "numeric"
```

```r
> x = letters[1:5]
> class(x)
```

```
## [1] "character"
```

```r
> xl = list(a=rnorm(10), b= letters, c= as.factor(c(1,3)))
> class(xl)
```

```
## [1] "list"
```

```r
> lapply(xl, class)
```

```
## $a
## [1] "numeric"
## 
## $b
## [1] "character"
## 
## $c
## [1] "factor"
```

On reviendra plus loin sur les fonctions ci-dessous

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

```
## [1] TRUE
```

```r
> F
```

```
## [1] FALSE
```

```r
> # A compléter
```
Soit un vecteur vec


```r
> vec = rnorm(10,mean = 3,sd = 2)
> vec +1
```

```
##  [1] 0.2271 4.4093 4.4145 3.2400 4.5349 2.7706 3.2026 0.6097 3.1641 5.6553
```

```r
> length(vec)
```

```
## [1] 10
```

```r
> mode(vec)
```

```
## [1] "numeric"
```

Considérons un autre vecteur



```r
> vec = c("classe","sig","log","tmp","plus","rennes")
> print(vec)
```

```
## [1] "classe" "sig"    "log"    "tmp"    "plus"   "rennes"
```

```r
> vec +1
```

```
## Error: argument non numérique pour un opérateur binaire
```

```r
> length(vec)
```

```
## [1] 6
```

```r
> mode(vec)
```

```
## [1] "character"
```

```r
> nchar(vec)
```

```
## [1] 6 3 3 3 4 6
```

Consulter l'aide se fait de plusieurs façons :


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

```
##      [,1] [,2]
## [1,]    1    2
## [2,]    3    4
## [3,]    5    6
## [4,]    7    8
## [5,]    9   10
```

```r
> rbind(mat,1:2)
```

```
##      [,1] [,2]
## [1,]    1    2
## [2,]    3    4
## [3,]    5    6
## [4,]    7    8
## [5,]    9   10
## [6,]    1    2
```

```r
> cbind(mat,2:6)
```

```
##      [,1] [,2] [,3]
## [1,]    1    2    2
## [2,]    3    4    3
## [3,]    5    6    4
## [4,]    7    8    5
## [5,]    9   10    6
```

```r
> # Produit matriciel  !
> mat * mat
```

```
##      [,1] [,2]
## [1,]    1    4
## [2,]    9   16
## [3,]   25   36
## [4,]   49   64
## [5,]   81  100
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

```
## $team
## [1] "Ioda Team"
## 
## $df
##     logs nbclic
## 1 google      1
## 2  yahoo      2
## 
## $dim
## [1] 1 2 4
## 
## $x
## [1] "a" "b" "c" "d" "e"
```

Une liste peut donc contenir des données de type différents et cela ne pose (à priori) aucun problème. 

L'accès à des éléments d'une liste se fait par le [[]] lorsqu'on veut l'élément correspondant à une position donnée. Sinon, cela reste un vecteur comme un autre, et myList[1] donne le résultat que l'on imagine : le premier élément de la liste



```r
> # Premier élément de la liste
> myList[[1]]
```

```
## [1] "Ioda Team"
```

```r
> # Deuxième élément
> myList[2]
```

```
## $df
##     logs nbclic
## 1 google      1
## 2  yahoo      2
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

```
##    letters    stat indices
## 1        a  0.4097       s
## 2        b  1.1212       g
## 3        c -0.4457       z
## 4        d -0.9823       i
## 5        e -0.1470       m
## 6        f  1.5838       j
## 7        g  0.2760       p
## 8        h  0.1223       q
## 9        i -0.4001       e
## 10       j  0.3209       t
```

> * Manipulations basiques

Un data.frame est une matrice. Les opérations d'indicage sont donc comme dans le cas des matrices


```r
> # Sélectionner les deux premières colonnes
> df[,c(1,2)]
```

```
##    letters    stat
## 1        a  0.4097
## 2        b  1.1212
## 3        c -0.4457
## 4        d -0.9823
## 5        e -0.1470
## 6        f  1.5838
## 7        g  0.2760
## 8        h  0.1223
## 9        i -0.4001
## 10       j  0.3209
```

```r
> # sélectionner les 3 premières lignes
> df[1:3,]
```

```
##   letters    stat indices
## 1       a  0.4097       s
## 2       b  1.1212       g
## 3       c -0.4457       z
```

```r
> # Sélectionner par les noms des variables
> df[,c("stat","indices")]
```

```
##       stat indices
## 1   0.4097       s
## 2   1.1212       g
## 3  -0.4457       z
## 4  -0.9823       i
## 5  -0.1470       m
## 6   1.5838       j
## 7   0.2760       p
## 8   0.1223       q
## 9  -0.4001       e
## 10  0.3209       t
```

```r
> # Opérations logiques
> df[,df$stat>0]
```

```
## Error: undefined columns selected
```

```r
> #Opérations matricielles
> dim(df)
```

```
## [1] 10  3
```

> * Quelques fonctions à connaitre pour la manipulation des data.frame


```r
> # Premiers éléments
> head(df)
```

```
##   letters    stat indices
## 1       a  0.4097       s
## 2       b  1.1212       g
## 3       c -0.4457       z
## 4       d -0.9823       i
## 5       e -0.1470       m
## 6       f  1.5838       j
```

```r
> # résumé statistique d'un df
> sumary(df)
```

```
## Error: impossible de trouver la fonction "sumary"
```

```r
> # Extraction élégante d'informations
> subset(df,stat >=0.5)
```

```
##   letters  stat indices
## 2       b 1.121       g
## 6       f 1.584       j
```

```r
> # Nom des variables d'un df
> names(df)
```

```
## [1] "letters" "stat"    "indices"
```

```r
> # Dimension d'un data.frame
> dim(df)
```

```
## [1] 10  3
```

> * Quelques fonctions utiles à la manipulation des données (c'est vrai pour les df comme pour tout le reste)


```r
> # Générer une suite de nombre
> seq(from = 1,to = 50,by = 5) ; 1:10
```

```
##  [1]  1  6 11 16 21 26 31 36 41 46
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
> # Répétition de valeurs
> rep(5)
```

```
## [1] 5
```

```r
> # Trier
> sort(df$stat)
```

```
##  [1] -0.9823 -0.4457 -0.4001 -0.1470  0.1223  0.2760  0.3209  0.4097
##  [9]  1.1212  1.5838
```

```r
> # Elements unique d'un vecteur
> unique(c(1,1,4,3,2,1,4,6))
```

```
## [1] 1 4 3 2 6
```

```r
> # Recherche des éléments selon une condition dans un vecteur
> vec = c(1,2,7,10,4,-1,-6,2)
> vec[vec<0]
```

```
## [1] -1 -6
```

```r
> # Max, min, moyenne
> max(vec) ; min(vec); mean(vec)
```

```
## [1] 10
```

```
## [1] -6
```

```
## [1] 2.375
```

```r
> # Si on ne veut que la position
> which.max(vec)
```

```
## [1] 4
```

```r
> # Position de la première occurence d'un élément
> match(2,vec)
```

```
## [1] 2
```

```r
> # Appartenance ensembliste
> 1 %in% vec
```

```
## [1] TRUE
```

```r
> # Arrondi
> round(2.34567,2)
```

```
## [1] 2.35
```

```r
> floor(3.98)
```

```
## [1] 3
```

```r
> # Opérations mathématiques basiques
> {vec = rnorm(10,2,4) ; 
+  print (vec)
+  }
```

```
##  [1]  4.0779 -2.9983 -0.3341 10.1174 11.0564  1.1404 -0.2296  2.0530
##  [9]  3.5018  1.8609
```

```r
> #Somme, Produit
> sum(vec) ;prod(vec)
```

```
## [1] 30.25
```

```
## [1] -1600
```

```r
> #Statistiques simples
> sd(vec) ; var(vec) ; range(vec); median(vec) ; quantile(vec) ; cumsum(vec)
```

```
## [1] 4.474
```

```
## [1] 20.02
```

```
## [1] -2.998 11.056
```

```
## [1] 1.957
```

```
##      0%     25%     50%     75%    100% 
## -2.9983  0.1129  1.9570  3.9339 11.0564
```

```
##  [1]  4.0779  1.0796  0.7455 10.8629 21.9193 23.0597 22.8301 24.8831
##  [9] 28.3849 30.2459
```

```r
> mat <- matrix(rnorm(12),3,4)
> mat
```

```
##        [,1]    [,2]    [,3]    [,4]
## [1,] 0.9264 -0.7553 -0.4532  0.1656
## [2,] 0.1894 -0.8221  0.3915 -0.7496
## [3,] 0.3043 -0.7872 -0.1101 -0.6743
```

```r
> # somme sur les lignes
> rowSums(mat)
```

```
## [1] -0.1165 -0.9908 -1.2673
```

```r
> # Transposée
> t(mat)
```

```
##         [,1]    [,2]    [,3]
## [1,]  0.9264  0.1894  0.3043
## [2,] -0.7553 -0.8221 -0.7872
## [3,] -0.4532  0.3915 -0.1101
## [4,]  0.1656 -0.7496 -0.6743
```

Quelques exemples d'utilisations des structures de boucles

```r
> # for
> vec = seq(2,10,2)
> for(i in vec) print(1:i)
```

```
## [1] 1 2
## [1] 1 2 3 4
## [1] 1 2 3 4 5 6
## [1] 1 2 3 4 5 6 7 8
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
> for(n in c(2,5,10,20,50)) {
+    x <- stats::rnorm(n)
+    cat(n, ": ", sum(x^2), "\n", sep = "")
+ }
```

```
## 2: 1.337
## 5: 2.774
## 10: 15.26
## 20: 16.81
## 50: 50.62
```

```r
> #if
> #to do
```

Bien que je n'utilise (presque) jamais de structures de la sorte, la fonction ifelse est vectorizable et de fait, elle est très agréable à utiliser



```r
> vec = rnorm(5,1,3)
> ifelse(vec>2,"sup à 2","inf à 2")
```

```
## [1] "inf à 2" "sup à 2" "inf à 2" "sup à 2" "inf à 2"
```
Si on avait voulu faire cette fonction en utilisant for, on aurait écrit

```r
> vec = rnorm(5,1,3)
> j=c()
> for(i in 1:length(vec))
+   if (vec[i]>2) j[i] <- 'sup à 2' else j[i] <- 'inf à 2'
> print(j)
```

```
## [1] "sup à 2" "inf à 2" "inf à 2" "sup à 2" "inf à 2"
```

Voici sans doute l'une des forces du langage : Une vraie structure mathématique vectorizable

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

```
## [1] 18
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


J'invite à consulter les manules d'introduction à R pour avoir un bagage étendu sur les concepts de base de R. En réalité, le langage R est tellement mouvant qu'il serait etrès rare aujourd'hui de voir tous ce que je viens ici d'énoncer. Comme on le verra plus loin, plusieurs libaries encapsulent aujourd'hui ces notions de manipulations basiques et font parfois perdre de vue que R est avant tout un langage méta-mathématique. C'est une bonne chose pour tous ceux qui arrivent d'un autre langage vers R mais peut se révléer désastreux dans la compréhension des concepts sous-jacents. Attention donc !

Concepts avancés de R
------------------------------------------------------------------------------------
Il y a une grande variété de ce qu'on appelle en R des concepts avancés. Je n'en retiens que quelques uns et invite à consulter les manuels de référence pour aller plus loin.

#### Concept 1 : Lecture et écriture des fichiers

R lit à peu près tous les formats de fichiers. La fonction de base de lecture est read.table dont les argument sont :

* file : fichier que l'on souhaite lire

* sep = "\t" : précise le séparateur (permet d'inclure des espaces à l'intérieur des champs). On peut aussi utiliser read.delim() qui est la même chose que read.table, mais avec \t comme séparateur par défaut).

* na.strings : indique les chaînes de caractères qui ont valeur de NA. Attention : si un champ vaut la chaîne NA, il sera interprêtécomme NA et non comme la chaîne "NA" ! (mettre na.strings à autre chose pour l'éviter)

* colClasses : force un type pour chaque colonne (numeric, factor, character, logical, Date, POSIXct).

* nrows : ne lit que les n premières lignes.

* as.is = TRUE : indique que les chaînes doivent être lues comme des chaînes de caractères et pas des facteurs.

* check.names = FALSE : ne change pas les noms des colonnes si celles-ci ne sont pas correctes (uniques et commençant par une lettre).  Par défaut, change les noms des colonnes pour avoir des noms valides (transforme 3 en X3 par exemple).

* encoding: format d'encodage du fichier

* header = T ou F : indique la présence d'une entête ou non dans le fichier

Les formats de lecture, `read.csv, read.csv2`, etc présentent les options similaires avec des options particulières en fonction du format du ficihier,

La fonction d'écriture `write.table` fonctionne sur le même principe. 

Rendez-vous sur le [Site aide mémoire de R](http://www.duclert.org) pour tout apprendre sur la lecture et la manipulation des fichiers !

Néanmoins, quelques exemples :


```r
> # Data à lire
> 
> logs_sle <- read.table("D:/Blog/Data_Friday/data/sle_time_series",header=F,
+                        col.names = c("timeStamp","nbAffichages","nbClics"),stringsAsFactors = F,sep=";")
> # Affichage des premiers éléments
> head(logs_sle)
```

```
##             timeStamp nbAffichages nbClics
## 1 2014-06-02 15:00:00           99       1
## 2 2014-06-02 16:00:00          131       0
## 3 2014-06-02 17:00:00          131       0
## 4 2014-06-02 18:00:00          165       0
## 5 2014-06-02 19:00:00          124       0
## 6 2014-06-02 20:00:00           80       2
```

```r
> # Affichage des infos du fichier
> str(logs_sle) ; summary(logs_sle)
```

```
## 'data.frame':	681 obs. of  3 variables:
##  $ timeStamp   : chr  "2014-06-02 15:00:00" "2014-06-02 16:00:00" "2014-06-02 17:00:00" "2014-06-02 18:00:00" ...
##  $ nbAffichages: int  99 131 131 165 124 80 164 105 82 29 ...
##  $ nbClics     : num  1 0 0 0 0 2 0 0 0 0 ...
```

```
##   timeStamp          nbAffichages    nbClics     
##  Length:681         Min.   :  1   Min.   : 0.00  
##  Class :character   1st Qu.: 53   1st Qu.: 1.00  
##  Mode  :character   Median :188   Median : 4.00  
##                     Mean   :184   Mean   : 6.73  
##                     3rd Qu.:286   3rd Qu.:10.00  
##                     Max.   :542   Max.   :66.00
```
Par défaut, lorsqu'un fichier est lu dans R, il est importé in-memory comme un data.frame. Il existe plusieurs autres fonctions pour lire et écrire des fichiers :
* scan() et read.lines() pour découper les valeurs à extraire et les affecter à un objet
* Pour créer un ???chier au format voulu il faut créer les lignes voulues et utiliser la fonction cat() ou write.lines()
et fermer le connecteur avec close. Citons aussi `readLines`, `read.delim2`, etc...

En tapant dans google : [read files in R ou Import Data in R ](https://www.google.fr/search?q=read+files+in+R&oq=read+files+in+R&aqs=chrome..69i57j0l5.2288j0j4&sourceid=chrome&es_sm=122&ie=UTF-8), on a une palanquée de fonctions possibles pour l'import des fichiers. 


#### Concept 2 : Les librairies dans R

Un package R est un ensemble cohérent de fonctions, de jeux de données et de documentation permettant de compléter les fonctionnalités du système ou d'en ajouter de nouvelles. Les packages sont normalement installés depuis le site [Comprehensive R Archive Network](http://cran.r-project.org). Normalement parce que depuis environ 3 années, tout le monde peut développer des librairies et les mettre à disposition de la communauté via `github`, `bioconductor` ou d'autres lieux de partages. 

Notons que le caractère open source de R le rend très mouvant, mais le CRAN a vocation à être le lieu de référence pour les librairies. Lorsqu'une librairie est présente sur le site du CRAN, alors elle est fiable parce que vérifiée à partir de critères très strictes et sa maintenance est "quasiment" assurée dans le temps.

L'installation des librairies se fait par l'instruction :

> install.packages()

et l'appel à ceette librairie se fait pendant l'exécution d'un programme par : 

> library() ou encore require()



```r
> # installez les librairies : ggplot2, dplyr, reshape2
> install.packages('dplyr',dep=T)
> library(dplyr)
```

Certaines librairies, __surtout les plus récentes__ ne sont pas disponibles sur le cran. Il faut installer une librairies d'outils à partir du CRAN : [devtools](devtools) afin d'avoir accès aux repos de github ou bioconductor.


```r
> install.packages("devtools")
> install_github("rCharts","ramnath")
```



#### Concept 3 : La fonction Apply et ses déclinaisons

l'un des concepts les plus innovants de la programmation en R est la fonction apply. 

Elle n'est pas intuitive, mais lorsqu'on a pris le pied, on ne fait jamais de boucle en R et on l'utilise quasiment à toutes les sauces. Je vais dans ce qui suit essayer d'en donner une intuition

Petit rappel : 

L'élément de base de R est un tableau (matrice, data.frame). Il a donc des lignes et des colonnes. La fonction apply() permet d'appliquer une fonction (par exemple une moyenne, une racine carré, etc) à chaque ligne ou chaque colonne d'un tableau de données.Cette fonction prend 3 arguments dans l'ordre suivant:

> * nom du tableau de données

> * un nombre pour dire si la fonction doit s'appliquer aux lignes (1), aux colonnes (2) ou aux deux (c(1,2))

> * le nom de la fonction à appliquer

Si l'on considère les logs_sle par exemple, on veut connaitre la moyenne du nombre d'affichages et du nombre de clics


```r
> apply(logs_sle[,2:3],2,mean)
```

```
## nbAffichages      nbClics 
##      184.338        6.728
```

La fonction peut être plus complexe


```r
> f = function(d){
+   return(min(d) +max(d))
+ }
> apply(logs_sle[,2:3],2,f)
```

```
## nbAffichages      nbClics 
##          543           66
```

L'avantage des fonctions apply est d'éviter de faire des boucles. Dans la programmation de tous les jours, à chaque fois que vous pensez à une boucle, dites vous que le apply fait l'affaire. 

A retenir : 

> Apply permet d'effectuer dans un tableau de données les mêmes opérations sur des lignes ou sur des colonnes

> Apply a plusiuers déclinaisons : sapply, lapply, vapply, mapply

Je renvois au site de [http://www.manio.org/blog/understanding-the-apply-functions-and-then-others-in-by-asking-questions/](http://www.manio.org/blog/understanding-the-apply-functions-and-then-others-in-by-asking-questions/) pour une compréhension approfondie de la fonction Apply à travers des questions et des exemples ou encore à l'excellent Blog de [saunders](http://nsaunders.wordpress.com/2010/08/20/a-brief-introduction-to-apply-in-r/) pour une introduction approfondie.

Quelques exemples d'utilisation des fonctions apply


```r
> list = list(df =head(logs_sle[,2:3]), vec = rnorm(10))
> lapply(list, mean)
```

```
## Warning: argument is not numeric or logical: returning NA
```

```
## $df
## [1] NA
## 
## $vec
## [1] 0.6922
```

```r
> attach(iris)
> # Moyenne des longueurs de pétales par espèces
> tapply(iris$Petal.Length, Species, mean)
```

```
##     setosa versicolor  virginica 
##      1.462      4.260      5.552
```

```r
> l <- list(a = 1:10, b = 11:20)
> # Moyenne des valeurs d'une listes de numeric
> l.mean <- sapply(l, mean) : l.mean
```

```
## Error: objet 'l.mean' introuvable
```

```r
> # Quel type d'objet est retourné?
> class(l.mean)
```

```
## Error: objet 'l.mean' introuvable
```


#### Concept 4 : Graphiques avec R

La richersse de graphiques avec R est incomparable. Un exemple est cette mangnifique représentation d'un clustering de réseau social : 

![network](figure/mapLinkedin.png)

ou encore ces comparisons cloud 
![compaisonCloud](figure/jour_normal.png)

la librairie qui a révolutionné la grammaire graphique dans un langage de haut niveau est *ggplot2* développé par Hadley Wickham, membre actif de la communauté R. <ggplot2.org>

On peut quasiment tout faire avec cette librairie. Tous les types de graphiques comme nous verrons plus loin.

> * Quelques graphiques classiques

Nous utiliserons pour l'illustration le fichier sle_clicks qui contient les informations d'AB Testing, partenaire, type de page, type de clic, ou encore position du listing cliqué, position de l'iframe dans la page du partenaire; pour les clics du mois de juin ou le fichier sle précédemment vu

1. Histogramme : Graphique permettant de représenter la répartition d'une variable continue. C'est le graphique le plus intuitif pour toutes personnes qui se frottent à l'analyse des données


```r
> sle_clicks <-read.csv("./data/sle-clicks.csv",header = T,sep = ";",dec=".")
> # Premiers éléments pour explorer le fichier
> head(sle_clicks)
```

```
##          timestamp kameleoon_x atpartner atpagetype position eventtype
## 1 02/06/2014 20:58             Lesrestos         FD        1  clickurl
## 2 02/06/2014 20:58             Lesrestos         FD        1 dispphone
## 3 03/06/2014 04:14             Lesrestos         FD        3  clickurl
## 4 03/06/2014 10:55                 Local         FD        2 dispphone
## 5 03/06/2014 10:55                 Local         FD        1 dispphone
## 6 03/06/2014 10:55                 Local         FD        1  clickurl
##           target posleft postop
## 1            LVS       0      0
## 2       Fantomas       0      0
## 3            LVS       0      0
## 4       Fantomas     151    195
## 5       Fantomas     151    195
## 6 Raison_Sociale     151    195
```

```r
> logs_sle <- read.table("D:/Blog/Data_Friday/data/sle_time_series",header=F,
+                        col.names = c("timeStamp","nbAffichages","nbClics"),stringsAsFactors = F,sep=";")
> 
> # Distribution du nombre de clics avec les fonctions de basse de R
> hist(logs_sle$nbClics)
> # Distribution du nombre de clics avec la bibliothèque ggplot2
> library(ggplot2)
```

![plot of chunk unnamed-chunk-28](./coursR_files/figure-html/unnamed-chunk-281.png) 

```r
> ggplot(logs_sle, aes(x=nbClics)) + geom_histogram(binwidth=2, fill="gray20",colour="white")
```

![plot of chunk unnamed-chunk-28](./coursR_files/figure-html/unnamed-chunk-282.png) 

Toute la richesse de cette bibliothèque est la personnalisation de graphiques symbolisés par des couches que l'on superpose au plan initial. le symbôle + indique le rajout de couche

Exemple de personnalisation : Je souhaite voir où se situe la moyenne dans la distribution


```r
> ggplot(logs_sle, aes(x=nbClics)) + geom_histogram(binwidth=2, colour="black", fill="white") + theme_bw()+
+     geom_vline(aes(xintercept=mean(logs_sle$nbClics, na.rm=T)),color="red", linetype="dashed", size=1.5)
```

![plot of chunk unnamed-chunk-29](./coursR_files/figure-html/unnamed-chunk-29.png) 

2. Graphique de dispersion : Généralement, on souhaite voir comment deux grandeurs évoluent ensemble, on utilise alors des nuages de dispersions


```r
> ggplot(logs_sle, aes(x=nbClics, y=nbAffichages)) +
+     geom_point(shape=1) +    #Cercle creux
+     geom_smooth(method=loess,   # Ajouter une courbe de tendance basée sur la méthode lowess
+                 se=TRUE)    # Colorer l'intervalle de confiance
```

![plot of chunk unnamed-chunk-30](./coursR_files/figure-html/unnamed-chunk-30.png) 
Dans ce graphique, globalement, on peut voir que nbAffichages = sqrt(nbClics). Autrement dit si on augmente l'affichage de 2, le nombre de clics augmente de 4

3. Séries temporelles
Si l'on veut par exemple visualiser par heure/jour/ le nombre d'affichages, cela est possible. Mais avant, un petit intermède est indispensable
__La gestion de la date est comme dans tous les langages un exercice très difficile__ 

Une doc bien faite pour apprendre à gérer les dates en R est [http://en.wikibooks.org/wiki/R_Programming/Times_and_Dates](http://en.wikibooks.org/wiki/R_Programming/Times_and_Dates). j'invite quiconque aura à gérer les dates dans un projet à s'en inspirer. 



```r
> # Quel est le format des variables dans mon fichier
> str(logs_sle)
```

```
## 'data.frame':	681 obs. of  3 variables:
##  $ timeStamp   : chr  "2014-06-02 15:00:00" "2014-06-02 16:00:00" "2014-06-02 17:00:00" "2014-06-02 18:00:00" ...
##  $ nbAffichages: int  99 131 131 165 124 80 164 105 82 29 ...
##  $ nbClics     : num  1 0 0 0 0 2 0 0 0 0 ...
```
timeStamp a un format character et pourtant, il s'agit d'une date au format datetime. On va donner à R cette information


```r
> # Modification du format du fichier
> # Quelle est ma zone géo
> Sys.timezone()
```

```
## [1] "Europe/Paris"
```

```r
> #logs_sle$newtimeStamp = as.Date(strftime(as.POSIXct(logs_sle$timeStamp), format="%Y-%m-%d %H:%M:%S", tz="EST")
> logs_sle$newtimeStamp = as.POSIXct(x = logs_sle$timeStamp,tz = "EST")
> str(logs_sle)
```

```
## 'data.frame':	681 obs. of  4 variables:
##  $ timeStamp   : chr  "2014-06-02 15:00:00" "2014-06-02 16:00:00" "2014-06-02 17:00:00" "2014-06-02 18:00:00" ...
##  $ nbAffichages: int  99 131 131 165 124 80 164 105 82 29 ...
##  $ nbClics     : num  1 0 0 0 0 2 0 0 0 0 ...
##  $ newtimeStamp: POSIXct, format: "2014-06-02 15:00:00" "2014-06-02 16:00:00" ...
```

```r
> # On peut biensur extraire les heures et les minutes par leur positions
> logs_sle$time = substr(logs_sle$newtimeStamp, 12, 16)
> # Ou encore et de manière plus native
> logs_sle$time <- as.POSIXct(logs_sle$newtimeStamp, format = "%H")
> head(logs_sle)
```

```
##             timeStamp nbAffichages nbClics        newtimeStamp
## 1 2014-06-02 15:00:00           99       1 2014-06-02 15:00:00
## 2 2014-06-02 16:00:00          131       0 2014-06-02 16:00:00
## 3 2014-06-02 17:00:00          131       0 2014-06-02 17:00:00
## 4 2014-06-02 18:00:00          165       0 2014-06-02 18:00:00
## 5 2014-06-02 19:00:00          124       0 2014-06-02 19:00:00
## 6 2014-06-02 20:00:00           80       2 2014-06-02 20:00:00
##                  time
## 1 2014-06-02 15:00:00
## 2 2014-06-02 16:00:00
## 3 2014-06-02 17:00:00
## 4 2014-06-02 18:00:00
## 5 2014-06-02 19:00:00
## 6 2014-06-02 20:00:00
```

```r
> # Le graphique avec la fonction ggplot
> ggplot(logs_sle, aes(x=time, y=nbClics)) + geom_line(colour="red")
```

![plot of chunk unnamed-chunk-32](./coursR_files/figure-html/unnamed-chunk-32.png) 

Une documentation complèe de ggplot2 est disponible ici : [http://docs.ggplot2.org/0.9.3.1](http://docs.ggplot2.org/0.9.3.1/)

> Attention : 

Notez que cette bibliothèque graphique demande beaucoup d'entrainement pour une prise en main opérationnelle. Ne pas hésitez à consulter les forums et l'aide en ligne pour personnaliser les fonctions. Ici, nous n'avons abordé qu'une infime partie de ce qui est possible à partir de cette librairie. 

Rappelons quand même que R dispose de fonctions de base pour les représentations graphiques. `plot` qui contient des possibilités très intéressantes et plus avancées que tous les autres langages sans ajout de libairies complémentaires


Etude de cas complète : Exploration d'un fichier de bout en bout avec R
------------------------------------------------------------------------------------

je propose ici de réaliser une phase exploratoire complète avec R. De l'importation de fichier, à la réalisation de graphiques simples et intuitifs en passant par les phases de tri, de fusion, de sélection de filtre et de comptages statistiques sur les fichiers sources


#### Etape 1 : Lecture du fichier

Comme vu précédemment, la lecture d'un fichier se fait à partir des commandes de bases du langage : `read.csv`, `read.delim`, `read.table`, `read.xlsx`,`scan`, `readlines`,etc... 

Pour cette première étape nous allons

> * Lire des fichier

> * Changer le noms de certaines variables

> * Mettre les noms des variables en minuscule

> * Cherchez en quelques minutes comment importer des fichiers à partir d'une URL

> * Afficher les premiers éléments des fichiers et les différentes types de variables disponibles

> * Changer le format des dates



```r
> # Lecture à partir d'une URL
> url_sle <- "https://www.dropbox.com/s/qwlx1zhcylwuxo1/sle_time_series"
> url_at <- "https://www.dropbox.com/s/z2v22tkczchmc61/sle-clicks.csv"
> Sys.timezone()
> #logs_sle$newtimeStamp = as.Date(strftime(as.POSIXct(logs_sle$timeStamp), format="%Y-%m-%d %H:%M:%S", tz="EST")
> download.file(url_sle,destfile = "fromDropBox1.csv")
> logs_sle <- read.table(url_sle,header=F,col.names = c("timeStamp","nbAffichages","nbClics"),stringsAsFactors = F,sep=";")
> head(logs_sle)
> names(logs_sle)
> names(logs_sle)[1] <- "timeStampChange"
> head(logs_sle)
> names(logs_sle)<-tolower(names(logs_sle))
> head(logs_sle)  
> str(logs_sle)
```


#### Etape 2 : Manipulation avec dPlyr, plyr, reshape2

Des librairies plyr, dPlyr, reshape2 sont des librairies faites en particulier pour des personnes qui viennent d'autres lanagees (SQL, SAS) et qui leur fournit un ensemble de focntions pratiques à la manipulation des données. 

Je présente ici quelques unes et renvoit à la documentation pour des informations complémentaires. 

Mais avant d'entrer dans le détail de ces fonctions, notons que bien qu'elles apportent une simplification en apparence, elles masquent en général la base du langage R et certains aujourd'hui l'utilisent principalement pour ces fonctions prêtes à l'emploi. Il est toujours important, voire nécessaire d'avoir une compréhension au delà de simples fonctions prépackagées

Pour découvrir quelques fonctions, nous allons effectuer les opérations suivantes

> * Sélectionner une partie seulement du dataframe 

> * Sélectionner quelques variables seulement 

> * Réaliser des jointures 

> * Créer de nouvelles variables à partir d'anciennes

> * Utiliser les fonctions apply, table, summary, by, pour calculer des statistiques simples et courantes en phase exploratoire



```r
> # Appel des librairies
> library(dplyr);library(reshape2)
```

```
## 
## Attaching package: 'dplyr'
## 
## Les objets suivants sont masqués from 'package:stats':
## 
##     filter, lag
## 
## Les objets suivants sont masqués from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
> # Dataframe de test
> set.seed(123)
> df1 = data.frame(var1 = sample(letters,15,replace = T), var2 =rnorm(15,2,3),var3 = c("A","B","C"))
> df2 = data.frame(varx1 = rep(c("a","b","c"),5), varx2 =rnorm(15,0,3),var3 = c("A","B","C"))
> head(df1) ; head(df2)
```

```
##   var1   var2 var3
## 1    h  5.842    A
## 2    u -3.182    B
## 3    k  7.071    C
## 4    w  3.511    A
## 5    y  9.585    B
## 6    b  3.647    C
```

```
##   varx1   varx2 var3
## 1     a -3.2571    A
## 2     b -0.2563    B
## 3     c  3.2118    C
## 4     a -0.4362    A
## 5     b -3.4966    B
## 6     c -2.4555    C
```

```r
> # > * Sélectionner une partie seulement du dataframe 
> filter(df1,var2>4)
```

```
##   var1  var2 var3
## 1    h 5.842    A
## 2    k 7.071    C
## 3    y 9.585    B
## 4    o 5.884    C
## 5    l 4.477    A
```

```r
> filter(df2, var3=="A")
```

```
##   varx1   varx2 var3
## 1     a -3.2571    A
## 2     a -0.4362    A
## 3     a  2.0548    A
## 4     a -1.7988    A
## 5     a -0.4542    A
```

```r
> filter(df2, (var3=="A" & varx2<0.2))
```

```
##   varx1   varx2 var3
## 1     a -3.2571    A
## 2     a -0.4362    A
## 3     a -1.7988    A
## 4     a -0.4542    A
```

```r
> # > * Sélectionner quelques variables seulement 
> select(df1,var1,var2)
```

```
##    var1    var2
## 1     h  5.8417
## 2     u -3.1818
## 3     k  7.0706
## 4     w  3.5114
## 5     y  9.5850
## 6     b  3.6473
## 7     n  2.7146
## 8     x -1.1467
## 9     o  5.8843
## 10    l  4.4766
## 11    y  1.8329
## 12    l -0.3531
## 13    r -0.2005
## 14    o  1.3524
## 15    c  0.9953
```

```r
> select(filter(df1,var2>2),var1,var3)
```

```
##   var1 var3
## 1    h    A
## 2    k    C
## 3    w    A
## 4    y    B
## 5    b    C
## 6    n    A
## 7    o    C
## 8    l    A
```

```r
> # > * Réaliser des jointures 
> head(merge(df1,df2), 20)
```

```
##    var3 var1  var2 varx1   varx2
## 1     A    h 5.842     a -3.2571
## 2     A    h 5.842     a -1.7988
## 3     A    h 5.842     a  2.0548
## 4     A    h 5.842     a -0.4362
## 5     A    h 5.842     a -0.4542
## 6     A    l 4.477     a -3.2571
## 7     A    l 4.477     a -1.7988
## 8     A    l 4.477     a  2.0548
## 9     A    l 4.477     a -0.4362
## 10    A    l 4.477     a -0.4542
## 11    A    n 2.715     a -3.2571
## 12    A    n 2.715     a -1.7988
## 13    A    n 2.715     a  2.0548
## 14    A    n 2.715     a -0.4362
## 15    A    n 2.715     a -0.4542
## 16    A    w 3.511     a -3.2571
## 17    A    w 3.511     a -1.7988
## 18    A    w 3.511     a  2.0548
## 19    A    w 3.511     a -0.4362
## 20    A    w 3.511     a -0.4542
```

```r
> head(inner_join(df1,df2),20)
```

```
## Joining by: "var3"
```

```
##    var1    var2 var3 varx1   varx2
## 1     h  5.8417    A     a -3.2571
## 2     w  3.5114    A     a -3.2571
## 3     n  2.7146    A     a -3.2571
## 4     l  4.4766    A     a -3.2571
## 5     r -0.2005    A     a -3.2571
## 6     u -3.1818    B     b -0.2563
## 7     y  9.5850    B     b -0.2563
## 8     x -1.1467    B     b -0.2563
## 9     y  1.8329    B     b -0.2563
## 10    o  1.3524    B     b -0.2563
## 11    k  7.0706    C     c  3.2118
## 12    b  3.6473    C     c  3.2118
## 13    o  5.8843    C     c  3.2118
## 14    l -0.3531    C     c  3.2118
## 15    c  0.9953    C     c  3.2118
## 16    h  5.8417    A     a -0.4362
## 17    w  3.5114    A     a -0.4362
## 18    n  2.7146    A     a -0.4362
## 19    l  4.4766    A     a -0.4362
## 20    r -0.2005    A     a -0.4362
```

```r
> #left_join(df1,df2)
> # > * Créer de nouvelles variables à partir d'anciennes
> # > * Utiliser les fonctions apply, table, summary, by, pour calculer des statistiques simples et courantes en phase exploratoire
> table(df1$var1,df1$var3)
```

```
##    
##     A B C
##   b 0 0 1
##   c 0 0 1
##   h 1 0 0
##   k 0 0 1
##   l 1 0 1
##   n 1 0 0
##   o 0 1 1
##   r 1 0 0
##   u 0 1 0
##   w 1 0 0
##   x 0 1 0
##   y 0 2 0
```

```r
> summary(df2)
```

```
##  varx1     varx2        var3 
##  a:5   Min.   :-9.682   A:5  
##  b:5   1st Qu.:-2.856   B:5  
##  c:5   Median :-0.454   C:5  
##        Mean   :-1.214        
##        3rd Qu.: 0.367        
##        Max.   : 3.212
```

```r
> apply(X = df1,2,length)
```

```
## var1 var2 var3 
##   15   15   15
```

```r
> apply(df2[,-2],2,as.factor)
```

```
##       varx1 var3
##  [1,] "a"   "A" 
##  [2,] "b"   "B" 
##  [3,] "c"   "C" 
##  [4,] "a"   "A" 
##  [5,] "b"   "B" 
##  [6,] "c"   "C" 
##  [7,] "a"   "A" 
##  [8,] "b"   "B" 
##  [9,] "c"   "C" 
## [10,] "a"   "A" 
## [11,] "b"   "B" 
## [12,] "c"   "C" 
## [13,] "a"   "A" 
## [14,] "b"   "B" 
## [15,] "c"   "C"
```


### Quelques fonctions d'un niveau 'un peu' avancées : melt, cast, rCharts


#### melt et cast (Excel amélioré)

To do

#### rCharts : d3 dans R

To do

#### Shiny & co : Rstudio, html5

To do

#### R et Hadoop

To do

#### R versus Python

To do

Conclusion partielle
------------------------------------------------------------------------------------

J'ai essayé ici d'introduire les notions centrales de R en partant de ce que je considère comme les fondamentaux à connaitre. L'aide en ligne est souvent trompeuse et masque mal la complexité des opérations à l'oeuvre. Les bibliothèques rapportées sont indispensables, mais il faut toujours s'assurer de bien comprendre ce qui est fait. 

J'ai par ailleurs insité sur 4 librairies qui ont révolutionné la conception même de R ces deux dernière années, et sans se mettre à jour régulièrement, on passe vite à côté de l'évolution du langage. Ces quatre librairies sont tout de même très sures et un projet vise même à en faire des éléments de base du langage.

Néanmoins, comme toute introduction, elle est partielle et partiale. Et parfois même, il y a certains partis pris sans doute liés à ma formation initiale de mathématicien et qui sont profondément discutables (du moins sur certaines choses que l'on attend d'un logiciel). 
La partialité vient aussi du fait qu'il n'a pas du tout été abordé (parce que le public ne s'y prête pas) le coeur de R à travers la Data science d'une part et sa véritable révolution autour de Shiny et de la manière dont la société Rstudio ont révolutionné l'approche de R d'autres parts. Par ailleurs, les possibilités graphiques sont aujourd'hui infinies avec Ramnath et la librairie rCharts, et le clou de la chose **Tout ce tutoriel a été écrit avec R** du début à la fin.


¤ <http://sciencendata.wordpress.com>



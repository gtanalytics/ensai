rm(list = ls())

# Initiation à R
# 1- Quelques fonctions utiles pour dialoguer avec le systeme 

# déclaration d'un espace de travail
setwd("mon espace de travail")

# Obtenir son espace de travail
getwd()
#Quels sont les fichiers disponibles dans mon espaces de travail
list.files("../TwitteR")
# En fonction de son système d'exploitation, on peut envoyer des commandes au système 
system("mkdir datademo2") ;
system("ls -l")
system("cat README")

# Et c'est ainsi que l'on peut communiquer avec Hadoop sans sortir de R, par exemple
system("hadoop fs -ls /")
system("hadoop fs -copyFromLocal mon/fichier/source mon/fichier/dest")

# Zipper et dezipper des fichiers
tarfile <- 'monarchive.tgz'
tar(tarfile,"data/",compression='gzip')
untar("Sur le même principe")

# 2 - R comme calculatrice
# démo directement dans la console

# 3 - R pour l'exploration des données

# Lecture des fichiers

sle = read.table("data/sle-clicks.csv",header = T,sep = ";")
## Lecture à partir d'une URL
url_data <- "http://osm13.openstreetmap.fr/~cquest/openfla/export/communes-adjacentes-20140306.txt"
communesAdjacantes <- read.table(url_data)
## On peut aussi télécharger le fichier directement
download.file(url_data,destfile = "communesAdjacentes.csv")
# Exploration basique du fichier
summary(sle)
head(sle)
str(sle)

# D'autres formats de lecture : Voir la doc

# 3 - Data Manipulation

# Rappel sur la structure de R

vec = c(1,2,3,4,7,8,10,20)
print(vec) ; vec

vec+1 # ajoute 1 à tous éléments du vecteur vec : On dit que les opérations sont vectorizables
log(vec)
exp(vec)
vec/vec
vec2=c(1,2)
vec2
vec/vec2 # On parle de recyclage (2 vecteurs n'ont pas besoin d'avoir la même taille pour que les opérations sur lui se fassent)
mat = matrix(round(rnorm(20,2,3)),4,5)
mat
mat -1
mat * mat
t(mat) # transposée de la matrice
#le vrai produit matriciel
mat %*%mat
mat %*%t(mat)
mat>1
mat[mat>1] # Il revient à sa structure de base lorsqu'il fait les opérations sur lesquelles il n y a pas de type défini
mat[mat>1]<-0

mat

# Voir la doc pour plus d'exemples et de détails

# Manipulation des data.frame
head(sle)
# sélection selon un critère ou plusieurs
lignes <- subset(sle, atpartner =="Local")
lignes <- sle[sle$atpartner =="Local",]
colonnes <- subset(sle, select = c(atpartner,timestamp,postop))
head(colonnes)
colonnes <-sle[,c("atpartner","timestamp")] 
head(colonnes)
# Biensûr, les conditions sont combinables avec les opérations de logiques booléennes
lignes <- subset(sle, (atpartner =="Local" & target=="LVS"))
lignesetCol <- subset(sle, atpartner %in% c("Local","LesRestos"), c(timestamp,atpartner))

# Toutes les opérations ensemblistes sont possibles et peuvent être utilisés sur des opérations de sélection d'éléments
list1 = seq(1,10)
list1
list2 = seq(3,8)
union(list1,list2)
setdiff(list1,list2)
intersect(list1,list2)
list1 %in%list2
match(list1,list2)
rep1 = setdiff(sle,lignes) # que représente ce jeu de données ?
# Transformation de variables

## Créer à partir d'une variable dans un jeu de données
sle$logposleft = log(sle$posleft)
sle = transform(sle, logposleft = log(posleft), dposleft = -posleft)
# Quand il y a plusieurs changements à effectuer, il est plus simple d'utiliser
withsle <- within(sle, {
  lposleft <- log(posleft)
  time <- as.POSIXct(timestamp)
  po <- ifelse(time>24,1,0)
  rm(timestamp)
})
head(withsle)

# Manipulations un peu avancées
df1 =sle
df2 =df1[sample(x = df1$atpartner,size = 0.01*nrow(df1)),c("atpartner","timestamp")] 
head(df2)
str(df2)
# Modifier les types
df2$atpartner=as.character(df2$atpartner)
str(df2)
# création d'une variable fictive
df2$nbClics <- rnorm(nrow(df2),10,2)
head(df2)
# Jointure : la fonction de base est la fonction merge (fini le select *)
jointure = merge(df1,df2)
# jointure à gauche
jointure = merge(df1,df2,all.x = T)
jointure = merge(df1,df2,all.y = T)
jointure = merge(df2,df1,sort =T)
# jointure sur deux variables
jointure = merge(df2,df1,by = c("timestamp","atpartner"))
# Les variables peuvent ne pas avoir le même nom
names(df2)[1] <- "atpartner2"
head(df2)
jointure = merge(df2,df1,by.x="atpartner2",by.y="atpartner")
# On peut combiner les jointures avec les sélections
jointure = subset(merge(df2,df1,by.x="atpartner2",by.y="atpartner"), select = c(atpartner2,nbclics,posleft))
# Rajouter des lignes à son data.frame ou des colonnes
newdf = rbind(sle,df1)
newdf = cbind(sle,rnorm(nrow(sle)))
# Pour être propre
newdf = data.frame(sle, newvar = rnorm(nrow(sle)))

# Que faites vous en général lorsque vous manipulez des données ?

# cherchez l'aide pour trier un fichier par exempel?

# Les libraires R (Voir la doc)

install.packages("reshape2") ; install.packages("dplyr");install.packages("plyr") ; install.packages("ggplot2")

# Les librairies sont un ensemble de fonctions personnalisées qui accélèrent le travail.
library(dplyr)
lignes = filter(sle,atpartner !="Local")
colonnes=select(sle,atpartner)
# Toutes les opérations que l'on a vu précedemment deviennent d'une simplicité déconcertante
df1 <-sle
df2 =df1[sample(x = df1$atpartner,size = 0.01*nrow(df1)),c("atpartner","timestamp")] 
# création d'une variable fictive
df2$nbClics <- rnorm(nrow(df2),10,2)
jointure = inner_join(df1,df2)
jointure = inner_join(df1,df2,by ="atpartner")
jointure = left_join(df1,df2)
jointure = anti_join(df1,df2)
jointure = select(inner_join(df1,df2,),atpartner,nbClics)

# Consultez l'aide R sur les fonctions left, anti, inner join

# 3 - Statistique exploratoire

traffic_match = read.csv('D:/Blog/traffic_curve/data_30juin.txt',sep='|',nrows =100000,
                            header= F,col.names=c('hm','quiQuoi','OS'),colClasses=rep('character',3))
head(traffic_match)
str(traffic_match)
logs_sle <- read.table("D:/Blog/Data_Friday/data/sle_time_series",header=F,
                       col.names = c("timeStamp","nbAffichages","nbClics"),stringsAsFactors = F,sep=";")
head(logs_sle)
# Manipulation des dates : Vous allez galérer comme ailleurs
str(logs_sle)
# Comment passer au format datetime
traffic_match$time <- as.character(as.POSIXct(paste(paste('2014-06-30',traffic_match$hm),'00'),
                                              format="%Y-%m-%d %H%M %S"))
traffic_match$trueTime <- as.POSIXct(traffic_match$time,format="%H")

str(traffic_match)
# découpage en tranche
traffic_match$trancheHoraire <- cut(x=as.numeric(traffic_match$hm),breaks=c(0,1200,1700,2000,2400),
                                    labels=c("Avant Midi","13 - 17","17 - 20","Apres 20"))

# comptages simples
table(traffic_match$OS,traffic_match$trancheHoraire)
# A votre avis, comment on fait pour avoir les pourcentages ?
plot(table(traffic_match$OS,traffic_match$trancheHoraire))
# Attention au format de sortie
stat_search <- as.data.frame(table(traffic_match$quiQuoi,traffic_match$trancheHoraire))
stat_searchx=subset(stat_search,Freq>100)
stat_searchx =arrange(stat_searchx,desc(Freq))
# Autres facons de compter : Il y en a tellement. table n'est pas rapide mais reste la plus intuitive
stats = aggregate(.~(traffic_match$OS+traffic_match$trancheHoraire),FUN = length,data= traffic_match)
# La syntaxe de ces fonctions parlera plus au personnes qui viennent de Python
grp <- group_by(traffic_match, OS)
summarise(grp, mean= mean(as.numeric(hm)))
# Les fonctions Apply
apply(logs_sle[,-1],MARGIN = 2, sum) ; apply(logs_sle[,-1],MARGIN = 2, mean)

# sélectionner toutes les variables qui sont character dans df1 et trouver le mot le plus long
# > Fonction sapply, nchar
# les fonctions dcast : Tableaux croisées dynamiques
library(reshape2)
castf = dcast(data = df1,formula = atpartner ~ target)
# Quelles opérations faites vous en général ?


# 4 - Graphiques simples
# histogramme
hist(x = logs_sle$nbAffichages)
hist(logs_sle$nbAffichages,col="skyblue3")
# les couleurs R
colors()
# scatterplot out time
df = as.data.frame(table(traffic_match$hm))
names(df) = c("time","Count")
plot(df$Count,col="red3",type="l",panel.last = F,frame.plot = F)
# Librairies graphiques R : Voir doc
# graphiques avancés
library(ggplot2)
ggplot(logs_sle, aes(x=nbClics)) + geom_histogram(binwidth=2, fill="gray20",colour="white")
# Customization
ggplot(logs_sle, aes(x=nbClics)) + geom_histogram(binwidth=2, colour="black", fill="white") + theme_bw()+
  geom_vline(aes(xintercept=mean(logs_sle$nbClics, na.rm=T)),color="red", linetype="dashed", size=1)

# Des fonctionnalités très avancées
head(sle)
slebis = select(sle,atpartner,target)
comptage =as.data.frame(table(slebis))
# Zoom sur la fonction melt
(p <- ggplot(comptage, aes(target, atpartner)) + geom_tile(aes(fill = Freq), colour = "white") + 
   scale_fill_gradient(low ="lavenderblush1", high = "steelblue"))


# Que voulez vous voir? 



# Plus de graphiques possibles
# Plus de Stats ?

# Un peu de d3
xtraffic= subset(traffic_match, OS %in% c("Android","iPhone OS"))
xtraffic$hm = strftime(xtraffic$time, format="%H:%M:%S")
courbe_traffic2 <-as.data.frame(table(xtraffic$time,xtraffic$OS))
library(rCharts)
pl2 <- mPlot(x='Var1',y="Freq",type='Line',group = 'Var2',data=courbe_traffic2)
pl2$set(pointSize = 0, lineWidth = 1)
print(pl2)

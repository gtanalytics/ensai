# Web Log Mining : Intro
GjT  
24 Nov 2014  

TP 3.a : Logs Mining : Web server Apache
====

### Objectifs 

A la fin de ce Travail pratiques, vous devrez  savoir : 

* Une fois de plus : utiliser l'aide Google, Stackoverflow 
* Comprendre ce qu'est un log apache
* Structurer des logs apache dans R
* Effectuer quelques graphiques à l'aide des librairies ggplot2, 
* Détecter des erreurs dans des logs


### Introduction

Pour gérer un serveur web, il est nécessaire de disposer d'un retour d'informations à propos de l'activité et des performances du serveur, ainsi que de tout problème qui pourrait survenir. Le serveur HTTP Apache propose des fonctionnalités de journalisation souples et très complètes.

On peut considérer que les journaux d'évènements (logs) sont des fichiers textes enregistrant de manière chronologique les évènements exécutés par un serveur ou une application informatique. Un contenu qu'il faut savoir déchiffrer.

Le type d'information contenu est en général : ouverture d'une session, installation d'un programme, navigation sur Internet, IP de provenance, actions effectuées, etc...

Les fichiers logs peuvent contenir des informations confidentielles (adresses IP, configuration du système, liste de processus...). Tout le monde n'a en général pas accès à ces informations dans une entreprises


#### Exemple de fichier de logs

```
77.27.19.57 - - [23/Nov/2014:16:10:03 -0800] "GET /logs/access.log HTTP/1.1" 200 2114336 "-" "Mozilla/5.0 (X11; Linux x86_64; rv:2.0b8pre) Gecko/20101011 Firefox/4.0b8pre" "redlug.com"
31.184.238.152 - - [23/Nov/2014:16:20:34 -0800] "GET /logs/access.log HTTP/1.1" 200 185 "http://orderendeponlinequickdelivery.soup.io" "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.102 Safari/537.36" "redlug.com"
188.165.15.99 - - [23/Nov/2014:16:21:34 -0800] "GET /paper2004/0401MEast.htm HTTP/1.1" 200 2297 "-" "Mozilla/5.0 (compatible; AhrefsBot/5.0; +http://ahrefs.com/robot/)" "www.redlug.com"
188.165.15.95 - - [23/Nov/2014:16:22:18 -0800] "GET /Socialist/05MayPrivatisation HTTP/1.1" 200 5579 "-" "Mozilla/5.0 (compatible; AhrefsBot/5.0; +http://ahrefs.com/robot/)" "redlug.com"
93.79.202.178 - - [23/Nov/2014:16:24:35 -0800] "GET /access_130930.log HTTP/1.1" 404 89 "http://benicar.likeapro.me/" "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1" "redlug.com"
```

### Récupération des informatios



```r
logs <- read.table("http://redlug.com/logs/access.log",sep=' ',header =F,stringsAsFactors = F)
head(logs)
```
Comme on peut le constater, le parsing du texte n'est pas évident. Il faut en général le faire très manuellement et se concentrer sur ce que l'on veut étudier.

Pour aujourd'hui, on va s'intéresser aux IPs qui arrivent, à l'heure et au browser

#### Mise en forme de l'information

```r
library(dplyr)
logs_mining <- select(logs, 1,4,10)
```

### Exercice 1: Mettre en forme les différents champs en appliquant les opérations suivantes

* Donner un nom à chaque champ
* le champ timestamp doit être de la forme HH:MM:SS et être de type time
* A partir du champ Browser, créer deux champs (browser et plateforme). Le premier doit indiquer le type de browser(exemple : mozilla) et le second la plateforme(exemple  : Linux)

> Aide:  le package stringr, lubridate. Les fonctions strsplit, 

### Exercice 2: Quelques statistiques

* Proposez des calculs statistiques



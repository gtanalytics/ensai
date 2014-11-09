Cours de webmining ENSAI - 2014/2015
=====

On trouvera ici toutes les notes de cours et les programmes pour le cours de webmining à l'ENSAI. Ce cours est réalisé dans le cadre du partenariat entre [le groupe Solocal](www.solocal.com) et [l'ENSAI](www.ensai.fr). Les exemples utilisés pour la démonstration sont issus parfois des cas pratiques chez Pagesjaunes


Le cours se décompose en deux parties : 

> Information Retrieval : Preprocessing, Extraction and Applicications 
Il s'agit d'une introduction à la collecte des informations issues du web, à la notion d’Information Retrieval, à la constitution des corpus, à leur organisation à des fins d’analyse exploratoires. 
On introduira par ailleurs l’algorithme qui permet de hiérarchiser les pages web (pagerank) et à la classification de documents textuels.

> Opinion Mining : Textmining, Analyse de sentiments Classification et évaluation des modèles 
Après avoir appris à récupérer les informations, à faire du pre-processing dans la première partie, cette partie aborde l’Opinion mining : Après quelques rappels et développements théoriques, il sera abordé les notions de classification de textes, d’analyses de sentiments, d’évaluation de modèles. 

## Programme

> Partie 1

### Information Retrieval - Théorie (6h)

**Information Retrieval**

* Concepts & Définitions

* World Wide Web

* Indexation & Crawl

* Notions de moteur de recherche 

* Introduction aux techniques de webdatamining

* Organisation de l'information issue du web

* Domaines d'applications du webmining

**Webmining : Outils et Techniques**

* Web Search

* User logs

* Term Document Matrix

* Tf-idf, Cosine Index, jaccard Index

-----

### Information Retrieval & Application (12h)

**TP1 : Introduction à R pour le Web Mining** (4h)

* Installation de librairies de wembining  disponible dans R
* Collecter les informations issues du WEB : Exemple de Twitter
* Pre-processing : Stemmatisation, Lemmatisation, 
* Parsing HTML, XML, 
* Tokenization

**TP2 : Web Content Mining** (4h)

* Introduction à la term-document matrix
* Similarités de documents
* Notions de distance statistique
* Classification de documents
* Détection des signaux faibles

**TP3 :Web Usage Mining ** (4h)

* Pré-traitement des données issues des logs
* Stockage et Organisation
* Règles d'associatione et motifs séquentiels


> Partie 2

**Opinion Mining - Théorie** (2h)

Etat de l'art

* Etat de l’art (opinion mining, sentiment analysis, affective computing)
* Quels descripteurs pour quels types de données textuelles
* Sélection automatique de descripteurs (réduction de l’espace de recherche)
* Annotation manuelle et automatique (schéma d’annotation, calcul d’un score d’agrément inter-annotateur)

-	Principaux modèles en Opinion mining
* Quels algorithmes de classification dans quels cas ?
* Quelles mesures utiliser pour mesurer la qualité d’un modèle (rappel, précision, f-score, ROC, indices de confiance)

**Opinion mining - Applications** (4h)

-	TP1 : classification de la valence d’un texte littéraire (critiques de cinéma) 
-	TP2 : Sentiment Analysis autour des textes issus des réseaux sociaux 


## Documentation

*	Web DataMining, Exploring Hyperlinks, Contents, and Usage Data, Bing Liu, Springer (Chapitre 6 à 13) (**)

*	Information Retrieval, [http://nlp.stanford.edu/IR-book/pdf/irbookonlinereading.pdf (chapitres 1-3)](http://nlp.stanford.edu/IR-book/pdf/irbookonlinereading.pdf (chapitres 1-3) (**)

*	package tm in R, [http://cran.r-project.org/web/packages/tm/vignettes/tm.pdf](http://cran.r-project.org/web/packages/tm/vignettes/tm.pdf) (*)

*	Infrastructure of Texmining with R, http://www.jstatsoft.org/v25/i05/paper

*	Webmining pluging in R, [http://cran.r-project.org/web/packages/tm.plugin.webmining/vignettes/ShortIntro.pdf](http://cran.r-project.org/web/packages/tm.plugin.webmining/vignettes/ShortIntro.pdf)

*	PageRank,  [http://ilpubs.stanford.edu:8090/422/1/1999-66.pdf](http://ilpubs.stanford.edu:8090/422/1/1999-66.pdf)

*	Mining the social web, [https://github.com/ptwobrussell/Mining-the-Social-Web](https://github.com/ptwobrussell/Mining-the-Social-Web)

*	Pang B. and Lee L. (2008). "Opinion mining and sentiment analysis." Foundations and Trends in Information Retrieval 2(1-2).

*	Dini L. and Mazinni G. (2002). Opinion classification through information extraction. CELI. Turin, Italy

*	Cornuéjols A., Miclet L. and Kodratoff Y. (2002). Apprentissage artificiel : Concepts et algorithmes

*	Ilieva L. (2004). Combining Pattern Classifiers : Methods and Algorithms (chapitre 1 “Fundamentals of Pattern Recognition”, chapitre 4 “Fusion of Label Outputs”) (*)


## Outils

Toutes les applications seront faites dans le langage [R](www.cran.r-project.org)

Sur la partie collecte de contenus, un spécialiste des données moteurs de recherche interviendra pendant une séance pour expliquer ce qu'est un moteur de recherche et comment on le construit


## Propriété intellectuelle

Tous les documents déposés ici sont libres de droits à conditions de **citer** expressement leur auteurs et de faire référence à la société [pagesjaunes](www.pagesjaunes.fr)


## Contacts

* GjT | Data scientist | Groupe Solocal | 2014
* Follow me on [wordpress](http://sciencendata.wordpress.com)
* Follow me on [github](http://github.io/gtanalytics)
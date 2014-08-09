Cours de webmining ENSAI - 2014/2015
=====

On trouvera ici toutes les notes de cours et les programmes pour le cours de webmining à l'ENSAI. Ce cours est réalisé dans le cadre du partenariat entre [le groupe Solocal](www.solocal.com) et [l'ENSAI](www.ensai.fr). Les exemples utilisés pour la démonstration sont issus parfois des cas pratiques chez Pagesjaunes


Le cours se décompose en deux parties : 

> Information Retrieval : Preprocessing, Extraction and PageRank 
Il s'agit d'une introduction à la collecte des informations issues du web, à la notion d’Information Retrieval, à la constitution des corpus, à leur organisation à des fins d’analyse exploratoires. 
On introduira par ailleurs l’algorithme qui permet de hiérarchiser les pages web (pagerank) et à la classification de documents textuels.

> Opinion Mining : Textmining, Analyse de sentiments Classification et évaluation des modèles 
Après avoir appris à récupérer les informations, à faire du pre-processing dans la première partie, cette partie aborde l’Opinion mining : Après quelques rappels et développements théoriques, il sera abordé les notions de classification de textes, d’analyses de sentiments, d’évaluation de modèles. 

## Programme

### Information Retrieval (3h)
-	Information Retrieval
	o	Concepts & Définitions
	o	Term Document Matrix
	o	Tf-idf, Cosine Index, jaccard Index
	o	Stemming

-	Web Search : Google 
	o	Google et le Page Rank
	o	Pages Jaunes (Notion de tri alpha)
	o	Notion de graphes et de vecteurs propres 

### Information Retrieval application (9h)
-	TP1 : Introduction à R pour le Web Mining (3h)
	o	Installation de librairies de textmining disponible dans R
	o	Collecter les informations issues du WEB : Twitter, Wikipedia
	o	Pre-processing : Stemmatisation, Lemmatisation, 
	o	Parsing HTML, XML, 
	o	Tokenization
	o	Introduction à la term-document matrix

-	TP2 : Similarité de documents (Applications aux recherches utilisateurs sur le site pagesjaunes.fr (3h)
	o	Indices de similarité : Tf, tf-idf Jaccard, Cosine
	o	Distance de Damerau, Distance de jaro
	o	Liens entre les recherches, Notion de graphe de recherche
	-	TP3 : Ordonnancement des résultats d’une recherche (3h)
	o	PageRank
	o	Détecter les mots clés
	o	Intro à la classification des docs sur mots clés

Opinion Mining (4h)
-	Quelles applications dans quels domaines d’activités ? 
-	Etat de l’art (opinion mining, sentiment analysis, affective computing)
	o	Quels descripteurs pour quels types de données textuelles
	o	Sélection automatique de descripteurs (réduction de l’espace de recherche)
	o	Quels algorithmes de classification dans quels cas ?

-	Constitution du corpus 

	o	Réflexions générales sur la qualité des données  et son impact
	o	Annotation manuelle et automatique (schéma d’annotation, calcul d’un score d’agrément inter-annotateur)
	o	 Répartition des données dans les classes

-	Pre-processing (texte)
	o	Quelle granularité pour mes données (mot, phrases, paragraphes)
	o	Annotation syntaxique et sémantique (exemples de POS, WordNet-Affect)

-	Evaluation
	o	Quelles mesures utiliser pour mesurer la qualité d’un modèle (rappel, précision, f-score, ROC, indices de confiance a 0.95)
	o	Produit de la société TEMIS (cartouche sentiments)
	o	Produit de la société Sinequa

Opinion mining : Applicationq (8h)
-	TP1 : classification de la valence d’un texte littéraire (critiques de cinéma) 
-	TP2 : classification de la valence de textes issus de réseaux sociaux (twitter, facebook)  
-	TP3 : Fusion de modèles (à partir des modèles crées dans le TP2)   
-	TP4 (optionnel) : Constructions de modèles à partir d’indices multimodaux (texte + audio)


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

* GjT | Senior Data scientist | Groupe SoLocal | 2014
* Follow me on [wordpress](http://sciencendata.wordpress.com)
* Follow me on [github](http://github.io/gtanalytics)
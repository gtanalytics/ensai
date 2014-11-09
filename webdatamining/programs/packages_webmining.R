packages<-function(x){
  x<-as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}
packages(reshape2) 
packages(ggplot2)
packages(stringr)
packages(tm)
packages(RCurl)
packages(stringdist)
library(jsonlite)
library(httr)
library(dplyr)

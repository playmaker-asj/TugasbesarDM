#set and get location
getwd()
setwd("C:/Users/renko/OneDrive/Documents/Tugas Besar Data Mining/Rstudio")
rm(list =ls())

#Reading File
DataSet <- read.csv("buddymove_holidayiq.csv", header=T, sep=",", comment.char = '#')
head(DataSet)

#Menginstal package Dependence
install.packages("colorspace")
install.packages("maggritr")
library(colorspace)
library(magrittr)

#data selection
SubSet=DataSet[2:7]
head(SubSet)

#scaling dataset
x<-scale(SubSet)
head(x)

complete_linkage<- eclust(x, "hclust", hc_method = "complete",k=1)
sc <- input %>% scale() %>% dist(method = "euclidean") %>% hclust(method = "ward.D2")
#Melihat model
sc

#membuat model virtual
fviz_dend(sc,k=3,
          cex = 0.5,
          k_colors = c("#00AFBB","#FC4E07","#2E9FDF"),
          color_labels_by_k = TRUE,
          rect = TRUE)

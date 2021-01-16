#set and get location
getwd()
setwd("C:/Users/renko/OneDrive/Documents/Tugas Besar Data Mining/Rstudio")
rm(list =ls())

#Importing library packages
install.packages("factoextra")
install.packages("NbClust")
install.packages("dplyr")
install.packages("cluster")
install.packages("tidyverse")
install.packages("gridExtra")
install.packages("ggplot2")

library(factoextra)
library(NbClust)
library(dplyr)
library(cluster)
library(ggplot2)
library(tidyverse)
library(gridExtra)

#Reading the file
data_buddy_move <- read.csv("buddymove_holidayiq.csv", 
                            header=T, sep=",", comment.char = '#')
head(data_buddy_move)

#data selection
buddy_move=data_buddy_move[,2:7]
head(buddy_move)



#Menerapkan statistik dasar sebelum menerapkan k means untuk memeriksa dan menerapkan standardisasi atau tidak 
stats<- data.frame(
  Min = apply(buddy_move, 2, min), # minimum
  Med = apply(buddy_move, 2, median), # median
  Mean = apply(buddy_move, 2, mean), # mean
  SD = apply(buddy_move, 2, sd), # Standard deviation
  Max = apply(buddy_move, 2, max)
)
stats <- round(stats,1)
head(stats)


#Nilai min max olahraga lebih sedikit, jadi harus di scaling
x<-scale(buddy_move)
head(x)

stats<- data.frame(
  Min = apply(x, 2, min), # minimum
  Med = apply(x, 2, median), # median
  Mean = apply(x, 2, mean), # mean
  SD = apply(x, 2, sd), # Standard deviation
  Max = apply(x, 2, max)
)
stats <- round(stats, 1)
head(stats)

# within-cluster sum of squares (wss).  Also called a "Scree" plot.
# Silhouette measures the quality of a cluster
# point lies within its cluster.
fviz_nbclust(x, kmeans, method="silhouette")
k <- 0

# pembagian cluster and visualisasi kmeans
kmean=kmeans(x,centers = 3,nstart = 25)
fviz_cluster(kmean, data=x)

#summary
kmean
#melihat tabel cluster
table(data_buddy_move$User.Id, kmean$cluster)

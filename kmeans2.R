# K- means clustreing
#Import mall data
dataset <- read.csv("Mall_Customers.csv")
x <- dataset[4:5]
# Using elbow method to find otimal number of clusters in the data
set.seed(6)
wcss <- vector()
for(i in 1:10)wcss[i]<- sum(kmeans(data,i)$withinss)
plot(1:10, wcss, type ="b",main = paste("Clusters of clients"), xlab = "Number of clusters",
     ylab = "WCSS")
# We can see in the graph the elbow forms at the cluster no 5, that means otimal no. of clusters in this
# grp is 5
#Applying k-means to the mall dataset
set.seed(29)
kmeans <- kmeans(data,centers =  5, iter.max = 300, nstart= 10)
kmeans
y_kmeans <- kmeans$cluster
# Visulaize the clusters
library(cluster)
clusplot(data, y_kmeans, lines = 0,
         shade = TRUE, color = TRUE,
         labels = TRUE, plotchar = FALSE, span = TRUE, main = paste("Clusters of clients"), 
         xlab = "Annual Income", ylab = "Spending score")




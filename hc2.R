# Hierarchical Clustering
# Import mall data
dataset <- read.csv("Mall_Customers.csv")
x <- dataset[4:5]

# Using the dandogram to find the optimal no of clusters
dandogram <- hclust(dist(x, method = "euclidean"), method = "ward.D")
plot(dandogram , main = paste("Dendogram"),
     xlab = "Cusotmers",
     ylab = "Euclidean distances")
# looking at the dandogram we need to find out optimal no of clusters for that we need to find the 
#laregest vertical line. Zoom the graph and check the vertical line that is parallel to 1000, we will take
# that vertical line and assume 5 clusters are the otimal no for this data

# Fitting hierarichal clustreing to mall dataset
hc <- hclust(dist(x, method = "euclidean"), method = "ward.D")
y_hc <- cutree(hc , k= 5)
y_hc

# Visualize the hierarchical clustering
library(cluster)
clusplot(x, y_hc, lines = 0,
         shade = TRUE, color = TRUE,
         labels = 2, plotchar = FALSE, span = TRUE, main = paste("Clusters of clients"), 
         xlab = "Annual Income", ylab = "Spending score")

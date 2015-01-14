# Clean environement
rm(list=ls())

# Load data
# good datasets: mtcars, swiss, airquality
data = mtcars

# Plot data to have a look
plot(data)

###### Using the prcomp function
## Perform PCA
#pca = prcomp(data, scale. = TRUE)

## Plot importance of different axes
#plot(pca)

## Explore which factors play a major role in PC1 and PC2
#plot(pca$x[,1:2], pch=16, col=data$am + 1)

#plot(pca$x[,1:2], pch=16)
#plot(pca$x[,2:3], pch=16)

#plot(pca$x[,1:2], pch=16, col=data$am + 1)
#plot(pca$x[,1:2], pch=16, col=data$cyl + 1)

##### Using the FactoMineR PCA function
library(FactoMineR)
pca = PCA(data)

# Plot importance of different axes
barplot(pca$eig[,1])

# Explore which factors play a major role in PC1 and PC2
pca$var$coord
plot(pca$ind$coord[,1:2], pch=16, col=data$am+1)


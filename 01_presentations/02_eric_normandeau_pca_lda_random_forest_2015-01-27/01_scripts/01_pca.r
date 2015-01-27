# Clean environement
rm(list=ls())


##### About SVD
# Creating fake dataset
set.seed(123)
x = rnorm(100, 5, 3)
y = x/2 + rnorm(100, 0, 1)
data = data.frame(x, y)
plot(data, pch=16, cex=1.5, col="#00000088", xlim=c(0, 12), ylim=c(0, 12))

##### Using the FactoMineR PCA function
# install.packages("FactoMineR")
library(FactoMineR)
pca = PCA(data)

# Plot importance of different axes
barplot(pca$eig[,1])

# Explore which factors play a major role in PC1 and PC2
pca$var$coord

################################################################################

##### Using the mtcars dataset
# Load data
# good datasets: mtcars, swiss, airquality
rm(list=ls())
data = mtcars

# Plot data to have a look
plot(data, pch=16, cex=0.8)

##### Using the FactoMineR PCA function
# install.packages("FactoMineR")
library(FactoMineR)
pca = PCA(data)

# Plot importance of different axes
barplot(pca$eig[,1])

# Explore which factors play a major role in PC1 and PC2
pca$var$coord

# Manual vs. automatic
palette(rainbow(3, v=0.9))
plot(pca$ind$coord[,1:2], pch=16, col=as.factor(data$am),
     cex=1.5, xlim=c(-5, 5), ylim=c(-3, 5))
text(pca$ind$coord[,1], pca$ind$coord[,2] + 0.2,
     row.names(data), col="darkgrey", cex=0.8)

# Number of cylinders
palette(rainbow(3, v=0.9))
plot(pca$ind$coord[,1:2], pch=16 + data$am, col=as.factor(data$cyl),
     cex=1.5, xlim=c(-5, 5), ylim=c(-3, 5))
text(pca$ind$coord[,1], pca$ind$coord[,2] + 0.2, row.names(data),
     col="darkgrey", cex=0.8)

# Power
palette(rainbow(20, v=0.9))
plot(pca$ind$coord[,1:2], pch=16, col=19*data$hp/max(data$hp),
     cex=1.5, xlim=c(-5, 5), ylim=c(-3, 5))
text(pca$ind$coord[,1], pca$ind$coord[,2] + 0.2,
     as.character(data$hp), col="darkgrey", cex=0.8)



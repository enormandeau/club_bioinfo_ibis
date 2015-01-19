# Clean environement
rm(list=ls())

# Load data
# good datasets: mtcars, swiss, airquality
data = mtcars

# Plot data to have a look
plot(data)

##### Using the FactoMineR PCA function
library(FactoMineR)
pca = PCA(data)

# Plot importance of different axes
barplot(pca$eig[,1])

# Explore which factors play a major role in PC1 and PC2
pca$var$coord

# Manual vs. automatic
palette(rainbow(3, v=0.9))
plot(pca$ind$coord[,1:2], pch=16, col=as.factor(data$am), cex=1.5)

# Number of cylinders
palette(rainbow(3, v=0.9))
plot(pca$ind$coord[,1:2], pch=16 + data$am, col=as.factor(data$cyl), cex=1.5)

# Power
palette(rainbow(10, v=0.9))
plot(pca$ind$coord[,1:2], pch=16, col=10*data$hp/max(data$hp), cex=1.5)
text(pca$ind$coord[,1], pca$ind$coord[,2] + 0.15, as.character(data$hp), col="darkgrey")



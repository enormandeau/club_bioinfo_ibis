# TODO
# - Remove part of the dataset (like for LDA) and assess quality of prediction

# Clean environment
rm(list=ls())

# Loading libraries
library(randomForest)


##### Predicting number of cylinders
# Load data
data = mtcars[,-2]

# Random Forest on all samples
rf = randomForest(data, as.factor(mtcars$cyl), ntree=10000)

# It is a classification problem (categories)
rf$type

# How good did we do?
plot(rf)
rf$votes

# See how good our prediction is
rf$confusion

# Prediction
prediction = data.frame(mtcars$cyl, as.numeric(as.character(rf$predicted)))
prediction = data.frame(prediction, prediction[,1] == prediction[,2])
row.names(prediction) = row.names(mtcars)
names(prediction) = c("Real", "Predicted", "Correct")
prediction
mean(prediction[,3])

# Find the important factors
importance = data.frame(rf$importance[order(rf$importance, decreasing=T),])
names(importance) = "Importance"
importance



##### Predicting gas consumption
# Load data
data = mtcars[,-1]

# Random Forest on all samples
rf = randomForest(data, mtcars$mpg, ntree=10000)

# It is a regression problem
rf$type

# Proportion of explained variance
plot(rf$rsq, type='l')

# See how good our prediction is
plot(mtcars$mpg, rf$predicted, pch=16, cex=1.5, col="#00000088",
     main="Predicted vs. Real mileage", ylab="Predicted mileage (mpg)",
     xlab="Actual mileage (mpg)")

# Find the important factors
imp = data.frame(sort(rf$importance[,1], decreasing=T))
names(imp) = c("Importance")
imp


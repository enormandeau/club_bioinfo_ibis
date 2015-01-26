# Clean environment
rm(list=ls())

# Loading the MASS library
# install.packages("MASS")
library(MASS)

# Loading data
data = mtcars

# Doing the LDA
model = lda(formula = cyl ~ ., data = data)
plot(model, cex=1.5, xlim=c(-6, 7), col=data$cyl/2)

# Prediction
set.seed(101)
random = sample(nrow(data))
train.data = data[random[1:22], ]
predict.data = data[random[23:32], ]

model = lda(formula = cyl ~ ., data = train.data)
pred = predict(model, predict.data)

# Assess predictions
success = predict.data$cyl == as.numeric(as.character(pred$class))
data.frame(data=predict.data$cyl, pred=pred$class, success)
mean(predict.data$cyl == as.numeric(as.character(pred$class)))

# Visualize the assignment
plot(model, xlim=c(-10, 10), ylim=c(-10, 10), cex=1.5)
color = rep("red", nrow(predict.data))
color[success] = "green"
text(pred$x[,1], pred$x[,2], as.numeric(predict.data$cyl), col=color, cex=1.5)


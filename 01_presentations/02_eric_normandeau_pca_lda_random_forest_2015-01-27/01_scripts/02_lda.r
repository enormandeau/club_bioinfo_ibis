# Clean environment
rm(list=ls())

# Loading the MASS library
library(MASS)

# Loading data
data = mtcars

# Doing the LDA
model = lda(formula = cyl ~ ., data = data)
plot(model)

# Prediction
set.seed(101)
random = sample(nrow(data))
train.data = data[random[1:22], ]
predict.data = data[random[23:32], ]

model = lda(formula = cyl ~ ., data = train.data)
pred = predict(model, predict.data)

# Assess predictions
predict.data$cyl
pred$class
success = predict.data$cyl == as.numeric(as.character(pred$class))
mean(predict.data$cyl == as.numeric(as.character(pred$class)))

# Visualize the assignment
plot(model, xlim=c(-10, 10), ylim=c(-10, 10))
color = rep("red", nrow(predict.data))
color[success] = "darkgreen"
text(pred$x[,1], pred$x[,2], as.numeric(predict.data$cyl), col=color, cex=1.5)


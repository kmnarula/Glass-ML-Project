set.seed(123456)

# Loading the required libraries:
library(mlbench)
library(caret)
library(dplyr)

# Loading the dataset: 
data(Glass)

# Calculating the pre-process parameters:
preprocessParams <- preProcess(Glass[,1:9], method=c("range"))

# Displaying the transformed parameters:
print(preprocessParams)

# Transforming the dataset according to the parameters:
changed <- predict(preprocessParams, Glass[,1:9])
transformed <- cbind(changed, Type = Glass$Type)

# In order to test our model and make predictions, we will need to divide the dataset 
# into two parts, namely the Training Dataset (80% of the dataset) and the 
# Validation Dataset (20% of the dataset).

# Creating the validation dataset:
validation <- transformed[-createDataPartition(transformed$Type, p=0.80, list=FALSE),]

# Creating the training dataset:
Glass <- transformed[createDataPartition(transformed$Type, p=0.80, list=FALSE),]

# We will now create a test harness:

# We will split our dataset into 10 parts, train in 9 and test on 1 and release for 
# all combinations of train-test splits. We will also repeat the process 3 times 
# for each algorithm with different splits of the data into 10 groups, in an effort 
# to get a more accurate estimate.

# Run algorithms using 10-fold cross validation
control <- trainControl(method="cv", number=10)
metric <- "Accuracy"


# We will now be testing different kinds of models using different types of 
# algorithms:

# 1) Linear Algorithms: 
# Linear Discriminant Analysis (LDA)
fit.lda <- train(Type~., data=Glass, method="lda", metric=metric, trControl=control)

# 2) Non-linear Algorithms: 
# a) Classification and Regression Trees (CART):

fit.cart <- train(Type~., data=Glass, method="rpart", metric=metric, trControl=control)

# b) k-Nearest Neighbors (kNN):
fit.knn <- train(Type~., data=Glass, method="knn", metric=metric, trControl=control)

# 3) Advanced algorithms
# a) Support Vector Machines (SVM) with linear kernel:
fit.svm <- train(Type~., data=Glass, method="svmRadial", metric=metric, trControl=control)


# Numeric summary of the accuracy of the models:
results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm))
summary(results)

# Grpahic summary of the accuracy of the models:
dotplot(results)

# Conclusion: We can clearly see that SVM was the best model!

# The summary of the results of the best model, SVM are:
print(fit.svm)


# We concluded that SVM was the best model. We will now check the accuracy of
# our model on the validation dataset which we separated earlier:

predictions <- predict(fit.svm, validation)
confusionMatrix(predictions, validation$Type)


# We will now be pre-procssing the data. It basically refers to the technique 
# of preparing (cleaning and organizing) the raw data to make it suitable for a 
# building and training Machine Learning models.

# It is important to prepare the data in such a way that it gives various 
# different machine learning algorithms the best chance on the problem.

# Loading the required libraries:
library(mlbench)
library(caret)

# Loading the dataset: 
data(Glass)

# a) Scale Algorithm: 
# Calculating the pre-process parameters:
preprocessParams <- preProcess(Glass[,1:9], method=c("scale"))

# Displaying the transformed parameters:
print(preprocessParams)

# Transforming the dataset according to the parameters:
transformed <- predict(preprocessParams, Glass[,1:9])

# Summarizing the updated dataset:
summary(transformed)

# b) Center Algorithm:

# Calculating the pre-process parameters:
preprocessParams <- preProcess(Glass[,1:9], method=c("center"))

# Displaying the transformed parameters:
print(preprocessParams)

# Transforming the dataset according to the parameters:
transformed <- predict(preprocessParams, Glass[,1:9])

# Summarizing the updated dataset:
summary(transformed)

# c) Standardize Algorithm:
# Calculating the pre-process parameters:
preprocessParams <- preProcess(Glass[,1:9], method=c("center", "scale"))

# Displaying the transformed parameters:
print(preprocessParams)

# Transforming the dataset according to the parameters:
transformed <- predict(preprocessParams, Glass[,1:9])

# Summarizing the updated dataset:
summary(transformed)

# d) Normalize Algorithm:
# Calculating the pre-process parameters:
preprocessParams <- preProcess(Glass[,1:9], method=c("range"))

# Displaying the transformed parameters:
print(preprocessParams)

# Transforming the dataset according to the parameters:
transformed <- predict(preprocessParams, Glass[,1:9])

# Summarizing the updated dataset:
summary(transformed)

# e) Box-Cox Algorithm:
# Calculating the pre-process parameters:
preprocessParams <- preProcess(Glass[,1:9], method=c("BoxCox"))

# Displaying the transformed parameters:
print(preprocessParams)

# Transforming the dataset according to the parameters:
transformed <- predict(preprocessParams, Glass[,1:9])

# Summarizing the updated dataset:
summary(transformed)

# f) Yeo-Johnson Algorithm:
# Calculating the pre-process parameters:
preprocessParams <- preProcess(Glass[,1:9], method=c("YeoJohnson"))

# Displaying the transformed parameters:
print(preprocessParams)

# Transforming the dataset according to the parameters:
transformed <- predict(preprocessParams, Glass[,1:9])

# Summarizing the updated dataset:
summary(transformed)

# g) Principal Component Algorithm:
# Calculating the pre-process parameters:
preprocessParams <- preProcess(Glass, method=c("center", "scale", "pca"))

# Displaying the transformed parameters:
print(preprocessParams)

# Transforming the dataset according to the parameters:
transformed <- predict(preprocessParams, Glass)

# Summarizing the updated dataset:
summary(transformed)

# h) Independent Component Algorithm:
# Calculating the pre-process parameters:
preprocessParams <- preProcess(Glass[,1:9], method=c("center", "scale", "ica"), 
                               n.comp=5)

# Displaying the transformed parameters:
print(preprocessParams)

# Transforming the dataset according to the parameters:
transformed <- predict(preprocessParams, Glass[,1:9])

# Summarizing the updated dataset:
summary(transformed)



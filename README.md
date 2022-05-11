# Glass-Project

Any given project in Machine Learning can be broken down into the following steps: (Also highlighted in Machine Learning Canvas.pdf [Courtesy: AltaML])
  1. Problem
  2. Prediction
  3. Business Task
  4. Data Sources
  5. ROI and Strategic value

**The dataset used:** Glass Dataset (https://archive.ics.uci.edu/ml/datasets/glass+identification). It's a data frame with 214 observations containing 
examples of the chemical analysis of 7 different types of glass. The problem is to forecast the type of class on basis of the chemical analysis. The 
study of classification of types of glass was motivated by criminological investigation. At the scene of the crime, the glass left can be used as 
evidence (if it is correctly identified!).

There isn't any specific problem to be identified in this project. I made this project in order to progress in the field of machine learning by displaying  
how unique algorithms can be used on a dataset and how the best algorithm can be found out and used to evaluate the model on unseen data using the 
language **R**.

Firstly, I toyed around with dataset by taking out the numerical and graphical summaries of the dataset. The fundamental idea is that the numerical and 
visual depiction of data should communicate the truth the data has to offer about the situation of interest.

I then polished the dataset, also known as pre-processing in the field of machine learning. Various different kinds of pre-processing methods were 
used such as:
  1. Scale Algorithm.
  2. Center Algorithm.
  3. Standardize Algorithm.
  4. Normalize Algorithm.
  5. Box-Cox Algorithm.
  6. Yeo-Johnson Algorithm.
  7. Principal Component Algorithm.
  8. Independent Component Algorithm.
The dataset was then divided into training dataset which comprises about 80% of the transformed dataset and validation dataset which comprises about 
20% of the transformed dataset.

Since the safest one is the normalize one, I went forward with that algorithm and built models. The algorithms used are:
  1. Linear Discriminant Analysis (LDA).
  2. K-Nearest Neighbors (KNN).
  3. Classification and Regression Trees (CART).
  4. Support Vector Machines (SVM).

The most effective algorithm was concluded with utmost precaution and used in the rest of the project. It was then used to evaluate the validation 
dataset and then make future predictions.

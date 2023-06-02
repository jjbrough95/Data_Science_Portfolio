# Heart_failure_prediction

Data is read into R and cleaned by changing data types, removing missing data, and creating dummy variables. Once the data is clean, a basic EDA is performed to find trends withing the data. A basic logistic regression model is then fit to check data and model viability.

Data is then read into python and split into test and training groups. The training split is used to fit a logistic regression model. the model creates predictions based on the testing set of data and those predictions are compared against the actual outcome. The results are compared using a confusion matrix.

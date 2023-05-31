library(ggplot2)
library(GGally)
library(car)
library(MASS)
library(lmtest)
library(magrittr)
library(multcomp)
birth.weights <- read.table("Birthweights.txt", header = TRUE)
#EDA
# 1)
ggplot(data = birth.weights, mapping = aes(x=Mage, y=BirthWeight))+geom_point()
# 2)
ggplot(data = birth.weights, mapping = aes(x=Race, y=BirthWeight))+geom_boxplot()
# 3)
ggplot(data = birth.weights, mapping = aes(x=Gage, y=BirthWeight))+geom_point(aes(color = factor(Gen)))
# 4)
cor(birth.weights$Mage,birth.weights$BirthWeight)
# 5)
ggpairs(birth.weights)

# Fitting a linear model
x <- model.matrix(~Mage+Gage+Race+Gen,data=birth.weights)
weights.lm <- lm(BirthWeight~Mage+Gage+Race+Gen, data = birth.weights)
# 1)
B <- solve(t(x)%*%x)%*%t(x)%*%birth.weights$BirthWeight
coef(weights.lm)
s2 <- t(birth.weights$BirthWeight-x%*%B)%*%(birth.weights$BirthWeight-x%*%B)/(nrow(birth.weights)-(ncol(x)-1)-1)
(summary(weights.lm)$sigma)^2
# 2)
x%*%B
fitted(weights.lm)
# 3)
birth.weights$BirthWeight-(x%*%B)
residuals(weights.lm)
# 4)
summary(weights.lm)

# Checking assumptions
# 1)
avPlots(weights.lm) #linearity is OK
# 2)
st.res <- stdres(weights.lm)
ggplot()+geom_histogram(mapping = aes(x=st.res))
ks.test(st.res, "pnorm")
# 3)
fit.values <- fitted(weights.lm)
ggplot(data = weights.lm, mapping = aes(x=fitted(weights.lm), y=stdres(weights.lm)))+geom_point()
bptest(weights.lm) #equal variance assumption is ok

# Predictions
# 1)
xnew <- c(1,26,37,1,0,0,0)
new.pred <- xnew%*%B
new.x <- data.frame(Mage = 26, Gage = 37, Race = "hisp", Gen = "Female")
predict.lm(weights.lm,newdata = new.x)
# 2)
new.x <- data.frame(Mage = 26, Gage = 37, Race = "hisp", Gen = "Female")
predict.lm(weights.lm,newdata = new.x, interval = "prediction", level = 0.99)

# Cross Validation
cv <- 1
n.cv <- 100 #Number of CV studies to run
n.test <- round(.1*nrow(birth.weights))  #Number of observations in a test set
rpmse <- rep(x=NA, times=n.cv)
bias <- rep(x=NA, times=n.cv)
wid <- rep(x=NA, times=n.cv)
cvg <- rep(x=NA, times=n.cv)
for(cv in 1:n.cv){
  ## Select test observations
  test.obs <- sample(x=1:nrow(birth.weights), size=n.test)
  
  ## Split into test and training sets
  test.set <- birth.weights[test.obs,]
  train.set <- birth.weights[-test.obs,]
  
  ## Fit a lm() using the training data
  train.lm <- lm(BirthWeight~., data=train.set)
  
  ## Generate predictions for the test set
  my.preds <- predict.lm(train.lm, newdata=test.set, interval="prediction")
  
  ## Calculate bias
  bias[cv] <- mean(my.preds[,'fit'] - test.set[['BirthWeight']])
  
  ## Calculate RPMSE
  rpmse[cv] <- ((my.preds[,'fit'] - test.set[,'BirthWeight'])^2) %>% mean() %>% sqrt()
  
  ## Calculate Coverage
  cvg[cv] <- ((test.set[['BirthWeight']] > my.preds[,'lwr']) & (test.set[['BirthWeight']] < my.preds[,'upr'])) %>% mean()
  
  ## Calculate Width
  wid[cv] <- (my.preds[,'upr'] - my.preds[,'lwr']) %>% mean()
  
}

# Hypothesis testing and Confidence intervals
# 1)
weights.lm <- lm(BirthWeight~Mage+Gage+Race+Gen, data = birth.weights)
mage.lm <- lm(BirthWeight~Mage, data = birth.weights)
race.lm <- lm(BirthWeight~Race, data = birth.weights)
# 2)
confint(mage.lm, level = .9)
# 3)
anova(weights.lm, race.lm)
# 4)
g.test <- glht()

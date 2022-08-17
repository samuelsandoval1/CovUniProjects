# install.packages("datarium") # use once

# Look at some marketing data that shows the impact of three different
# advertising media (youtube, facebook, and newspaper) on sales. 
# The data are advertising budget in $US1000 along with the sales

library(tidyverse)
library(datarium)
marketing = as_tibble(marketing)
marketing

# predict sales knowing only the spending on youtube advertising.
# The response variable 𝑌 is sales and the predictor variable 𝑋
# is youtube. Exploratory data analysis should start with a scatterplot
ggplot(data=marketing,aes(x=youtube,y=sales)) +
  geom_point()

# lm() used for linear model
x = marketing$youtube
y = marketing$sales
# Model is y = a + b*x
model = lm(y~x)
summary(model)
a = model$coefficients[1]
b = model$coefficients[2]
a
b

# Linear model: 𝑦 = (8.439112) + (0.04753664) × 𝑥

# Exercise. Calculate the correlation coefficient between sales and youtube.
# (this is below here)

# Model is sales = a + b*youtube
ggplot(marketing,aes(x=youtube,y=sales)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE)
model = lm(sales~youtube, data=marketing)
summary(model)

# fitted linear model: 
# sales = (8.439112) + (0.047537) × youtube


# “broom” can be used to nicely tidy up (sweep up) the output of 
# the lm() function as a tibble that can be further used within
# the tidyverse set of functions and packages.
library(broom)
tidy(model)

#  calculate the predicted values (called “y hat”) y^i = a + b x i
# and theresiduals e = yi - y^i using R. 
fitted = augment(model)
fitted

# Can use the fitted values to demonstrate the link between the 
# fitted values and the original values on our scatterplot if we wish.
ggplot(fitted,aes(x=youtube,y=sales)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE) +
  geom_segment(aes(xend=youtube,yend=.fitted), colour="red", size=0.3)

#  predict “sales” from “youtube” advertising ->  sales~youtube
library(tidyverse)
library(datarium)
marketing = as_tibble(marketing)
# Model is sales = a + b*youtube
ggplot(marketing,aes(x=youtube,y=sales)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE)
model = lm(sales~youtube, data=marketing)
summary(model)
# fitted model: sales = (8.439112) + (0.047537) * youtube

# Exercise. Now consider the two linear models “sales~facebook” (with 
# facebook advertising as the only predictor variable) and 
# “sales~newspaper” (with newspaper advertising as the only  predictor
# variable). Investigate these linear models by scatterplot and fitting
# the linear model. Write down the equation of the fitted model in 
# each case.
library(tidyverse)
library(datarium)
marketing = as_tibble(marketing)
# Model is sales = a + b*facebook
ggplot(marketing,aes(x=facebook,y=sales)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE)
model = lm(sales~facebook, data=marketing)
summary(model)
# fitted model: sales = (11.17397) + (9.20250) * facebook


# Exercise. A dataset on using wetland systems to treat wastewater uses 
# biochemical oxygen demand (BOD) mass loading to predict BOD mass removal.

library(tidyverse)
loading = c(3,8,10,11,13,16,27,30,35,37,38,44,103,142)
removal = c(4,7, 8, 8,10,11,16,26,21, 9,31,30, 75, 90)
wetland = tibble(loading,removal)

# (a) Write R code to construct a scatterplot of the dataset above 
# (using ggplot), including the line of best fit.

ggplot(wetland,aes(x=loading,y=removal)) +
  geom_point() +
  geom_smooth(method="lm",se=FALSE)

# (b) Use lm() to fit the linear model “removal~loading” to the dataset. 
# What is the equation of the line of best fit?
model = lm(removal~loading, data=wetland)
summary(model)

# Model is loading = a + b*removal
# equation: removal = (0.62614) + (0.65229) * loading

#(c) Use lm() to fit the linear model “removal~loading-1”
# (no intercept term) to the dataset.
# What is the equation of the line of best fit?

model = lm(removal~loading-1, data=wetland)
summary(model)

# Fitted model:
#   removal = 0.66057*loading
# Notice there is no intercept in this model.



# equation: removal = (0.62614) + (0.65229) * loading


# Multiple Regression

# The linear model is “sales~youtube+facebook” and we can use lm() 
# to fit this model to the data.
# Model is sales = a + b*youtube + c*facebook
model = lm(sales~youtube+facebook,data=marketing)
summary(model)

# Shows: sales =3.50532 + 0.04575 × youtube + 0.18799 × facebook


# Exercise.
# (a) Consider the linear model “sales~youtube+facebook+newspaper” 
# (with three predictor variables). Use lm() to fit this linear model 
# to the data and write down the fitted model.
model = lm(sales~youtube+facebook+newspaper,data=marketing)
summary(model)

# Shows: sales = 3.526667 + 0.045765 x youtube + 
# 0.188530 x facebook + -0.001037 x newsppaer


# (b) How is the scatterplot (produced by the R code below) related 
# to the fitted model from part (a)?
ggplot(marketing,aes(x=youtube+facebook+newspaper,y=sales)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE)

# This is NOT related to the fitted model in part (a).
# The line in the scatterplot would be:
#   sales = a + b*(youtube+facebook+newspaper)
# with just two model coefficients to be calculated

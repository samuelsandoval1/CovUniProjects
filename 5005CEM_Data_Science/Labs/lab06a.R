# The values in the sales column of the marketing tibble are called 
# observed values of sales, i.e., the values in the data.
library(tidyverse)
library(datarium)
marketing = as_tibble(marketing)
observed_sales = marketing$sales
observed_sales

#  fit the linear model “sales~youtube”
model = lm(sales~youtube, data=marketing)
summary(model)
# sales = (8.439112) + (0.047537) x youtube

#  value of sales our fitted model predict for each observed value of
# youtube
a = model$coefficients[1]
b = model$coefficients[2]
predicted_sales = a + b*marketing$youtube
predicted_sales


# residual sales are the “leftovers” (positive or negative)
# when the predicted sales are subtracted from the observed sales.
residual_sales = observed_sales - predicted_sales
residual_sales

# residuals vs predicted values plot
ggplot(NULL, aes(x=predicted_sales, y=residual_sales)) +
  geom_point()
# This plot shows the pattern remaining in the data when the pattern
# explained by the model has been removed

# function augment() used to calculate the predicted (fitted) values
# and the residuals and then plot a scatterplot of the special variables
# with names beginning with dot, i.e., .fitted and .resid
model = lm(sales~youtube, data=marketing)
library(broom)
augment(model) %>%
  ggplot(aes(x=.fitted,y=.resid)) +
  geom_point()

# To construct these diagnostic plots, we use the autoplot() function 
# from the R package “ggfortify”. The diagnostic plots show residuals 
# in four different ways.

install.packages("ggfortify") # run only once
library(ggfortify)
model = lm(sales~youtube,data=marketing)
autoplot(model)

# Exercise: By looking at the four diagnostic plots,
#          do you have any concerns over the regression assumptions 
#          or concerns regarding any particular points in this dataset?
model = lm(sales~youtube+facebook, data=marketing)
autoplot(model)

# By looking at the plots:

# Residuals vs Fitted
#   seems to be a high-low-high nonlinear pattern (BAD)
#   point labelled 131 is clear outlier

# Normal Q-Q
#   generally ok (GOOD)
#   point labelled 131 a concern here too

# Scale-Location
#   points seem to be more spread out vertically
#   in the middle (A BIT BAD)

# Residuals vs Leverage
#   shows clear outlier (labelled 131)
#   generally ok for leverage



#  the linear model “sales~youtube”.
modelA = lm(sales~youtube,data=marketing)
summary(modelA)
# gives R^2 = 0.6119, i.e., 61% of the variance in sales is 
# predictable (explained) by the linear relationship with youtube

# Exercise. Show that the Pearson correlation coefficient between 
#           sales and youtube is 𝑟 = 0.7822244. What is r^2 in this case?

r = cor(marketing$sales, marketing$youtube)
r
# [1] 0.7822244
r^2
# [1] 0.6118751

# the linear model “sales~youtube+facebook
modelB = lm(sales~youtube+facebook,data=marketing)
summary(modelB)
#  gives R^2 = 0.8972, i.e., 90% of the variance in sales is 
#  predictable (explained) by the linear relationship with youtube 
#  and facebook together

# Exercise. Consider the linear model “sales~facebook+newspaper”. 
# Would you consider that this model is a “better” model than
# “sales~youtube”?
model = lm(sales~youtube, data=marketing)
summary(model)
# R^2 = 0.6119

model = lm(sales~facebook+newspaper, data=marketing)
summary(model)
# R^2 = 0.3327

# We would consider the sales~youtube model to be a
# better model (higer R^2 value), i.e., youtube is
# a better predictor of sales than facebook and
# newspaper together.



# Lab 08b

#Taking an exploratory data analysis style look at the data, 
# we might look at summary statistics, scatterplots and 
# correlation coefficients.
library(tidyverse)
state = as_tibble(state.x77)
summary(state)
library(GGally)
ggpairs(state)

# can then use the cor.test() function to carry out a hypothesis 
# test on two particular variables. For example, we can test 
# the correlation between Population and Income.
cor.test(state$Population, state$Income)

# test the correlations between all pairs of variables all at once
install.packages("psych") # run once
library(psych)
corr.test(state)

# We can easily plot a scatterplot of height vs age 
# and fit a linear model “height~age”
children = tribble(
  ~age,~height,~siblings,
  18, 76.1, 1,
  19, 77.0, 2,
  20, 78.1, 3,
  21, 78.2, 2,
  22, 78.8, 0,
  23, 79.7, 1,
  24, 79.9, 5,
  25, 81.1, 0,
  26, 81.2, 1,
  27, 81.8, 4,
  28, 82.8, 1,
  29, 83.5, 5 )
ggplot(children, aes(x=age,y=height)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE)
model = lm(height~age, data=children)
summary(model)

# Use the number of siblings as a predictor
model = lm(height~age+siblings, data=children)
summary(model)


# Exercise. The dataset in the R code below concerns the number 
# of species of tortoise on the various Galapagos Islands. 
# There are 30 cases (Islands) and 7 variables in the dataset. See
# for a description of the variables involved.

#install.packages("faraway") # run only once
library(tidyverse)
library(faraway)
gala = as_tibble(gala)
library(GGally)
ggpairs(gala)
model = lm(Species~Area+Elevation+Nearest+Scruz+Adjacent,data=gala)
summary(model)

#  a) From the scatter matrix, which variables have significant 
# correlation coefficient with Species? Does corr.test() 
# provide the same information?


# (b) From fitting the linear model, which predictor variables 
# are NOT significant predictors of Species? What linear model 
# would you suggest instead?
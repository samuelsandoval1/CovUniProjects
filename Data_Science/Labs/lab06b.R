# Look at a dataset which gives credit card balance ($),
# income (in thousands), credit card limit, credit rating, age, 
# and years of education for 400 people.
# install.packages("ISLR") # run only once
library(tidyverse)
library(ISLR)
credit = as_tibble(Credit)
credit = select(credit,Balance,Limit,Income)
summary(credit)

# Look at the correlation between the variables (take them in pairs).
# install.packages("GGally") # run only once
library(GGally)
ggscatmat(select(credit,Balance,Limit,Income))

# We r interested in predicting credit card balance (Balance) 
# using credit card limit (Limit), i.e., the response variable 
# is Balance and the predictor variable is Limit.
ggplot(credit, aes(x=Limit,y=Balance)) +
  geom_point() +
  geom_smooth(method="lm",se=FALSE)
model = lm(Balance~Limit, data=credit)
summary(model)
model$coefficients
# line of best fit as: Balance = -292.7904955 + 0.1716373×Limit

# Exercise. Plot a scatterplot of “Balance~Income” and fit a 
# linear model using lm(). What is the corresponding 𝑅2 value? 
# Is this better or worse than the 𝑅2 value for “Balance~Limit”?

ggplot(credit, aes(x=Income,y=Balance)) +
  geom_point() +
  geom_smooth(method="lm",se=FALSE)
model = lm(Balance~Income, data=credit)
summary(model)
model$coefficients

# Fitted model:
#   Balance = 246.5148 + 6.0484*Income
#   R^2 = 0.215
#     worse than for Balance~Limit (R^2=0.7425)


# can fit the linear model “Balance~Limit+Income” and find that 
# R^2 = 0.8711 which has improved on both “Balance~Limit” and
# “Balance~Income”.
model = lm(Balance~Limit+Income, data=credit)
summary(model)
# Balance = -385.1793 + 0.24643 × Limit – 7.6633 × Income 
# has negative multiplier

# should visually check the four diagnostic plots to see 
# if this regression model is valid for this dataset.
library(ggfortify)
autoplot(model)


# Exercise. The credit card data set also has variables for credit 
# rating and age. Compare the models “Balance~Rating”, “Balance~Age” 
# and “Balance~Rating+Age” in terms of R^2 value.
credit = as_tibble(Credit)
credit = select(credit,Balance,Limit,Income,Rating,Age)

# We will look again at the “gapminder” dataset,just focusing on
# data from the year 2007.
# install.packages("gapminder") # run only once
library(tidyverse)
library(gapminder)
gapminder2007 = gapminder %>%
  filter(year==2007) %>%
  select(country, continent, lifeExp, gdpPercap)
gapminder2007

# Take a look at life expectancy across all countries in 2007. 
# We see that life expectancy ranges from 39.61 years to 82.60 years
# but with a mean (across countries) of 67.01 years. 
summary(gapminder2007$lifeExp)
ggplot(gapminder2007, aes(x=lifeExp)) +
  geom_histogram(binwidth=5)

# The mean of 67.01 years gives our best estimate of life expectancy
# if we do not have any further information, i.e., we have 
# NO predictor variable. Notice that fitting "lifeExp~1" 
# also gives this same information. 
model = lm(lifeExp~1, data=gapminder2007)
model

# Now break this down by continent and we see a histogram for each 
# continent and notice that the mean for Africa is 54.8 years 
# but for Europe is 77.6 years.
library(tidyverse)
gapminder2007 %>%
  group_by(continent) %>%
  summarise(count=n(),mean=mean(lifeExp))
ggplot(gapminder2007, aes(x=lifeExp)) +
  geom_histogram(binwidth=5) +
  facet_wrap(~continent)

# Now consider mean life expectancy above that of Africa.
gapminder2007 %>%
  group_by(continent) %>%
  summarise(count=n(),mean=mean(lifeExp-54.8))

# Now we are in a good place to understand what the linear model 
# “lifeExp~continent” produces.
model = lm(lifeExp~continent, data=gapminder2007)
model


# Look at some data which predicts a person’s score (on some task) 
# using their age (quantitative) and gender (categorical)
library(tidyverse)
load(url("http://www.openintro.org/stat/data/evals.RData"))
evals = as_tibble(evals) %>%
  select(score, age, gender)
summary(evals)
ggscatmat(evals, color="gender") # not working?

# We use geom_jitter rather than geom_point because there are 
# multiple points all plotted over the top of each other.
ggplot(evals, aes(x=age,y=score,colour=gender)) +
  geom_jitter() +
  geom_smooth(method="lm", se=FALSE)
female_evals = filter(evals, gender=="female")
female_model = lm(score~age, data=female_evals)
female_model

male_evals = filter(evals, gender=="male")
male_model = lm(score~age, data=male_evals)
male_model

# Linear model “score~age+gender”.
model = lm(score~age+gender, data=evals)
model


# We have ignored what is called the “interaction effect” between age 
# and gender, i.e., that exactly how score is predicted from age 
# depends on gender (and how score is predicted from gender depends on age).
# using *
model = lm(score~age*gender, data=evals)
model

# Exercise. Consider using smoking status (“yes” or “no”) of the
# mother and length of pregnancy (gestation) to predict birth weight o
# f babies (grams).
# (a) Load the dataset from the TSV file birthsmokers.tsv (on Aula).
library(tidyverse)
babies = read_tsv("birthsmokers.tsv")
# (b) Consider the graphical plot produced by the R code below. 
#     Carefully explain what you notice in the plot.

ggplot(babies, aes(x=gestation,y=weight)) +
  geom_point(aes(colour=smoking)) +
  geom_smooth(method="lm",se=FALSE)

# The line is the line-of-best-fit for the whole
# dataset. It is striking that most pink dots
# are above (mother does NOT smoke) and most
# blue dotes are below (mother DOES smoke).


# (c) Fit, interpret and compare the two linear models: 
#     weight ~ gestation and weight ~ gestation + smoking. 
#     What can you conclude about how smoking influences the 
#     relationship between weight and gestation?

model = lm(weight~gestation, data=babies)
summary(model)
# weight = -2037.00 + 130.82*gestation
# R^2 = 0.7752

model = lm(weight~gestation+smoking, data=babies)
summary(model)

# for mothers who do NOT smoke: 
#   weight = -2389.573 + 143.100*gestation
# for mothers who DO smoke:
#   weight = (-2389.573-244.544) + 143.100*gestation
# R^2 = 0.8964 

# The second model has higher R^2 (better model).

# Conclusion: If the mother smokes then the baby
# weight falls by 244grams on average below the
# baby weight if the mother does not smoke.

# (d) What model would you recommend to be investigated next and why?

model = lm(weight~gestation*smoking, data=babies)
summary(model)
# (Notice the * instead of +.)
# This model includes the "interaction effect",
# considers effect of smoking on both intercept
# and multiplier.

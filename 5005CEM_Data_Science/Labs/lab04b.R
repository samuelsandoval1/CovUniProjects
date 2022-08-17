library(tidyverse)
install.packages("titanic") # run only once
library(titanic)
titanic = as_tibble(titanic_train)
titanic

titanic = select(titanic,Survived,Pclass,Name,Gender=Sex,Age,Fare)
titanic
summary(titanic)

# summary() that Survived and Pclass are summarised by counts of
# how many passengers rather than mean, median, etc
titanic$Survived = as_factor(titanic$Survived)
titanic$Pclass = as_factor(titanic$Pclass)
titanic
summary(titanic)

# a scatter matrix which show relationships between 
# the quantitative variables.
library(GGally)
ggscatmat(titanic)


# Survived titanic
summary(titanic$Survived)

# Survived by Gender
ggplot(titanic, aes(x=Gender)) +
  geom_bar(aes(fill=Survived))

# Survived by Pclass
ggplot(titanic, aes(x=Pclass)) +
  geom_bar(aes(fill=Survived))

# Survived by Gender and Pclass
ggplot(titanic, aes(x=Gender)) +
  geom_bar(aes(fill=Survived)) +
  facet_wrap(~Pclass)

# Survived by Age and Gender (beware colours)
ggplot(titanic, aes(x=Age)) +
  geom_histogram(aes(fill=Survived),binwidth=5) +
  facet_grid(Gender~Pclass)

# Exercise. The “diamonds” dataset contains categorical variables
# cut, color and clarity. Write R code to reproduce the graphical 
# plot below. Write down what you notice about the median price.

library(tidyverse)
library(GGally)
summary(diamonds)
ggplot(diamonds,aes(x=color,y=price)) +
  geom_boxplot() +
  facet_wrap(~cut)

# Conclusion: for Very Good, Premium and Ideal diamonds, the median
# price increases with color grade (D to J) with J highest.
# Also median price is much less than maximum price.

# come back to ^^


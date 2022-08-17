
#  calculate summary statistics for each variable 
# (including the mean, median, quartiles, max and min) using summary().

library(tidyverse)
# Anscombe's quartet
View(anscombe)
# first Anscombe dataset given by columns 1 and 5
x = anscombe[,1]
y = anscombe[,5]


# summary code
summary(x)
sd(x)
summary(y)
sd(y)
cor(x,y)

# construct a scatterplot to visualise the relationship
# between the two variables
library(tidyverse)
ggplot(NULL,aes(x=x,y=y)) +
  geom_point()

# Anscombe's quartet
# second Anscombe dataset given by columns 2 and 6
x = anscombe[,2]
y = anscombe[,6]
# run summary code from line 14
# run scatterplot with code from line 22


# third dataset
x = anscombe[-3,3]
y = anscombe[-3,7]
# run summary code from line 14
# run scatterplot with code from line 22

# gapminder
# install.packages("gapminder") # run only once
library(gapminder)
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point(aes(colour=continent))

gapminder %>%
  filter(year==2007) %>%
  group_by(continent) %>%
  summarise(num_countries=n_distinct(country),
            r=cor(gdpPercap,lifeExp))

# Exercise. For the “diamonds” dataset, write a dplyr pipe that produces 
# a summary table showing for each cut of diamond the number of diamonds
# of that cut and the correlation coefficient of carat and price.
# Which cut of diamond has the highest correlation coefficient
# between carat and price? (Pg. 4)
library(tidyverse)
View(diamonds)
diamonds %>%
  group_by(cut) %>%
  summarise(count=n(),cor_carat_price=cor(carat,price))

# Highest correlation coeffecient is: Ideal





# Dataset which gives credit card balance ($), income (in thousands),
# credit card limit, credit rating, age, and years of education for 400 ppl
install.packages("ISLR")
library(tidyverse)
library(ISLR)
credit = as_tibble(Credit)
credit = select(credit,Balance,Limit,Income)
summary(credit)

#  look at the correlation between the variables (take them in pairs). 
ggplot(credit, aes(x=Balance, y=Limit)) +
  geom_point()
cor(credit$Balance,credit$Limit)

# quick and easy way to look at all the pairs of quantitative
# variables at the same time in a scatter matrix 

# install.packages("GGally") # run only once
library(GGally)
ggscatmat(select(credit,Balance,Limit,Income))

# Exercise (page 6) -- Decathlon

# (a)
cor(hurdles,longjump) = -0.39
#     makes sense (minimise time, maximise distance).
cor(discus,longjump) = -0.13
#     does *NOT* make sense (maximise both), tradeoff strength vs speed
cor(hurdles,points) = -0.54
#     makes sense (award more points for a shorter time to run)

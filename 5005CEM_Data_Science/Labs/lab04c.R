library(tidyverse)
library(ISLR) # you might also need install.packages("ISLR")
credit = as_tibble(Credit)
ggplot(credit, aes(x=Income,y=Balance)) +
  geom_point()

#specify a title and axis labels to a plot.
ggplot(credit) +
  geom_point(aes(x=Income,y=Balance,colour=Student)) +
  scale_colour_discrete() +
  labs(title="Balance vs Income ",
       x = "Income ($000)",
       y = "Balance ($)")

# set the scales of a plot
ggplot(credit) +
  geom_point(aes(x=Income,y=Balance)) +
  scale_x_continuous(limits=c(-100,250))

# So overall, we have the following R code to build the plot 
# in a variable called d. The final line draws the plot
d = ggplot(mpg, aes(fl))
d = d + geom_bar()
d = d + coord_flip()
d

ggplot(mpg, aes(fl)) +
  geom_bar() +
  coord_flip()

# Exercises:
# (a) Construct the example plot. Check your understanding using the 
# R Graph Gallery. Try constructing your own histogram, for
# example, you could use a variable from the gapminder dataset.

library(ggplot2)
library(gapminder)
data(gapminder)

data=data.frame(value=rnorm(100))

# basic histogram
library(tidyverse)
c = ggplot(mpg, aes(hwy))
c + geom_histogram(binwidth=5)

library(gapminder)
ggplot(gapminder, aes(lifeExp)) +
  geom_histogram(binwidth=5)

# (b) Do a boxplot example plot
f = ggplot(mpg, aes(class,hwy))
f + geom_boxplot()

ggplot(gapminder, aes(pop)) +
  geom_boxplot()

# (c) Two categorical variables
g = ggplot(diamonds, aes(cut,color))
g + geom_count()


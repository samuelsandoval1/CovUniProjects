
# 5005CEM Data Science
# Live coding -- Week 4 -- Wednesday

# More Exploratory Data Analysis



library(tidyverse)
url = 'https://raw.githubusercontent.com/mwaskom/seaborn-data/master/penguins.csv'
penguin = read_csv(url)
penguin

# install.packages("GGally")
library(GGally)
ggpairs(penguin)

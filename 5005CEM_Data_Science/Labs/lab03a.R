library(tidyverse)
install.packages("gapminder") # run only once
library(gapminder)

# Approach 1: Intermediate variables
A = filter(gapminder, continent=="Europe", year==2007)
B = select(A,-continent,-year)
ggplot(B,aes(x=gdpPercap,y=lifeExp, size=pop)) +
  geom_point(alpha=0.5)


# Approach 2: Nested function calls
ggplot(select(filter(gapminder, continent=="Europe", year==2007),
              -continent,-year),aes(x=gdpPercap,y=lifeExp, size=pop)) +
  geom_point(alpha=0.5)

# Approach 3: Pipes
gapminder %>%
  filter(continent=="Europe", year==2007) %>%
  select(-continent,-year) %>%
  ggplot(aes(x=gdpPercap,y=lifeExp, size=pop)) +
  geom_point

# produce summaries of variables in a tibble. A summary function
# takes a vector as an input and returns one value. The summary function n() counts
# the number of rows, n_distinct(variable) counts the number of distinct values in the
# variable, and mean(variable) calculates the mean of the values in the variable
gapminder %>%
  filter(year==1952) %>%
  summarise(num_countries=n_distinct(country),
            mean_pop=mean(pop))

# we can group the rows of a tibble by some logical criterion
#(using group_by()) and then apply the summary functions to each 
#group of rows separately
gapminder %>%
  group_by(year) %>%
  summarise(num_countries=n_distinct(country),
            mean_pop=mean(pop))

#  pipe this summary dataset (tibble) directly into ggplot to draw a basic
# line graph of the results.
gapminder %>%
  group_by(year) %>%
  summarise(num_countries=n_distinct(country),
            mean_pop=mean(pop)) %>%
  ggplot(aes(x=year,y=mean_pop)) +
  geom_line()

options(scipen=1000)

# Exercises

myleague = "E0"
# Get data from www.football-data.co.uk
url = paste0("http://www.football-data.co.uk/mmz4281/1920/",myleague,".csv")
football = read_csv(url)
football
distinct(football, HomeTeam)

# Pick your favourite team in this league, and filter out only those matches (rows) that
# your team is involved in (either as the home team or the away team).

gapminder %>%
  filter(HomeTeam=="Man United") %>%
  select(-HomeTeam  -Matches)

library(tidyverse)
myleague = "E0"
url = paste0("http://www.football-data.co.uk/mmz4281/1920/",myleague,".csv")
football = read_csv(url)

# (a)
myteam = "Wolves"
football %>%
  filter(HomeTeam==myteam | AwayTeam==myteam)
# or
result = football %>%
  filter(HomeTeam==myteam | AwayTeam==myteam)
View(result)

# Write a dplyr pipe to find the mean (average) number of Full Time Home Goals
# scored by each team over the league season
# (b)

football %>%
  group_by(HomeTeam) %>%
  summarise(mean_FTHG=mean(FTHG))
# or perhaps we want to sort them in descending order
football %>%
  group_by(HomeTeam) %>%
  summarise(mean_FTHG=mean(FTHG)) %>%
  arrange(desc(mean_FTHG))








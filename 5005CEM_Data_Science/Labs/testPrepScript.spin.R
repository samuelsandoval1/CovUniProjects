# Test Prep R Script

# code for probs that use pnorm, qnorm
pnorm(20,15,3) - pnorm(10,15,3) # for proababilty
qnorm(0.1,15,3)  # at most/ up to?

qnorm(0.43,96,25) 

pnorm(475,500,20)
1-pnorm(515,500,20)

pnorm(70,75,12) - pnorm(60,75,12)
qnorm (.85, 75, 12)
1 - pnorm(75, 60, 15)
qnorm(.4, 60, 15)

1 - pnorm(127, 100, 15)
qnorm(0.10, 100, 15)

(1-pnorm(133,100,15))/(1-pnorm(127,100,15))

pnorm(224,232,5)
qnorm(0.7,232,5)

# Question 5 April 
M = cbind(c(1,1),c(-1,1))
flag = rbind(c(0, 0, 1, 1, 0),
             c(0, 2, 2, 1, 1))
par(pty="s")
plot(0,0,xlim=c(-2,2),ylim=c(-2,2))
grid()
lines(flag[1,],flag[2,],col='blue')

newflag = M %*% flag

lines(newflag[1,],newflag[2,],col='blue',lty=2)

# Code part of April Phase test
library(tidyverse)
library(ggfortify)

setwd("~/Projects/Data_Science/Labs")
flying = read_csv('../Data/flying.csv')
flying

nrow(flying)
ncol(flying)


# bar chart
ggplot(flying,mapping=aes(x=frequency)) +
  geom_bar()+ 
  coord_flip() +
  ggtitle("Frequency ppl travel by plane")

# summary table
flying %>%
  filter(recline_frequency == "Never" | recline_frequency == "Once in a while")%>%
  group_by(recline_rude) %>%
  summarise(count=n())
#recline_rude
#recline_frequency

#children_under_18 
#baby
flying %>%
  select(baby,children_under_18) %>%
  drop_na()%>%
  ggplot(aes(x=children_under_18, fill=baby)) +
    geom_bar() +
    ggtitle("Is it rude to bring a baby on the plane?")

# bank.csv
bank = read_csv('../Data/bank.csv')
# salary~service


# calculate correlation efficient, best fit eq code
ggplot(bank,aes(x=salary,y=service)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE)
model = lm(salary~service, data=bank)
summary(model)
# 43382.70  <-- intercept
# 73.25 <-- coefficent of sales

# use salary and size to predict sales
ggplot(bank,aes(x=salary,y=service)) +
  geom_point() +
  geom_smooth(method=lm, se=FALSE)
model = lm(salary~service+size, data=bank)
summary(model)
# Intercept: 46481.10
# Coefficent: 82.89


# Code part of July Phase test
fruit = read_csv('../Data/fruit.csv')
fruit

nrow(fruit)
ncol(fruit)

# to see the fruit types
select(fruit,item) %>% unique()
distinct(fruit,country)

spain = filter(fruit, country=='Spain') %>% select(item) %>% unique() 
uk = filter(fruit, country=='UK') %>% select(item)  %>% unique() 
intersect(spain,uk)
# not used but show other fruit stuff (below)
union(spain,uk)
setdiff(spain,uk)

fruit %>%
  filter(item=='Strawberries') %>%
  ggplot(aes(x=year , y=yield, colour=country )) +
  geom_line() 

# summary table, 2019
fruit %>%
  filter(year==2019) %>%
  group_by(item) %>%
  summarise(total_area = sum(area))

cycle = read_csv('../Data/cycling.csv')
cycle

ggplot(cycle, aes(x=age25to34,y=cycletowork)) + 
  geom_point() +
  geom_smooth(method=lm, se=FALSE)

model = lm(cycletowork~age25to34, data=cycle)
summary(model)

autoplot(model)

model = lm(cycletowork~age25to34+travel10to20km+zerocarsvans, data=cycle)
summary(model)

# fitted model:
# cycletowork = 0.8177823 + 0.1263045 * age25to34
#                         - 0.817057 * travel10to20km
#                         + 0.006776 * zerocarsvans

model = lm(cycletowork~age25to34+travel10to20km, data=cycle)
summary(model)
# R^2 = 0.4564


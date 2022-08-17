# Lab08a

# calculating the sample mean 𝑥̅ (we say “x bar”).
# Endpoints of Uniform distribution
a = 0 # feel free to change
b = 50 # feel free to change but need a<b
# Sample size
n = 40 # feel free to change but need n>=30
# Random sample
x = runif(n,a,b)
x
# Sample mean
xbar = mean(x)
xbar

# can form the confidence interval using the formulas for the 
# lower and upper ends given above. All when need to do is
# select a value for z
a = 0
b = 50
n = 40
x = runif(n,a,b)
xbar = mean(x)
# Sample standard deviation
s = sd(x)

# Magic value
z = 2
# Confidence interval
lower = xbar - z*s/sqrt(n)
upper = xbar + z*s/sqrt(n)
print(c(lower,upper))

# For each random sample, we will construct a 95% confidence interval, 
# and check whether the true population mean is within the
# confidence interval.
# should see should see 100000 different confidence intervals
# go past in the output

z = 2 # magic value
a = 0
b = 50
n = 40
replications = 100000
outside = rep(FALSE,replications)
for (i in 1:replications)
{
  x = runif(n,a,b)
  xbar = mean(x)
  s = sd(x)
  lower = xbar - z*s/sqrt(n)
  upper = xbar + z*s/sqrt(n)
  print(c(lower,upper))
  truemean = (a+b)/2
  outside[i] = (truemean<lower) | (truemean>upper)
}
summary(outside)
failure = sum(outside)/length(outside)
failure

# Exercise. For different values of 𝑧 record the proportion 
# of failures (failure). For example, when 𝑧 = 2 the result 
# is approximately 0.05337 (which will vary each time you run 
# due to random variation) which means approximately 5.337% 
# of confidence intervals did not contain true population mean 𝜇.


# IDK

# The third column records the variable prob from the R code below,
# corresponding to each value of 𝑧. Calculate the missing 
# values of prob.
z = 2.0
prob = (1-pnorm(z,0,1))+pnorm(-z,0,1)
prob

# can therefore use the R function qnorm() to find the 
# 𝑧 value corresponding to a given probability 𝛼.
alpha = 0.05
qnorm(1-alpha/2,0,1)

# Exercise. What value of 𝑧 would be used for a 99% confidence
# interval? What value of 𝑧 would be used for a 90% confidence 
# interval?

# IDK

# plots the standard normal distribution (the highest peak) and
# some example t-distributions. 
x = seq(-3.5,3.5,0.01)
ggplot(NULL) +
  geom_line(aes(x,y=dnorm(x,0,1))) +
  geom_line(aes(x,y=dt(x,30)), colour="red") +
  geom_line(aes(x,y=dt(x,8)), colour="green") +
  geom_line(aes(x,y=dt(x,3)), colour="blue")


# We change our confidence interval demo R code so that the random
# samples come from a normal distribution, and the “1.96” 
# is replaced by a quantile from the correct t-distribution,
# i.e., the one with value 𝑛 − 1 for the degrees of freedom parameter.
alpha = 0.05
mu = 25
sigma = 8
n = 5
replications = 100000
outside = rep(FALSE,replications)
for (i in 1:replications)
{
  x = rnorm(n,mu,sigma)
  xbar = mean(x)
  s = sd(x)
  lower = xbar - qt(1-alpha/2,n-1)*s/sqrt(n)
  upper = xbar + qt(1-alpha/2,n-1)*s/sqrt(n)
  print(c(lower,upper))
  truemean = mu
  outside[i] = (truemean<lower) | (truemean>upper)
}
summary(outside)
failure = sum(outside)/length(outside)
failure

# Exercise. Try different values for 𝛼, mu, sigma and 𝑛, 
# and check the corresponding value of failure. 
# (Remember that 𝛼 is a probability.)

# t

# We will look at data from across the different states of the USA.
# The data set “state.x77” is built into R. The variable Murder 
# is the murder rate in each state per 100,000 people 
# (in the year 1976).
library(tidyverse)
state = as_tibble(state.x77)
summary(state)

# We write this formally as the null hypothesis 𝐻0: 𝜇 = 8.5.
# Of course, R knows all about hypothesis testing, and has one
# main command that does all the work
t.test(state$Murder, mu=8.5)

# Let us see where all of these numbers come from.
x = state$Murder
t = (mean(x)-8.5)/(sd(x)/sqrt(length(x)))
t
df = length(x)-1
df
p_value = 2*pt(t,df)
p_value
lower = mean(x)-qt(1-0.05/2,df)*sd(x)/sqrt(length(x))
upper = mean(x)+qt(1-0.05/2,df)*sd(x)/sqrt(length(x))
c(lower,upper)

# Exercise. Try the R code below. What confidence intervalis
# reported? What is the null hypothesis of the hypothesis test 
# carried out?
t.test(state$Income, conf.level=0.90)
# Its 4435.8
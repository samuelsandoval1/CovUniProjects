library(tidyverse)

# follows a continuous uniform distribution, i.e., 𝑋~𝑈(0,360)

# Plot of pdf of U(0,360)
a = 0
b = 360
x = -100:450
y = dunif(x,a,b)
qplot(x,y,geom="line")

# the probability that the spinner lands in the range 
# from 45 to 90 degrees
# If X~U(0,360), find P(45<=X<=90)
punif(90,0,360)-punif(45,0,360)
# Gives answer 0.125

# Exercise. What is the probability that the spinner lands 
# in the range from 315 to 45 degrees? Be careful.
punif(45,0,360) + 1-punif(315,0,360)


# Normal distribution in R
mu = 100
sigma = 15
x = (mu-3.5*sigma):(mu+3.5*sigma)
y = dnorm(x,mu,sigma)
qplot(x,y,geom="line")

# probability of randomly selected person having an IQ 
# between 120 and 140
pnorm(140,mu,sigma)-pnorm(120,mu,sigma)
# : 0.0874 

# IQ value is such that 99% of people have 
# IQ less-than-or-equal-to that value
qnorm(0.99,mu,sigma)

# Exercise. Without using any R, what do you think the
# value of qnorm(0,100,15) will be? What about qnorm(1,100,15)? 
# Confirm your answers using R.

qnorm(0,100,15)
qnorm(1,100,15)


# Challenge. The function qnorm(p,mu,sigma) is used to find the
# value 𝑥 such that 𝑃(𝑋 ≤ 𝑥) = 𝑝 where the given 𝑝 is 
# the first argument to the qnorm function. Use R and qplot to 
# draw a graph where the horizontal axis is values of 𝑝 and the
# vertical axis is the corresponding values of the qnorm function
# for the distribution of IQ scores. You will want to use the
# seq function (to get help type ?seq in the R console).

mu = 100
sigma = 15
prob  = seq(0,1,0.001)
value = qnorm(prob,mu,sigma)
qplot(prob,value,geom="line")

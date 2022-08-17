# First dataset from Anscombe’s quartet (the data is
# built into R) and plot the corresponding scatterplot using ggplot
library(tidyverse)
# Anscombe's quartet (first dataset)
x = anscombe[,1]
y = anscombe[,5]
ggplot(NULL,aes(x=x,y=y)) +
  geom_point(size=4)


# Given 𝑎 = 2.0 and 𝑏 = 0.7, we can calculate the corresponding 
# residuals (observed minus predicted values of y) as follows.
a = 2.0
b = 0.7
residuals = y-(a+b*x)
residuals
ggplot(NULL,aes(x=x,y=y)) +
  geom_point(size=4) +
  geom_abline(slope=b,intercept=a)


# Calculating line that is best fit
b = 0.7
a = mean(y)-b*mean(x)
residuals = y-(a+b*x)
ggplot(NULL,aes(x=x,y=y)) +
  geom_point(size=4) +
  geom_abline(intercept=a,slope=b) +
  geom_rect(aes(xmin=x,xmax=x-residuals,
                ymin=y,ymax=y-residuals),
            fill="green",alpha=0.5) +
  coord_fixed() +
  xlim(3,17) +
  ylim(3,12)
SSR = sum(residuals^2)
SSR

# Exercise. Continue to increase the value of 𝑏 in the R code above,
# and note what happens to the SSR value. What value of 𝑏 appears to 
# give the smallest SSR value? You might want to try wrapping the 
# R code in a loop (for b) to automate the process.

for (b in seq(0.4,0.6,0.05)) {
  a = mean(y)-b*mean(x)
  residuals = y-(a+b*x)
  SSR = sum(residuals^2)
  cat(b,SSR,'\n')
}

# 0.4  14.86469 
# 0.45 14.03869 
# 0.5  13.76269 
# 0.55 14.03669 
# 0.6  14.86069 
# Exercise. A dataset on using wetland systems to treat wastewater 
# uses biochemical oxygen demand (BOD) mass loading (the x variable) 
# to predict BOD mass removal (the y variable)
library(tidyverse)
loading = c(3,8,10,11,13,16,27,30,35,37,38,44,103,142)
removal = c(4,7, 8, 8,10,11,16,26,21, 9,31,30, 75, 90)
wetland = tibble(loading,removal)
x = loading
y = removal

# (a) Use ggplot to construct a scatterplot of this dataset. 
# Roughly estimate the slope ofthe line of best fit.

ggplot(wetland, aes(x=loading, y=removal)) +
  geom_point(size=4)
b_rough = max(removal)/max(loading)
# > b_rough
# [1] 0.6338028



# (b) Modify the R code on page 4 to refine the estimate of b, 
# starting from 𝑏 = 1. Make sure you modify the xlim() and ylim()
# so that you can see all the green squares. What value of 𝑏 appears 
# give the smallest SSR value? You might want to try wrapping
# the R code in a loop to automate the process.

b = 1
a = mean(y)-b*mean(x)
residuals = y-(a+b*x)
ggplot(NULL,aes(x=x,y=y)) +
  geom_point(size=4) +
  geom_abline(intercept=a,slope=b) +
  geom_rect(aes(xmin=x,xmax=x-residuals,
                ymin=y,ymax=y-residuals),
            fill="green",alpha=0.5) +
  coord_fixed() +
  xlim(0,200) +
  ylim(0,150)
SSR = sum(residuals^2)
SSR

for (b in seq(1,0.5,-0.05)) {
  a = mean(y)-b*mean(x)
  residuals = y-(a+b*x)
  SSR = sum(residuals^2)
  cat(b,SSR,'\n')
}


# Output
# 1 2810.357 
# 0.95 2164.843 
# 0.9 1619.344 
# 0.85 1173.859 
# 0.8 828.3886 
# 0.75 582.933 
# 0.7 437.4921 
# 0.65 392.0659 
# 0.6 446.6543 
# 0.55 601.2573 
# 0.5 855.875 


# Conclusion: the value of b that gives the smallest SSR
#   is between 0.64 and 0.66


# calculate best values of a and b
x = anscombe[,1]
y = anscombe[,5]
b = sum((x-mean(x))*(y-mean(y)))/sum((x-mean(x))^2)
a = mean(y)-b*mean(x)
b
a
# The best-fit values of 𝑎 and 𝑏 are: 𝑎 = 3.000091 and 𝑏 = 0.5000909.



# Exercise. For the wetland dataset, using mass loading (the 𝑥 variable) 
# to predict BOD mass removal (the 𝑦 variable), calculate the 
# best-fit values of 𝑎 and 𝑏 and write down the line of best fit 
# (in terms of removal and loading)
loading = c(3,8,10,11,13,16,27,30,35,37,38,44,103,142)
removal = c(4,7, 8, 8,10,11,16,26,21, 9,31,30, 75, 90)
wetland = tibble(loading,removal)
x = loading
y = removal


# Exercise. The “cars” dataset is also built in to R. It gives the 
# speed (mph) of cars and the corresponding distances (dist) taken 
# to stop (feet). These are all cars from the 1920s

library(tidyverse)
summary(cars)
x = cars$speed
y = cars$dist

# (a) Plot a scatterplot of stopping distance vs speed (this means 
# that dist is on the vertical axis and speed is on the horizontal axis)
# Add a title to your plot and label the horizontal and vertical axes.
# Roughly estimate the slope of the line of best fit.

library(tidyverse)
ggplot(cars, aes(x=speed, y=dist)) +
  geom_point() +
  labs(title="Stopping distances of 1920s cars",
       x="Speed (mph)",
       y="Distance (feet)")
b_rough = max(cars$dist)/max(cars$speed)
# > b_rough
# [1] 4.8

# (b) Calculate the correlation coefficient between stopping distance
# and speed. How would you describe the relationship between the speed 
# and stopping distance?

cor(cars$speed,cars$dist)
# or
x = cars$speed
y = cars$dist
cor(x,y)

# [1] 0.8068949
# Conclusion: strong positive relationship

#  (c) Suppose we wish to use speed (the 𝑥 variable) to predict stopping
#  dist (the y variable). Calculate the best-fit values of 𝑎 and 𝑏 
# and write down the line of best fitin terms of dist and speed). 
# For these 1920s cars, what is the approximate increase in stopping 
# distance required for a 1mph increase in speed?

b = sum((x-mean(x))*(y-mean(y)))/sum((x-mean(x))^2)
a = mean(y)-b*mean(x)
b
a
# > b
# [1] 3.932409
# > a
# [1] -17.57909

# Fitted model:
#   dist = -17.57909 + 3.932409 * speed

# Stopping distance increase by approximately 3.9 feet for
# one mph increase in speed.  Remember these are 1920s cars.




#------------------
# minilab 9b
# Linear Regression
#------------------

library(tidyverse)

#---
# Example 1.  Anscombe's quartet

a = 1   # which dataset from Anscombe (1,2,3,4)
x = anscombe[,a]
y = anscombe[,a+4]

# Linear regression by matrix operations
X = cbind(1,x)
XtX = t(X) %*% X
XtXinv = solve(XtX)
beta = XtXinv %*% t(X) %*% y
beta
y_fitted = X %*% beta
residuals = t(y - y_fitted)
residuals

# Linear regression using lm()
model = lm(y~x)
summary(model)
model$residuals
ggplot(NULL, aes(x=x, y=y)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE)

#---
# Example 2.  Quadratic regression

a = 2   # which dataset from Anscombe (1,2,3,4)
x = anscombe[,a]
y = anscombe[,a+4]

# Quadratic regression by matrix operations
X = cbind(1,x,x^2)
XtX = t(X) %*% X
XtXinv = solve(XtX)
beta = XtXinv %*% t(X) %*% y
beta
y_fitted = X %*% beta
residuals = t(y - y_fitted)
residuals

# Quadratic regression using lm()
model = lm(y~x+I(x^2))
summary(model)
model$residuals
ggplot(NULL, aes(x=x, y=y)) +
  geom_point() +
  geom_smooth(method="lm", formula=y~x+I(x^2), se=FALSE)


#---
# Example 3.  Galapagos Islands dataset

library(faraway)
G = as_tibble(gala)
G

# Linear regression by matrix operations
X = as.matrix(cbind(1,G[,c(3,4,5,6,7)]))
y = gala$Species

XtX = t(X) %*% X
XtXinv = solve(XtX)
beta = XtXinv %*% t(X) %*% y
beta
y_fitted = X %*% beta
residuals = t(y - y_fitted)
residuals

# Linear regression using lm()
model = lm(Species~Area+Elevation+Nearest+Scruz+Adjacent, data=G)
summary(model)
model$residuals


# -- the end --

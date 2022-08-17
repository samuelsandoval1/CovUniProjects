
# Roll 6 then 5
library(tidyverse)
n = 10000
x = rep(0,n)
for (i in 1:n)
{
  count = 0
  finished = FALSE
  while (finished==FALSE)
  {
    d = rdunif(1,1,6)
    count = count+1
    while (d==6)
    {
      d = rdunif(1,1,6)
      count = count+1
      if (d==5)
        finished = TRUE
    }
  }
  x[i] = count
}
summary(x)

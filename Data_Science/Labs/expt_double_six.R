
# Roll 6 twice in a row
library(tidyverse)
n = 10000
x = rep(0,n)
for (i in 1:n)
{
  count = 0
  d = 0
  while (d!=6)
  {
    d = rdunif(1,1,6)
    count = count+1
    if (d==6)
    {
      d = rdunif(1,1,6)
      count = count+1
    }
  }
  x[i] = count
}
summary(x)

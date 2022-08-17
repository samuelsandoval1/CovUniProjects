#install.packages("tidyverse")
library(tidyverse)
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, colour=class, size=cyl))

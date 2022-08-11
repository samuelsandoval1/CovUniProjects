
#tidyverse
install.packages('tidyverse')

#demo with starwars library
library(tidyverse)
starwars
view(starwars)

starwars %>%
  group_by(species) %>%
  summarise(count=n()) %>%
  arrange(desc(count))

# tidy data
mydata = tribble(
  ~word, ~frequency,
  'gamer',10,
  'coding',20,
  'poggers',2,
  'based',40
)
mydata

# word cloud
#install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(data=mydata)

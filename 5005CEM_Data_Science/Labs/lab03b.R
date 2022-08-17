library(tidyverse)
install.packages("nycflights13") # run this only once
library(nycflights13)

View(airlines)

# use filter to find flights (rows) with a delayed departure. We then form one group
# for each airline (carrier column in the tibble) and count how many rows for each group

delayed_flights = flights %>% # start with the flights
  filter(dep_delay>0) %>% # find only the delays
  group_by(carrier) %>% # group by airline (carrier)
  summarise(num_delay=n()) # count the observations
delayed_flights

# carrier is a common key. Therefore, to combine these two tibbles we use a join.
left_join(delayed_flights, airlines, by="carrier")

# It remains to find the maximum of the num_delay column and select the particular airline
# (row) that gives that maximum value.
left_join(delayed_flights, airlines, by="carrier") %>%
  filter(num_delay==max(num_delay)) %>% # find most delayed
  select(name) # select the airline

# It is possible to complete the whole sequence as one dplyr pipe.
flights %>% # start with the flights
  filter(dep_delay>0) %>% # find only the delays
  group_by(carrier) %>% # group by airline (carrier)
  summarise(num_delay=n()) %>% # count the observations
  left_join(airlines, by="carrier") %>% # join by common key
  filter(num_delay==max(num_delay)) %>% # find most delayed
  select(name) # select the airline

# On average, to which airport do flights arrive most early?
flights %>%
  group_by(dest) %>%
  summarise(mean_delay=mean(arr_delay))

# Remove NA notices
flights %>%
  group_by(dest) %>%
  summarise(mean_delay=mean(arr_delay, na.rm=TRUE))

# find the row of this summary table with minimum value
# Therefore it is recommended to also use na.rm=TRUE 
# when using the min() or max() functions.
flights %>%
  group_by(dest) %>%
  summarise(mean_delay=mean(arr_delay, na.rm=TRUE)) %>%
  filter(mean_delay==min(mean_delay, na.rm=TRUE))

# To apply a join between our results and the airports dataset, 
# we need to specify that dest and faa are to be treated as the common key.
flights %>%
  group_by(dest) %>%
  summarise(mean_delay=mean(arr_delay, na.rm=TRUE)) %>%
  filter(mean_delay==min(mean_delay, na.rm=TRUE)) %>%
  left_join(airports,by=c("dest"="faa"))

# Get the full name of the airport
flights %>%
  group_by(dest) %>%
  summarise(mean_delay=mean(arr_delay, na.rm=TRUE)) %>%
  filter(mean_delay==min(mean_delay, na.rm=TRUE)) %>%
  left_join(airports,by=c("dest"="faa")) %>%
  select(name)

# Exercise. Diamonds
# (a) Write a dplyr pipe that produces a summary table showing 
# for each cut of diamond the number of diamonds of that cut, 
# along with the minimum, median and maximum price of diamonds of that cut

library(tidyverse)
diamonds %>%
  group_by(cut) %>%
  summarise(count=n(),
            min_price=min(price),
            median_price=median(price),
            max_price=max(price))

# compare with
diamonds %>%
  ggplot(aes(x=cut, y=price)) +
  geom_boxplot()
# which is the same as
ggplot(diamonds,aes(x=cut, y=price)) +
  geom_boxplot()


# (b)  Write a dplyr pipe to determine what color of diamond has the 
# highest mean of price per carat among diamonds with Ideal cut.

diamonds %>%
  group_by(color) %>%
  summarise(mean_ppc=mean(price/carat)) %>%
  filter(mean_ppc==max(mean_ppc))

# compare with
diamonds %>%
  group_by(color) %>%
  summarise(mean_ppc=mean(price/carat)) %>%
  ggplot(aes(x=color, y=mean_ppc)) +
  geom_col()

# Exercise. Use the nycflights13 package datasets to answer the following.
# (a) Considering only flights from JFK to SEA, what was the average, min,
# and max air time of those flights?
library(tidyverse)
library(nycflights13)

result = flights %>%
  filter(origin=="JFK", dest=="SEA") %>%
  summarise(average_air_time=mean(air_time, na.rm=TRUE),
            min_air_time=min(air_time, na.rm=TRUE),
            max_air_time=max(air_time, na.rm=TRUE))
View(result)

flights %>%
  filter(origin=="JFK", dest=="SEA") %>%
  ggplot(aes(y=air_time)) +
  geom_boxplot()

#  (b) Which city was flown to with the highest average speed?
# Find average_speed in descending order
result = flights %>%
  group_by(dest) %>%
  summarise(average_speed=mean(distance/air_time, na.rm=TRUE)) %>%
  arrange(desc(average_speed))
View(result)

# now isolate the maximum
flights %>%
  group_by(dest) %>%
  summarise(average_speed=mean(distance/air_time, na.rm=TRUE)) %>%
  filter(average_speed==max(average_speed, na.rm=TRUE))

# but we want the airport name
flights %>%
  group_by(dest) %>%
  summarise(average_speed=mean(distance/air_time, na.rm=TRUE)) %>%
  filter(average_speed==max(average_speed, na.rm=TRUE)) %>%
  left_join(airports,by=c("dest"="faa")) %>%
  select(name)

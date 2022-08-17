#Lab 02c

install.packages("nycflights13") # run only once
library(tidyverse)
library(nycflights13)
dim(flights)
View(flights)

# select specific variables
names(flights)
select(flights, year, month, day)
select(flights, year:day)
select(flights, -year)
select(flights, -(year:day))
       
# select with helper functions
select(flights, starts_with("sched"))
select(flights, ends_with("delay"))
select(flights, contains("arr"))
select(flights, matches(".*_.*_.*")) # regular expression matching
select(flights, last_col())

# remove duplicates
dim(flights)
dim(distinct(flights))
distinct(select(flights, month, day))
distinct(flights, month, day) # does the same as line above

# extract data as a vector
sat = pull(flights,sched_arr_time)
sat
summary(sat)


#change the column name
rename(flights, destination=dest, tail_num=tailnum)

#create new columns that are calculated from existing columns
mutate(flights, gain=arr_delay-dep_delay, speed=distance/(air_time/60))

#keep the new variables.
transmute(flights, gain=arr_delay-dep_delay, gain_per_hour=gain /(air_time/60))
transmute(flights, distance_residual=distance-mean(distance))

#Select particular rows by row number
slice(flights, 87:96) # particular 10 rows
top_n(flights, 20)

#Select rows according to some condition which involves the values in some
#of the columns (variables)
filter(flights, month==1, day==1)

#Take a random sample of rows. Set the seed for random generator
set.seed(123)
sample_n(flights, 20)
0.001*nrow(flights) # how many rows expected if 0.1% of the rows
sample_frac(flights, 0.001)

#Reorder (sort) the data by the content of particular columns
arrange(flights, year, month, day)
arrange(flights, desc(arr_delay)) # descending order

# Now, find all flights (rows) that:
# (a) Departed between midnight and 6am (inclusive).
# (b) Had an arrival delay of two or more hours.
# (c) Flew to Houston (IAH or HOU).
# (d) Were operated by United (UA), American (AA), or Delta (DL).
# (e) Arrived more than two hours late, but didn’t leave (depart) late.
# (f) Were delayed by at least an hour, but made up over 30 minutes in flight


# (a)
select(flights, flight, dep_time, starts_with("000"), ends_with("600"))

# (b)
results = filter(flights, arr_delay > 120) # checks if arr_delay is greater than 120 mins
View(results)

# (c)

houstonFlights = filter(flights, dest=="IAH" | dest=="HOU") # | bar, means or
View(houstonFlights)

#(d)
specificAirlines = filter(flights, carrier=="UA" | carrier=="AA"|carrier=="DL" ) # | bar, means or
View(specificAirlines)

# (e)  
lateArrivalNotDepartLate = filter(flights, arr_delay > 120 & dep_delay < 1) # | bar, means or
View(lateArrivalNotDepartLate)

# (f) 
delayedAndMadeUpTime = filter(flights, dep_delay > 60 & arr_delay < 30) # | bar, means or
View(delayedAndMadeUpTime)

#Learned:
# select() to select columns in different ways
# mutate() to create new columns
# filter() to select rows by some criterion
# arrange() to sort the rows


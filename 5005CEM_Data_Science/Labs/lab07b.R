# 7b

library(tidyverse)

# Simulation of 12-sided dice rolls
n = 120
rolls = rdunif(n,1,12)
table(rolls)

# plot the corresponding barchart
mydata = tibble(rolls)
ggplot(mydata,mapping=aes(x=rolls)) +
  geom_bar()

# Exercise. Consider rolling one 6-sided dice (call it dice A) 
# and then rolling another 6-sided dice (call it dice B) and 
# taking the sum of the values.
n = 36000
rollsA = rdunif(n,1,6)
rollsB = rdunif(n,1,6)
rolls_sum = rollsA + rollsB
table(rolls_sum)

# Plot a barchart showing the count for each possible value of the 
# sum of the two dice. What counts are you expecting to see 
# (approximately) when n=36000?
mydata = tibble(rolls_sum)
ggplot(mydata,mapping=aes(x=rolls_sum)) +
  geom_bar()


# Exercise. Consider rolling a fair 6-sided dice until a 6 turns up 
# twice in a row. Do you think this will take more, the same,
# or fewer rolls than rolling a fair 6-sided dice until a 6 turns up 
# followed immediately by a 5?

# We can use R to simulate these two processes (separately) over 
# 10000 repeated trials and compare the means. 
# Two pieces of R code are provided on Aula:
#   expt_double_six.R
#   expt_six_five.R
# After you have run these, what conclusion do you make?

# expt_double_six.R
# from 10000 trials

# > summary(x)
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#    2.00   13.00   30.00   41.89   57.00  386.00 

# Conclusion:
#     six then six (on average 42 rolls)
#     six then five (on average 36 rolls)


# Exercise. Another application of dice rolling is the classic 
# board game Snakes and Ladders. The R code provided on Aula 
# (expt_snakes_ladders.R) implements the particular board below.
# Run the code to estimate the probability that the player to move 
# first will win. Investigate the head start that the second player 
# would need in order to have a higher probability of winning that
# the first player (change the initial value of locationB).


# The second player would need to have a head start of 10 

# Snakes and Ladders in R

library(tidyverse)

snakes_and_ladders = function(num_replications) {

  ladder_start = c( 5,12)
  ladder_end   = c(15,21)
  snake_start  = c( 9,24)
  snake_end    = c( 4,13)
  
  result = tibble(winner        =character(),
                  count_rollsA  =numeric(),
                  count_laddersA=numeric(),
                  count_snakesA =numeric(),
                  count_rollsB  =numeric(),
                  count_laddersB=numeric(),
                  count_snakesB =numeric())
  
  for (i in 1:num_replications) {
    locationA = 0
    locationB = 10
    count_rollsA = 0
    count_rollsB = 0
    count_laddersA = 0
    count_laddersB = 0
    count_snakesA = 0
    count_snakesB = 0
    
    keep_going = TRUE
    while (keep_going) {
      rollA = sample(6,1)
      ##cat("roll A:",rollA,"\n")
      count_rollsA = count_rollsA + 1
      locationA = locationA + rollA
      if (locationA %in% ladder_start) {
        k = match(locationA,ladder_start)
        locationA = ladder_end[k]
        ##print("  Ladder")
        count_laddersA = count_laddersA + 1
      }
      if (locationA %in% snake_start) {
        k = match(locationA,snake_start)
        locationA = snake_end[k]
        ##print("  Snake")
        count_snakesA = count_snakesA + 1
      }
      ##cat("  location A",locationA,"\n")
      if (locationA>=25) {
        keep_going = FALSE
        winner = "A"
      }
      else {
        rollB = sample(6,1)
        ##cat("roll B:",rollB,"\n")
        count_rollsB = count_rollsB + 1
        locationB = locationB + rollB
        if (locationB %in% ladder_start) {
          k = match(locationB,ladder_start)
          locationB = ladder_end[k]
          ##print("  Ladder")
          count_laddersB = count_laddersB + 1
        }
        if (locationB %in% snake_start) {
          k = match(locationB,snake_start)
          locationB = snake_end[k]
          ## print("  Snake")
          count_snakesB = count_snakesB + 1
        }
        ## cat("  location B",locationB,"\n")
        if (locationB>=25) {
          keep_going = FALSE
          winner = "B"
        }
      }
    }
    ## cat("Winner is: ",winner,"\n")
    result = add_row(result,
                     winner=winner,
                     count_rollsA  =count_rollsA,
                     count_laddersA=count_laddersA,
                     count_snakesA =count_snakesA,
                     count_rollsB  =count_rollsB,
                     count_laddersB=count_laddersB,
                     count_snakesB =count_snakesB)
  }
  return(result)
}

overall = snakes_and_ladders(10000)
View(overall)
overall %>%
  group_by(winner) %>%
  summarise(count=n())

# Press ESC to terminate early.

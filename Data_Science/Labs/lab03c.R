library(tidyverse)
library(rvest)
library(lubridate)
url = "http://espn.go.com/nfl/superbowl/history/winners"
page = read_html(url)
page

# extract the table from the page
sb_table = html_nodes(page, 'table')
sb = html_table(sb_table)[[1]]
sb

# The top two rows are headings, so we can remove these from the table and set the
# column labels with meaningful names. Finally we can bring it into the tidyverse by
# making it a tibble
sb = sb[c(-1,-2),]
names(sb) = c("number", "date", "site", "result")
sb = as_tibble(sb)
sb

# Exercise
library(tidyverse)
library(rvest)
url="https://www.imdb.com/search/title/?title_type=feature&genres=sci-fi&sort=num_votes,desc&count=250&explore=genres&view=advanced"
webpage = read_html(url)
title = html_text(html_nodes(webpage, '.lister-item-header a'))
rating = html_text(html_nodes(webpage, '.ratings-imdb-rating strong')) 
runtime = html_text(html_nodes(webpage, '.text-muted .runtime')) 
table = tibble(title=title, rating=rating, runtime=runtime)
View(table)

# Data Cleaning

# We can replace the roman numerals with integers, just by noting that the superbowl
# number is just the same as the row number.
mutate(sb,number=1:nrow(sb))

# mdy() function (month/day/year format of dates) from the R tidyverse package
# “lubridate” to translate the string format dates to an actual date type
mutate(sb,date=mdy(date))

# Separating the site column into the stadium and the city is by specifying the
# characters used to make the split
separate(sb,site,c("stadium","city",NA),sep='[()]')

# use separate again to split the winning team/score from the losing team/
# score, because there is a convenient comma to use as the separato
separate(sb,result,c("winner","loser"),sep=', ')

# The regular expression in the variable pattern below is a space, 
# followed by one or more digits, followed by the end of the string ($). 
pattern = ' \\d+$'
separate(sb,result,c("winner","loser"),sep=', ') %>%
  mutate(winner_score=as.numeric(str_extract(winner,pattern))) %>%
  mutate(winner=gsub(pattern,"",winner))


pattern = ' \\d+$'
sb %>%
  mutate(number=1:nrow(sb)) %>%
  mutate(date=mdy(date)) %>%
  separate(site,c("stadium","city",NA),sep='[()]') %>%
  separate(result,c("winner","loser"),sep=', ') %>%
  mutate(winner_score=as.numeric(str_extract(winner,pattern))) %>%
  mutate(winner=gsub(pattern,"",winner))

library(lubridate)
wday(today(),label=TRUE)
dmy(01032020)
dmy(28022020)
dmy(01032020) - dmy(28022020)

# Exercise
# (a) diff between tyson fury and deontay wilde
tyson_fury = dmy("12/08/1988")
deontay_wilde = dmy("22/10/1985")
age_diff = tyson_fury - deontay_wilde
dmy("12/08/1988") - dmy("22/10/1985") 

# (b) At the very end of 31 December 2016 there was an additional 
# “leap second” inserted into the world clock, i.e., the final minute of 2016 
# was 61 seconds long. Check if lubridate can calculate this.
x <- ymd("2016-12-31")
second(x)
second(x) > 61


#Lab 02b

library(tidyverse)
mydata = read_csv("/Users/samuelsandoval/Projects/Data_Science_Work/data01.csv")
mydata

#Exercise, import Data from Kaggle
library(tidyverse)
mydata2 = read_csv("/Users/samuelsandoval/Projects/Data_Science_Work/Marvel_DC_imdb.csv")
mydata2

#import from URL
library(tidyverse)
url = "https://raw.githubusercontent.com/fivethirtyeight/data/master/unisex-names/unisex_names_table.csv"
namesdata = read_csv(url)
namesdata

View(arrange(namesdata,gap))

# Exercise. Try importing another CSV dataset from the fivethiryeight GitHub/
# https://github.com/fivethirtyeight/data/ pages.

library(tidyverse)
url = "https://raw.githubusercontent.com/fivethirtyeight/data/master/avengers/avengers.csv"
avgdata = read_csv(url)
avgdata


# Last Exercises

#Take a CSV file and replace all the commas with semicolons and resave. Then use
#read_csv2() to load the data from the file. Check that the dataset loads correctly
#using View().
library(tidyverse)
mydata2 = read_csv2("/Users/samuelsandoval/Projects/Data_Science_Work/data02.csv")
View(mydata2)

# Replace all the semicolons with tabs and save as a “.tsv” file. Then use read_tsv() to
#load the data from the .tsv file. Check that the dataset loads correctly using View().

library(tidyverse)
mydata3 = read_csv2("/Users/samuelsandoval/Projects/Data_Science_Work/data03.tsv")
View(mydata3)


# Create a small table in Excel with column names and save as an “.xlsx” file. Install the
#readxl package in R. Then use library(readxl) and read_excel() to load the data from
#the .xlsx file. Check that the dataset loads correctly using View(). For more
#information about reading from Excel files, see https://readxl.tidyverse.org

library(readxl)
myExcelData = read_excel("/Users/samuelsandoval/Projects/Data_Science_Work/dataExcel.xlsx")
View(myExcelData)


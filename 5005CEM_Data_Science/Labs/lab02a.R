#Lab 02a

#Top 10 Male and Female Tennis players
# as at 20 January 2020
# Data from: https://www.atptour.com/en/rankings/singles
# https://www.wtatennis.com/rankings/singles
# https://www.eurosport.co.uk/tennis/
library(tidyverse)
name = c("Nadal","Djokovic","Federer","Medvedev","Theim",
         "Tsitsipas","Zverev","Berrettini","Bautista Agut","Monfils",
         "Barty","Pliskova","Halep","Osaka","Svitolina",
         "Andreescu","Bencic","Kvitova","Williams","Bertens")
rank = c(1:10,1:10)
age = c(33,32,38,23,26,21,22,23,31,33,
        23,27,28,22,25,19,22,29,38,28)
height = c(1.85,1.88,1.85,1.98,1.85,1.93,1.98,1.96,1.83,1.93,
           1.66,1.86,1.68,1.80,1.74,1.70,1.75,1.82,1.75,1.82)
weight = c(85,77,85,83,79,89,90,95,75,85,
           62,72,60,69,60,60,63,68,72,74)
gender = c(rep("M",10),rep("F",10))
tennis = tibble(name,rank,age,height,weight,gender)
print(tennis)

# Tribble
tennis = tribble(
  ~name, ~rank, ~age, ~height, ~weight, ~gender,
  #--------------|---|---|----|---|----|
  "Nadal", 1, 33, 1.85, 85, "M",
  "Djokovic", 2, 32, 1.88, 77, "M",
  "Federer", 3, 38, 1.85, 85, "M",
  "Medvedev", 4, 23, 1.98, 83, "M",
  "Theim", 5, 26, 1.85, 79, "M",
  "Tsitsipas", 6, 21, 1.93, 89, "M",
  "Zverev", 7, 22, 1.98, 90, "M",
  "Berrettini", 8, 23, 1.96, 95, "M",
  "Bautista Agut", 9, 31, 1.83, 75, "M",
  "Monfils", 10, 33, 1.93, 85, "M",
  "Barty", 1, 23, 1.66, 62, "F",
  "Pliskova", 2, 27, 1.86, 72, "F",
  "Halep", 3, 28, 1.68, 60, "F",
  "Osaka", 4, 22, 1.80, 69, "F",
  "Svitolina", 5, 25, 1.74, 60, "F",
  "Andreescu", 6, 19, 1.70, 60, "F",
  "Bencic", 7, 22, 1.75, 63, "F",
  "Kvitova", 8, 29, 1.82, 68, "F",
  "Williams", 9, 38, 1.75, 72, "F",
  "Bertens", 10, 28, 1.82, 74, "F"
)
print(tennis)

nrow(tennis)
ncol(tennis)
colnames(tennis)
summary(tennis)
View(tennis) # with capital V

#Access indiv elements
tennis[1,"name"]
tennis[1,"age"]
tennis[1,]
tennis[,"height"]
tennis$height

#boxplot
ggplot(tennis, aes(y=height)) +
  geom_boxplot()

ggplot(tennis, aes(x=gender, y=height)) +
  geom_boxplot()

#wide data/ narrow 
W = tribble(
  ~person, ~age, ~weight, ~height,
  "Bob", 32, 128, 180,
  "Alice", 24, 86, 175,
  "Steve", 64, 95, 165
)
print(W)

N = pivot_longer(W,-person,names_to="variable",values_to="value")
print(N)

# make data narrow and wider
B = pivot_wider(N, names_from=variable, values_from=value)
print(B)


#Exercise

countries = tribble(
  ~country, ~year, ~value,
  #-------|---|---|
  "Algeria",2000,7,
  "Algeria",2001,9,
  "Brazil",2000,12,
  "Brazil",2001,14,
  "Colombia",2000,16,
  "Colombia",2001,18
)

C = pivot_wider(countries, names_from=country, values_from=year)
print(C)

C = pivot_wider(countries, names_from=year, values_from=country)
print(C)
# Vectors
people = c("Djokovic","Federer","Thiem","Zverev",
           "Barty","Kenin","Halep","Muguruza")
print(people)

odds = seq(1,20,2)
print(odds)

one_to_seventy = 1:70
print(one_to_seventy)

a = c(3,1,4,1,5)
b = c(1,6,1,8,0)
a+b

vowels = c("a","e","i","o","u")
print(vowels[1])
print(length(vowels))
print(vowels[length(vowels)])
print(vowels[2:4])
print(vowels[c(1,3,5)])

shoe_sizes = c(5.5, 11, 7, 8, 4)
filter = c(TRUE, FALSE, FALSE, FALSE, TRUE)
print(shoe_sizes[filter])
shoe_is_small = (shoe_sizes<6)
print(shoe_is_small)
print(shoe_sizes[shoe_is_small])
print(shoe_sizes[shoe_sizes>6])

#List
person = list(
  first_name = "Ada",
  job = "Programmer",
  salary = 100000,
  carparking_permit = TRUE
)
print(person)
names(person)
person$first_name
person$job
person[["salary"]]

animals = list("Aardvark","Baboon","Camel")
print(animals)
animals[1]
animals[[1]]
is.list(animals)
is.list(animals[1])
is.list(animals[[1]])

#Exercise 
#a - Vector
my_friends = c("Jacob", "Ethan", "Joe", "Mathias", "Shaleen") 
print(my_friends)

#b - List
my_bio = list(
    hobby = "coffee enthusiast", 
    travel = "traveler",
    subject = "innovator"
)
print(my_bio)

#c - List with list as element
third_list = list(
  firstItem = "item1", 
  secondItem = "item2",
  thirdItem = list(
    itemOne = "person",
    itemTwo = "person2"
  )
)
print(third_list)

#d - List with vector as an element
list_vec = list(
  element = c("Item", "SecondOne") ,
  nextElem = "item2"
)
print(list_vec)

#e Possible for vector with list as an element
vec_list = c(list(a="sup",b="adios"), 21) 
print(vec_list)
print(class(vec_list))

# NO its not possible for a vector to have a list as one of its elements.
# R accepts what you type but the output is a list.

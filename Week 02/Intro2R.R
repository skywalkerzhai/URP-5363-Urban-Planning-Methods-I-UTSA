# Intro to R
# The University of Texas at San Antonio

#---- New block ----


#---- INSTRUCTIONS ----
# Objective: Familiarize yourself with R syntax (programming language)

'
Task: Run each line of code written bellow. 
Then, write a comment after each command explaining what it does and what is the output. Use the # sign to start commenting. For example:
'

1+1 # commands R to directly sum two numbers, then the sum result is return


#------ Part 1: Exploring R ------

print('Hi world!, Mom look!, I am programming in R!,...')
print('This is the first day of lab!,...')
print('1+2')

#------ Part 2: Let's create  objects ------

twoplustwo <- 2 + 2
two_plus_two <- 2 + 2
two.plus.two <- 2 + 2
t_p_t <- 2+2

two plus two <- 2 + 2

#------ Part 3: R Functions to create/manipulate objects ------

twoplustwo

twoplustwo*twoplustwo


#What class of object is 'twoplustwo'?

class(twoplustwo)


# What can be done with object 'twoplustwo'?
sum(two_plus_two,twoplustwo,3)

c(two_plus_two,twoplustwo,3)

sum(c(two_plus_two,twoplustwo,3))

#------ Part 4: more on objects ------

a<-1

b<-"1"

class(b)

l1<-list(a,b)

m1<-matrix(0,2,2)

mdat <- matrix(c(1,2,3,11,12,13), nrow = 2, ncol = 3, byrow = TRUE)

sq1<-seq(1,10,1)

sq2<-LETTERS[sq1]

df1<- data.frame(sq1,sq1)

df2<- data.frame(sq1,sq2)

data_cube<-array(data = 0,dim = c(2,2,3))

#------ Part 5: Indexing Objects ------

A<-c(1836457,2)

A
A[1]
A[2]
A[-1]
A[1:2]

grades<-rnorm(100,80,15)

grades[1:5]

grades>80

grades[grades>80]

df1$sq1
df1[,'sq1']


#------ Part 6: R Packages ------
#https://www.youtube.com/watch?v=6AOpomu9V6Q
install.packages('tidyverse')
install.packages("leaflet")

library(tidyverse)
library(leaflet)


leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=-98.502829112097, lat=29.422872578200067,  popup="This is our class building!")


#------ Part 7: Import data ------
d0<-read.csv("https://opportunityinsights.org/wp-content/uploads/2018/10/tract_covariates.csv",header = T)

install.packages("data.table")

library(data.table)

d1<-fread("https://opportunityinsights.org/wp-content/uploads/2018/10/tract_covariates.csv")


'Import in Environment'


#------ Part 8: Ask R for help ------

?sum
help('sum')

help(package='foreign')

??regression
??tidyverse


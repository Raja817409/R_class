setwd("C:/Data R/")
## R Syntex
#Evering that is stored as a R language is R Syntex
#Smalla brackets opens function 
#middle brakets creates the chunks of codes or blockes of codes
{print(5) print(6)}
fruits<-"apple"

#Big bracket []is used to located the itesms
fruits[2]
fruits<-c("apple","orange","mango","pineapple")
number<-c(1,2,3)
#R as calculator or math          
2+3
2 + 3
squrt(25)
5^2
#variables  
Apple<-5
APPLE <- 6
apple_ <- 7
_apple <-7
1apple <- 3
.apple <- 3
apple11 <- 5
#romove variable 
rm(Apple,APPLE)#remove multiple
ls()#gives lists of date in envirement
rm(list= ls())#removes all variables in environment
a <- 5
a <- 6
b <- a
a <- 10
b <- 5
a + b
a - b
a / b 
a %% b # reminder
a % % b # integer division
floor(a/b)
celing (a/b)
a=10
b=3
a + b
a - b


a * b
a ^ b
a/b
a%%b
a % % b
a %/% b
floor(a/b)
celing(a/b)

##logical operation 

a <- 10
a == !10
a == 10
# == referes to is equal to

a < 20
a > 20
a >= 10
a <= 10
a > 5 |a< 9
a > 5 & a < 9

a != 5

num <- c(1,3,5,9.11)
4 %in% num
3 %in% num

### numeric

a<- 10.3
# to test
class(a) # class function test the data type

## discreat -- interger

b <- 10
class(b)
b <- 10L
class(b)

class(b* 3L)

## categorical -- character

fruits <- ("apple")
class(fruits)

fruits <- ("apple","orange","mango")
class (fruits)

# date date type

dob <- as.Date("1992-02-06")
dob + 7
class(dob)

# formate a date as a string
formatted_date <- format (date, format = "%Y-%M-%D")

# Add dayes to a date
new_date <- date + 7

# Calculate the different between two dates
date1 <- as.Date ("1992-02-16")
date2 <- as.Date ("2024-06-18")
date_diff <- date2 - date1
date_diff

# Extra components of a date
year <- format(date1, format = "%Y")
month <- format(date1, formate= "%M")
day <- format(date1, formate = "%D")

## Convert the date type

a <- 10
class(a)
b<- as.integer(a)
class(b)
b
a

c<- as.character(a)
c
c
class (c)
d <- as.numeric(c)
d
class (d)

e <- as.numeric(fruits)
e

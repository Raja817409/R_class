# List
#creat the list
# list() function is used to create the list 

l1 <- list(1.1,2,"apple","ball",5L)

toys <- c("doll","bus","watch","light")

books <- c("story","school")

diary <- c("home", "meeting", "college")

phone <- c(1,24,5,8,0)


misc <- list(toys,books,diary,phone) #without names
misc <- list("toys","books","diary","phone") #without names




misc1 <- list(toys = toys,
              books = books,
              diary= diary,
              phone = phone) #with names

misc2 <- list(toys = c("doll","bus","watch","light"),
              books = c("story","school"),
              diary= c("home", "meeting", "college"),
              phone = c(1,24,5,8,0)) #with names

              
#Access

#part of list access by index
misc2[1]

misc2[c(1,3)]



misc2[c(1,2,3,4)]


# Date access by name

misc2$books

misc2["books"] 

misc2[["books"]]






##
misc2$toys[1]
misc2$book[2]
misc2$diary[3]
misc2$phone[5]


misc2 [[books]][2] #it does not work

misc2 ["book"] #its NA


# modify
misc2$toys[3] <-"train"

misc2$toys[2] <- "bus"

misc2$toys[c(1,2)] <- c("barby","car")
misc2$diary[c(1,3)] <- c("sport","university")
misc2$books[c(1,2)] <- c("poem", "college")
misc2$phone[c(2,4,5)] <- c(6,9,28)

#Removing
misc2[2]
misc3 <- misc2[-2]

misc2[-c(1,3)]
misc2$phone[-3]
misc2$phone <- misc2$phone[-3]
rm(misc,misc1,misc2,misc3,l1)

#### now vector
# create


toys <- c("doll","bus","watch","light")

books <- c("story","school")

diary <- c("home", "meeting", "college")

phone <- c(1,24,5,8,0)

#Acces items

even <- seq(from = 2, to = 100, by = 2)
even

odd <- seq (from = 1, to = 100, by = 2)
odd


gap_data <- seq(from = 1, to = 10, length.out = 6)
gap_data


sample_date <- sample(x = c(1:100), size = 10)
sample_date

set.seed(40)
sample_date <- sample(x = c(1:100), size = 10,replace = FALSE)
sample_date


sample2 <- sample(x = c("male","female","other"),size = 60,replace = TRUE)
sample2

set.seed(1)
sample2 <- sample(x = c("male","female","other"),size = 60,replace = TRUE)
sample2


#Access items

sample_date[4]
sample_date[c(1,3,5)]
sample_date[2:4]
sample_date[seq(from = 1, to = 10, by = 2)]

which(sample_date== 27)

which(sample_date == 30)

sample_date[which(sample_date == 30)]

sample_date[which(sample_date== 27)]

which(sample_date < 40)

sample_date[which(sample_date < 40)]

sample_date[which(sample_date > 40)]

sample_date[which(sample_date < 30)]

sample_date[which(sample_date > 30)]

sample2[which(sample2 == "male")]

sample2[which(sample2 == "female")]

#Modify

sample2[which(sample2 == "female")] <- "F"

sample2[which(sample2 == "male")] <- "M"

sample2[which(sample2 == "other")] <-"O"

#Delate

sample_date [-4]
sample_date[which(sample_date> 50)]
S2 <- sample_date[which(sample_date> 50)]
sample_date

length(sample_date)
length(S2)

sample_date[length(sample_date)] #last
sample_date[length(sample_date)-1] # second last

# 3 D Array


set.seed(40)
dat <- sample(1:100, 24, replace = TRUE)

ar1 <- array(data = dat, dim = c(4,3,2))

ar1[3,3,1]

# Matrix

# Create  a Matrix

m1 <- matrix(c(1:12), nrow = 4, ncol = 3, byrow = FALSE)
print(m1)

m <- matrix(c(1:12), nrow = 4, ncol = 3, byrow = TRUE)
print(m)

M <- matrix(c(3:14), nrow = 4, byrow = TRUE)
print(M)

m3 <- matrix(c(4:15), ncol = 3, byrow = FALSE)
print(m3)


m2 <- matrix(c(1:12),nrow = 4, ncol = 3, byrow = TRUE)
print(m2)


dim(m1)
ncol(m1)
nrow(m1)

m1

dat1 <- c(50, 150, 250, 100, 120, 300, 130, 123, 245)
m2 <- matrix(dat1, nrow = 3, 
             ncol = 3, 
             byrow = FALSE,
             dimnames = list(from = c("ktm","brj","btl"), to = c("ktm","brj","btl")))
print(m2)


rownames = c("row1", "row2", "row3", "row4")
colnames = c("col1", "col2", "col3")
N <- matrix(c(1:12), nrow = 4, byrow = TRUE, dimnames = list(rownames,colnames))
print(N)


rownames = c("Ktm","Pok","Btl","Brt")
colnames = c("Ram","Sita","Hari")
dat3 <- c(100,150,200,250,300,350,400,450,500,550,600,650)
p <- matrix(dat3, nrow = 4, byrow = FALSE,dimnames = list(rownames, colnames))
print(p)


#Access or slice the matrix

stay<- c(m2[1,1],m2[2,2],m2[3,3])
sum(stay)         

time <- c(p[3,1],p[3,2],p[3,3])
sum(time)

diag(m2)
sum(diag(m2))

diag(p)
diag(x=6,3)

diag(3)
diag(x= 5,4)

m1[2:3,2:3]
m1[c(2,3),c(1,3)]

#Delete
m1[-c(2,3),-c(1,3)]

#to join matrix there are two function ( bind to add column)
# rbind to add row
# to add row the new members should match row number
# to add column the new members should match row number

cbind(m1,c(10,11,12,13))

rbind(m1, c(10,11,12))

cbind(p,c(1,2,3,4))
rbind(p,c(5,6,7))


# Modify
  m1[c(2,3),c(1,3)] <- c(13,14)
  m1[c(2,3),c(1,3)] <- c(15,16,17,18)
  
  #Matrix Operation 
  
  m1 <- matrix(c(1:4),nrow = 2)
  m2 <- matrix(c(5:8),ncol = 2)
  
  m1 + m2
  m1 - m2
  m1 * m2

  solve(m1)
  solve(m2)
  

  # Matrix multpication
  
  m1 <- matrix(c(1:6), nrow = 2, byrow = TRUE)
  m1
  
  m2 <- matrix(c(10,20,30,11,21,31),ncol = 2, byrow = FALSE)
  m2

  m1 %*% m2    
  
  
  ### Factor data
  
music <- factor(c("pop","jazz","lok","flok", "pop","jazz"))
  
music <- factor(c("pop","jazz","lok","flok", "pop","jazz"),levels = c("lok","folk","pop","jazz","classic"))
music
levels(music)

#Modify
music[2] <- "classic"

#Basic Function

dat <- c(1,2,3,10,12)

length(dat)

min(dat)

max(dat)

sum(dat)

mean(dat)

dat1 <- c(1,1,2,4,2,3,4,1,5,3,2,1,2,3,6,3)

unique(dat1)

sort(dat1,decreasing = FALSE)
sort(dat1, decreasing = TRUE)

rev(dat1)

x <- "apple"

y <- "DOG"

toupper(x)

tolower(y)

paste(x,y) # 

paste0(x,y) 

paste(x,y, sep = "-")

paste0(x,"_",y,"@gmail.com")

n <- "Rajaram "
substring(n,1,3)

is.na(dat)

table(dat1)

barplot(table(dat1))

x <- -23
abs(x)

sqrt(abs(x))

# Data Frames

# we can use function data.frame () in R

df <- data.frame(c("Amija","Raj","Asish","Prakash"),
                 c("R","Python","Java","C++"),
                c(22,25,28,31))
df

colnames(df) <- c("Name","Language","Age")
df

df <- data.frame(Name= c("Amija","Raj","Asish","Prakash"),
                 Language= c("R","Python","Java","C++"),
                 Age= c(22,25,28,31))
df

RF <- data.frame(Name = c("Dhanej","Pradip","Raja","Jiwan","Shyam"),
                 Professon = c("NGO","Business","Research","Teacher","Pilot"),
                 Age = c(40,39,44,42,45))
print(RF)
                 
                 
#Creating data frame with multiple techniques

set.seed(40)
df1 <- data.frame(ID= c(1:60),Age= sample(c(18:65),60,replace = TRUE),
                  Gender = sample(c("Male","Female"),60,replace = TRUE),
                  Income = rnorm(n =60, mean = 50000, sd = 5000),
                  Score = runif(n = 60, min = 40, max = 100))

print(df1)



str(df1)   

df1$Score <- as.factor(df1$Score)
print(df1$Score)

df1$Age <- as.numeric(df1$Age)
print(df1$Age)

df1$Income <- as.factor(df1$Income)
print(df1$Income)

df2 <- df1[,-3]
str(df2)

df3 <- apply(df2, MARGIN = 2, FUN = as.numeric)
print(df3)

df3 <- data.frame(df3)
print(df3)

str(df3)

df2

head(df2,10) # First six rows in default

tail(df2) # Last six columns in default


summary(df1)

summary(df1$Age)

summary(df1$Gender)

unique(df1$Gender)

# Access any item/items in the data frames

# Column access

df1$Gender

df1$Income

df1["Gender"] # it gives the orginal structure 

df1[['Gender']] # it returns the vector

df1[,c("Gender","Score")]

df1[,c(3,5)]  
#or  
df1[5:15,]

df1[seq(1,60,2),c("ID","Gender","Score")] 
# or
df1[seq(1,60,2),c(1,3,4)]

df1[seq(2,60,2),c(1,3,4)]

df1[which(df1$Income > 50000),c(2,3,4)]

df1[which(df1$Gender == "Male"),]

#modify

df1[8,2] <- NA
print(df1)

df1[15,3] <- NA
print(df1)

df1[,-5] #delete

#Add column/columns

expendure <- rnorm(n = 60, mean =15000, sd = 3000)

df2 <- cbind(df1, expendure)
df2

## Add row/ rows
dat1 <- data.frame(ID = c(61,62,63), 
                      Age= c(30,32,35),
                      Gender = c("Male","Female","Male"),
                      Income = c(65000,36000,46000),
                      Score = c(50.5,55.8,86.2))
print(dat1)

df3 <- rbind(df1,dat1)
df3

df3[,-2]
df3[-25]
dim(df3)
length(df3)
names(df3)
colnames(df3)
names(df3)[3] <- "Sex"
names(df3)[5] <- "Marks"


      
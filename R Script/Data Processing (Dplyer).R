# Here we will practice some of the data processing or 

## Installing Dplyr package

# install.packages("dplyr)

library(dplyr)

# pipe function
# select function
# select operates with columns se;ection

#by number/ index

mtcars %>%
  select(seq(from = 1, to = 11, by = 3)) %>% 
  select(1,2)
  
# by name
mtcars %>%
  select(mpg,hp,drat)

# by number
mtcars %>%
  select(1,4,7,11)
#or 

mtcars %>%
  select(seq(from = 1, to = 11, by = 3)) %>% 
  select(1,2)
# not select any column

mtcars %>% select(-1,-3,-7)

# arrange the column

mtcars %>% select(5,2,1,4,8)

sort(names(mtcars), decreasing = TRUE)

mtcars %>% select(sort(names(mtcars)))


## Filter Function
# Filter operates in a row
# either by name or by logic

mtcars %>% filter(disp > mean(disp))

mtcars %>% filter(disp > median(disp))

mtcars %>% slice(1,2,4,8)

mtcars %>% slice(seq(from = 1,to = nrow(mtcars),by= 3))

mtcars %>% filter(disp > 300) %>% select(mpg, disp)

mtcars %>% slice_sample(n = 5)

# stratified random sampling
# group by 
set.seed(2)
iris %>% group_by(Species) %>%
  slice_sample(n = 3)

iris %>% slice_sample(prop = 0.10)

iris %>% group_by(Species) %>%
  slice_sample(prop = 0.10)

mtcars %>% slice_head(n = 5)

mtcars %>% slice_max(disp, n = 5)

iris %>% group_by(Species) %>% slice_max(Petal.Length, n = 3)

iris %>% distinct(Species,.keep_all = TRUE)

iris %>% distinct(Species,.keep_all = FALSE)

##Arrange Function is used to sort the data
library(dplyr)

mtcars %>%  arrange(desc(mpg))

mtcars %>%  arrange(desc(mpg)) %>% head()
mtcars %>%  arrange(desc(mpg), cyl) %>% head()                   
mtcars %>%  arrange(desc(mpg), cyl,desc(disp)) %>% head() 
mtcars %>% arrange(-mpg,-cyl,-disp) %>% head()

## Grouping and summaring

install.packages("gapminder")

library(gapminder)
str(gapminder)

gapminder %>% summarise(Average_pop_thou = mean(pop)/1000,
                        Average_life_exp = mean(lifeExp),
                        sd_gdp = sd(gdpPercap))
#Groping and Summarring 

gapminder %>% group_by(continent) %>% summarise(mean(pop),sd(pop))

gapminder %>% group_by(continent,year) %>% 
  summarise(n = n(),
            average_population = mean(pop),
            median = median(pop),
            deviation = sd(pop))

# to make is simpler we can add across function inside sumarry

gapminder %>%
  group_by(continent,year) %>% 
  summarise(
    across(
      c(lifeExp, gdpPercap, pop),
      list(min= min,mean = mean,max = max,deviation =sd))) %>% 
  View()

# Data Modification

library(gapminder)

gapminder

set.seed(20)
dat <- data.frame(s.n = c(1:10),
                  b = sample(c(30:100),size = 10, replace = TRUE),
                  l = sample(c(25:50),size = 10, replace = TRUE),
                  h = sample(c(25:50),size = 10, replace = TRUE))

dat$area <- dat$l * dat$b

dat$volume <- dat$l * dat$b * dat$h 

# using dplyr mutate function 

library(dplyr)
set.seed(20)
dat1 <- data.frame(s.n = c(1:10),
                  b = sample(c(30:100),size = 10, replace = TRUE),
                  l = sample(c(25:50),size = 10, replace = TRUE),
                  h = sample(c(25:50),size = 10, replace = TRUE))
dat1 %>%
  mutate(Area = l*b) %>%
  mutate(Volume = Area * h) %>% #add extra column
  mutate(New_veriable = NA) -> final_data

#Rename : rename column Name

names(final_data)[4] <- "Height"

# Using dplyr(rename function)

final_data %>% rename(Length = l) -> final_data
final_data %>% rename(Breadth = b) -> final_data
#Or
final_data %>% rename(Length = l) %>% rename(Breadth = b)

# Join Function

clients <- read.csv("Data/clients.csv")
orders <-read.csv("Data/orders.csv")

str(clients) 
names(clients)
names(orders)
str(orders)

# now used join function
## Left function 

library(dplyr)

clients %>%
  left_join(orders[,c(2, 16:25)], by = "num_client") -> left_client
left_join()

clients %>%
  left_join(orders, by = c("num_client" = "num_client")) %>%

clients %>%
  right_join(orders[,c(2, 16:25)], by = "num_client")  %>% names()

clients %>%
  inner_join(orders[,c(2, 16:25)], by = c("num_client" = "num_client"))  %>% names() # if it is different

clients %>%
  semi_join(orders[,c(2, 16:25)], by = "num_client")  %>% dim()

clients %>%
  full_join(orders[,c(2, 16:25)], by = "num_client")  %>% dim()

df <- data.frame(x= 1:10)

set.seed(12)
df %>%
  slice_sample(prop = 0.7) -> train.data
df %>%
anti_join(train.data, by = "x") -> test_data
test_data

# with base
df[c(1,2,3)]
df[-test_data$x,]

# merge
merge(clients, orders, by = "num_client")

# Pivot function

# pivot wider

library(gapminder)
library(tidyr)

wide_date <- gapminder %>% 
  filter(continent == "Asia") %>%
  pivot_wider(id_cols = c("continent","country"),
            names_from = "year",
            values_from = "lifeExp")

wide_date <- gapminder %>%
  filter(continent == "Asia") %>%
  pivot_wider(id_cols = c("continent","country"),
              names_from = "year",
              values_from = pop)

wide_date <- gapminder %>%
  filter(continent == "Asia") %>%
  pivot_wider(id_cols = c("continent","country"),
              names_from = "year",
              values_from = gdpPercap) -> wider_data

# pivot longer

wider_data
wider_data %>%
  pivot_longer(cols = names(wider_date)[3:length(wider_data)],
               names_to = "year",
               values_to = "LifeExp") 

wider_data
wider_data %>%
  pivot_longer(cols = c("lifeExp", "pop","gdpPercap"),
               names_to = "variable",
               values_to = "value")
gapminder %>% View()

gapminder %>%
  pivot_longer(cols = names(gapminder)[4:6],
               names_to = "Data",
               values_to = "values") %>% View()


long_date <- gapminder %>%
  filter(continent == "Asia") %>%
  pivot_longer(cols = c("pop","gdpPercap", "lifeExp"),
    names_to = "variable",
    values_to = "value")

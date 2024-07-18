## Introduction to ggplot

data <- read.table("Data/tips_text.txt",
                   sep = "\t",
                   header = TRUE)


#install.packages("ggplot2")
library(ggplot2)

plot(tip ~ total_bill,
     data = data,
     xlab = "Total_bill($)",
     ylab = "amount of tip($)",
     main = "The relation between total bill and tips",
     col= "blue",
     pch = 2,
     cex = 2)



hist(data$total_bill, 
     xlab = "Total bill($)",
     main = "Distribution of Total bill",
     col = "red"
)


barplot(table(data$sex), 
        col = c("pink","skyblue"))



boxplot(data$total_bill)

boxplot(total_bill ~ sex,
        data = data,
        col = c("pink","blue"),
        xlab = "Gender",
        ylab = "Total amount of bill($)")


## Introduction to ggplot2

library(ggplot2)

library(dplyr)

# just draw a plot


ggplot(data =data,
       mapping = aes(x = data$total_bill, 
                     y = data$tip))
## add graph on it

ggplot(data =data,
       mapping = aes(x = total_bill, 
                    y = tip))+
  geom_point(color ="blue",
             size = 2,
             alpha = 0.3,
             shape = 5,) # or shape = "O"

## customizing graphs

ggplot(data =data,
       mapping = aes(x = total_bill, 
                     y = tip,
                     colour = sex))+
  geom_point(size = 2,
             alpha = 1) +
  scale_color_manual(values = c("red","yellow"))+
  geom_smooth(method = "lm",
              se = FALSE,
              size = 1.5)
#Scales
data %>%
ggplot(mapping = aes(x = total_bill, 
                     y = tip,
                     colour = sex))+
  geom_point(size = 2,
             alpha = 1) +
  scale_color_manual(values = c("red","yellow"))+
  geom_smooth(method = "lm",
              se = FALSE,
              size = 1.5) +
scale_x_continuous(breaks = seq(0,55,5),
                   labels = scales::dollar) +
  scale_y_continuous(breaks = seq(0,15,2.5),
                     labels = scales::dollar) +
  facet_wrap(~day)+
  labs(title = "Relation between tips and total bill",
       subtitle = "Also demonstrates the day and sex",
       caption = "Data from Resturant",
       tag = "2022",
       x = "Amount of expenses",
       y = "Amount of tip",
       color = "Gender") +
  theme_light() -> plot1

## Univarite
### Categorical

# 1, Bar_chart

library(mosaicData)

Marriage %>%
ggplot(mapping = aes(x = race,
                     y = after_stat(count))) +
  geom_bar(color = "black",
           fill = "blue") # scale_color_manual(values = c("red","yellow")

  
Marriage %>%
  ggplot(mapping = aes(x = race,
                       y = after_stat(count/sum(count)*100))) +
  geom_bar(color = "red",
           fill = c("blue","pink","green", "yellow"))
Marriage %>%
  ggplot(mapping = aes(x = race,
                       y = after_stat(count/sum(count)))) +
  geom_bar(color = "red",
           fill = c("blue","pink","green", "yellow"))+
  scale_y_continuous(labels = scales::percent)

#Summary

Marriage %>%
  count(race) %>% rename(Race = "race") %>%
  rename(N = "n") -> plot_data
 plot_data %>%
   ggplot(mapping = aes(x = Race, y = N)) +
   geom_bar(stat = "identity")

 # ordering the x value
 plot_data %>%
   ggplot(mapping = aes(x = reorder(Race, -N), y = N)) +
   geom_bar(stat = "identity")
 
# labeling
 plot_data %>%
   ggplot(mapping = aes(x = reorder(Race, -N), y = N)) +
   geom_bar(stat = "identity") +
   geom_text(aes(label = N, vjust = -0.5))
               
# Solution 1
  Marriage %>%
   ggplot(aes(x= officialTitle))+
    geom_bar(fill = "green", color = "black")+
    coord_flip()
    
# solution 2: tilting the label    
  Marriage %>%
    ggplot(aes(x= officialTitle))+
    geom_bar(fill = "green", color = "black")+
    theme(axis.text.x = element_text(angle = 45,hjust = 1))
          
### Categorical univalent
### Pie Chart
library(ggpie)
      diamonds %>% ggpie(
            group_key = "cut",
            count_type = "full",
            fill_color = c("black","yellow","red","blue","pink"),
            label_info = "all",
            label_split = "[[:space:]]+",
            label_len = 40,
            label_color = "black",
            label_type = "horizon",
            label_pos = "out",
            label_gap = 0.05,
            label_threshold = NULL,
            label_size = 4,
            border_color = "green",
            
          )
      
### Tree Map  
      library(treemapify)
      
  plot_data %>%
    ggplot(aes(fill = Race,
               area = N,
               label = paste(Race,N,sep = " ")))+
             
    geom_treemap()
  +
    geom_treemap_text(color = "white",
                      place = "center") +
    theme(legend.position = "none")+
    labs(title = "a")
  
  
### Waffle Chart
library(waffle)

plot_data %>%
    ggplot(aes(fill = Race, values = N))+
    geom_waffle(na.rm = TRUE) +
    theme(legend.position = "bottom")

## Uni variate/ Quantitative
  
## Histogram

Marriage %>%
  ggplot(mapping = aes(x = age, y = after_stat(count/sum(count)))) +
  geom_histogram()
   
# or
Marriage %>%
  ggplot(mapping = aes(x = age, y = after_stat(count/sum(count)))) +
  geom_histogram()
    
    
# Density plot 
    
Marriage %>%
  ggplot(mapping = aes(x = age, y = after_stat(count/sum(count)))) +
  geom_density(linetype = 2,
               linewidth = 1,
               color = 'red')
# Dot plot

Marriage %>%
  ggplot(mapping = aes(x = age)) +
  geom_dotplot(color = 'red',fill = "blue", dotsize = 1)

# categorical vs Quantitative 
## barplot which we already covered 

## Kernel density plot(Grouped)

library(dplyr)
library(ggplot2)
library(carData)
Salaries %>%
  ggplot(mapping = aes(x = salary, 
                       fill = rank)) +
  geom_density(alpha = 0.4) +
  theme(legend.position = "top") +
  scale_fill_brewer(palette = "Set1")

# Box Plots
Salaries%>%
  ggplot(mapping = aes(y = salary))+
  geom_boxplot(color = "black", fill = "blue")


Salaries %>%
  ggplot(mapping = aes(x = rank, y = salary, fill = rank))+
  geom_boxplot(notch = TRUE, outerliers = TRUE, outlier.color = "red") +
  scale_fill_brewer(palette = "Set2")+
  theme(legend.position = "none")+
  stat_summary(fun.data = "median_hilow",
               geom = "text",
               vjust = -0.35,
               size = 2,
               color = "black",
               aes(label = ..y..))+
  coord_flip() +
  theme(legend.position = "none")




  
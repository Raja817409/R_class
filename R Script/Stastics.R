tips <- read.table("Data/tips_text.txt",
                   header = TRUE,
                   sep = "\t")

str(tips)
head(tips)

## T- Tests

## One Sample T Test

pop_mean<- 2.5
alpha <- 0.05

HO <- "The average tip in our restaurant is equals to population mean"
H1 <- " Our average tip differents from population mean"

ost <- t.test(tips$tip, 
             alternative = "two.sided",
             mu = pop_mean)
ost
#p.value

p_val <- ost$p.value


# decision 
decision <- if(p_val < alpha){
  print(H1)
} else{
  print(H0)
}

# Visulize 

hist(tips$tip)
abline(v = ost$conf.int, col = "red",lwd = 2)
abline(v = pop_mean, col = "blue", lwd = 2)

## Two sample t test

H0 <- "two sample are equal"
H1 <- "two sample are differ"

tst <- t.test(tips~sex,data = tips,var.equal = TRUE)

p_val <- tst$p.value

decision <- ifelse(p_val < alpha, H1, H0)

library(dplyr)
library(ggplot2)

tip_summary <- tips %>%
  group_by(sex) %>%
  summarise(
    mean_tip = mean(tip),
    sd = sd(tip),
    n = n()) %>%
  mutate(lower = mean_tip - 1.96 * sd / sqrt(n),
         upper = mean_tip + 1.96 * sd / sqrt(n))

## visualization

tip_summary %>%
  ggplot(mapping = aes(x = mean_tip, y = sex)) +
  geom_point() +
  geom_errorbar(aes(xmin = lower,
                    xmax = upper))
## Paired T test

library(UsingR)
father.son  

H0 <- "equal height"
H1 <- "Different height"

ptt <- t.test(father.son$fheight, father.son$sheight, paired = TRUE)

p_val <- ptt$p.value
p_val

decision <- ifelse(p_val < alpha, H1, H0)
decision
library(tidyr)
father.son %>% pivot_longer(cols = c("fheight","sheight"),
                            names_to = "data",
                            values_to = "height") %>%
  ggplot(mapping = aes(x = data, y = height, fill = data)) +
  geom_boxplot() +
  geom_text(aes(label = paste0("p = ", round(p_val,8)),x = 1,y = 80)) +
  theme(legend.position = "none")

##ANOVA
library(ggplot2)
library(ggpubr)
library(tidyverse)
library(broom)
library(AICcmodavg)

crop_data <- read.csv("Data/crop.data.csv")
summary(crop_data)
str(crop_data)

crop_data$density <- as.character(crop_data$density)
str(crop_data)
#
## apply(X = crop_data[,1:3],MARGIN =2,FUN = as.character)

crop_data[,1:3] <- sapply(crop_data[,1:3], as.character)
str(crop_data)
unique(crop_data$density)
unique(crop_data$fertilizer)

## perform one way ANOVA
H0 <- "no effect of fertilizer"
H1 <- " signficance of fertilizer"

one_way <- aov(yield ~ fertilizer, data = crop_data)
summary_anova <- summary(one_way)
summary_anova

anova_table <- summary_anova[[1]]
table <- as.data.frame(anova_table)
p_val <- summary_anova[[1]]$`Pr(>F)`[1]

decision <- if_else(p_val < 0.05, H1, H0)
decision

# post-hoc analysis
Pha <- TukeyHSD(one_way,conf.level = 0.95)
Pha 

## Visualize

library(ggstatsplot)
ggbetweenstats(data = crop_data,
               x = fertilizer,
               y = yield,
               type = "parametic")

# two way anova
two_way <- aov(yield ~ fertilizer + density,
               data = crop_data)
summary_two <- summary(two_way)

p_val1 <- summary_two[[1]]$`Pr(>F)`[1]
p_val2 <- summary_two[[1]]$`Pr(>F)`[2]

## interaction

inter <- aov(yield ~ fertilizer * density,
             data = crop_data)
summary(inter)  

library(easystats)

compare_performance(one_way,two_way,inter)


## non pragmatic
## alternative of one sample t test

np_ost <- wilcox.test(tips$tip, mu = 2.5)
np_ost$p.value

# alternative of two sample test
np_tst <- wilcox.test(tip ~sex, data = tips)
np_tst$p.value

# Alternative of paired t test
np_paired <- wilcox.test(father.son$fheight,
                         father.son$sheight, 
                         paired = TRUE,
                         alternative = "two.sided")

# alternative of ANOVA

np_anova <- kruskal.test(yield ~ fertilizer, data = crop_data)
np_anova$p.value

library(dunn.test)
dunn.test(crop_data$yield, crop_data$fertilizer)


#### normality test ######
# plotting

hist(crop_data$yield)
shapiro.test(crop_data$yield)

## variance - ftest, levene test

var.test(yield ~ density, data = crop_data)

library(car)
leveneTest(crop_data$yield,crop_data$fertilizer)


## 
library(tidyverse)
library(ggpubr)  
library(broom)  
library(AICcmodavg)

crop_data <- read.csv("Data/crop.data.csv")
summary(crop_data)
str(crop_data)

# 
crop_data$density <- as.character(crop_data$density)

# 
# apply(X = crop_data[,1:3],MARGIN = 2, FUN = as.character)
crop_data[,1:3] <- sapply(crop_data[,1:3], as.character)
str(crop_data)
# One way anova
summary(crop_data)

unique(crop_data$density)
unique(crop_data$fertilizer)
unique(crop_data$block)

# perform one way anova
H0 <- "no effect of fertilizer"
H1 <- "significance of fertilizer"

one_way <- aov(yield ~ fertilizer, data = crop_data)
summary_anova <- summary(one_way)
summary_anova

anova_table <- summary_anova[[1]]
table <- as.data.frame(anova_table)
p_val <- summary_anova[[1]]$`Pr(>F)`[1]

decision <- if_else(p_val < 0.05,H1,H0)
decision

length(unique(crop_data$fertilizer))

# post-hoc analysis
pha <- TukeyHSD(one_way,conf.level = 0.95)
pha

## visualize
library(ggstatsplot)

ggbetweenstats(data = crop_data,
               x = fertilizer,
               y = yield,
               type = "parametric")

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

library(AICcmodavg)
library(easystats)

compare_performance(one_way,two_way,inter)

## non - parametric
# alternative of one sample t test
np_ost <- wilcox.test(tips$tip, mu = 2.5)
np_ost$p.value

# alternative of two sample t test
np_tst <- wilcox.test(tip ~ sex, data = tips)
np_tst$p.value

# alternative of paired t test
np_paired <- wilcox.test(father.son$fheight,
                         father.son$sheight, 
                         paired = TRUE,
                         alternative = "two.sided") 
np_paired

# alternative of ANOVA
np_anova <- kruskal.test(yield ~ fertilizer, data = crop_data)
np_anova$p.value

library(dunn.test)
dunn.test(crop_data$yield, crop_data$fertilizer)

###### Normality test #####
# plotting
hist(crop_data$yield)
shapiro.test(crop_data$yield)

## variance - ftest, levene test
var.test(yield ~ density, data = crop_data)

library(car)
leveneTest(crop_data$yield, crop_data$fertilizer)
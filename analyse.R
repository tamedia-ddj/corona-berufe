#Clear workspace
rm(list = ls())
#Set working directory
setwd("~/Desktop/GitHub/202003_corona_berufe")

#Set preferred options
options(stringsAsFactors = FALSE)
#Load packages
library("ggplot2")
library(feather)


#import data
data_large <- read_feather("internal/data_large.feather")
data_small <- read_feather("internal/data_small.feather")


##### Look at correlations with percentage of women in job
### Model 1 (Frauenanteil ~ Exp_Prox)
m0 <- lm(Exp_Prox ~ Frauenanteil, weights=data_large$"Total (in T)", data=data_large)
summary(m0)
## Plot model
ggplot(data_large, aes(x=Frauenanteil, y=Exp_Prox)) + 
  geom_point()+
  geom_smooth(method=lm)

### Model 2 (Frauenanteil ~ Exposure)
m1 <- lm(Exposure ~ Frauenanteil, weights=data_large$"Total (in T)", data=data_large)
summary(m1)
## Plot model
ggplot(data_large, aes(x=Frauenanteil, y=Exposure)) + 
  geom_point()+
  geom_smooth(method=lm)

### Model 3 (Frauenanteil ~ Proximity)
m2 <- lm(Proximity ~ Frauenanteil, weights=data_large$"Total (in T)", data=data_large)
summary(m2)
## Plot model
ggplot(data_large, aes(x=Frauenanteil, y=Proximity)) + 
  geom_point()+
  geom_smooth(method=lm)


##### Look at correlations with average income
### Model 4 (average_income ~ Proximity)
m3 <- lm(Proximity ~ data_small$'Alle-Total', weights = data_small$"n (in Tausend)", data=data_small)
summary(m3)
## Plot model
ggplot(data_small, aes(x=data_small$'Alle-Total', y=Proximity)) + 
  geom_point()+
  geom_smooth(method=lm)


### Model 5 (average_income ~ Exp_Prox)
m4 <- lm(Exp_Prox ~ data_small$'Alle-Total', weights = data_small$"n (in Tausend)", data=data_small)
summary(m4)
## Plot model
ggplot(data_small, aes(x=data_small$'Alle-Total', y=Exp_Prox)) + 
  geom_point()+
  geom_smooth(method=lm)


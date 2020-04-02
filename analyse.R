#Clear workspace
rm(list = ls())
#Set working directory
setwd("~/Desktop/GitHub/202003_corona_berufe")

#Set preferred options
options(stringsAsFactors = FALSE)
#Load packages
library("ggplot2")
library(feather)
#load("internal/.RData") 
data_large <- read_feather("internal/data_large.feather")
save(data_large,file="internal/data_large.Rda")

m1 <- lm(Frauenanteil ~ Exposure, data=data_large)
summary(m1)

ggplot(data_large, aes(x=Frauenanteil, y=Exposure)) + 
  geom_point()+
  geom_smooth(method=lm)

m2 <- lm(Frauenanteil ~ Proximity, data=data_large)
summary(m2)

ggplot(data_large, aes(x=Frauenanteil, y=Proximity)) + 
  geom_point()+
  geom_smooth(method=lm)

data_small <- read_feather("internal/data_small.feather")
save(data_small,file="internal/data_small.Rda")


m3 <- lm(data_small$'Alle-Total' ~ Proximity, data=data_small)
summary(m3)

ggplot(data_small, aes(x=data_small$'Alle-Total', y=Proximity)) + 
  geom_point()+
  geom_smooth(method=lm)

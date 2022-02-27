## ---- packages
library(tidyverse)
library(broom)

## ---- data
data(trees)

## ---- overview of data
head(trees)
summaru(trees)

## ---- EDA
ggplot(data=trees, aes(x=Volume, y=Girth)) +
  geom_point() + theme(aspect.ratio = 1)
cor(trees$Volume, trees$Girth)

## ---- lm
model <- lm(Volume ~ Girth, data=trees)
model
summary(model)

ggplot(trees, aes(y=Volume, x=Girth))+
  geom_point() +
  geom_abline(intercept = -36.943, slope = 5.066, colour="forestgreen", lwd=2) +
  theme(aspect.ratio = 1)

## ---- residuals
fitresid <- augment(model)
fitresid
ggplot(fitresid, aes(y=.resid, x=.fitted))+
  geom_point()

ggplot(fitresid, 
       aes(sample=.resid))+
  stat_qq() + stat_qq_line()+labs(x="Theoretical Quantiles", y="Sample Quantiles")

shapiro.test(fitresid$.resid)


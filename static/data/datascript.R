#set.seed(1)
#x <- rnorm(100, mean=100, sd=10)
#y <- log(x) + rnorm(100, sd=0.2) + 10
#x <- x
#data <- data.frame(x=x, y=y)

library(tidyverse)
# data <- read_csv("data.csv")
dataurl <- read_csv("https://thiyangaregression.netlify.app/data/data.csv")

library(ggplot2)
ggplot(data, aes(x=x, y=y)) + geom_point()

write.csv(data,'data.csv')

sl <- lm(y~x, data=data)
library(broom)
resid <- augment(sl)
ggplot(resid, aes(x=.resid, y=.fitted)) + geom_point()

data$lgx <- log(x)
sl2 <- lm(y~lgx, data=data)
resid2 <- augment(sl2)
ggplot(resid2, aes(x=.resid, y=.fitted)) + geom_point()

data$lgx <- log(x)
data$lgy <- log(y)
sl2 <- lm(lgy~lgx, data=data)
resid2 <- augment(sl2)
ggplot(resid2, aes(x=.resid, y=.fitted)) + geom_point()


library(ggplot2)
set.seed(123)
x <- rep(1:5, each=10)
y <- 10 * x + 20 + rnorm(50, sd=10)
df <- data.frame(x=x, y=y)
ggplot(df, aes(x=x, y=y)) + geom_point() + stat_summary(fun.y=mean, geom="point", col="red", size=2)
y2 <- 10*1:5 + 20
df2 <- data.frame(x=1:5, y=y2)
ggplot(df, aes(x=x, y=y)) + geom_point() +
geom_point(data=df2, aes(x=x, y=y), colour="red", size=3) + 


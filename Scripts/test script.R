
bulls <- data.frame("lag" = c(1, 34, 15, 3, 12, 14, 4, 16, 10, 3, 12, 6, 10, 19, 29, 3, 1, 1, 17))
bulls$"red" <- as.factor(c(0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0, 0, 0))

bulls2 <- data.frame("lag" = c(17, 6, 11, 12, 29, 1, 4, 1, 2, 10, 5, 13, 22, 3, 34, 5, 14, 24, 6, 1, 28, 21, 4, 4, 4, 1))
bulls2$"red" <- as.factor(c(0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,0,0,0,0,1,0,0))

bulls3 <- data.frame("lag" = c(3, 1, 7, 11, 1, 7, 8, 5, 9, 6, 5, 9, 29))
bulls3$"red" <- as.factor(c(0,0,1,0,0,0,0,0,1,0,0,0,0))

sapply(list.files(file.path(getwd(), "Functions"), full.names = T), source)


summary(bulls$lag)
sd(bulls$lag)
hist(bulls$lag)
nrow(bulls)
sum(bulls$lag)
nrow(bulls) / sum(bulls$lag)


hist_wrap(bulls$lag)



analysis <- "poisson process"

plt(ts(bulls$lag))
plt(bulls$lag)


poisson.test(sum(bulls$lag), length(bulls$lag), r = mean(bulls$lag))


x <- ts(bulls$lag)
acf(x)

plt(x, main = "Test")

summary(lm(x ~ time(x)))











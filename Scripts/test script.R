
bulls <- data.frame("lag" = c(1, 34, 15, 3, 12, 14, 4, 16, 10, 3, 12, 6, 10, 19, 29, 3, 1, 1, 17))
bulls$"red" <- as.factor(c(0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0, 0, 0))



summary(bulls$lag)
sd(bulls$lag)
hist(bulls$lag)
nrow(bulls)
sum(bulls$lag)


hist_wrap(bulls$lag)

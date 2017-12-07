
bulls <- data.frame("lag" = c(1, 34, 15, 3, 12, 14, 4, 16, 10, 3, 12, 6, 10, 19, 29, 3, 1, 1, 17))
bulls$"red" <- as.factor(c(0,0,0,0,0,0,0,0,0,1,0,0,1,1,0,0,0, 0, 0))



summary(bulls$lag)
sd(bulls$lag)
hist(bulls$lag)
nrow(bulls)
sum(bulls$lag)

b.wide <- data.frame("throw" = rep(1:6, 35))
unlist(sapply(bulls$lag, function(x) c(rep(0, x - 1), 1)))

b.wide$"bull" <- unlist(sapply(bulls$lag, function(x) c(rep(0, x - 1), 1)))

b.wide$"red" <- b.wide$"bull"
b.wide$red[which(b.wide$red == 1)[which(bulls$red == 0)]] = 0

b.wide$bull <- as.factor(b.wide$bull)
b.wide$red <- as.factor(b.wide$red)


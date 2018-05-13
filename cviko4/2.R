n <- 20
theta <- 1/6

# (A)
dbinom (5, size = n, prob = theta)

# (B)
pbinom (4, size = n, prob = theta)

# (C)
1-pbinom (5, size = n, prob = theta)

# (D)
sum(dbinom (seq(1,9,by=2), size = n, prob = theta))

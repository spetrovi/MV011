n <- 10
theta <- 1/2

# (A)
dbinom (5, size = n, prob = theta)
choose (10, 5) / 2^10

# (B) 
pbinom (5, size = n, prob = theta)

# (C)
pbinom (10, size = n, prob = theta) - pbinom (6, size = n, prob = theta)
1 - pbinom (6, size = n, prob = theta)

# (D)
dbinom (seq (1,9,by=2), size = n, prob = theta)
sum(dbinom (seq (1,9,by=2), size = n, prob = theta))


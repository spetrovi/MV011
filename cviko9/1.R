#	Priklad 1

X <- c (0.31, 0.30, 0.29, 0.32)
n <- length (X)
prumer <- mean (X)
odchylka <- sd (X)
alpha <- 0.05
kvantil <- qchisq (1-alpha, n - 1)
D <- sqrt (n - 1) * odchylka / sqrt (kvantil)
D

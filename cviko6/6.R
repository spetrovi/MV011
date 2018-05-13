#	Vypocetni pomucka k Prikladu 1

X <- seq (0, 4, by = 1)
p <- c (1/2, 1/4, 1/8, 1/16, 1/16)
F <- cumsum (p)
data.frame (X, p, F)

# stredna hodnota EX
EX <- sum(0*1/2, 1*1/4, 2*1/8, 3*1/16, 4*1/16)

# 2.moment E(X^2)
EX2 <- sum(0^2*1/2, 1^2*1/4, 2^2*1/8, 3^2*1/16, 4^2*1/16)

# rozptyl DX = E(X^2) - (EX)^2
DX <- EX2 - EX^2

# smerodajna odchylka, sigmax = sqrt(DX)
sqrt(DX)



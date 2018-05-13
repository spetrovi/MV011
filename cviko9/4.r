
# Priklad 4

X <- c (0.140, 0.138, 0.143, 0.142, 0.144, 0.137)
Y <- c (0.135, 0.140, 0.142, 0.136, 0.138)


nx <- length (X)
ny <- length (Y)

alpha <- 0.05
kvantil <- qnorm (1 - alpha)

priem_x = mean (X)
priem_y = mean (Y)

rozp_x = 4e-6
rozp_y = 9e-6

S <- sqrt((rozp_x/nx)+(rozp_y/ny))
D <- priem_x - priem_y - kvantil * S 

D

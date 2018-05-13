# Priklad 2 

data <- read.csv (file = "intervaly.csv", header = TRUE, sep = ",", dec = ".")

stredy <- (data$dolni+data$horni) / 2
X <- rep(stredy, data$cetnost)


priemer <- mean (X)
rozptyl <- var (X)
odchylka <- sd(X)

n <- sum (data$cetnost)

alpha <- 0.05
kvantil <- qt(1-alpha/2, n-1)
kvantil2 <- qt(alpha/2, n-1)

kvantil
kvantil2

D <- (-(kvantil*odchylka)/sqrt(n)) + priemer
H <- (-(kvantil2*odchylka)/sqrt(n)) + priemer
c (D, H)

kvantil <- qchisq(1-alpha/2, n-1)
kvantil2 <- qchisq(alpha/2, n-1)


D<- (n-1)*rozptyl/kvantil
H<- (n-1)*rozptyl/kvantil2

c (D, H)

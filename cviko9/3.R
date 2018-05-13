
#	Priklad 3 

N <- 8000 
n <- 160
x <- 48
alpha <- 0.05
prumer <- x / n # bodovy odhad podilu
prumer * N      # bodovy odhad poctu
odchylka <- sqrt (prumer * (1 - prumer))
kvantil <- qnorm (1 - alpha / 2)
kvantil2 <- qnorm (alpha / 2)
D <- prumer - kvantil * odchylka / sqrt(n)
H <- prumer - kvantil2 * odchylka / sqrt(n)
c (D, H)              # intervalovy odhad podilu
round (c (D, H) * N)  # intervalovy odhad poctu (zaokrouhleno na cela cisla)

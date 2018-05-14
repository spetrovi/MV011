# Priklad 1

data <- read.csv (file = "../data/3znamky.csv", header = TRUE, sep = ",", dec = ".")
data

# pocet skupin
r <- nrow(data)

# cetnosti
n.j <- data$cetnosti

# pocet pozorovani
n <- sum(n.j)

# relativni cetnost
p.j <- n.j / n

# kumulativni cetnost
N.j <- cumsum (n.j)

# kumulativni relativni cetnosti
F.j <- N.j / n

# tabulka 
tabulka <- data.frame (znamka = data$znamka, n.j, p.j, N.j, F.j)
tabulka

# sloupkovy diagram
barplot (tabulka$n.j, names.arg = tabulka$znamka, xlab = "znamka", ylab = "pocet pozorovani", main = "sloupkovy diagram")

# graf cetnostni funkce
plot (tabulka$znamka, tabulka$n.j, type = "p", pch = 20, cex = 2, col = "red", xlab = "znamka", ylab = "hodnoty cetnostni funkce", main = "cetnostni funkce")

# polygon cetnosti
plot (tabulka$znamka, tabulka$n.j, type="b", pch = 20, xlab = "znamka", ylab = "pocet pozorovani", main = "polygon cetnosti", col = "red", cex = 2, lty = 2)

# graf empiricke distribucni funkce
plot (c(0, tabulka$znamka, 5), c(0, tabulka$F.j, 1), type="s", xlab = "znamka", ylab = "ECDF", main="empiricka distribucni funkce", col = "red", lwd = 2)

X <- rep (tabulka$znamka, tabulka$n.j)
plot (ecdf (X), col = "red", lwd = 2, xlab = "znamka", ylab = "ECDF", main="empiricka distribucni funkce")

priemer <- mean(X)

rozptyl <- mean (X^2) - priemer^2
odchylka <- sqrt(rozptyl)

# pre kvantily musis usortit X
X.sorted <- sort (X)

# najdes si stvrtinu, polovinu, tristvrtinu 
c.25 <- 0.25 * n
c.50 <- 0.50 * n
c.75 <- 0.75 * n

# aby si dostal dobru hodnotu spriemerujes dve susedne hodnoty
q25 <- (X.sorted[c.25] + X.sorted[c.25 + 1]) / 2
q50 <- (X.sorted[c.50] + X.sorted[c.50 + 1]) / 2
q75 <- (X.sorted[c.75] + X.sorted[c.75 + 1]) / 2

c (q25, q50, q75)

# toto je kvantilova odchylka
q <- q75 - q25

boxplot (X, horizontal = TRUE, ylim = range (X), xlab = "znamka", main = "boxplot")

# bodky do boxplotu
stripchart (X, vertical = FALSE, method = "jitter", pch = 21, col = "red", bg = "yellow", cex = 1.5, add = TRUE)














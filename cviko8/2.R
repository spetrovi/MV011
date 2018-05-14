# Priklad 2

data <- read.csv (file = "../data/ocel.csv", header = TRUE, sep = ",", dec = ".")
data

#merania su intervaly, preto potrebujes stredy
stredy <- (data$mez.d + data$mez.h) / 2

# dlzka intervalov
d.j <- data$mez.h - data$mez.d

# pocet skupin
r <- nrow(data)

# cetnosti
n.j <- data$pocet

# pocet pozorovani
n <- sum(n.j)

# relativni cetnost
p.j <- n.j / n

# kumulativni cetnost
N.j <- cumsum (n.j)

# kumulativni relativni cetnosti
F.j <- N.j / n

# tabulka 
tabulka <- data.frame (data$mez.d, data$mez.h, stredy = stredy, n.j, p.j, N.j, F.j, d.j)
tabulka

# sloupkovy diagram
barplot (tabulka$n.j, names.arg = tabulka$stredy, xlab = "stredy", ylab = "pocet pozorovani", main = "sloupkovy diagram")

# graf cetnostni funkce
plot (tabulka$stredy, tabulka$n.j, type = "p", pch = 20, cex = 2, col = "red", xlab = "stredy", ylab = "hodnoty cetnostni funkce", main = "cetnostni funkce")

# polygon cetnosti
plot (tabulka$stredy, tabulka$n.j, type="b", pch = 20, xlab = "stredy", ylab = "pocet pozorovani", main = "polygon cetnosti", col = "red", cex = 2, lty = 2)

# graf empiricke distribucni funkce
plot (c(0, tabulka$stredy, max(tabulka$stredy)+20), c(0, tabulka$F.j, 1), type="b", xlab = "stredy", ylab = "ECDF", main="empiricka distribucni funkce", col = "red", pch = 20, lwd = 1.5)

#plot (c(0, tabulka$D[1], tabulka$H, max(X) + 500), c(0, 0, tabulka$F.j, 1), type = "b", xlab = "pocty zapujcek", ylab = "ECDF", main = "empiricka distribucni funkce", col = "red", pch = 20, lwd = 1.5)


X <- rep (tabulka$stredy, tabulka$n.j)

#toto az tak dobre nefunguje, resp. neda to taky vysledok ako v rieseniach
plot (ecdf (c(0, tabulka$stredy, max(tabulka$stredy)+20)), col = "red", lwd = 2, xlab = "znamka", ylab = "ECDF", main="empiricka distribucni funkce")

priemer <- mean(X)
priemer

rozptyl <- mean (X^2) - priemer^2
rozptyl

odchylka <- sqrt(rozptyl)
odchylka

X.sorted <- sort (X)

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
q

boxplot (X, horizontal = TRUE, ylim = range (X), xlab = "znamka", main = "krabicovy diagram (boxplot)")
stripchart (X, vertical = FALSE, method = "jitter", pch = 21, col = "red", bg = "yellow", cex = 1.5, add = TRUE)














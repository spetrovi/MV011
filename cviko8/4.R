# Priklad 4

data <- read.csv (file = "../data/kola.csv", header = TRUE, sep = ",", dec = ".")

X <- data$cnt

n <- length(X)

# hodnoty cnt maju velky rozsah, pozri range, (22 8714)
range(X)

# preto si chceme vyrobit intervaly
# nasledujuci vypocet na velkost intervalov je uplne arbitrarny
r <- round (sqrt (n))
velkost <- ceiling(diff (range (X)) / r)

# urcime si rozsah
mez.d <- min(X)
mez.h <- max(X)

# napocitame intervaly
D <- seq (from = mez.d, to = mez.h, by = velkost)
H <- seq (from = mez.d + velkost, to = (mez.h + 2), by = velkost) #+2 aby mali D a H rovnaku velkost

stredy <- (D + H) / 2

# dlzka intervalov, mohli by sme aj rep (velkost, length(stredy))
d.j <- H - D

# vygenerujeme tabulku
tabulka <- data.frame(D, H, stredy)
tabulka

# cetnosti
# aplikuje funkciu na tabulku
# ak je druhy argument 1, ide sa po riadkoch, ak je 2, ide sa po stlpcoch
# anonymna funkcia robi to, ze ked je hodnota X vacsia alebo rovna dolnej medzi (v tabulke w[1])
# a zaroven mensia ako horna medz(w[2]), podmienka uspeje, takze tam zostane
# array takych hodnot, ktore su potom zosumovane, teda dostaneme cetnosti 
# pre jednotlive intervaly
n.j <- apply (tabulka, 1, function (w) {
sum (X >= w[1] & X < w[2])
})

# pocet pozorovani, alebo length(X), alebo nrow(data)
n <- sum(n.j)

# relativni cetnost
p.j <- round(n.j / n, 4)

# kumulativni cetnost
N.j <- round(cumsum (n.j), 3)

# kumulativni relativni cetnosti
F.j <- round(N.j / n, 3)

#cetnostni hustota zapujicek
f.j <- p.j / d.j

tabulka <- data.frame(D, H, stredy, n.j, p.j, N.j, F.j, f.j)
tabulka

# sloupkovy diagram cetnosti
barplot (tabulka$n.j, names.arg = tabulka$stredy, las = 3, xlab = "", ylab = "pocet poziciek", )

# sloupkovy diagram relativnich cetnosti
barplot (tabulka$p.j, names.arg = tabulka$stredy, las = 3, xlab = "", ylab = "relativne cetnosti poziciek", )

# sloupkovy diagram cetnostni hustoty
barplot (tabulka$f.j, names.arg = tabulka$stredy, las = 3, space = 0, xlab = "", ylab = "cetnostni hustota poziciek", main = "histogram", col = "yellow")

# defaultni histogram v R, zkousejte menit parametr "breaks"
hist (X, breaks = 27, freq = FALSE, col = "yellow", xlab = "pocty zapujcek", ylab = "hodnoty cetnostni hustoty", main = "histogram")

# graf empiricke distribucni funkce
plot (c(0, tabulka$D[1], tabulka$H, max(X) + 500), c(0, 0, tabulka$F.j, 1), type = "b", xlab = "pocty zapujcek", ylab = "ECDF", main = "empiricka distribucni funkce", col = "red", pch = 20, lwd = 1.5)


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


# hradby boxplotu
c (q25, q75) + c (-1, 1) * 1.5 * q
c (q25, q75) + c (-1, 1) * 3 * q

boxplot (X, horizontal = TRUE, ylim = range (X), xlab = "cetnost", main = "krabicovy diagram (boxplot)")
stripchart (X, vertical = FALSE, method = "jitter", pch = 21, col = "red", bg = "yellow", cex = 1.5, add = TRUE)





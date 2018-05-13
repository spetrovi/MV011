data <- read.csv (file = "kola.csv", header = TRUE, sep = ",", dec = ".")

X <- data$cnt

n <- length (X)
r <- round (sqrt (n))
range(X)
diff (range (X)) / r
#	volime tedy 27 intervalu o delkach 322 

dolni <- seq (from = 21.5, to = 8714, by = 322)
horni <- seq (from = 21.5 + 322, to = 8720, by = 322)
stredy <- (dolni + horni) / 2

tabulka <- data.frame (dolni, horni, stredy)
tabulka

n.j <- apply (tabulka, 1, function (w) {
	sum (X >= w[1] & X < w[2])
})
sum (n.j)

p.j <- n.j / n
sum (p.j)

N.j <- cumsum (n.j)

F.j <- N.j / n

d.j <- horni - dolni

f.j <- p.j / d.j

tabulka <- cbind (tabulka, data.frame (n.j, p.j, N.j, F.j, d.j, f.j))
tabulka

barplot (tabulka$n.j, names.arg = tabulka$stredy, las = 3, xlab = "", ylab = "pocet zapujcek", )

# sloupkovy diagram relativnich cetnosti
barplot (tabulka$p.j, names.arg = tabulka$stredy, las = 3, xlab = "", ylab = "relativni cetnosti zapujcek", )

# sloupkovy diagram cetnostni hustoty
barplot (tabulka$f.j, names.arg = tabulka$stredy, las = 3, space = 0, xlab = "", ylab = "cetnostni hustota zapujcek", main = "histogram", col = "yellow")

#	defaultni histogram v R, zkousejte menit parametr "breaks"
hist (X, breaks = 27, freq = FALSE, col = "yellow", xlab = "pocty zapujcek", ylab = "hodnoty cetnostni hustoty", main = "histogram")

# graf empiricke distribucni funkce
plot (c(0,tabulka$dolni[1], tabulka$horni, 9000), c(0,0,tabulka$F.j,1), type = "b", xlab = "pocty zapujcek", ylab = "ECDF", main = "empiricka distribucni funkce", col = "red", pch = 20, lwd = 1.5)

X.sorted <- sort (X)
X.sorted

# median, kvartily, kvartilova odchylka
c.25 <- 0.25 * n
c.50 <- 0.50 * n
c.75 <- 0.75 * n
c (c.25, c.50, c.75)

# kvantily
x.25 <- (X.sorted[c.25] + X.sorted[c.25 + 1]) / 2
x.50 <- (X.sorted[c.50] + X.sorted[c.50 + 1]) / 2
x.75 <- (X.sorted[c.75] + X.sorted[c.75 + 1]) / 2
c (x.25, x.50, x.75)

# kvartilova odchylka (IQR)
q <- x.75 - x.25
q

# hradby boxplotu
c (x.25, x.75) + c (-1, 1) * 1.5 * q
c (x.25, x.75) + c (-1, 1) * 3 * q


boxplot (X, horizontal = TRUE, ylim = range (X), xlab = "sss", main = "krabicovy diagram (boxplot)")
stripchart (X, vertical = FALSE, method = "jitter", pch = 21, col = "red", bg = "yellow", cex = 1.5, add = TRUE)











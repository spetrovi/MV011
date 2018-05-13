# =============================================================================================================================
# Priklad 7

tabulka <- read.csv (file = "ropa.csv", header = TRUE, sep = ",", dec = ".")
summary (tabulka)

logaritmus <- log(tabulka$MBBl)

model1 <- lm(logaritmus ~ Year, data = tabulka)
prehled1 <- summary(model1)

# grafika

plot (c (1850, 2000), c (0, 10), type = "n", xlab = "rok", ylab = "logMBBl")
points (tabulka$Year, logaritmus, col = "blue", pch = 24, lwd = 1.5, cex = 1.0)

# prichystame si sit na x-ove ose
x <- seq (1850, 2000, by = 0.1)
# pomoci funkce "predict" nechame dopocitat odpovidajici Y-ove hodnoty na regresni funkci
Y1 <- predict (model1, data.frame (Year = x))
lines (x, Y1, col = "red", lwd = 2)

model2 <- lm (logaritmus ~ Year + I(Year^2), data = tabulka) 
prehled2 <- summary(model2)

# prichystame si sit na x-ove ose
x <- seq (1850, 2000, by = 0.1)
# pomoci funkce "predict" nechame dopocitat odpovidajici Y-ove hodnoty na regresni funkci
Y2 <- predict (model2, data.frame (Year = x))
lines (x, Y2, col = "green", lwd = 2)




boxplot (model1$residuals, model2$residuals, ylab = "rezidua", names = c(1,2), border = c ("red", "#00cc00"))


sum (model1$residuals^2) / model1$df.residual
prehled1$r.squared
prehled1$adj.r.squared

sum (model2$residuals^2) / model2$df.residual
prehled2$r.squared
prehled2$adj.r.squared


#	Graficka pomucka k Prikladu 1

x <- seq (0, 10, by = 0.01)
fX <- dexp (x, rate = 0.5)
plot (x, fX, type = "l", col = "red", lwd = 2, ylab = "hustota X")

y <- seq (0, 660, by = 0.01)
fY <- ifelse (y < 60, 0, exp (-y/120 + 1/2) / 120)

plot (y, fY, type = "l", col = "blue", lwd = 2, ylab = "hustota Y")

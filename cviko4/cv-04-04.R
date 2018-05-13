# Priklad 4

lambda <- 4
#	mozne hodnoty x jsou vsechna prirozena cisla, 
#	horni mez sekvence hodnot x v R je tak nutno patricne upravit 
x <- seq (0, 10)
titulek <- "Poissonovo rozdeleni"

# pravdepodobnostni funkce
pravdepodobnostni <- dpois (x, lambda = lambda)

#	sloupcovy graf
barplot (pravdepodobnostni, col = rainbow (length (x)), names.arg = x, ylab = "pravdepodobnostni funkce", main = titulek)

#	klasicky bodovy (korektne matematicky) graf
plot (x, pravdepodobnostni, type = "h", col = "red", ylab = "pravdepodobnostni funkce", main = titulek)
points (x, pravdepodobnostni, pch = 16, cex = 0.5, col = "red")

# distribucni funkce
distribucni <- ppois (x, lambda = lambda)
# jedna se o skokovou funkci
dist.fce <- stepfun (x, c (0, distribucni))

# distribucni funkce je vzdy zprava spojita, 
# tzn. leve krajni body vzdy patri k useckam
plot (dist.fce, verticals = FALSE, col = "red", pch = 16, cex = 0.5, ylab = "distribucni funkce", main = titulek)

# (A)
# 2-29 Marca, 1x za tyzden znamena 4x za 28 dni, preto lambda=4
ppois (0, lambda = lambda)

# (B)
sum(dpois (seq(0,4,by=1), lambda = lambda))
ppois (4, lambda = lambda)

# (C)
1-ppois (0, lambda = lambda)

# (D)
ppois (6, lambda = lambda) - ppois (1, lambda = lambda)



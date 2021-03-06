# Priklad 3

theta <- 0.4
#	mozne hodnoty x jsou vsechna prirozena cisla, 
#	horni mez sekvence hodnot x je tak nutno patricne upravit 
x <- seq (0, 10)
titulek <- "geometricke rozdeleni"

# pravdepodobnostni funkce
pravdepodobnostni <- dgeom (x, prob = theta)

#	sloupcovy graf
barplot (pravdepodobnostni, col = rainbow (length (x)), names.arg = x, ylab = "pravdepodobnostni funkce", main = titulek)

#	klasicky bodovy (korektne matematicky) graf
plot (x, pravdepodobnostni, type = "h", col = "red", ylab = "pravdepodobnostni funkce", main = titulek)
points (x, pravdepodobnostni, pch = 16, cex = 0.5, col = "red")

# distribucni funkce
distribucni <- pgeom (x, prob = theta)
# jedna se o skokovou funkci
dist.fce <- stepfun (x, c (0, distribucni))

# distribucni funkce je vzdy zprava spojita, 
# tzn. leve krajni body vzdy patri k useckam
plot (dist.fce, verticals = FALSE, col = "red", pch = 16, cex = 0.5, ylab = "distribucni funkce", main = titulek)

# ======================================================================
theta <- 0.4

# (A)
pgeom(10, prob = theta)

# (B) 
1 - pgeom(3, prob = theta)

# (C)
pgeom(8, prob = theta) - pgeom(4, prob = theta)

# 2, 3, 4, 5, 6
# neparne -> 3,5... 2/5
# parne -> 2,4,6... 3/5

# (A)
theta <- 2/5
n <- 10

pgeom(n, prob=theta)
# t.j. s 99% pravdepodobnostou uhras menej ako 10 kol

# (B)
1-pgeom(3, prob=theta)

# (C)
pgeom(8, prob=theta)-pgeom(4, prob=theta)




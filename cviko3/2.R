	library (prob)

#	Priklad 2

# "D" = divka, "H" = hoch

u <- c ("D", "H")
p <- c (0.5, 0.5)

iidspace (u, 2, probs = p)
S <- iidspace (u, 2, probs = p)


# A - obe su D
# B - jedno je D

B <- subset(S, isin (S, 'D'))
A <- subset(S, isin (S, c ('D','D')))

B
A

AB <- intersect(A, B)
AB
Prob(AB) / Prob(B)

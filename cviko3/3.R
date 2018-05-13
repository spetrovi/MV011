library(prob)

# DK, Di, H

#p1 <- 1/3566848
p1 <- 1/40
u <- c ("DK", "Di", "H")
p <- c (p1, 0.5 - p1, 0.5)

S <- iidspace(u, 2, probs = p)


#nemozu byt dve kunhuty ani dve s rovnakym menom

S[2,]$probs <- S[2,]$probs + S[1,]$probs / 2
S[4,]$probs <- S[4,]$probs + S[1,]$probs / 2
S[1,]$probs <- 0

B <- subset (S, isin (S, "DK"))
A <- subset (S, ! isin (S, "H"))
AB <- intersect (A, B)
#Prob (AB) / Prob (B)


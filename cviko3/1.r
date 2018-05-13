library(prob)

kocky <- rolldie(2)

S <- probspace(kocky)

# A - padly dve 5
# B - sucet je delitelny 5

A <- subset(S, X1 == 5 & X2 == 5)
B <- subset(S, (X1 + X2) %% 5 == 0)

A
B

AB <- intersect(A,B)
AB

Prob(AB) / Prob(B)

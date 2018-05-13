library (prob)
n <- 4
mince <- tosscoin(n)
S <- probspace(mince)

A <- subset (S, isin (S, rep('H', n)))

A
Prob(A)

S

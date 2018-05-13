library(prob)

kategorie <- rep(c ("A", "B", "C"), each = 2)

nehoda <- rep (c("ano", "ne"), 3)

el.jevy <- data.frame(kategorie, nehoda)

p <- c (0.7 * 0.03, 0.7 * (1-0.03), 0.2 * 0.06, 0.2 * (1-0.06), 0.1 * 0.1, 0.1 * (1-0.1))
S <- probspace (el.jevy, probs = p)

S

sum(S$probs)

N <- subset (S, nehoda == "ano")
N
Prob (N)

A <- subset(S, kategorie == 'A')
B <- N

AB <- intersect(A,B)
Prob(AB) / Prob(B)



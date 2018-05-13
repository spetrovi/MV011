library(prob)

# rakovinu ma 5% ludi
# pozitivny pri 95% ludi s rakovinou
# negativny pre 95% ludi bez rakoviny

# Ma pacient rakovinu(A) za predpokladu, ze je pozitivny vysledok(B)?

kategorie <- rep(c ("Ma", "Nema"), each = 2)

vysledok <- rep (c("Pozitivny", "Negativny"), 2)

el.jevy <- data.frame(kategorie, vysledok)

p <- c (0.005 * 0.95, 0.005 * 0.05, 0.995 * 0.05, 0.995 * 0.95)
S <- probspace (el.jevy, probs = p)
S
sum(S$probs)

B <- subset(S, vysledok == "Pozitivny")
B
Prob(B)

A <- subset(S, kategorie == "Ma")

AB <- intersect(A,B)

Prob(AB) / Prob(B)

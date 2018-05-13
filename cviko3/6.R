library(prob)
# zlte 40%
# biele 60%

# povedal, ze videl zlty
# presnost 80%
# aka je pravdepodobnost, ze bol zlty(A)

kategorie <- rep(c ("Zlty", "Biely"), each = 2)

vysledok <- rep (c("Spravne", "Nespravne"), 2)

el.jevy <- data.frame(kategorie, vysledok)

p <- c (0.4 * 0.8, 0.4 * 0.2, 0.6 * 0.8, 0.6 * 0.2)
S <- probspace (el.jevy, probs = p)
S
sum(S$probs)

kategorie <- rep(c ("Zlty", "Biely", "Zbytok"))

vysledok <- rep (c("Spravne", "Nespravne", "Whatevs"))

el.jevy <- data.frame(kategorie, vysledok)
p <- c (0.32, 0.12, 1-0.32-0.12)
S2 <- probspace (el.jevy, probs = p)

B <- subset(S2, kategorie != 'Zbytok')
A <- subset(S, kategorie == 'Zlty')


AB = intersect(A,B)
Prob(AB) / Prob(B)



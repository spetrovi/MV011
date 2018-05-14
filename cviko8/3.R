# Priklad 3

priemer <- 110
rozptyl <- 800

n <- 20

# das prec zle cisla a pridas nove
# priemer je suma x->n (x*px)
# rozptyl je priemer (X^2) - priemer^2
zle <- (85 + 120) / n
dobre <- (90 + 150) / n

novy_priemer <- priemer - zle + dobre
novy rozptyl <- rozptyl - (85^2 + 120^2) / n + priemer^2 + (95^2 + 150^2) / n - novy_priemer^2

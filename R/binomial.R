binomial <- function() {
  disease <- drawDisease()
  p <- round(100*runif(1,0,0.4))
  n <- sample(3:10, 1)
  x <- sample(0:n, 1)
  y <- sample(1:2, 1)
  s <- sample(1:2, 1)
  
  out("Suppose that ", p, "% of individuals in a certain population suffer from ", disease, ".  If we take a sample of ", n, " individuals,")
  out("a) What is the probability that exactly ", y, " will suffer from ", disease, "?")
  out("b) What is the probability that ", c("at least ", "no more than ")[s], y, " will suffer from ", disease, "?")
  
  cat("\n\n")
  readline("Press <Enter> to reveal answers")
  cat("\n\n")
  
  ind <- if (s==1) seq(y, n) else seq(0,y)
  out("a) ", round(dbinom(y, n, p/100), 3))
  out("b) ", round(sum(dbinom(ind, n, p/100)), 3))
}

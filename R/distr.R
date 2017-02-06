distr <- function() {
  x <- runif(1)
  if (x < .33) {
    normal()
  } else if (x < .66) {
    binomial()
  } else {
    clt()
  }
}

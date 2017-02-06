quiz2 <- function() {
  x <- runif(1)
  if (x < .5) {
    corr()
  } else {
    prob()
  }
}

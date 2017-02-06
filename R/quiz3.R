quiz3 <- function() {
  x <- runif(1)
  if (x < .33) {
    cat1()
  } else if (x < .67) {
    cont1()
  } else {
    distr()
  }
}

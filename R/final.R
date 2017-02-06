final <- function() {
  x <- runif(1)
  if (x < .25) quiz2()
  else if (x < .5) quiz3()
  else if (x < .75) quiz4()
  else quiz5()
}

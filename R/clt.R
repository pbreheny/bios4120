clt <- function() {
  mark <- drawMarker()
  n <- round(runif(1,10,50))
  SD <- round(runif(1,.8,1.2)*mark$SD,1)
  m <- round(runif(1,.8,1.5)*mark$m,1)
  SE <- SD/sqrt(n)
  cut1 <- round(qnorm(runif(1), m, SE), 1)
  cut2 <- round(2.5*SE*runif(1))
  cut3 <- round(100*runif(1))
  s1 <- sample(1:2, 1)
  s2 <- sample(1:2, 1)
  
  out("Suppose that, for individuals in a certain population, levels of ", mark$marker, " are normally distributed with a mean of ", m, " and a standard deviation of ", SD, ".  ",
      "If we take a sample of ", n, " individuals,")
  out("a) What is the probability that the mean ", mark$marker," level is ", c("below ", "above ")[s1], cut1, "?")
  out("b) What is the probability that the mean ", mark$marker," level ", c("within ", "more than ")[s2], cut2, c(" of"," away from")[s2], " the population mean?")
  out("c) What two values contain the middle ", cut3, " percent of sample means?")
  
  cat("\n\n")
  readline("Press <Enter> to reveal answers")
  cat("\n\n")
  
  alpha <- 2*pnorm(-cut2/SE)
  z <- qnorm((1-cut3/100)/2)
  out("a) ", round(100*pnorm(cut1, m, SE, lower=(s1==1)), 1))
  out("b) ", round(100*ifelse(s2==1, 1-alpha, alpha), 1))
  out("c) ", paste(round(m + c(1,-1)*z*SE, 1), collapse=", "))
}

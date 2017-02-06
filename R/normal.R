normal <- function() {
  mark <- drawMarker()
  SD <- round(runif(1,.8,1.2)*mark$SD,1)
  m <- round(runif(1,.8,1.5)*mark$m,1)
  cut1 <- round(qnorm(runif(1), m, SD), 1)
  cut2 <- round(2.5*SD*runif(1))
  cut3 <- round(100*runif(1))
  s1 <- sample(1:2, 1)
  s2 <- sample(1:2, 1)
  
  out("Suppose that, for individuals in a certain population, levels of ", mark$marker, " are normally distributed with a mean of ", m, " and a standard deviation of ", SD, ".")
  out("a) What percent of individuals have ", mark$marker," levels ", c("below ", "above ")[s1], cut1, "?")
  out("b) What percent of individuals have ", mark$marker," levels ", c("within ", "more than ")[s2], cut2, c(" of"," away from")[s2], " the mean?")
  out("c) What is the ", cut3, "th percentile of ", mark$marker, " levels in this population?")
  
  cat("\n\n")
  readline("Press <Enter> to reveal answers")
  cat("\n\n")
  
  alpha <- 2*pnorm(-cut2/SD)
  out("a) ", round(100*pnorm(cut1, m, SD, lower=(s1==1)), 1))
  out("b) ", round(100*ifelse(s2==1, 1-alpha, alpha), 1))
  out("c) ", round(qnorm(cut3/100, m, SD), 1))
}

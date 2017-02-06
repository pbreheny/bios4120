cat1conf <- function() {
  year <- round(runif(1,1980,2012))
  disease <- drawDisease()
  n <- round(runif(1,15,120))
  p <- runif(1,.05,.5)
  x <- round(n*p)
  conf.level <- sample(c(.8,.9,.95,.95,.95,.95),1)
  
  writeLines(strwrap(paste("A ",year," study attempted to estimate the percentage of individuals with ",disease," in a certain population.  The study sampled ",n," individuals; of those individuals, ",x," had ",disease,".  Calculate a ",100*conf.level,"% confidence interval for the percent of individuals with ",disease," in this population.",sep="")))
  cat("\n\n")
  readline("Press <Enter> to reveal answers")
  cat("\n\n")
  
  p <- x/n
  SE <- sqrt(p*(1-p)/n)
  CI <- round(p+c(-1,1)*qnorm((1+conf.level)/2)*SE,3)
  cat("CI = (",max(0,CI[1]),", ",min(1,CI[2]),")    (approximate CI for a proportion)\n",sep="")
}

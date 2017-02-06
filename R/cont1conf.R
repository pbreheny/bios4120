cont1conf <- function() {
  year <- round(runif(1,1980,2012))
  mark <- drawMarker()
  n <- round(runif(1,10,50))
  SD <- round(runif(1,.8,1.2)*mark$SD,1)
  m <- round(runif(1,.8,1.5)*mark$m,1)
  conf.level <- sample(c(.8,.9,.95,.95,.95,.95),1)
  time <- paste(sample(3:40,1),"weeks")
  
  writeLines(strwrap(paste("A ",year," study attempted to estimate the average levels of ",mark$marker," for individuals in a certain population.  The study sampled ",n," individuals; for those individuals, the average ",mark$marker," level was ",m,", and the sample standard deviation was ",SD,".  Calculate a ",100*conf.level,"% confidence interval for the average levels of ",mark$marker," in this population.",sep="")))
  cat("\n\n")
  readline("Press <Enter> to reveal answers")
  cat("\n\n")
  
  SE <- SD/sqrt(n)
  CI <- round(m+c(-1,1)*qt((1+conf.level)/2,n-1)*SE,3)
  cat("CI = (",CI[1],", ",CI[2],")     (CI for a mean)\n",sep="")
}

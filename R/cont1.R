cont1 <- function() {
  if (runif(1) < .5) {
    cont1conf()
    return(invisible(NULL))
  }
  
  year <- round(runif(1,1980,2012))
  mark <- drawMarker()
  n <- round(runif(1,10,50))
  d <- runif(1,0,1)
  SD <- round(runif(1,.8,1.2)*mark$SD,1)
  m <- round(d*mark$SD,1)
  conf.level <- sample(c(.8,.9,.95,.95,.95,.95),1)
  drug <- drawExp("drug")
  time <- paste(sample(3:40,1),"weeks")
  
  writeLines(strwrap(paste("A ",year," study involved ",n," individuals who were randomly assigned to take either ",drug," for ",time," followed by a control therapy for ",time,", or control therapy for ",time," followed by ",drug," for ",time,". The outcome of the study was the difference in ",mark$marker," levels for each individual, comparing their measurements on the drug with their measurements on the placebo.  On average, individuals' ",mark$marker," levels were ",m," units lower while taking the drug.  The standard deviation of those differences was ",SD,".",sep="")))
  writeLines(strwrap(paste("a) What is the probability of seeing a difference in ",mark$marker," levels this large if there was really no difference between the two treatments?",sep="")))
  writeLines(strwrap(paste("b) Calculate a ",100*conf.level,"% confidence interval for the average amount by which an individual's ",mark$marker," levels would drop if they were to take ",drug,".",sep="")))
  cat("\n\n")
  readline("Press <Enter> to reveal answers")
  cat("\n\n")
  
  SE <- SD/sqrt(n)
  p.value <- 2*pt(-m/SE,n-1)
  if (p.value < .0001) p.value <- "< 0.0001"
  else p.value <- paste("= ",formatC(round(p.value,4)))
  cat("a) p ",p.value,"            (one-sample/paired t-test)\n",sep="")
  CI <- round(m+c(-1,1)*qt((1+conf.level)/2,n-1)*SE,1)
  cat("b) CI = (",CI[1],", ",CI[2],")     (CI for a mean)\n",sep="")
}

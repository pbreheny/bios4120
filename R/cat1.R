cat1 <- function() {
  if (runif(1) < .5) {
    cat1conf()
    return(invisible(NULL))
  }
  
  year <- round(runif(1,1980,2012))
  disease <- drawDisease()
  n <- round(runif(1,15,120))
  p <- runif(1,.5,.9)
  x <- round(n*p)
  dor <- sample(1:2,1)
  conf.level <- sample(c(.8,.9,.95,.95,.95,.95),1)
  drug <- drawExp("drug")
  time <- paste(sample(3:40,1),"weeks")
  
  writeLines(strwrap(paste("A ",year," study involved ",n," individuals with ",disease," who were randomly assigned to take either ",drug," for ",time," followed by a control therapy for ",time,", or control therapy for ",time," followed by ",drug," for ",time,". In the study, ",x," individuals did better on treatment than control, while ",n-x," individuals did better on control than treatment.",sep="")))
  writeLines(strwrap(paste("a) What is the probability of seeing this many (or more) patients do better on one treatment than the other, if there was really no difference between the two treatments?",sep="")))
  writeLines(strwrap(paste("b) Calculate a ",100*conf.level,"% confidence interval for the percent of individuals with ",disease," who would improve if given ",drug,".",sep="")))
  cat("\n\n")
  readline("Press <Enter> to reveal answers")
  cat("\n\n")
  
  p <- x/n
  SE <- sqrt(.5^2/n)
  p.value <- 2*pnorm(-abs((p-.5)/SE))
  if (p.value < .0001) p.value <- "< 0.0001"
  else p.value <- paste("= ",round(p.value,4))
  cat("a) p ",p.value,"        (z-test)\n",sep="")
  SE <- sqrt(p*(1-p)/n)
  CI <- round(p+c(-1,1)*qnorm((1+conf.level)/2)*SE,3)
  cat("b) CI = (",CI[1],", ",CI[2],")    (approximate CI for a proportion)\n",sep="")
}

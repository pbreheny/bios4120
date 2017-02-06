cont2 <- function()
  {
    year <- round(runif(1,1980,2012))
    mark <- drawMarker()
    ex <- drawExp("beneficial")
    n1 <- round(runif(1,5,100))
    n2 <- round(runif(1,5,100))
    d <- runif(1,0,1)
    m <- c(mark$m,round(mark$m+d*mark$SD,1))
    conf.level <- sample(c(.8,.9,.95,.95,.95,.95),1)
    writeLines(strwrap(paste("A ",year," study investigated whether ",ex$act," may lower ",mark$marker," levels.  The study obtained a sample of ",n2," individuals who do not ",ex$action," and ",n1," individuals who do.  They found that among the individuals who ",ex$action,", their average ",mark$marker," levels were ",m[1],", while the control group had an average of ",m[2],".  The pooled standard deviation was ",mark$SD,".",sep="")))
    writeLines(strwrap(paste("a) What is the probability that the difference between the two groups would be as great or greater than what the study observed, if ",ex$act," truly has no effect on ",mark$marker," levels?",sep="")))
    writeLines(strwrap(paste("b) Provide a ",100*conf.level,"% confidence interval for the amount by which ",ex$act," reduces ",mark$marker," levels.",sep="")))
    cat("\n\n")
    readline("Press <Enter> to reveal answers")
    cat("\n\n")
    d <- m[2]-m[1]
    SE <- mark$SD*sqrt(1/n1+1/n2)
    p <- 2*pt(-d/SE,n1+n2-2)
    if (p < .001) p <- "< 0.001"
    else p <- paste("= ",round(p,3))
    cat("a) p ",p,"        (two-sample Student's t-test)\n",sep="")
    alpha <- 1-conf.level
    l <- d+qt(alpha/2,n1+n2-2)*SE
    u <- d-qt(alpha/2,n1+n2-2)*SE
    cat("b) CI = (",round(l,2),", ",round(u,2),")    (CI for a difference of two means)\n",sep="")
  }

cat2 <- function()
  {
    year <- round(runif(1,1980,2012))
    disease <- drawDisease()
    n <- round(runif(1,50,500))
    p1 <- runif(1,0,.4)
    n1 <- round(n*p1)
    n2 <- round(runif(1,0,n1))
    dor <- sample(1:2,1)
    conf.level <- sample(c(.8,.9,.95,.95,.95,.95),1)
    drug <- drawExp("drug")
    or.text <- c(paste("more likely individuals in the placebo group are to suffer from ",disease," than individuals who take the drug.",sep=""),paste("less likely individuals who take the drug are to suffer from ",disease,".",sep=""))
    writeLines(strwrap(paste("A ",year," study investigated whether taking the drug ",drug," reduced the likelihood of developing ",disease,".  In the trial, ",n," inviduals were randomized to receive the drug, while ",n," individuals received a placebo.   At the end of the study, ",n1, " individuals on the placebo developed ",disease,", compared with ",n2," individuals who took the drug.",sep="")))
    writeLines(strwrap(paste("a) What is the probability that the difference between the drug and placebo would be as great or greater than what the study observed, if there was really no difference between the two treatments?",sep="")))
    writeLines(strwrap(paste("b) Calculate the odds ratio for how much ",or.text[dor],sep="")))
    writeLines(strwrap(paste("c) Provide a ",100*conf.level,"% confidence interval for the quantity in part b).",sep="")))
    cat("\n\n")
    readline("Press <Enter> to reveal answers")
    cat("\n\n")
    tab <- cbind(c(n1,n-n1),c(n2,n-n2))
    p <- suppressWarnings(chisq.test(tab,correct=FALSE)$p.value)
    if (p < .0001) p <- "< 0.0001"
    else p <- paste("= ",round(p,4))
    cat("a) p ",p,"        (Chi-squared test)\n",sep="")
    or <- tab[1,1]*tab[2,2]/(tab[1,2]*tab[2,1])
    if (dor==2) or <- 1/or
    cat("b) OR = ",round(or,2),"\n",sep="")
    se <- sqrt(sum(1/tab))
    alpha <- 1-conf.level
    l <- log(or)+qnorm(alpha/2)*se
    u <- log(or)-qnorm(alpha/2)*se
    cat("c) CI = (",round(exp(l),2),", ",round(exp(u),2),")    (CI for odds ratio)\n",sep="")
  }

surv <- function()
  {
    year <- round(runif(1,1980,2012))
    n <- round(runif(1,10,50))
    t <- round(sort(runif(6,.2,.5)*100))
    S <- round(runif(1),3)
    d <- sample(c("Yes","No"),size=6,replace=TRUE)
    
    writeLines(strwrap(paste("A ",year," study examined the survival times for patients given an experimental therapy.  An excerpt of the raw data is given below.  Calculate the survival function for all of the times in the table.",sep="")))
    write.table(data.frame(Time=t,Death=d,n=c(n,rep(NA,5)),S=c(S,rep(NA,5))),sep="\t",na="",row.names=FALSE,quote=FALSE)
    cat("\n\n")
    readline("Press <Enter> to reveal answers")
    cat("\n\n")
    tab <- table(t)
    dd <- as.numeric(by(d=="Yes",t,sum))[-1]
    nn <- n-rep(c(0,cumsum(tab)[-length(tab)]),tab)
    ind <- which(!duplicated(t))
    nn <- nn[ind][-1]
    SS <- round(cumprod(c(S,(nn-dd)/nn)),3)
    write.table(data.frame(Time=unique(t),n=c(n,nn),S=SS),sep="\t",na="",row.names=FALSE,quote=FALSE)
  }

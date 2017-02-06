bayes <- function() {
  pA <- round(runif(1), 3)
  pB <- round(runif(1), 3)
  pAB <- round(runif(1, max(0, pA + pB -1), min(pA, pB)), 3)
  pA.B <- pAB/pB
  pB.A <- pAB/pA
  pB.Ac <- pB*(1-pA.B)/(1-pA)
  pAoB <- pA + pB - pAB
  
  writeLines("")
  writeLines(strwrap(paste0("The probablity of A is ", round(pA, 3),", the probability of B given A is ", round(pB.A, 3),", and the probability of B given A-complement (i.e., given that A does not happen) is ", round(pB.Ac, 3), ".")))
  writeLines("")
  writeLines(strwrap("a) What is the probability of A and B?"))
  writeLines(strwrap("b) What is the probability of A given B?"))
  writeLines(strwrap("c) What is the probability of B?"))
  
  cat("\n\n")
  readline("Press <Enter> to reveal answers")
  cat("\n\n")
  
  writeLines(strwrap(paste0("a) ", round(pA*pB.A, 3))))
  writeLines(strwrap(paste0("b) ", round(pA.B, 3))))
  writeLines(strwrap(paste0("c) ", round(pB, 3))))
}

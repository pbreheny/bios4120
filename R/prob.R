prob <- function() {
  if (runif(1) < .3) {
    bayes()
    return(invisible(NULL))
  }
  type <- sample(1:3, 1)
  pA <- round(runif(1), 3)
  pB <- round(runif(1), 3)
  pAB <- round(runif(1, 0, min(pA, pB)), 3)
  pA.B <- pAB/pB
  pB.A <- pAB/pA
  pAoB <- pA + pB - pAB
  
  given.txt <- c("A and B", "A or B", "A given B")
  given.num <- c(pAB, pAoB, pA.B)
  
  writeLines("")
  writeLines(strwrap(paste0("The probablity of A is ", round(pA, 3),", the probability of B is ", round(pB, 3),", and the probability of ", given.txt[type], " is ", round(given.num[type], 3), ".")))
  writeLines("")
  for (i in 1:2) {
    j <- setdiff(1:3, type)[i]
    writeLines(strwrap(paste0(letters[i], ") What is the probability of ", given.txt[j], "?")))
  }
  writeLines(strwrap("c) What is the probability of B given A?"))
  
  cat("\n\n")
  readline("Press <Enter> to reveal answers")
  cat("\n\n")
  
  for (i in 1:2) {
    j <- setdiff(1:3, type)[i]
    writeLines(strwrap(paste0(letters[i], ") ", round(given.num[j], 3))))
  }
  writeLines(strwrap(paste0("c) ", round(pB.A, 3))))
}

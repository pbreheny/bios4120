corr <- function() {
  year <- round(runif(1,1980,2012))
  mark <- drawMarker(2)
  r <- round(runif(1, -0.9, 0.9), 2)
  writeLines(strwrap(paste0("A ", year, " study found the correlation between ", mark$marker[1] ," and ", mark$marker[2], " to be ", r, ".")))
  writeLines(strwrap(paste0("Furthermore, they found that ", mark$marker[1], " had a mean of ", mark$m[1], " and a SD of ", mark$SD[1], " while ", mark$marker[2], " had a mean of ", mark$m[2], " and a SD of ", mark$SD[2], ".")))
  x <- round(runif(2, 0.1, 1.5), 1)
  i <- sample(1:2, 1)
  j <- setdiff(1:2, i)
  s <- c(-1,1)[i]
  s.word <- c("below", "above")[i]
  y <- round(mark$m[1] + mark$SD[1] * x[2], 1)
  writeLines(strwrap(paste0("a) Suppose an individual's ", mark$marker[1], " is ", x[1], " standard deviations ", s.word, " average.  How many standard deviations above/below average is that individual's ", mark$marker[2], " likely to be?")))
  writeLines(strwrap(paste0("b) Suppose an individual's ", mark$marker[1], " is ", y, ".  What is that individual's ", mark$marker[2], " likely to be?")))
  writeLines(strwrap(paste0("c) What is the regression coefficient for predicting ", mark$marker[i], " based on ", mark$marker[j], "?")))
  cat("\n\n")
  readline("Press <Enter> to reveal answers")
  cat("\n\n")
  ii <- if (r > 0) i else j
  writeLines(paste0("a) ", round(x[1] * abs(r), 2), " SDs ", c("below", "above")[ii], " average"))
  writeLines(paste0("b) ", round(mark$m[2] + mark$SD[2]*x[2]*r, 2)))
  writeLines(paste0("c) ", round(r * mark$SD[i] / mark$SD[j], 3)))
}

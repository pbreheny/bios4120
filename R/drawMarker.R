drawMarker <- function(n=1) {
  marker <- c("cholesterol","uric acid","BMI","blood pressure","fatty acid","insulin")
  i <- sample(1:length(marker),n)
  m <- c(204,5.7,28,120,299,105)
  SD <- c(44,1,5,15,30,10)
  return(list(marker=marker[i],
              m=round(m[i]*runif(1,.8,1.2),n),
              SD=round(SD[i]*runif(1,.8,1.2),n)))
}

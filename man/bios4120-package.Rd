\name{bios4120}
\alias{bios4120}
\docType{package}
\title{Random question generator for BIOS 4120}
\description{
  Randomly generates certainly types of questions for the course
  BIOS:4120 at the University of Iowa to help students study for exams.
}
\author{Patrick Breheny <patrick-breheny@uiowa.edu>}
\examples{
# Quiz 2
prob()  ## Probability question
corr()  ## Correlation/regression question
quiz2() ## Randomly draws one of the above two questions

# Quiz 3
distr() ## Distributions (normal, binomial, central limit theorem)
cat1()  ## One-sample categorical data (using CLT approximation)
cont1() ## One-sample continuous data
quiz3() ## Randomly draws one of the above three questions

# Quiz 4
cat2()  ## Two-sample categorical data
cont2() ## Two-sample continuous data
quiz4() ## Randomly draws one of the above two questions

# Post-Quiz 4
ANOVA() ## ANOVA/multiple comparison question 
surv()  ## Kaplan-Meier/survival question 
quiz5() ## Randomly draws one of the above two questions 
final() ## Randomly draws a question from quiz2, quiz3, quiz4, or quiz5 
}

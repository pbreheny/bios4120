# bios4120

This R package is for students of my BIOS:4120 class.  To get extra practice/experience with common problems, this package provides a random question generator. To use it, you must have R installed on your computer.

## Install

The easiest way to install is via the `devtools` package.  This is not installed by default, so to install both packages, submit the following into R:

```
install.packages('devtools')
library(devtools)
install_github('pbreheny/bios4120')
```

## Usage

Once installed, load the package with `library(bios4120)` and then you can use any of the following functions:

Random questions from quiz 2:

```
prob()  ## Probability question
corr()  ## Correlation/regression question
quiz2() ## Randomly draws one of the above two questions
```

Random questions from quiz 3:

```
distr() ## Distributions (normal, binomial, central limit theorem)
cat1()  ## One-sample categorical data (using CLT approximation)
cont1() ## One-sample continuous data
quiz3() ## Randomly draws one of the above three questions
```

Random questions from quiz 4:

```
cat2()  ## Two-sample categorical data
cont2() ## Two-sample continuous data
quiz4() ## Randomly draws one of the above two questions
```

Random questions from post-quiz 4:

```
ANOVA() ## ANOVA/multiple comparison question 
surv()  ## Kaplan-Meier/survival question 
quiz5() ## Randomly draws one of the above two questions 
final() ## Randomly draws a question from quiz2, quiz3, quiz4, or quiz5 
```

## Disclaimers

* Not all aspects of the course lend themselves to random question generation. Seeing the "big picture" is also very important, but it is very difficult to ask automatically generated questions about such concepts. I hope that you find the tool helpful, but it is not a wholesale replacement for conventional studying.  I will also ask broader, conceptual questions on actual quizzes/tests.
* Quizzes, lectures, and labs from this course use actual data from real studies. The random question generator does not. So by all means, if the random question generator produces a study that provides convincing evidence that drinking coffee lowers blood pressure (or something), do not read anything into it! These are not real studies!

head(mtcars)

apply(mtcars,2,mean)

apply(mtcars,2,median)

apply(mtcars,2,sd)

apply(mtcars,2,var)

table(mtcars$cyl)


table(mtcars$cyl)/sum(table(mtcars$cyl))


quantile(mtcars$mpg,probs = c(0.05,0.1,0.5,0.9,0.95))


range(mtcars$mpg)

summary(mtcars)

library(Hmisc)

describe(mtcars)

sapply(mtcars,mean,na.rm=T)































































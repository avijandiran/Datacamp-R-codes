# Author DataFlair
library(boot)


# Creating Function to obtain R-Squared from the data
r_squared <- function(formula, data, indices) {
  val <- data[indices,] # selecting sample with boot 
  fit <- lm(formula, data=val)
  return(summary(fit)$r.square)
} 
# Performing 1500 replications with boot 
output <- boot(data=mtcars, statistic=r_squared, 
               R=1500, formula=mpg~wt+disp)
# Plotting the output
output 
plot(output)
# Obtaining a confidence interval of 95%
boot.ci(output, type="bca")
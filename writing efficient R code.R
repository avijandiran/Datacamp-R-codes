
# How long does it take to read movies from CSV?
system.time(read.csv("movies.csv"))

# How long does it take to read movies from RDS?
system.time(readRDS("movies.rds"))



# Elapsed time:
# Using system.time() is convenient, but it does have its drawbacks when comparing multiple function calls. 
# The microbenchmark package solves this problem with the microbenchmark() function.


# Load the microbenchmark package
library(microbenchmark)

# Compare the two functions
compare <- microbenchmark(read.csv("movies.csv"), 
                          readRDS("movies.rds"), 
                          times = 10)
# Print compare
compare


# Relative time:-
# When benchmarking it's important to consider both absolute and relative times.
# Using the timings below, on average a single call to read.csv() is 720 - 80 = 640 milliseconds slower than that of readRDS().

# Load the benchmarkme package
library(benchmarkme)

# Assign the variable ram to the amount of RAM on this machine
ram <- get_ram()
ram

# Assign the variable cpu to the cpu specs
cpu <- get_cpu()
cpu

# Run the io benchmark
res <- benchmark_io(runs = 1, size = 5)

# Plot the results
plot(res)


x <- NULL
n <- 30000
r <- for(i in 1:n) {
  x <- c(x, rnorm(1))
}

#The growing() function defined below generates n random standard normal numbers, but grows the size of the vector each time an element is added!
  
#Note: Standard normal numbers are numbers drawn from a normal distribution with mean 0 and standard deviation 1.

n <- 30000
# Slow code
growing <- function(n) {
  x <- NULL
  for(i in 1:n)
    x <- c(x, rnorm(1))
  x
}

system.time(res_grow <- growing(n=30000))

res_grow

n <- 30000
# Fast code
pre_allocate <- function(n) {
  x <- numeric(n) # Pre-allocate
  for(i in 1:n) 
    x[i] <- rnorm(1)
  x
}

# Use <- with system.time() to store the result as res_allocate
n <- 30000

system.time(res_allocate <- pre_allocate(n))

# Vectorized code: multiplication
# The following piece of code is written like traditional C or Fortran code. Instead of using the vectorized version of multiplication, it uses a for loop.

x <- rnorm(10)
x2 <- numeric(length(x))
for(i in 1:10)
  x2[i] <- x[i] * x[i]

#Your job is to make this code more "R-like" by vectorizing i

# Store your answer as x2_imp
x2_imp <- c( x * x)




# Vectorized code: calculating a log-sum
# A common operation in statistics is to calculate the sum of log probabilities. The following code calculates the log-sum (the sum of the logs).

# x is a vector of probabilities
total <- 0
for(i in seq_along(x)) 
  total <- total + log(x[i])

#However this piece of code could be significantly improved using vectorized code.

# Initial code
n <- 100
total <- 0
x <- runif(n)
for(i in 1:n) 
  total <- total + log(x[i])

# Rewrite in a single line. Store the result in log_sum
log_sum <- sum(log(x))

#Data frames and matrices - column selection

# Which is faster, mat[, 1] or df[, 1]? 
microbenchmark(mat[,1], df[,1]) # matrix is always faster than dataframe

#Row timings
#Similar to the previous example, the objects mat and df are a matrix and a data frame, respectively. Using microbenchmark(), how long does it take to select the first row from each of these objects?
  
#To make the comparison fair, just use mat[1, ] and df[1, ].


# Which is faster, mat[1, ] or df[1, ]? 
microbenchmark( mat[1,], df[1,])

#codeprofiling 

# Load the data set
data(movies, package = "ggplot2movies") 

# Load the profvis package
library(profvis)

# Profile the following code with the profvis function
profvis ({
  # Load and select data
  comedies <- movies[movies$Comedy == 1, ]
  
  # Plot data of interest
  plot(comedies$year, comedies$rating)
  
  # Loess regression line
  model <- loess(rating ~ year, data = comedies)
  j <- order(comedies$year)
  
  # Add fitted line to the plot
  lines(comedies$year[j], model$fitted[j], col = "red")
})    ## Remember the closing brackets!


# Load the microbenchmark package
library(microbenchmark)

# The previous data frame solution is defined
# d() Simulates 6 dices rolls
d <- function() {
  data.frame(
    d1 = sample(1:6, 3, replace = TRUE),
    d2 = sample(1:6, 3, replace = TRUE)
  )
}

# Complete the matrix solution
m <- function() {
  matrix(sample(1:6, 6, replace = TRUE), ncol=2)
}

# Use microbenchmark to time m() and d()
microbenchmark(
  data.frame_solution = d(),
  matrix_solution     = m()
)


# Example data
rolls

# Define the previous solution 
app <- function(x) {
  apply(x, 1, sum)
}

# Define the new solution
r_sum <- function(x) {
  rowSums(x)
}

# Compare the methods
microbenchmark(
  app_sol = app(rolls),
  r_sum_sol = r_sum(rolls)
)



# In this code, if is_double[1] is FALSE we don't need to evaluate is_double[2] or is_double[3], 
#so we can get a speedup by swapping & for &&.
# 
# One thing to note is that && only works on single logical values, i.e., 
#logical vectors of length 1 (like you would pass into an if condition), but & also works on vectors of length greater than 1.

# Example data
is_double

# Define the previous solution
move <- function(is_double) {
  if (is_double[1] & is_double[2] & is_double[3]) {
    current <- 11 # Go To Jail
  }
}

# Define the improved solution
improved_move <- function(is_double) {
  if (is_double[1] && is_double[2] && is_double[3]) {
    current <- 11 # Go To Jail
  }
}

# microbenchmark both solutions
# Very occassionally the improved solution is actually a little slower
# This is just random chance
microbenchmark( improved_move(is_double), move(is_double), times = 1e5)


library(parallel)

detectCores()

get_cpu()


# The following piece of code implements a simple dice game. The game is as follows:
#   
#   Initialize: total <- 0.
# Roll a single die and add it to total.
# If total is even, reset total to zero.
# If total is greater than 10, the game finishes



total <- no_of_rolls <- 0 # Initialise
while(total < 10) {
  total <- total + sample(1:6, 1)
  
  if(total %% 2 == 0) total <- 0  # If even. Reset to 0
  
  no_of_rolls <- no_of_rolls + 1
}
no_of_roll













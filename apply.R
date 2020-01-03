lapply(mtcars$mpg,nchar)

class(mtcars)

unlist(lapply(mtcars,nchar))  # simply changes the list to vector

# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)

# Take a look at the structure of split_low
str(split_low)

#****************************************

# split_low has been created for you
split_low

# Transform: use anonymous function inside lapply
names <- lapply(split_low, function(x) { x[1] })




# Transform: use anonymous function inside lapply
years <- lapply(split_low, function(x) { x[2] })

#*********************88



# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low, select_el, index = 1)
years <- lapply(split_low, select_el, index = 2)


lapply(list(1, "a", TRUE), str)



lapply(split_low, function(x) {
  if (nchar(x[1]) > 5) {
    return(NULL)
  } else {
    return(x[2])
  }
})


#***********************************************  sapply

# temp has already been defined in the workspace

# Use lapply() to find each day's minimum temperature
lapply(temp,min)


# Use sapply() to find each day's minimum temperature
sapply(temp,min)

# Use lapply() to find each day's maximum temperature
lapply(temp,max)

# Use sapply() to find each day's maximum temperature

sapply(temp,max)


# temp is already defined in the workspace

# Finish function definition of extremes_avg
extremes_avg <- function(x) {
  ( min(x) + max(x) ) / 2
}

# Apply extremes_avg() over temp using sapply()

sapply(temp,extremes_avg)

# Apply extremes_avg() over temp using lapply()

lapply(temp,extremes_avg)



#---------------------


# temp is already available in the workspace

# Create a function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x))
}

# Apply extremes() over temp with sapply()
sapply(temp,extremes)

# Apply extremes() over temp with lapply()

lapply(temp,extremes)


#--------------------------------------------

# temp is already prepared for you in the workspace

# Definition of below_zero()
below_zero <- function(x) {
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp,below_zero)

# Apply below_zero over temp using lapply(): freezing_l

freezing_l <- lapply(temp,below_zero)

# Are freezing_s and freezing_l identical?

identical(freezing_s ,freezing_l)

freezing_s

freezing_l

#-------------------------------------

#lapply = fun over list or vector  , always retuwns list 

#sapply fun over list or vectors , try to simplify list to array

#vapply fun over list or vector , explilictly specify output format 



#vapply


# temp is already available in the workspace

# Definition of basics()
basics <- function(x) {
  c(min = min(x), mean = mean(x), max = max(x))
}

# Apply basics() over temp using vapply()

vapply(temp,basics,FUN.VALUE=numeric(3))


#-------------

# temp is already available in the workspace

# Definition of the basics() function
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# Fix the error:
vapply(temp, basics, numeric(4))


#---------------

# temp is already defined in the workspace

# Convert to vapply() expression
sapply(temp, max)

vapply(temp,max, numeric(1))

# Convert to vapply() expression
sapply(temp, function(x, y) { mean(x) > y }, y = 5)

vapply(temp,function(x, y) { mean(x) > y },y = 5, numeric(1) & logical(1))










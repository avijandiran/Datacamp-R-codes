library(profvis)
library(ggplot2)

profvis({
  data(diamonds, package = "ggplot2")
  
  plot(price ~ carat, data = diamonds)
  m <- lm(price ~ carat, data = diamonds)
  abline(m, col = "red")
})



times <- 4e5
cols <- 150
data <-
  as.data.frame(x = matrix(rnorm(times * cols, mean = 5),
                           ncol = cols))
data <- cbind(id = paste0("g", seq_len(times)), data)

profvis({
  # Store in another variable for this run
  data1 <- data
  
  # Get column means
  means <- apply(data1[, names(data1) != "id"], 2, mean)
  
  # Subtract mean from each column
  for (i in seq_along(means)) {
    data1[, names(data1) != "id"][, i] <-
      data1[, names(data1) != "id"][, i] - means[i]
  }
})

profvis({
  data1 <- data
  # Four different ways of getting column means
  means <- apply(data1[, names(data1) != "id"], 2, mean)
  means <- colMeans(data1[, names(data1) != "id"])
  means <- lapply(data1[, names(data1) != "id"], mean)
  means <- vapply(data1[, names(data1) != "id"], mean, numeric(1))
})



profvis({
  data1 <- data
  means <- vapply(data1[, names(data1) != "id"], mean, numeric(1))
  
  for (i in seq_along(means)) {
    data1[, names(data1) != "id"][, i] <- data1[, names(data1) != "id"][, i] - means[i]
  }
})



profvis({
  data1 <- data
  
  # Given a column, normalize values and return them
  col_norm <- function(col) {
    col - mean(col)
  }
  
  # Apply the normalizer function over all columns except id
  data1[, names(data1) != "id"] <-
    lapply(data1[, names(data1) != "id"], col_norm)
})

system.time(
            data1[, names(data1) != "id"] <-lapply(data1[, names(data1) != "id"], col_norm)
            )

system.time(means <- apply(data1[, names(data1) != "id"], 2, mean))
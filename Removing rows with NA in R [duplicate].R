mydf <- data.frame(A = c(1, 2, NA, 4), B = c(1, NA, 3, 4), 
                   C = c(1, NA, 3, 4), D = c(NA, 2, 3, 4), 
                   E = c(NA, 2, 3, 4))


mydf[complete.cases(mydf$A), ]
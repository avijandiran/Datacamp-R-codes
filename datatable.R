library(data.table)

library(MASS)

mtcars


cars <- as.data.table(mtcars)

class(cars)
cars

cars[1,]

cars[1:5,]

cars[,1]  #or 

cars[,cyl]

cars[,list(cyl,mpg)]


cars[cyl == "8" & mpg > "10" ,]


cars[,list(order(carb))]

str(cars)


cars[order(carb),]

























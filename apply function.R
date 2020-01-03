
#*****************************  apply *********************************
m <- matrix(c(1,2,3,4),2,2)
#1 <-  row
#2 <- column

apply(m,1,sum)

apply(m,2,sum)

apply(m,1,mean)

apply(m,2,mean)



#*****************************  lapply *********************************

list <- list(x=c(1,1),d=c(2,2),e=c(3,3))



lapply(list,sum)


data <- list(x=1:5,y=6:10,z=11:15)

lapply(data,FUN=median)

nyc <- list(pop=8405837,
            boroughs=c("Manhattan","bronx","broklyn","queens","staten Island"),
            capital=F)

for(info in nyc){
  print(class(info))
}

unlist(lapply(nyc,class))  # unlist is used for the data to look as vector  cause lapply return list data

class(nyc)



#****************************** sapply  *****************************************

sapply(data,FUN= median)  # sapply is similar to lapply but it returns the data as vector



#**************** Vapply ********************************
  
#vapply is similar to sapply but it explicitly specify the type of return value (integer, double etc) , its safer and faster than sapply


vapply(x,FUN,FUN.VALUE)

vapply(data,sum,FUN.VALUE = double(1))

vapply(data,sum,FUN.VALUE = double(2))




#************** tapply ******************************
  
  tapply(x,factor,FUN) # works on vector , it apply the function by grouping factors inside the vector 
  
  
age <- c(23,33,28,21,20,19,34)

gender <- c("m","m","m","f","m","f","f")

f <- factor(gender)

tapply(age,f,median)

tapply(age,gender,mean)


class(mtcars)

mtcars$cyl


fac <- factor(mtcars$cyl)

t <- tapply(mtcars$cyl,fac,sum)
 
class(t)

#******************   mapply                *****************
  
mappy( function...)  #mapply is a multivarite verison of sapply, it will apply the specified fun to the first element of each argument first, followed by the second element , so on.


a <- list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
a


mapply(rep,1:4,4:1)  #this fun and a returns the same value 




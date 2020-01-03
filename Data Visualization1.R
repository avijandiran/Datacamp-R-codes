# base graphics , grid graphics, Lattice graphics , ggplot2

# *******************  scatterplot *************

library(MASS)

plot(mtcars$hp,mtcars$mpg)

#p -point , l-line , b- both , h - histogram , o-overplotted , s -step, n-no plot

plot(mtcars$hp,mtcars$mpg,type='p',
     xlim=c(0,max_hp),
     ylim=c(0,max_mpg),
     ylab="Miles per Gallon",
     xlab="Horsepower",
     main="Horsepower vs Mileage")

max_hp <- max(mtcars$hp)

max_mpg <- max(mtcars$mpg)


#************************** par  - used to set or query graphical parameters.


names(plot_pars)

plot_pars <- par()


par(mfrow=c(2,2))

plot(anscombe$x1,anscombe$y1)

plot(anscombe$x2,anscombe$y2)


plot(anscombe$x3,anscombe$y3)

plot(anscombe$x4,anscombe$y4)

#define common x and y limits for the 4 plots


xmin <- min(anscombe$x1,anscombe$x2,anscombe$x3,anscombe$x4)

xmax <- max(anscombe$x1,anscombe$x2,anscombe$x3,anscombe$x4)

ymin <- min(anscombe$y1,anscombe$y2,anscombe$y3,anscombe$y4)


ymax <- max(anscombe$y1,anscombe$y2,anscombe$y3,anscombe$y4)




plot(anscombe$x1,anscombe$y1,
     xlim=c(xmin,xmax),
     ylim=c(ymin,ymax),
     xlab="X value",
     ylab="y value",
     main="First dataset")


plot(anscombe$x2,anscombe$y2,
     xlim=c(xmin,xmax),
     ylim=c(ymin,ymax),
     xlab="X value",
     ylab="y value",
     main="First dataset")

plot(anscombe$x3,anscombe$y3,
     xlim=c(xmin,xmax),
     ylim=c(ymin,ymax),
     xlab="X value",
     ylab="y value",
     main="First dataset")

plot(anscombe$x4,anscombe$y4,
     xlim=c(xmin,xmax),
     ylim=c(ymin,ymax),
     xlab="X value",
     ylab="y value",
     main="First dataset")




#Error in plot.new() : figure margins too large
#par("mar")

#5.1 4.1 4.1 2.1

#par(mar=c(1,1,1,1))


#*************************************** pch

#pch <- symbols
#cex <-  thickness
#ity <- line type
#lvd <- line width

library(MASS)
par(mfrow=c(1,1))

max_hp <- max(mtcars$hp)

max_mpg <- max(mtcars$mpg)


plot(mtcars$hp,mtcars$mpg,
     type="n",
     xlim=c(0,max_hp),
     ylim = c(0,max_mpg),
     xlab = "Horsepower",
     ylab="Miles per gallon")

points(mtcars$hp,mtcars$mpg,pch=15)

points(mtcars$hp,mtcars$mpg,pch=2)

points(mtcars$hp,mtcars$mpg,pch=1)

points(mtcars$hp,mtcars$mpg,pch=mtcars$cyl)


points(mtcars$hp,mtcars$mpg,pch=as.character(mtcars$cyl))



plot(mtcars$hp,mtcars$mpg,
     type="n",
     xlab="horsepower",
     ylab="Gas Mileage")

index6 <- which(mtcars$cyl==6)


points(mtcars$hp[index6],
       mtcars$mpg[index6],
       pch=19)

text(mtcars$hp[index6],
     mtcars$mpg[index6],
     adj=-0.2,cex=1.2,font=10)

index4 <- which(mtcars$cyl==4)

index8 <- which(mtcars$cyl ==8 )

points(mtcars$hp[index4],
       mtcars$mpg[index4],
       pch=17)

points(mtcars$hp[index4],
       mtcars$mpg[index4],
       pch=15)

legend("topright",pch=c(17,1,15),
       legend = c("4","6","8"))

?legend


#*********color

colors()

rainbow()

heat.colors()

terrain.colors()

topp.colors()

cm.colors()

library(RColorBrewer)
library(colorspace)
library(colorRamps)




























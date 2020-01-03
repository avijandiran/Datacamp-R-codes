#*************Line Chart

plot(AirPassengers,type="l")



plot(AirPassengers,type="o",col="red",xlab="Month",
     ylab="Rainfall",main="Rain fall chart")




v <- c(7,12,28,3,41)

plot(v,type="o")

plot(v,type="o",col="red",xlab="Month",
     ylab="Rainfall",main="Rain fall chart")

v <- c(14,7,6,19,3)

lines(t,type="o",col="blue")


#************** bar plot


# used for various categories 


counts <- table(mtcars$gear)

barplot(counts,main="car Distribution",
        xlab="Number of Gears",ylab="count",legend=rownames(counts),
        col=c("red","yellow","green"))


# stacked bar

counts <- table(mtcars$vs,mtcars$gear)

barplot(counts,main="car Distribution by gears and v/s",
        xlab="Number of Gears",ylab="count",legend=rownames(counts),
        col=c("yellow","green"))

# horizontal bar plot

barplot(counts,horiz = T)
barplot(counts,main="car Distribution ",horiz=T,
        names.arg = c("3 gears","4 gears","5 gears"))

# stacked bar plot with colors and legend
counts <- table(mtcars$vs,mtcars$gear)
counts
barplot(counts,main="car Distribution by gears and vs",
              xlab="number of gears",
              col=c("skyblue","red"),
              legend= rownames(counts))

#grouped bar plot

counts <- table(mtcars$vs,mtcars$gear)
counts
barplot(counts,main="car Distribution by gears and vs",
        xlab="number of gears",
        col=c("darkblue","red"),
        legend= rownames(counts),
        beside=T)


# pie Chart

slices <- c(10,12,4,16,8)
label <- c("US","UK","Austraila","india","france")
pie(slices,labels = label,main="Pie chart of countries")



slices <- c(10,12,4,16,8)
label <- c("US","UK","Austraila","india","france")

percentage <- round(slices/sum(slices)*100)
label <- paste(paste(label,round(slices/sum(slices)*100)),"%",sep = "")

# using percentage instead if typing 
label <- paste(paste(label,round(percentage)),"%",sep = "")



pie(slices,label=label)
pie(slices,labels = label,col=rainbow(length(label)),main="Pie chart of countries")


# 3d exploded pie chart

library(plotrix)

slices <- c(10,12,4,16,8)
label <- c("US","UK","Austraila","india","france")
pie3D(slices,labels = label,main="3D Pie chart")
















































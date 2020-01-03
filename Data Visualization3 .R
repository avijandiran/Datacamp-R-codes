#Histogram shows frequency distribution

hist(mtcars$mpg)


hist(mtcars$mpg,breaks=8.5,col="lightblue",xlab="mpg",ylab="freq")

hist(mtcars$mpg,breaks = 8.5,col="lightblue")

hist(mtcars$mpg,breaks=15,col="lightblue")

hist(AirPassengers)

hist(AirPassengers,breaks=5)
hist(AirPassengers,breaks=seq(100,700,100))

hist(AirPassengers,breaks=c(100,seq(200,600,150),700))

#Density Plot  more Effective way to view the distribution of a varibale

densitydata <- density(mtcars$mpg)

plot(densitydata)

plot(densitydata,main="Kernel density data plot")

polygon(densitydata,col="skyblue",border="black") # too add color u need to pass polygon

#boxplot

#minum  25th per , median,75th percentile maxium

boxplot(mpg~cyl,data=mtcars,main="car Milage Data",xlab="number of Cylinders",ylab="Miles Per Gallon",col=c("gold","darkgreen"))


vec <- c(3,2,5,6,4,8,1,2,3,2,4,30,36)

?boxplot

boxplot(vec)

boxplot(vec, varwidth = TRUE)

# Boxplot of MPG by Car Cylinders

# a formula, such as y ~ grp, where y is a numeric vector of data values

# to be split into groups according to the grouping variable grp (usually a factor).

boxplot(mpg~cyl, data = mtcars)

boxplot(mpg~cyl,data=mtcars, main="Car Milage Data",
        
        xlab="Number of Cylinders", ylab="Miles Per Gallon",col=(c("gold","darkgreen","Blue")))


# mosaic plot  categorical data  with area of data


data(HairEyeColor)

mosaicplot(HairEyeColor)

?mosaicplot


#heat map exploratory data analysis with 2d as axis and 3d shown by intensity of color
#need to convert the data set in matrix format

mtcars

heatmap(as.matrix(mtcars),Rowv=NA,Colv=NA,scale="column",col=cm.colors(256),xlab="Attributes",main="Heatmap")

?heatmap

#3d graph 

library(lattice)

attach(mtcars)

attach(iris)

cloud(Sepal.Length~Sepal.Width*Petal.Length,data=iris)



cloud(hp~mpg*wt,data=mtcars,main="3D Scatterplot")

cloud(hp~mpg*wt,data=mtcars,main="3D Scatterplot",col=cyl, pch=17)

cloud(hp~mpg*wt,data=mtcars,main="3D Scatterplot",col=cyl, pch=17)

cloud(hp~mpg*wt,data=mtcars,main="3D Scatterplot",col=cyl, pch=17)

cloud(hp~mpg*wt|am,data=mtcars,main="3D Scatterplot",col=cyl, pch=17)


# am - Automatic or  manual 

?lattice

# 3d with plotly package

library(plotly)

data(mtcars)

plot_ly(mtcars,x = ~wt , y= ~hp , z= ~qsec)


#basic 3 d scatter plot with color 

mtcars$am[which (mtcars$am==1)] <- "manual"

mtcars$am[which (mtcars$am==0)] <- "automatic"

mtcars$am <- as.factor(mtcars$am)


plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec, color = ~am, colors = c('#BF382A', '#0C4B8E')) %>%
  
  add_markers() %>%
  
  layout(scene = list(xaxis = list(title = 'Weight'),
                      
                      yaxis = list(title = 'horsepower'),
                      
                      zaxis = list(title = 'qsec')))

#3D Scatter Plot with color scaling

plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec,
        
        marker = list(color = ~mpg, colorscale = c('#FFE1A1', '#683531'), showscale = TRUE)) %>%
  
  add_markers() %>%
  
  layout(scene = list(xaxis = list(title = 'Weight'),
                      
                      yaxis = list(title = 'horsepower'),
                      
                      zaxis = list(title = 'qsec')),
         
         annotations = list(
           
           x = 1.13,
           
           y = 1.05,
           
           text = 'Miles/(US) gallon',
           
           xref = 'paper',
           
           yref = 'paper',
           
           showarrow = FALSE
           
         ))



# Load the `plotly` library

library(plotly)

# Your volcano data

str(volcano)

volcano

# The 3d surface map

plot_ly(z = ~volcano, type = "surface")













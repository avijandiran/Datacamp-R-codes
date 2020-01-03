#ggplot grammer of graphics



#Data <- variables of interest

#Aesthics <-   x and y axis , color fill , size labels, alpha shape , line width  line type 

#geomtric <-  point , line , histogram , bar, boxplot 

#facets <-  columns , rows

# statistics <-  binning , smoothing , descriptive , inferential 

#coordinates <-  cartesian , fixed , polar , limits 

# Themes <-  non-data ink


library(ggplot2)

  ggplot(mtcars,aes(x=wt, y=mpg ,col=factor(cyl),size=disp))+
  geom_point()+
  facet_grid(.~am)+
  stat_smooth(method=lm,col="red")+
  # scale_y_continuous("mpg",limits=c("2","35"),expand=c(0,0))+
  # scale_y_continuous("mpg",limits=c("2","35"),expand=c(0,0))+
  coord_equal()


  
  
  p <- ggplot(mtcars,aes(x=factor(cyl)))
  
  p
  
  
  p+geom_bar()


  # Scatter plot
  
  
  
  ggplot(mtcars, aes(x=wt, y = mpg)) # 2 Layer
  
  ggplot(mtcars, aes(x=wt, y = mpg))+ geom_point() # 3 Layer
  
  # Adding color
  
  ggplot(mtcars, aes(x=wt, y = mpg, col = disp))+geom_point() # 3 Layer
  
  #Adding color based on a factor
  
  ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) + geom_point()# 3
  
  #Add size
  
  ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) + geom_point()
  
  # Add color and shape (4 aesthetics):
  
  ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl), shape = factor(am))) + geom_point()
  
  # Add color shape and size(hp/wt) (5 aesthetics):
  
  ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl), shape = factor(am), size = (hp/wt))) + geom_point()
  
  
  
  #############################################################
  #Bar Plot
  
  p <- ggplot(mtcars, aes(x= factor(cyl)))
  
  p + geom_bar()
  
  ggplot(mtcars, aes(x= factor(cyl), fill = factor(am)))+ geom_bar()
  
  # Histogram
  
   q <- ggplot(mtcars, aes(x= mpg))
  
   q + geom_histogram()
  
  ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5)
  
  ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5, color = "black")
  
  ggplot(mtcars, aes(x= mpg))+ geom_histogram(binwidth = 5, color = "black", fill = "blue")
  
  # Density plot
  
  q + geom_density(color = "black", fill = "blue")
  
  #Boxplot
  
  ggplot(mtcars, aes(x=factor(cyl), y = mpg))+ geom_boxplot(color = "black", fill = "lightblue")
  
  
  
  ####################################################################
  
  
  
  # Facet Layer
  
  
  
  #Split the whole dataset based on a character along row or column
  
  mtcars$am[which(mtcars$am == 0)] <- 'Automatic'
  
  mtcars$am[which(mtcars$am == 1)] <- 'Manual'
  
  mtcars$am <- as.factor(mtcars$am)
  
  ggplot(mtcars, aes(x = wt, y = mpg, shape = factor(cyl), col = qsec)) +
    
  geom_point() +
    
  facet_grid(.~am)
  
  # Basic scatter plot
  
  p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()
  
  p
  
  # 1 - Separate rows according to transmission type, am
  
  p + facet_grid(am ~ .)
  
  
  # 2 - Separate columns according to cylinders, cyl
  
  p + facet_grid(. ~ cyl)
  
  # 3 - Separate by both columns and rows
  
  p + facet_grid(am ~ cyl)
  
  

  # Statistics Layer
  
  ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point() + stat_smooth(method = lm, col = "red")
  
  #Smoothing
  
  # A scatter plot with LOESS smooth
  
  ggplot(mtcars, aes(x = wt, y = mpg)) +
    
    geom_point() +
    
    geom_smooth()
  
  # A scatter plot with an ordinary Least Squares linear model
  
  ggplot(mtcars, aes(x = wt, y = mpg)) +
    
    geom_point() +
    
    geom_smooth(method = "lm")
  
  # The previous plot, without CI ribbon
  
  ggplot(mtcars, aes(x = wt, y = mpg)) +
    
    geom_point() +
    
    geom_smooth(method = "lm", se = FALSE)
  
  # The previous plot, without points
  
  ggplot(mtcars, aes(x = wt, y = mpg)) +
    
    stat_smooth(method = "lm", se = FALSE)
  
  #Grouping variables
  
  # 1 - Define cyl as a factor variable
  
  ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
    
    geom_point() +
    
    stat_smooth(method = "lm", se = FALSE)
  
  #################################################################
  
  # Coordinates layer
  
  # Controls plot dimension
  
  ggplot(mtcars, aes(x = wt, y = mpg)) +
    
    geom_point() +
    
    stat_smooth(method = lm, col = "red") +
    
    scale_y_continuous("mpg",limits = c(2,35),expand = c(0,0)) +
    
    scale_x_continuous("wt",limits = c(0,20), expand = c(0,0)) +
    
    coord_equal() #1:1 aspect ratio
  
  
  
  #Zoomin in
  
  # Basic ggplot() command, coded for you
  
  p <- ggplot(mtcars, aes(x = wt, y = hp, col = am)) + geom_point() + geom_smooth()
  
  p
  
  # Add coord_cartesian(): the proper way to zoom in
  
  p + coord_cartesian(xlim = c(3, 6))
  
  #################################################################
  
  # Theme Layer
  
  # Starting point
  
  p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
    
    geom_point()
  
  p
  
  z = p + facet_grid(. ~ cyl)
  
  z
  
  # Plot 1: Change the plot background fill to darkgrey
  
  z +
    
    theme(plot.background = element_rect(fill = "darkgrey"))
  
  # Plot 2: Adjust the border to be a black line of size 3
  
  z +
    
    theme(plot.background = element_rect(fill = "darkgrey", color = "black", size = 3))
  
  # Recycle Theme
  
  # Save Theme
  
  # Use of element_text(), element_line(), element_rect()
  
  mtcar_theme <- theme(panel.background = element_blank(),
                       
                       plot.background = element_rect(fill = "lightyellow"),
                       
                       legend.background = element_blank(),
                       
                       legend.key = element_blank(),
                       
                       strip.background = element_rect(color = "green"),
                       
                       
                       
                       axis.text = element_text(colour = "Blue"),
                       
                       axis.text.x = element_text(angle = 45),
                       
                       strip.text = element_blank(),
                       
                       
                       
                       panel.grid.major = element_line(colour = "lightblue"),
                       
                       panel.grid.minor = element_line(colour = "pink"),
                       
                       axis.line = element_line(colour = "lightblue")
                       
                       
                       
  )
  
  mtcar_theme
  
  #Recycle Theme
  
  p
  
  p + facet_grid(am ~ cyl)
  
  p + facet_grid(am ~ cyl) + mtcar_theme
  
  # Inbuilt Theme
  
  p + facet_grid(am ~ cyl) + theme_classic()
  
  p + facet_grid(am ~ cyl) + theme_linedraw()
  
  p + facet_grid(am ~ cyl) + theme_bw()
  
  p + facet_grid(am ~ cyl) + theme_dark()
  
  p + facet_grid(am ~ cyl) + theme_light()
  
  p + facet_grid(am ~ cyl) + theme_gray()












































































































































































































































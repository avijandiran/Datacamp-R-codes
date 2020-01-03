
ctr <- 1

while (ctr<=7){
  
  print(paste("Ctr is set to ",ctr))


ctr <- ctr + 1 

}


#********************************************


# Initialize the speed variable
speed <- 64

# Code the while loop
while ( speed > 30 ) {
  print("Slow down!")
  speed <-  speed - 7
}

# Print out the speed variable
speed


#**********************************88

# Initialize the speed variable
speed <- 64

# Extend/adapt the while loop
while (speed > 30) {
  print(paste("Your speed is",speed))
  if ( speed > 48 ) {
    print("Slow down big time!")
    speed= speed - 11
  } else {
    print("slow down!")
    speed=speed-6
  }
}


#***************************
  
  

  # Initialize the speed variable
  speed <- 88

while (speed > 30) {
  print(paste("Your speed is", speed))
  
  # Break the while loop when speed exceeds 80
  if ( speed > 80 ) {
    
    break;  
  }
  
  if (speed > 48) {
    print("Slow down big time!")
    speed <- speed - 11
  } else {
    print("Slow down!")
    speed <- speed - 6
  }
}


#**********************************
  


  # Initialize i as 1 
  i <- 1
  
  # Code the while loop
  while (i <= 10) {
    print( 3*i)
    if ( (3*i) %% 8==0 ) {
      break;
    }
    i <- i + 1
  }















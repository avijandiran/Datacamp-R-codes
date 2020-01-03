 
  listrds <- list.files(path = "/data/3.Temp/models/", pattern = "*.rds", all.files = TRUE,) # creates the list of all the RDS files in the directory
  i=1
  for (k in 1:length(listrds)){
    ldf <- readRDS(paste0("/data/3.Temp/models/",listrds[k]))
    i=i+1
  }
  
  print(i) 
  
  

library(data.table)
library(bikeshare14)

class(batrips)

#converting the data frame into data.table 

batrips <- as.data.table(batrips)


# using column names to select columns

# j argument accepts a character vector of column names

ans <- batrips[,c("trip_id","duration")]

 head(ans,2)


 batrips_df <- as.data.frame(batrips)
 
 ans <- batrips_df[,"trip_id"]
 
 head(ans,2)
 
 #the result is a vector , not a dataframe
 
 ans <- batrips[,"trip_id"]
 
 head(ans,2)


#column numbers insted of names work just fine
 
 ans <- batrips [,c(2,4)]
 
 head(ans,2)
 

 # the method is bad practice for column numbers 
 # if the order of columns changes , the result is wrong
 
 batrips[,c(2,4)]
 
 # the result is always correct , no matter the order 
 batrips[,c("duration","start_station")]



#Deselecting columns with character vectors
 
 # -c("col1","col2", ........) deselects the specified columns
 # convenience feature only in data.table
 #using ! insted of - works the same way 
 
 
 #select all cols *except* those shown below
 
 ans <- batrips[,c("start_date","end_date","end_station")]
 
 head(ans,1)
 
# Remember how columns were used as if they are variables in i argument in the last chpater ?
 
 #recapthe "i " argument 
 
 #all trips more than an hour
 
 batrips[duration >3600]
 

#similarly you can use a list of variables (column names) to select columns
 
 ans <- batrips[,list(trip_id,dur=duration)]
 
 head(ans,2)

# when selectiong a single column , not wrapping the variable by list() returns a vector 
 
#select a sinle column and return a data.table
 
 ans <- batrips[,list(trip_id)]
 
 head(ans,2)
 
 #selected a single column and return a vector
 
 ans <- batrips[,trip_id]
 
 head(ans,2)

 # .() is an alias to list(), for convenience
 
 #.() is the same as list()
 
 ans <- batrips[,.(trip_id,duration)]
 
 head(ans,2)



 # Select bike_id and trip_id using a character vector
 df_way <- batrips[,c("bike_id","trip_id")]
 df_way

 
 # Select start_station and end_station cols without a character vector
 dt_way <- batrips[,.(start_station,end_station)]
 dt_way
 
 
 # Deselect start_terminal and end_terminal columns
 drop_terminal_cols <- batrips[,-c("start_terminal","end_terminal")]
 drop_terminal_cols
 




































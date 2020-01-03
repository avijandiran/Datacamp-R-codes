
library(data.table)
library(bikeshare14)

class(batrips)

#converting the data frame into data.table 

batrips <- as.data.table(batrips)


#computing on columns

#since columns can be reffered to as variable,you can compute directly on them in j

#compute mean of duration using the data.table way

ans <- batrips[,mean(duration)]

head(ans,2)

#compute mean of duration column using the data.frame way

ans <- mean(batrips[,"duration"])




#computing on rows and columns

#combining i and j straightforward

#compute mean of duration column for "japantown" start station

batrips[start_station == "Japantown" , mean(duration)]



start_station == "Japantown" <-  i

mean(duration) <-  j 

#j is computed on the rows retured by the filtering operation 


# .N can be used in j as well 

#particlarly useful to get the number of rows after filtering in i 


#how many trips started from "japentown"?

batrips[start_station =="Japantown", .N]



#compare this to the data.frame way

nrow(batrips[batrips$start_station == "Japantown",])



# Calculate median duration using the j argument
median_duration <- batrips[,median(duration)]
median_duration


# Get median duration after filtering
median_duration_filter <- batrips[end_station == "Market at 10th" & subscription_type == "Subscriber" , median(duration)]
median_duration_filter



# You will use the difftime() function in this exercise to calculate
# the difference in minutes between the trips. difftime() needs
# two required arguments, time1 and time2 to calculate the 
# difference (time1 - time2). To calculate the difference in 
# minutes, set the units argument to "min":


date1 <- "2018-12-20 11:30:00 EST"
date2 <- "2018-12-20 11:20:00 EST"
difftime(date1, date2, units = "min")

#Time difference of 10 mins



# Compute duration of all trips
trip_duration <- batrips[, difftime(end_date,start_date , units="min")]
head(trip_duration)



#multiple computations in j


#recall that you can select multiple columns using .()

ans <- batrips[,.(trip_id, dur= duration)]

head(ans,2)


#you can compute on multiple columns and return a data.table the same way 


batrips[, .(mn_dur=mean(duration),
            med_dur= median(duration))]





# how would you perform this operation using the data frame way ?

#get mean and median of suration

batrips[, . (mn_dur = mean(duration, med_dur = median(duration)))]






#combining with i
#together with i , you can compute on columns in j only for those rows that satisfy a conditon 

batrips[start_station == "Japantown" , .(mn_dur = mean(duration),
                                         med_dur=median(duration))]




# Calculate the average duration as mean_durn
mean_duration <- batrips[,.(mean_durn = mean(duration))]
mean_duration



# Get the min and max duration values
min_max_duration <- batrips[, .(min(duration),max(duration))]
min_max_duration


# Calculate the average duration and the date of the last ride
other_stats <- batrips[, .(mean_duration= mean(duration) , last_ride = max(end_date)) ]
other_stats



duration_stats <- batrips[start_station == "Townsend at 7th" & duration < 500, 
                          .(min_dur = min(duration), 
                            max_dur = max(duration))]
duration_stats



# Plot the histogram of duration based on conditions
batrips[start_station == "Townsend at 7th" & duration < 500, hist(duration)]
















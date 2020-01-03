#************* dplyr package

library(dplyr)
library(hflights)

head(hflights)
tail(hflights)
summary(hflights)
str(hflights)


hflights <- tbl_df(hflights)

class(hflights)

dplyr::glimpse(hflights)

#**************************** select *******************
  
# pick variables by their name  

tbl <- select(hflights,hflights$ActualElapsedTime,hflights$AirTime,hflights$ArrDelay,hflights$DepDelay)  
  
  
  
tb1 <- select(hflights,ActualElapsedTime,AirTime,ArrDelay,DepDelay)   #  using select 
  

tb2 <- hflights[,c("ActualElapsedTime","AirTime","ArrDelay","DepDelay")]  # old method 
  
tb2


select(hflights,ends_with("num"))

select(hflights,starts_with("cancel"))

select (hflights,UniqueCarrier,ends_with("num"),starts_with("cancel"))




#***********************filter ****************************

# pick observation by their values

filter(hflights,Cancelled==1)


long_flights <- filter(hflights , Distance >=3000)


long_journey <- filter(hflights,TaxiIn < TaxiOut > AirTime)


All_day_jpurney <- filter(hflights, DepTime <500 | ArrTime >2200)



early_flight <-  filter(hflights ,DepDelay > 0 , ArrDelay <0)



cancelled_Day <- filter(hflights, Cancelled ==1 , DepDelay >0)

glimpse(cancelled_Day)

w <- filter(hflights,DayOfWeek == 6 | DayOfWeek == 7 ,Distance >1000, TaxiIn + TaxiOut < 15)

y <- filter(hflights ,DayOfWeek %in% c(6,7),Distance >1000,TaxiIn + TaxiOut < 15)

#***********************arrange ****************************
  
#reorder rows  
  

arrange(hflights,DepDelay)


dtc <- filter(hflights , Cancelled ==1 , !is.na(DepDelay)) # Delay not equal to NA

View(dtc)

d <- arrange (dtc ,DepDelay)

c <- arrange(dtc,CancellationCode)


e <- arrange(dtc, UniqueCarrier, DepDelay)

desc_flight <- arrange (dtc ,desc(DepDelay))
  

#*********************** mutate ****************************
  

# create new variable from existing variable



g2 <- mutate(hflights,loss=ArrDelay - DepDelay)

g1 <- mutate(hflights,ActualGroundTime = ActualElapsedTime -AirTime)


#***********************summarize ****************************
  
# collapse many values down to a single summary


summarise(hflights , max_dist = max(Distance),min_dist=min (Distance))




div <- filter (hflights ,hflights$Diverted ==1 )

summarise(div, max_div = max(Distance))

summarise(filter(hflights, hflights$Diverted == 1), max_div = max(Distance))


















































































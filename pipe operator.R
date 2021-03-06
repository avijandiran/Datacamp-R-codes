library(magrittr)
library(dplyr)        


#*************** dplyr **********************
select (hflights ,TailNum)

select(filter(hflights, DepDelay >240))

select(filter(hflights, DepDelay >240),TailNum)


arrange(hflights , TaxiIn + TaxiOut)

hf_Taxing <-  mutate(hflights,TaxingTime = TaxiIn + TaxiOut)


hf_Taxing <-  arrange(hf_Taxing,TaxingTime)





 # filter , mutate , arrange , select 


hflight_fill <- filter(hflights,DepDelay >240)

nrow(hflight_fill)

ncol(hflight_fill)


hflight_fil_mut <- mutate(hflight_fill,TaxingTime=TaxiIn + TaxiOut)


nrow(hflight_fil_mut)

ncol(hflight_fil_mut)



hflight_fil_mut_arr <- arrange(hflight_fil_mut,TaxingTime)

nrow(hflight_fil_mut_arr)

ncol(hflight_fil_mut_arr)

hflight_fil_mut_arr_sel <- select (hflight_fil_mut_arr, TailNum)

nrow(hflight_fil_mut_arr_sel)

ncol(hflight_fil_mut_arr_sel)

#************************   pipe operator ****************


#This operator allows you to pipe the output from one function to 
#the input of another function. Instead of nesting functions
#(reading from the inside to the outside), the idea of of piping
#is to read the functions from left to right.

#object %>% FUN(arg1, arg2, arg3 ,~)

a1 <- select(a,x,y,z)
a2 <- filter(a1,x>y)
a3 <- mutate(a2,q=x+y+z)
a4 <- summarise(a3,all=sum(q))


summarise(mutate(filter(select(a,x,y,z),x>y ),q=x+y+z),all=sum(q))

a%>% 
  select(x,y,x)%>%
  filter(x>y) %>%
  mutate(q=x+y+z) %>%
  summarise(all=sum(q))


hflights %>%
  filter(DepDelay >240) %>%
  mutate(TaxingTime =TailNum) %>%
  arrange(TaxingTime) %>%
  select(TailNum)


# Take the hflights data set and then ...
# Add a variable named diff that is the result of subtracting TaxiIn from TaxiOut, and then ...
# Pick all of the rows whose diff value does not equal NA, and then ...
# Summarise the data set with a value named avg that is the mean diff value.


hflights %>%
  mutate(diff = TaxiIn - TaxiOut) %>%
  filter(!is.na(diff)) %>%
  summarise((avg=mean(diff)))

  

hflights %>%
  mutate(RealTime= ActualElapsedTime + 100 , mph = Distance / RealTime * 60) %>%
  filter(!is.na (mph < 70)) %>%
  summarise( n_less=n() ,
             n_dest=n_distinct(Dest),
             min_dist =min(Distance),
             max_dist= max(Distance))

#********************** group_by ************************************


#allows for group operations in te split -apply-combine concept


group_by(df,Group)
  df %>%
    group_by((Group))

  # group_by() takes an existing tbl and converts it into 
  #a grouped tbl where operations are performed "by group".
  
  # Make an ordered per-carrier summary of hflights

  hflights %>%
    group_by(UniqueCarrier) %>%
    summarise(p_canc = mean(Cancelled == 1)*100,
    avg_delay = mean(ArrDelay,na.rm = TRUE))%>%
    arrange(avg_delay, p_canc)

  # summary of hflights without per carrier
  
  hflights %>%
    summarise(p_canc = mean(Cancelled == 1)*100,
    avg_delay = mean(ArrDelay,na.rm = TRUE))%>%
    arrange(avg_delay, p_canc)



  # Ordered overview of average arrival delays per carrier
  
  # mutate() uses the rank() function, that calculates
  #within-group rankings.
  
  # rank() takes a group of values and calculates the rank of each value within the group,
  
  hflights %>%
    filter(!is.na(ArrDelay), ArrDelay>0) %>%
    group_by(UniqueCarrier) %>%
    summarise (avg = mean(ArrDelay))%>%
    mutate(rank = rank(avg)) %>%
    arrange(rank)

#******************************* Date  *************************

#Advance Date zoo and forecast packages 
  
today <- Sys.Date()
  
class(today)  

as.Date("2017-01-09")


character_date <- "1992-01-25"

class(character_date)

anuBday <- as.Date(character_date)


class(anuBday)

as.Date("01/28/2017", format= "%m/%d/%Y")


as.Date("September 15, 2008", format = "%B %d, %Y")

dates <- as.Date(c("2017-01-02", "2017-05-03", "2017-08-04", "2017-10-17"))

dates

months(dates)

weekdays(dates)

quarters(dates)








































library(data.table)

DT[i , j , by]

# i <-  on which rows ?
#   j <- what to do?
#   by <- grouped by what?



x_dt <- data.table(id=1:2,name=c("a","b")) # pass vectors of same length to the data table function

x_dt

class(x_dt)


x_df <- data.frame(id=1:2,name=c("a","b"))

x_df

class(x_df)


#conversion to data.table

dt1 <- as.data.table(iris)

class(iris)

class(dt1)

#data.table is also data frame. one can use all the functions from data frame in data table

nrow(x_dt)

ncol(x_dt)

dim(x_dt)


# unless the data frame , the data table doesnt convert the character
#into factor thus preventing buys by avaoiding unexpected behaviour


class(x_df$name)

class(x_dt$name)


#data.table never sets , needs or useds row names

rownames(x_dt) <- c("R1","R2")

x_dt


# Load data.table
library(data.table)

# Create the data.table X 
X <- data.table(id = c("a", "b", "c"),value = c(0.5, 1.0, 1.5))

# View X
X


library(bikeshare14)

#batrips dataset



# Get number of columns in batrips
col_number <-ncol(batrips)


# Print the first 8 rows
head(batrips, n=8)


# Print the last 8 rows
tail(batrips, n=8)


# Print the structure of batrips
str(batrips)


#filtering rows in a data.table


#subset 3rd and 4th rows from batrips

batrips[3:4]

#same as 

batrips[3:4,]


#subset everything except first five rows

batrips[-(1:5)]

#same as

batrips[!(1:5)]


#.N is an integer value that contais the number of rows in the data.table


#useful alternative to nrow(x) in i

nrow(batrips)

batrips[326339]

batrips[n]

#returns the last row 

batrips[.N]

#returns all but the last 10 rows 

ans <- batrips[1:(.N-10)]

nrows(ans)


#subset rows where subscription_type is "subscriber"

batrips[subscription_type=="Subscriber"]

#If batrips was only a data frame

batrips[batrips$subscription_type == "Scubscriber",]

#subset rows where start_terminal=58 and end_terminal is not 65 

batrips[start_terminal == 58 & end_terminal != 65]

#if batrips was only a data frame

batrips[batrips$start_terminal == 58 & batrips$end_terminal != 65]



#optimized using secondary indices for speed automatically

set.seed(11)

datat <- data.table(x= sample(10000,10e6,TRUE),
                 y=sample(letters,1e6,TRUE))

indices(datat)


#0.207s on first run
#(time to create index + subset)

system.time(datat[x==900])

indices(datat)


#0.002s on subsquent runs
#(instant subset using index)

system.time(datat[x==900])




# Filter third row
row_3 <- batrips[start_date]
row_3


# Filter rows 10 through 20
rows_10_20 <- batrips[10:20,]
rows_10_20



# Filter the 1st, 6th and 10th rows
rows_1_6_10 <- batrips[c(1,6,10)]
rows_1_6_10


#Filtering rows using negative integers

# Select all rows except the first two
not_first_two <- batrips[-(1:2)]
not_first_two




# Select all rows except 1 through 5 and 10 through 15
exclude_some <- batrips[-c(1:5, 10:15)]
exclude_some




# Select all rows except the first and last
not_first_last <- batrips[-c(1,nrow(batrips))]
not_first_last

# Select all rows except the first and last
not_first_last <- batrips[-c(1,.N(batrips))]
not_first_last



# Filter all rows where start_station is "MLK Library"
trips_mlk <- batrips[start_station == "MLK Library"]
trips_mlk




# Filter all rows where start_station is "MLK Library" AND duration > 1600
trips_mlk_1600 <- batrips[start_station == "MLK Library"  & duration > 1600]
trips_mlk_1600


# Filter all rows where `subscription_type` is not `"Subscriber"`
customers <- batrips[subscription_type !="Subscriber"]
customers


# Filter all rows where start_station is "Ryland Park" AND subscription_type is not "Customer"
ryland_park_subscribers <- batrips[start_station == "Ryland Park"& subscription_type !="Customer"]
ryland_park_subscribers
































library(data.table)
library(bikeshare14)

class(batrips)

#converting the data frame into data.table 

batrips <- as.data.table(batrips)

#helpers for filtering 

# %like% allows you to search for a pattern in a character or a factor vector 
#usage : col %like% pattern 

#subset all rows where start_station starts with San Francisco


batrips[start_station %like% "San Francisco"]

batrips[end_station %like% "Beale at Market" ]


#instead of 

batrips[grepl("San Francisco", start_station)]


#  %between% allows you to search for values in the closed interval [val1,val2]
# usage: numeric_col %between% c(val1, val2)

batrips[duration %between% c(2000,3000)]

#instead of 

batrips[duration >=2000 & duration <=3000]



#  %chin%  is similar to %in% , but it is much faster and only for character vectors
# usage: character_col %chin% c("val1","val2","val3")


#subset all rows where start_station is "Japantown", "Mezes Park" ,"MLK Library"

batrips[start_station %chin% c("Japantown", "Mezes Park" ,"MLK Library")]


batrips[start_station %in% c("Japantown", "Mezes Park" ,"MLK Library")]



# Filter all rows where end_station contains "Market"
any_markets <- batrips[end_station %like% "Market"]
any_markets

x <- c("aaba", "aaba", "baca")

# Search for "aa" anywhere in the string
x %like% "aa"
#[1]  TRUE  TRUE FALSE

# Search for "ba" at the end of a string
x %like% "ba$"
#[1]  TRUE  TRUE FALSE


# Filter all rows where end_station ends with "Market" 
end_markets <- batrips[end_station %like% "Market$"]
end_markets


# Filter all rows where trip_id is 588841, 139560, or 139562
filter_trip_ids <- batrips[ c(trip_id) %in% c(588841, 139560,  139562)]
filter_trip_ids


# Filtering with %between% and %chin%
#   Two other functions that can come in handy when filtering rows
#are %between% and %chin%.


# %between% works only on numeric columns and can be used to filter values in the
#closed interval [val1, val2].

# %chin% works only on character columns and is an efficient version of %in%.
#You can use it to look for specific strings in a vector.


# Filter all rows where duration is between [5000, 6000]
duration_5k_6k <- batrips[duration %between% c(5000,6000)]
duration_5k_6k


# Filter all rows with specific start stations
two_stations <- batrips[start_station %chin% c("San Francisco City Hall", "Embarcadero at Sansome")]
two_stations










































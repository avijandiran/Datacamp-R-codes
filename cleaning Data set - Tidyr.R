
library(tidyr)


gather(wide_df,my_key,my_val,-col) #-> gather columns into key_value pairs


spread(long_day,my_key,my_val) # -> spread key-value pairs into columns


separate(treatments,year_mo,c("year","month"))  #-> separate one column into multiple


unite(treatments,year_mo,year,month)  #->unite multiple columns into one


# Apply gather() to bmi and save the result as bmi_long
bmi_long <- gather(bmi, year, bmi_val, -Country)

# View the first 20 rows of the result
dim(bmi_long , n=20)


# Apply spread() to bmi_long
bmi_wide <- spread(bmi_long, year, bmi_val)

# View the head of bmi_wide
head(bmi_wide)



# Apply separate() to bmi_cc
bmi_cc_clean <- separate(bmi_cc, col = Country_ISO, into = c("Country","ISO"), sep = "/")

# Print the head of the result
head(bmi_cc_clean)


# Apply unite() to bmi_cc_clean
bmi_cc <- unite(bmi_cc_clean, Country_ISO, Country, ISO, sep = "-")

# View the head of the result
head(bmi_cc)



# View the head of census
head(census)

# Gather the month columns
census2 <- gather(census, month, amount, -YEAR)

# Arrange rows by YEAR using dplyr's arrange
census2_arr <- arrange(census2, YEAR)

# View first 20 rows of census2_arr
head(census2_arr, 20)

head(pets)

spread(pets, type, num)

# View first 50 rows of census_long
head(census_long,n=50)

# Spread the type column
census_long2 <- spread(census_long,type,amount)

# View first 20 rows of census_long2
head(census_long2, n=20)


# Multiple values are stored in one column
# It's also fairly common that you will find two variables stored in a single column of data.
# These variables may be joined by a separator like a dash, underscore, space, or forward slash.
# 
# The separate() function comes in handy in these situations. To practice using it, we have created a slight modification of 
# last exercise's result. Keep in mind that the into argument, 
# which specifies the names of the 2 new columns being formed, must be given as a character vector (e.g. c("column1", "column2")).


# View the head of census_long3
head(census_long3)

# Separate the yr_month column into two
census_long4 <-  separate(census_long3,yr_month,into=c("year","month"))

# View the first 6 rows of the result
head(census_long4 , n=6)

# Load the tidyr package
library(tidyr)

# Gather the columns
weather2 <- gather(weather, from=c(X1: X31), day, value, na.rm = TRUE)

# View the head
head(weather2)


# First remove column of row names
without_x <- weather2[, -1]

# Spread the data
weather3 <- spread(without_x,measure,value)

# View the head
head(weather3)



# Load the stringr and lubridate packages
library(stringr)
library(lubridate)

# Remove X's from day column
weather3$day <- str_replace(weather3$day, "X", "")

# Unite the year, month, and day columns
weather4 <- unite(weather3, date, year, month, day, sep = "-")

# Convert date column to proper date format using lubridates's ymd()
weather4$date <- ymd(weather4$date)

# Rearrange columns using dplyr's select()
weather5 <- select(weather4, date, Events, CloudCover:WindDirDegrees)

# View the head of weather5
head(weather5)

# View the structure of weather5
str(weather5)

# Examine the first 20 rows of weather5. Are most of the characters numeric?
head(weather5, 20)

# See what happens if we try to convert PrecipitationIn to numeric
as.numeric(weather5$PrecipitationIn)


# Count missing values
sum(is.na(weather6))

# Find missing values
summary(weather6)

# Find indices of NAs in Max.Gust.SpeedMPH
ind <- which(is.na(weather6$Max.Gust.SpeedMPH))

# Look at the full rows for records missing Max.Gust.SpeedMPH
weather6[ind, ]


# Review distributions for all variables
summary(weather6)

# Find row with Max.Humidity of 1000
ind <- which(weather6$Max.Humidity == 1000)

# Look at the data for that day
weather6[ind, ]

# Change 1000 to 100
weather6$Max.Humidity[ind] <- 100



# Look at summary of Mean.VisibilityMiles
summary(weather6$Mean.VisibilityMiles)

# Get index of row with -1 value
ind <- which(weather6$Mean.VisibilityMiles == -1)

# Look at full row
weather6[ind, ]

# Set Mean.VisibilityMiles to the appropriate value
weather6$Mean.VisibilityMiles[ind] <- 10


# Review summary of full data once more
summary(weather6)

# Look at histogram for MeanDew.PointF
hist(weather6$MeanDew.PointF)

# Look at histogram for Min.TemperatureF
hist(weather6$Min.TemperatureF)

# Compare to histogram for Mean.TemperatureF
hist(weather6$Mean.TemperatureF)



# Clean up column names
names(weather6) <- new_colnames

# Replace empty cells in events column
weather6$events[weather6$events == ""] <- "None"

# Print the first 6 rows of weather6
head(weather6)






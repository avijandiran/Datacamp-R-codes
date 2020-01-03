library(stringr)

str_trim("  this is a test    ")

str_pad("24493",width=7,side="left",pad="0")

str_pad("24493",width=10,side="right",pad="0")



friends <- c("Sarah","Tom","Alice")

str_detect(friends,"Alice")

str_replace(friends,"Alice","David")

# Load the stringr package
library(stringr)

# Trim all leading and trailing whitespace
str_trim(c("   Filip ", "Nick  ", " Jonathan"))

# Pad these strings with leading zeros
str_pad(c("23485W", "8823453Q", "994Z"),width=9,side="left",pad="0")


# R thanks to toupper() and tolower()

# Print state abbreviations
states

# Make states all uppercase and save result to states_upper
states_upper<- toupper(states)

# Make states_upper all lowercase again
tolower(states_upper)



# Copy of students2: students3
students3 <- students2

# Look at the head of students3
head(students3)

# Detect all dates of birth (dob) in 1997
str_detect(students3$dob,"1997")

# In the sex column, replace "F" with "Female" ...
students3$sex <- str_replace(students3$sex,"F","Female")

# ... and "M" with "Male"
students3$sex <- str_replace(students3$sex,"M","Male")

# View the head of students3
head(students3)


# Replace "T" with "0" (T = trace)
weather5$PrecipitationIn <-str_replace(weather5$PrecipitationIn , "T" ,"0") 

# Convert characters to numerics
weather6 <- mutate_at(weather5, vars(CloudCover:WindDirDegrees), funs(as.numeric))

# Look at result
str(weather6)

























































































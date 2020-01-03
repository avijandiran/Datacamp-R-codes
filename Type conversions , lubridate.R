#Type conversions

as.character(2017)

as.numeric(TRUE)

as.integer(99)

as.factor("somethings")

as.logical(0)


library(lubridate)


ymd("2017-08-25")


ymd("2015 August 25")


mdy("August 25, 2017")

hms("13:33:09")

ymd_hms("2015/08/25 13:33:09")



# Make this evaluate to "character"
class("TRUE")

# Make this evaluate to "numeric"
class(8484.00)

# Make this evaluate to "integer"
class(99L)

# Make this evaluate to "factor"
class(factor("factor"))

# Make this evaluate to "logical"
class(FALSE)

# Preview students with str()
str(students)

# Coerce Grades to character
students$Grades <- as.character(students$Grades)

# Coerce Medu to factor
students$Medu <- as.factor(students$Medu)

# Coerce Fedu to factor
students$Fedu <- as.factor(students$Fedu)

# Look at students once more with str()
str(students)



# Preview students2 with str()
str(students2)

# Load the lubridate package
library(lubridate)

# Parse as date
dmy("17 Sep 2015") 

# Parse as date and time (with no seconds!)

mdy_hm("July 15, 2012 12:56")

# Coerce dob to a date (with no time)
students2$dob <- ymd(students2$dob)

# Coerce nurse_visit to a date and time
students2$nurse_visit <- ymd_hms(students2$nurse_visit)

# Look at students2 once more with str()
str(students2)














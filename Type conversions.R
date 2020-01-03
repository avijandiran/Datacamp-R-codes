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

















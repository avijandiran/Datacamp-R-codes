grepl() # ^a= beginig of the word has a  , a$= ending of the word has a 


?regex

grep()


sub()  # replacement for the argument only mathes the 1st argument 


gsub() #  it replaces all the argument even it repeats 



# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for "edu"

grepl(pattern='edu',x=emails)

# Use grep() to match for "edu", save result to hits
hits = grep(pattern="edu",x=emails)

# Subset emails using hits

emails[hits]

#--------------------

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly

grepl(pattern="@.*\\.edu$" , emails)

# Use grep() to match for .edu addresses more robustly, save result to hits

hits = grep(pattern= "@.*\\.edu$", emails)
# Subset emails using hits

emails[hits]

#--------------------------

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "global@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use sub() to convert the email domains to datacamp.edu

sub(pattern="@.*\\.edu$", replacement= "@datacamp.edu",x=emails)



























































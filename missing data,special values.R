
#special values

# inf-infinite value
# 1/0
# 1/0+1/0
# 333333^33333
# NAN-not a number
# 0/0
# 1/0-1/0

df <- data.frame(A=c(1,NA,8,NA),
                 B=c(3,NA,88,23),
                 C=c(2,45,3,1))


#check for NAs

is.na(df)

class(df)

# Are there any NAs?

any(is.na(df))

#count number of NAs

sum(is.na(df))


summary(df)


#find rows with no missing values returns vector

complete.cases(df)

#subset data,keeping only completed cased
df[complete.cases(df),]

#another way to remove rows with NAs 
na.omit(df)



# Call is.na() on the full social_df to spot all NAs
is.na(social_df)

# Use the any() function to ask whether there are any NAs in the data
any(is.na(social_df))

# View a summary() of the dataset
summary(social_df)

# Call table() on the status column

table(social_df$status)


# Replace all empty strings in status with NA
social_df$status[social_df$status == ""] <- NA

# Print social_df to the console
social_df

# Use complete.cases() to see which rows have no missing values
complete.cases(social_df)

# Use na.omit() to remove all rows with any missing values
na.omit(social_df)


 
#outliers
#simulate some data

set.seed(10)

x <- c(rnorm(30,mean=15,sd=5),-5,28,35)

#view a boxplot

boxplot(x,horizontal = TRUE)



df2 <- data.frame(A=rnorm(100,50,10),
                 B=c( rnorm(99,50,10),500),
                  C=c(rnorm(99,50,10),-1))
df2

summary(df2)


hist(df2$B,breaks=20)

boxplot(df2)


#summary() & hist() is best to find the outliers

# Look at a summary() of students3
summary(students3)

# View a histogram of the age variable
hist(students3$age,breaks=20)

# View a histogram of the absences variable
hist(students3$absences , breaks=20)

# View a histogram of absences, but force zeros to be bucketed to the right of zero
hist(students3$absences,right=FALSE)


# View a boxplot of age
boxplot(students3$age)

# View a boxplot of absences
boxplot(students3$absences)
























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













































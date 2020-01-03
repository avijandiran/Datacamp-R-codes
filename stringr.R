
library(stringr)

"hi!"

'I said "hi!" '

 "I said \"hi!\" " # \ \ describes an escape sequence
 
 " I'd say \"hi!\""



#Line 1: The table was a large one, but the three were all crowded together at one corner of it:
#Line 2: "No room! No room!" they cried out when they saw Alice coming.
#Line 3:"There's plenty of room!" said Alice indignantly, and she sat down in a large arm-chair at one end of the table.

 # Define line1
 line1 <- "The table was a large one, but the three were all crowded together at one corner of it:"
 
 # Define line2
 line2 <- '"No room! No room!" they cried out when they saw Alice coming.' 
 
 # Define line3
 line3 <- "\"There's plenty of room!\" said Alice indignantly, and she sat down in a large arm-chair at one end of the table."


 # Putting lines in a vector
 lines <- c(line1, line2, line3)
 
 # Print lines
 print(lines)
 
 # Use writeLines() on lines
 writeLines(lines)
 
 # Write lines with a space separator
 writeLines(lines, sep=" ")
 
 #\" is used to denote a double quote.
 #\n gives a newline
 #\U followed by up to 8 hex digits sequence denotes a particular Unicode character.
 
 #\U1F30D  globe 
 
 #\u If you only need four digits for the codepoint, an alternative escape sequence is \u
 
 #\\ backslash
 
 #\ escape sequence
 
 # Should display: To have a \ you need \\
 writeLines("To have a \\ you need \\\\")
 
 # Should display: 
 # This is a really 
 # really really 
 # long string
 writeLines("This is a really \n really really \n long string")
 
 # Use writeLines() with 
 # "\u0928\u092e\u0938\u094d\u0924\u0947 \u0926\u0941\u0928\u093f\u092f\u093e"
 
 writeLines("\u0928\u092e\u0938\u094d\u0924\u0947 \u0926\u0941\u0928\u093f\u092f\u093e")
 
 
 
x <- c(19890000000000000000000000000000000000000000000000,0.0000000000000008)


format(x,scientific = TRUE)


format(x,scientific = FALSE)



formatC(x,format="f")


formatC(x,format="e") # e for scientific

formatC(x,format="g") # g for scientific only for saving space

# Some vectors of numbers
percent_change <- c(4, -1.91, 3.00, -5.002)
income <- c(72.19, 1030.18, 10291.93, 1189192.18)
p_values <- c(0.12, 0.98, 0.0000191, 0.00000000002)

# Format c(0.0011, 0.011, 1) with digits = 1
format(c(0.0011, 0.011, 1), digits = 1)

# Format c(1.0011, 2.011, 1) with digits = 1
format(c(1.0011, 2.011, 1), digits = 1)

# Format percent_change to one place after the decimal point
format(percent_change, digits = 2)

# Format income to whole numbers
format(income, digits = 2)

# Format p_values in fixed format
format(p_values, scientific = FALSE)



formatted_income <- format(income, digits = 2)

# Print formatted_income
print(formatted_income)

# Call writeLines() on the formatted income
writeLines(formatted_income)

# Define trimmed_income

trimmed_income<-format(income , digits=2 , trim=TRUE)

# Call writeLines() on the trimmed_income

writeLines(trimmed_income)

# Define pretty_income
pretty_income<- format(income , digits=2 , big.mark=",")

# Call writeLines() on the pretty_income
writeLines(pretty_income)


# From the format() exercise
x <- c(0.0011, 0.011, 1)
y <- c(1.0011, 2.011, 1)

# formatC() on x with format = "f", digits = 1
formatC(x, format = "f", digits = 1)

# formatC() on y with format = "f", digits = 1
formatC(y, format = "f", digits = 1)

# Format percent_change to one place after the decimal point
formatC(percent_change, format = "f", digits = 1)

# percent_change with flag = "+"
formatC(percent_change, format = "f", digits = 1, flag = "+")

# Format p_values using format = "g" and digits = 2
formatC(p_values, format = "g", digits = 2)


















































































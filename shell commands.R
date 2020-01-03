# pwd <-  print working directory 

# ls <-  listing 

#The shell decides if a path is absolute or relative by looking at its first character:
#If it begins with /, it is absolute. If it does not begin with /, it is relative.

# ls course.txt

# cd <-  change directory 

#More often, though, you will take advantage of the fact that the special path .. 
#(two dots with no spaces) means "the directory above the one I'm currently in". 

#If you are in /home/repl/seasonal, then cd .. moves you up to /home/repl. If you use cd .. once again, it puts you in /home. 
#One more cd .. puts you in the root directory /, which is the very top of the filesystem. (Remember to put a space between cd and .. 
#- it is a command and a path, not a single four-letter command.)

#cd ~ will always take you home.

#cp <-  copy files

#mv to move files

# remove files

#mv to rename files

# rmdir remove directory it works only if no files in that directory 

#mkdir make new directory

#The original command for doing this was called more, but it has been superseded by a more powerful command called less. 
#(This kind of naming is what passes for humor in the Unix world.) When you less a file, one page is displayed at a time;
#you can press spacebar to page down or type q to quit.

#If you give less the names of several files, you can type :n (colon and a lower-case 'n') to move to the next file, 
#:p to go back to the previous one, or :q to quit.


# One of the shell's power tools is tab completion. If you start typing the name of a file and then press the tab key, 
# the shell will do its best to auto-complete the path. For example, if you type sea and press tab, it will fill in the 
# directory name seasonal/ (with a trailing slash). 
# If you then type a and tab, it will complete the path as seasonal/autumn.csv.



# head will only display the first three lines of the file. If you run head -n 100, it will display the first 100 
#(assuming there are that many), and so on.
# A flag's name usually indicates its purpose (for example, -n is meant to signal "number of lines").
#Command flags don't have to be a - followed by a single letter,
# but it's a widely-used convention.
#head -n 3 seasonal/summer.csv


# In order to see everything underneath a directory, no matter how deeply nested it is, you can give ls the flag -R (which means "recursive"). 
# If you use ls -R in your home directory, you will see something like this:
#ls -R -F

  
  

#To find out what commands do, people used to use the man command (short for "manual"). 
#For example, the command man head brings up this information:
# man tail
# tail -n +7 seasonal/spring.csv



# head and tail let you select rows from a text file. If you want to select columns, you can use the command cut. It has several options (use man cut to explore them), but the most common is something like:
#   
#   cut -f 2-5,8 -d , values.csv
# 
# which means "select columns 2 through 5 and columns 8, using comma as the separator". cut uses -f (meaning "fields") to specify columns and -d (meaning "delimiter") to specify the separator. You need to specify the latter because some files may use spaces, tabs, or colons to separate columns.




# How can I select lines containing specific values?
#   head and tail select rows, cut selects columns, and grep selects lines according to what they contain. In its simplest form, grep takes a piece of text followed by one or more filenames and prints all of the lines in those files that contain that text. For example, grep bicuspid seasonal/winter.csv prints lines from winter.csv that contain "bicuspid".
# 
# grep can search for patterns as well; we will explore those in the next course. What's more important right now is some of grep's more common flags:
#   
#   -c: print a count of matching lines rather than the lines themselves
# -h: do not print the names of files when searching multiple files
# -i: ignore case (e.g., treat "Regression" and "regression" as matches)
# -l: print the names of files that contain matches, not the matches
# -n: print line numbers for matching lines
# -v: invert the match, i.e., only show lines that don't match




#The command wc (short for "word count") prints the number of characters, words, and lines in a file. 
#You can make it print only one of these using -c, -w, or -l respectively.

#grep 2017-07 seasonal/spring.csv | wc -l


#How can I specify many files at once?

#To make your life better, the shell allows you to use wildcards to specify a list of files with a single expression. The most common wildcard is *, which means "match zero or more characters". 
#Using it, we can shorten the cut command above to this:

#cut -d , -f 1 seasonal/*
#cut -d , -f 1 seasonal/*.csv


# What other wildcards can I use?
#   The shell has other wildcards as well, though they are less commonly used:
#   
#   ? matches a single character, so 201?.txt will match 2017.txt or 2018.txt, but not 2017-01.txt.
# [...] matches any one of the characters inside the square brackets, so 201[78].txt matches 2017.txt or 2018.txt, but not 2016.txt.
# {...} matches any of the comma-separated patterns inside the curly brackets, so {*.txt, *.csv} matches any file whose name ends 
#with .txt or .csv, but not files whose names end with .pdf.



# How can I sort lines of text?
#   As its name suggests, sort puts data in order. 
# By default it does this in ascending alphabetical order, but the flags -n and -r can be used to sort numerically and 
# reverse the order of its output, while -b tells it to ignore leading blanks and -f tells it to fold case (i.e., be case-insensitive).
# Pipelines often use grep to get rid of unwanted records and then sort to put the remaining records in order.
# 
# 
# Remember the combination of cut and grep to select all the tooth names from column 2 of seasonal/summer.csv?
#   
#   cut -d , -f 2 seasonal/summer.csv | grep -v Tooth

#Starting from this recipe, sort the names of the teeth in seasonal/winter.csv (not summer.csv) in descending alphabetical order. 
#To do this, extend the pipeline with a sort step.
#cut -d , -f 2 seasonal/winter.csv | grep -v Tooth | sort -r
  

How can I remove duplicate lines?
  Another command that is often used with sort is uniq, whose job is to remove duplicated lines. More specifically, it removes adjacent duplicated lines. If a file contains:






















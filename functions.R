args( sd)

args(apply)


mean(abs( linkedin - facebook),na.rm=TRUE) #Mean Absolute Deviation

library(base)

library(ggvis)



abs() #calc the absolute value of numeric value 

round() # rounds the inputs

sum() #sum of input arragr

mean() # arithmetic mean 

seq() #genetrate the sequance number 

seq(1,10 ,by=3) # generates 1 to 10 number by 3 

seq(8,2, by= -2)


sum(abs(round(errors)))
    

    # seq(): Generate sequences, by specifying the from, to, and by arguments.
    # rep(): Replicate elements of vectors and lists.
    # sort(): Sort a vector in ascending order. Works on numerics, but also on character strings and logicals.
    # rev(): Reverse the elements in a data structures for which reversal is defined.
    # str(): Display the structure of any R object.
    # append(): Merge vectors or lists.
    # is.*(): Check for the class of an R object.
    # as.*(): Convert an R object from one class to another.
    # unlist(): Flatten (possibly embedded) lists to produce a vector.


# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec= unlist(linkedin)

fb_vec= unlist(facebook)

# Append fb_vec to li_vec: social_vec

social_vec = append(li_vec,fb_vec)

# Sort social_vec

sort(social_vec, decreasing = TRUE)


# Fix me
rep(seq(1, 7, by = 2), times = 7)

#----------------

# Create first sequence: seq1
seq1 = seq(1,500 , by=3)

# Create second sequence: seq2
seq2= seq( 1200, 900 , by = -7)

# Calculate total sum of the sequences

sum(seq1)+sum(seq2)














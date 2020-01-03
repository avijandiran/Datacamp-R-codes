df1<-data.frame(matrix(rnorm(20), nrow=10)) 


temp = c(5,10,2,3,1,11) #Author DataFlair
temp[c(1,5,6,9)]
temp[2:5]
matrix(temp, nrow = 2)


quadX <- c(16.92, 24.03, 7.61, 15.49, 11.77)    #DataFlair
quadY <- c(8.37, 12.93, 16.65, 12.2, 13.12)
comb <- cbind(quadX, quadY)
colnames(comb)
rownames(comb) <- LETTERS[1:5]



AA<-matrix(c(1,2,3,1,2,4,1,2,NA,2,5,2,NA,2,5,1),ncol=2)


AAA<-as.data.frame(AA)


i=1;k=0;
for (i in 1:length(AAA$V2)) {
k<-k+if_else(is.na (AA[i,2]),2.5,0)
  print(k)
}

k

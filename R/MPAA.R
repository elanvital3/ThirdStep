#모멘텀 투자

# Data 가져오기 
price <- getData('000720') #xts
price2 <-as.data.frame(price) #data frame
price2 <- na.omit(price2) 
price2$time <- as.POSIXct(row.names(price2))

# MPAA #142
price2$mom_score <- 
  (if_else(price2$rtn20>1,1,0)+
  if_else(price2$rtn40>1,1,0)+
  if_else(price2$rtn60>1,1,0)+
  if_else(price2$rtn80>1,1,0)+
  if_else(price2$rtn100>1,1,0)+
  if_else(price2$rtn120>1,1,0)+
  if_else(price2$rtn140>1,1,0)+
  if_else(price2$rtn160>1,1,0)+
  if_else(price2$rtn180>1,1,0)+
  if_else(price2$rtn200>1,1,0)+
  if_else(price2$rtn220>1,1,0)+
  if_else(price2$rtn240>1,1,0))/12

head(price2[,c("close","rtn1","mom1")])
  
head(price2)
p0=79273.12;

floor(length(price2$mom_score)/20)


i=0;
for (i in 0:floor(length(price2$mom_score)/20)) {
  if(i==1){
    price2$sum[i]<-p0
    price2$st[i]<-p0*price2$mom_score[i]
    price2$cash[i]<-price2$sum[i]-price2$st[i]
  }else{
    price2$sum[i*20+1]<-price2$st[(i-1)*20+1]*price2$rtn1[i*20+1]+price2$cash[(i-1)*20+1]
    price2$st[i*20+1]<-price2$sum[i*20+1]*price2$mom_score[i*20+1]
    price2$cash[i*20+1]<-price2$sum[i*20+1]-price2$st[i*20+1]
  }
}


head(price2[,c("rtn1","close","st","cash","sum","mom_score")])


ggplot()+geom_line(data=price2,aes(x=time,y=sum),color="blue")+
  geom_line(data=price2,aes(x=time,y=close),color="red")



plot(price2$close)
dim(price2)
head(price2)
str(price2)
class(price2)

mtcars
class(mtcars)
names(mtcars)
str(mtcars)
plot(x=mtcars$mpg,y=mtcars$wt)
ggplot(data=mtcars,aes(x=mpg,y=wt))+geom_point()


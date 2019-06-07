install.packages('quantmod')
library(xts)
library(dplyr)
library(quantmod)
library(ggplot2)


######### 주가 가져오기 #########

# 주식함수
getData<-function(x,from,to){
  if(missing (from)){
    stock <- getSymbols(paste(x,".KS",sep=""),auto.assign = F)
  }else if(missing(to)){
    stock <- getSymbols(paste(x,".KS",sep=""),from=from,auto.assign = F)
  }else{
    stock <- getSymbols(paste(x,".KS",sep=""),from=from,to=to,auto.assign = F)}
  stock<-adjustOHLC(stock,use.Adjusted = T)
  stock<-stock[Vo(stock)>0]
  colnames(stock)<-c('open','high','low','close','volume','adjusted')
  stock$rtn1 <- ROC(Cl(stock))+1 
  stock$rtn20 <- ROC(Cl(stock),n=20)+1
  stock$rtn60 <- ROC(Cl(stock),n=60)+1
  stock$rtn120 <- ROC(Cl(stock),n=120)+1
  stock$rtn180 <- ROC(Cl(stock),n=180)+1
  stock$rtn240 <- ROC(Cl(stock),n=240)+1
  stock$mom1 <- momentum(Cl(stock)) 
  stock$mom20 <- momentum(Cl(stock),n=20)
  stock$mom60 <- momentum(Cl(stock),n=60)
  return(stock)
}

  # Data 가져오기 
price <- getData('096770')
price2 <-as.data.frame(price)

momentum(tail(price$close))
tail(price$close)


tail(price2)
price2$buy <- if_else(price2$rtn240-price2$rtn20>0,"Buy","Sell")


length(price2$rtn1)
price2[2,"rtn1"]


rtn_total<-1;k=0
for (i in 1:length(price2$rtn1)) {
  if_else(is.na(price2[i,"rtn1"])==FALSE,
          k<-k+price2[i,"rnt1"],
          k<-k)
}

i=1;k=0

rtn_total<-1;i<-1

for (i in 1:length(price2$rtn1)) {
  rtn_total <- rtn_total + if_else (is.na(price2[i,"rtn1"]) ,1,
                                   if_else(is.na(price2[i,"buy"]),0,
                                           if_else(price2[i,"buy"]=="buy",2,0)))
                                 
print(rtn_total)
}

price2[100,"rtn1"]

summary(price2$buy)
table(is.na(price2$buy))
rtn_total

i=3;
price2[300,"buy"]=="buy"

rtn_total

if_else(is.na(price[3,"rtn1"]),1,0)

k

is.na(price[i,"rtn1"])==T

k
rnt_total

is.na(price2[1,"rtn1"])
i
k<-0;i<0
for (i in 1:10) {
  k<-is.na(price2[i,"rtn1"])
  print(k)
}


is.na(price2[5,"buy"])
names(price2)
k

is.na(price2[3,"rtn1"])

i=1;is.na(price2[i,"rtn1"])


rtn_total


is.na(price2[300,"buy"])
is.na(price2[3,"rtn1"])==F
price2$buy
is.na(price[1,"rtn1"])


rm(aa)
row.names(aa)
str(price)
class(price)

tail(price2)
  # write.table(tail(price,100),"clipboard",sep="\t",row.names = F)

  #graph 그리기 (기본)
  # plot(price$close,type='l',cex.main=1)
  # mtext('종가')
  # abline(h=mean(price$close),col='red')
  # 
  # plot(price$rtn*100,type='l',col='red',main='삼송',cex.main=1)
  # mtext('변동성')

  #graph 그리기 (기본)

chartSeries(price['2019-05-01::2019-05-29'],up.col = 'red',dn.col = 'blue',theme = 'white',name = '삼송')
addMACD()
add_BBands() ## 왜 안되지?
addSMA(10)
addSMA(30,col='blue')

  #to.weekly, to.monthly





######### 종목코드 가져오기 #########
  ###https://kind.krx.co.kr/corpgeneral/corpList.do?method=loadInitPage###

CODE <- read.table(file="clipboard",sep="\t",header=T)
read.table("clipboard",header = T,sep="\t")
read.csv("cc.csv")
dim(CODE)

tail(CODE)


######### 재무제표 가져오기 #########
BS<-(read.csv("~/R/financial-statements/rawdata/096770.csv"))

BS
dim(BS)

BS$DPS.보통주.현금.주식.
names(BS)
ggplot(BS,aes(y=DPS.보통주.현금.주식.,x=구분))+geom_point()+geom_line()

names(BS[c(1,24,25,26)])<-c("year","DPS","배당금"BS[,26])


View(BS)
                            
                            
                          
  
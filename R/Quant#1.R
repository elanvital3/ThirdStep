library(xts)
library(dplyr)
library(quantmod)
library(ggplot2)


setwd("R/")
getwd()


######### 주가 가져오기 #########

# 주식함수 (daily)
getData<-function(x,from,to){
  if(missing (from)){
    stock <- getSymbols(paste(x,".KS",sep=""),auto.assign = F)
  }else if(missing(to)){
    stock <- getSymbols(paste(x,".KS",sep=""),from=from,auto.assign = F)
  }else{
    stock <- getSymbols(paste(x,".KS",sep=""),from=from,to=to,auto.assign = F)}
  stock<-adjustOHLC(stock,use.Adjusted = T) #수정주가반영
  stock<-stock[Vo(stock)>0] #거래량 0 이상
  colnames(stock)<-c('open','high','low','close','volume','adjusted')
  stock$rtn1 <- ROC(Cl(stock))+1 #종가 변화율 
  stock$rtn20 <- ROC(Cl(stock),n=20)+1
  stock$rtn40 <- ROC(Cl(stock),n=40)+1
  stock$rtn60 <- ROC(Cl(stock),n=60)+1
  stock$rtn80 <- ROC(Cl(stock),n=80)+1
  stock$rtn100 <- ROC(Cl(stock),n=100)+1
  stock$rtn120 <- ROC(Cl(stock),n=120)+1
  stock$rtn140 <- ROC(Cl(stock),n=140)+1
  stock$rtn160 <- ROC(Cl(stock),n=160)+1
  stock$rtn180 <- ROC(Cl(stock),n=180)+1
  stock$rtn200 <- ROC(Cl(stock),n=200)+1
  stock$rtn220 <- ROC(Cl(stock),n=220)+1
  stock$rtn240 <- ROC(Cl(stock),n=240)+1
  stock$mom1 <- momentum(Cl(stock),n=1)
  return(stock)
}



  # Data 가져오기 
price <- getData('096770') #xts
price <- getData('096770',period = "monthly") #xts
head(price)
price2 <-as.data.frame(price) #data frame

  


  #graph 그리기 (기본)

chartSeries(price['2019-05-01::2019-05-29'],up.col = 'red',dn.col = 'blue',theme = 'white',name = '삼송')
addMACD()
add_BBands() ## 왜 안되지?
addSMA(10)
addSMA(30,col='blue')

  #to.weekly, to.monthly


######### 종목코드 가져오기 #########
  ###https://kind.krx.co.kr/corpgeneral/corpList.do?method=loadInitPage###
  ### 아마도 퀀트킹에서 추출 ###
CODE <- read.csv(file="CODE.csv",header=T,)
dim((CODE))
length(CODE$CODE)

######### 재무제표 가져오기 #########
  #financial statements grit 에서 가져오기

BS<-NULL
length(CODE$코드.번호)
for (i in 1:length(CODE$코드.번호)) {
  try({
    NBS <- (read.csv(paste("C:/Users/elanv/OneDrive/Documents/financial-statements/rawdata/",substr(CODE[i,"코드.번호"],2,7),".csv",sep="")))
    NBS$CODE<-  substr(CODE[i,"코드.번호"],2,7)
    NBS$COMPANY<-  CODE[i,"회사명"]
    BS <- rbind(BS,NBS)},silent=T)
}
View(CODE)

View(BS)


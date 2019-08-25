library(quantmod)
library(xts)
CODE <- read.csv(file="CODE %>% .csv",header=T,) ; head(CODE);

getwd()

usdkrw_xts <- getSymbols(Symbols="USD/KRW")

usdkrw_xts

plot(usdkrw_xts)

unemp_xts <- getSymbols(Symbols="LRHUTTTTKRA156N", 
                        src = "FRED", 
                        from= "1998-01-01", 
                        to = "2017-05-01", auto.assign = FALSE)
plot(unemp_xts)

a<-getSymbols(Symbols  = "000720.KS")
a
,periodicity = "monthly"

aa<-getSymbols(Symbols="000720.KS",auto.assign = F);aa
bb<-getSymbols(Symbols="000720.KS",
               ,periodicity = "monthly",
               auto.assign = F);bb

head(aa)
View(tail(bb))
View(tail(aa,30))
plot(aa)


pp<-getData("000720");pp
qq<-getSymbols("000720.KS")
qq
head(qq)

plot(qq)

b<-getSymbols("AAPL")
b
plot(b)

getFinancials(Symbol="AAPL", env = parent.frame(), src = "google",)

Defunct

시총 200 개 안에 code 를 뽑아내고
모멘텀 상위 75개로 매수하는 프로그램 짜기
그다음에 가치 투자도 포함해서 해보기


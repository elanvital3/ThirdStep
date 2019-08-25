install.packages("Quandl")
library(Quandl)

quandldata = Quandl("NSE/OIL", collapse="monthly", start_date="2013-01-01", type="ts")
plot(quandldata[,1])

metaData(ts)
Ratios <- yahooQF(c("Price/Sales", 
                    "P/E Ratio", 
                    "Price/EPS Estimate Next Year", 
                    "PEG Ratio", 
                    "Dividend Yield", 
                    "Market Capitalization"))

codes <- c("000720.KS","004170.KS")

CODE
3) 그럼 결합해 볼까요?
  
  FinancialRatio<- getQuote(paste(codes, sep="", collapse=";"), what=Ratios)
  #깔끔하게 보려고 날짜는 제거해줍니다.
  FinancialRatio <- data.frame(Symbol=codes, FinancialRatio[,2:length(FinancialRatio)])
                               
                               
  FinancialRatio
  
  getQuote("AAPL")
  
  
  data <- Quandl.datatable('MER/F1', paginate=TRUE)
data  


mydata = Quandl.datatable("ZACKS/FC", ticker="AAPL")
names(mydata)
View(mydata)
Quandl.api_key("kgvM6gvnkcrtE97Tiyy8")



install.packages("remotes") #github package 설치를 위한 패키지지
install.packages('xaringan')
install.packages('Rcpp')

f.libPaths()  #설치 위치
installed.packages() # 설치된 패키지 확인

library(xaringan)
library(remotes)
library(Rcpp)

xaringan::inf_mr()

#blogdown
if (!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("rstudio/blogdown")

blogdown::install_hugo(force = TRUE)

library(blogdown)

blogdown::new_site()

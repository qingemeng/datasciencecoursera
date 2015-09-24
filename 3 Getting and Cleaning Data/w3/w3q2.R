# NUS package server is down :( so I have to change to another server for the jpeg package
install.packages("jpeg")
library(jpeg)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl, destfile = "jeff.jpg", method = "curl")
img.n<-readJPEG("jeff.jpg",native=TRUE)
class(img.n)
quantile(img.n,probs=c(0.3,0.8))
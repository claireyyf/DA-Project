install.packages("itunesr")
library(itunesr)
data=getReviews(281796108,'us',1)
data
View(data)

orgindata=read.csv("AppleStore")
install.packages("itunesr")
library(itunesr)
data=getReviews(281796108,'us',1)
data
View(data)

orgindata=read.csv("AppleStore.csv")
View(orgindata)

reviews <- data.frame()

df <- data.frame(orgindata)

for (i in df[5811:nrow(df),2]){
  t <- try(getReviews(i, 'us', 1))
  if("try-error" %in% class(t)) print("error")
  else {
    print(i)
    #id <- rep(i, nrow(getReviews(i, 'us', 1)))
    review <- getReviews(i, 'us', 1)
    review <- data.frame(i, review[["Review"]])
    reviews <- rbind(reviews, review)
    #reviews$id  <- rbind(reviews$id, rep(i, nrow(getReviews(i, 'us', 1))))
  }
}

head(reviews)
View(reviews)
write.csv(reviews,'apple_reviews.csv')

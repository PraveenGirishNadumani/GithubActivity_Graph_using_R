library(jsonlite)


# code to get the API payload/response from github API
x <- fromJSON("https://api.github.com/repos/razorpay/razorpay-android-sample-app/stats/commit_activity")
x$days

write.csv(x$days,"testfile.csv")
p <- read.csv("testfile.csv")
p

plot(unlist(p),xlab = "days", ylab = "commits", col = "blue",pch = 19)


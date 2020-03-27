library(jsonlite)


# code to get the API payload/response from github API
x <- fromJSON("https://api.github.com/repos/razorpay/razorpay-android-sample-app/stats/commit_activity")
plot(unlist(x$days))

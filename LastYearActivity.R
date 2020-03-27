library(jsonlite)

# code to get the API payload/response from github API last year activity data.
year <- fromJSON("https://api.github.com/repos/razorpay/razorpay-android-sample-app/stats/commit_activity")
year$days

#writing the data to csv file using write.csv function 
write.csv(year$days,"testfile.csv")
#reading the data from .csv file
yearData <- read.csv("testfile.csv")

#fetching the weekly data for number of addition and deletion from github API
weeklyAddDel <- fromJSON("https://api.github.com/repos/razorpay/razorpay-android-sample-app/stats/code_frequency")

#wrting weekly addition data to the csv file
write.csv(weeklyAddDel[,2],"weeklyAddition.csv")

#writing weekly deletion data to the csv file 
write.csv(weeklyAddDel[,3],"weeklyDeletion.csv")

weeklyAddData <- read.csv("weeklyAddition.csv")
weeklyDelData <- read.csv("weeklyDeletion.csv")

#ploting data for last year activity data 
plot(unlist(yearData),xlab = "Days", ylab = "Commits per day", col = "blue",pch = 19, main = "Last Year Commit Data")

#ploting data for weekly addition and deletion per week
plot(weeklyAddData$X,weeklyAddData$x,xlab = "Number of weeks", ylab = "Number of addition", col = "blue", main = "Number Of Addition Per Week")
plot(weeklyDelData,xlab = "Number of weeks", ylab = "Number of deletion", col = "blue", main = "Number Of Deletion Per Week")


tweets <- read.csv('GitHub/russian-troll-tweets/IRAhandle_tweets_1.csv')

for (i in 2:9) {
  string <- paste0("GitHub/russian-troll-tweets/IRAhandle_tweets_", i, ".csv")
  temp <- read.csv(string)
  tweets <- rbind(tweets, temp)
}

time_stamp <- tweets[['publish_date']]

time_stamp <- as.POSIXct(time_stamp, format="%m/%d/%Y %H:%M", tz="GMT")

hist(time_stamp, breaks="days", freq=TRUE)

#right = data.frame()
#for (i in 1:length(tweets[,1])) {
#  if (tweets["account_type",i] = "Right") {
#    append(right, tweets[i,])
#  }
#}
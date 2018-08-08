tweets <- read.csv('GitHub/russian-troll-tweets/IRAhandle_tweets_1.csv')

for (i in 2:9)
{
  string <- paste0("GitHub/russian-troll-tweets/IRAhandle_tweets_", i, ".csv")
  temp <- read.csv(string)
  tweets <- rbind(tweets, temp)
}

time_stamp <- tweets[['publish_date']]

time_stamp <- as.POSIXct(time_stamp, format="%m/%d/%Y %H:%M", tz="GMT")

hist(time_stamp, breaks="days", freq=TRUE)

right <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                  c("external_author_id", "author", "content", "region", "language", "publish_date", "harvested_date",
                    "following", "followers", "updates", "post_type", "account_type", "new_june_2018", "retweet", "account_category"))
left <- setNames(data.frame(matrix(ncol = 15, nrow = 0)),
                 c("external_author_id", "author", "content", "region", "language", "publish_date", "harvested_date",
                   "following", "followers", "updates", "post_type", "account_type", "new_june_2018", "retweet", "account_category"))
for (i in 1:length(tweets[,1]))
{
  
  if (tweets[i, 15] == "RightTroll")
  {
    rowtemp <- tweets[i,]
    right <- rbind(right, rowtemp)
  }
  if (tweets[i, 15] == "LeftTroll")
  {
    rowtemp <- tweets[i,]
    left <- rbind(left, rowtemp)
  }
  
}
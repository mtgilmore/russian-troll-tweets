tweets <- read.csv('GitHub/russian-troll-tweets/IRAhandle_tweets_1.csv')

for (i in 2:9) {
  string <- paste0("GitHub/russian-troll-tweets/IRAhandle_tweets_", i, ".csv")
  temp <- read.csv(string)
  tweets <- rbind(tweets, temp)
}
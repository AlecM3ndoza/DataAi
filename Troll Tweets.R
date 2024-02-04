library(tidyverse)         # for graphing and data cleaning
library(tidymodels)        # for modeling

library(naniar)            # for examining missing values (NAs)
library(lubridate)         # for date manipulation
library(dbplyr)            # for SQL query "cheating" - part of tidyverse but needs to be loaded separately
library(mdsr)              # for accessing some databases - goes with Modern Data Science with R textbook

#tidytext
library(tidytext)          # for text analysis, the tidy way!
library(textdata)          
library(reshape2)
library(wordcloud)         # for wordcloud
library(stopwords)

theme_set(theme_minimal()) # Lisa's favorite theme

troll_tweets <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/russian-troll-tweets/master/IRAhandle_tweets_12.csv")
troll_tweets_untoken <- troll_tweets1 %>%
  unnest_tokens(???,???)

troll_tweets_untoken

#get rid of stopwords (the, and, etc.)
troll_tweets_cleaned <- troll_tweets_untoken %>%
  anti_join(stop_words)

#get rid of http, https, t.co, rt, amp, single number digits, and singular letters
troll_tweets_cleaned <- troll_tweets_cleaned %>%
  filter(word != ????) # you can use %in% for a list of words

troll_tweets_small <- troll_tweets_cleaned %>%
  count(??) %>%
  slice_max(order_by = n, n = 50) # 50 most occurring words

# visualize the number of times the 50 top words appear
ggplot(troll_tweets_small, 
       aes(y = fct_reorder(word,n), x = n)) +
  geom_col()


# look at sentiment
get_sentiments("bing")

# assign a sentiment to each word that has one associated
troll_tweets_sentiment <- troll_tweets_cleaned %>%
  inner_join(???)

# count the sentiments
troll_tweets_sentiment %>% 
  ???
  
  # make a wordcloud where the size of the word is based on the number of times the word appears across the tweets
  
  troll_tweets_small %>%
  with(wordcloud(word, n, max.words = ??))

# make a wordcloud colored by sentiment

troll_tweets_sentiment %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c(??,??),
                   max.words = ??)


# Twitterbot.py

import datetime
import os
from time import sleep

import tweepy

# Import our Twitter credentials from credentials.py


# Access and authorize our Twitter credentials from credentials.py

os.getenv("consumer_key")

auth = tweepy.OAuthHandler(os.getenv("consumer_key"), os.getenv("consumer_secret"))
auth.set_access_token(os.getenv("access_token"), os.getenv("access_token_secret"))
api = tweepy.API(auth)

# should print out the user name associated with your account credentials

user = api.me()
print(user.name)

# Sending a tweet directly from the python console

tweet = "this is a test tweet from my bot "
print(tweet)
api.update_status(tweet)

# For loop to iterate over tweets with #twitterbot, limit to 10
for tweet in tweepy.Cursor(
    api.search, q="#twitterbot", since="2018-10-06", until="2018-11-08", lang="en"
).items(10):
    # Print out usernames of the last 10 people to use #twitterbot
    try:
        print(f"I see: @{tweet.user.screen_name} has also made a twitterbot. Nice!")

        # Retweet the tweet
        tweet.retweet()
        print("Retweeted the tweet")

        # Favorite the tweet
        tweet.favorite()
        print("Favorited the tweet")

        # Follow the user who tweeted
        if not tweet.user.following:
            tweet.user.follow()
            print("Followed the user")

        # Have to space everything out so as to no overload Twitter
        sleep(5)

    except tweepy.TweepError as e:
        print(e.reason)
    except StopIteration:
        break

# Follow everyone who follows you as of today's date.
now = datetime.datetime.now()
for follower in tweepy.Cursor(api.followers).items():
    follower.follow()
    print(f"Followed everyone that is following me as of {str(now)}.")

with open("stoker.txt", "r") as stoker:
    # Read lines one by one from my_file and assign to file_lines variable

    file_lines = stoker.readlines()

# Create a for loop to iterate over file_lines

# Tweet a line every 10 seconds


def tweet():
    for line in file_lines:
        try:
            print(line)
            if line != "\n":
                api.update_status(line)
                sleep(10)
        except tweepy.TweepError as e:
            print(e.reason)
            sleep(2)


tweet()

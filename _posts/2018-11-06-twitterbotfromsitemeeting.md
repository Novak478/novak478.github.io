---
title: "Basic Twitterbot walkthrough"
layout: post
date: 2018-11-06 00:10
image: /assets/images/markdown.jpg
headerImage: false
tag:
- programming
- tech
- tutorial
category: blog
author: zacknovak
description: Create a basic twitterbot with hopefully no problems. 
# jemoji: '<img class="emoji" title=":ramen:" alt=":ramen:" src="https://assets.github.com/images/icons/emoji/unicode/1f35c.png" height="20" width="20" align="absmiddle">'
---

## Summary:

Revision 3.
Creating a basic twitterbot using Python 3 and Tweepy.

---

## Intro

Hi everyone! This is a simple twitterbot that:

-	Follows everyone following you.
-   Favorites a tweet based on keywords.
-   Retweets a tweet based on keywords
-   Tweet out a text file of your choosing, line by line. I am using Bram Stoker's Dracula.

This tutorial is made using:
-	[Python 3](https://www.python.org/downloads/)(Python 3)
-	[Tweepy](http://www.tweepy.org/)

I am also using Python's default shell "IDLE" for this.

---

I created this project to introduce Python to students in the University of Akron's Information Technology & eBusiness (SITE) group in a fun way. I also tried to familiarize them with how to import files / libraries, create a credential file, use a try / catch block and conditional statements, open/read/close files, and interact with an API. In full disclosure, the tutorial / project is a combination of Twitterbot projects from [DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-create-a-twitterbot-with-python-3-and-the-tweepy-library) and [Free Code Camp](https://medium.freecodecamp.org/creating-a-twitter-bot-in-python-with-tweepy-ac524157a607).

--

## Code

Here is the entire code:

##Twitterbot.py

{% highlight html %}
import tweepy
import datetime
from time import sleep

# Import our Twitter credentials from credentials.py
from credentials import *

# Access and authorize our Twitter credentials from credentials.py
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)

## test to make sure your credentials are set up properly
## should print out the user name associated with your account credentials
user = api.me()
print (user.name)

##Test Tweet
# Sending a tweet directly from the python console
tweet = "this is a test tweet from my bot "
print(tweet)
api.update_status(tweet)

#For loop to iterate over tweets with #twitterbot, limit to 10
for tweet in tweepy.Cursor(api.search,
                           q='#twitterbot',
                           since='2018-10-06',
                           until='2018-11-08',
                           lang='en').items(10):
#Print out usernames of the last 10 people to use #twitterbot
    try:
        print('I see: @' + tweet.user.screen_name + ' has also made a twitterbot. Nice!')

        #Retweet the tweet
        tweet.retweet()
        print('Retweeted the tweet')

        # Favorite the tweet
        tweet.favorite()
        print('Favorited the tweet')

        # Follow the user who tweeted
        if not tweet.user.following:
            tweet.user.follow()
            print('Followed the user')

        #Have to space everything out so as to no overload Twitter
        sleep(5)

    #Break gracefully
    except tweepy.TweepError as e:
        print(e.reason)

    #Stop for loop
    except StopIteration:
        break


##Follow everyone who follows you as of today's date.
now = datetime.datetime.now()
for follower in tweepy.Cursor(api.followers).items():
    follower.follow()
    print ("Followed everyone that is following me as of " + str(now) + ".")

# Open text file stoker.txt (or your chosen file) for reading
stoker = open('stoker.txt', 'r')
# Read lines one by one from my_file and assign to file_lines variable
file_lines = stoker.readlines()
# Close file
stoker.close()

# Create a for loop to iterate over file_lines
# Tweet a line every 10 seconds
def tweet():
    for line in file_lines:
        try:
             print(line)
             if line != '\n':
                 api.update_status(line)
                 sleep(10)
             else:
                pass
        except tweepy.TweepError as e:
            print(e.reason)
            sleep(2)

tweet()

{% endhighlight %}

## Credentials.py
{% highlight html %}


{% highlight html %}
consumer_key = 'get'
consumer_secret = 'your'
access_token = 'own'
access_token_secret = 'keys please'
{% endhighlight %}

Not that much right?

Here are the example outputs:


![Terminal Output](https://github.com/Novak478/novak478.github.io/blob/master/assets/images/TwitterbotTerminalOutput.PNG?raw=true)

![Twitter Output](https://github.com/Novak478/novak478.github.io/blob/master/assets/images/TwitterbotTwitterOutput.PNG?raw=true)

--
## Detailed Steps

1. Create a twitter account if you do not have one already. Just head to [twitter](www.twitter.com) and create an account. If you already have one, you can choose to associate it with your bot or create an entirely new one.

2. Apply for a developer account.
Go to: [https://apps.twitter.com/](https://apps.twitter.com/) and apply for a developer account. Choose the twitter account you want to associate with the bot. Go through the following application, accept the TOS, and submit the application. You will have to verify your email, and then your application will be reviewed. I have it be approved in as few as 20 minutes but also up to 2 hours.


3. Start coding!
When your application gets approved and you are given your Twitter Developer tokens, you are able to start coding!

## Getting started
In your command line, run the command ‘pip install tweepy’. You may have to run it as an administrator in some cases, depending on how your system is configured. 
{% highlight html %}
pip install tweepy
{% endhighlight %}
![pip install tweepy](https://github.com/Novak478/novak478.github.io/blob/master/assets/images/pipinstalltweepy.PNG?raw=true)

NOTE: you can get pip by going to [get-pip.py](https://bootstrap.pypa.io/get-pip.py). Copy the entire file, paste it into an empty file, save it as "getpip.py". It's important to save that file where your python files are naturally saved to (so think where your version of python is downloaded to). Run that file. You should then have pip.

After that, create your credentials.py file.  
{% highlight html %}
consumer_key = 'get'
consumer_secret = 'your'
access_token = 'own'
access_token_secret = 'keys please'
{% endhighlight %}

Great, now it's time to actually create your Twitterbot file. Create another new file named Twitterbot.py.

Start off by importing the right libraries and your credentials file.
{% highlight html %}
import tweepy
import datetime
from time import sleep

# Import our Twitter credentials from credentials.py
from credentials import *
{% endhighlight %}

Very cool. Now add onto that file by authenticating yourself with your tokens in the python shell. Think of it as logging in remotely.

{% highlight html %}
import tweepy
import datetime
from time import sleep

# Import our Twitter credentials from credentials.py
from credentials import *

# Access and authorize our Twitter credentials from credentials.py
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)
{% endhighlight %}

At this point, you are now logged in! To test and make sure you're authenticated, add a small test that should output the twitter username your name for the twitter account you've associated with your developer tokens.
{% highlight html %}
## test to make sure your credentials are set up properly
## should print out the user name associated with your account credentials
user = api.me()
print (user.name)
{% endhighlight %}

In my case, the output should be "Zack Novak" as that is the name on my account. Test for yourself!

Next, we'll directly send a tweet. Add the functionality below:
{% highlight html %}
##Test Tweet
# Sending a tweet directly from the python console
tweet = "this is a test tweet from my bot"
print(tweet)
api.update_status(tweet)
{% endhighlight %}

If you go onto your twitter account, you should now see your tweet! very cool beans.

At this point, your file should look like so:
{% highlight html %}
import tweepy
import datetime
from time import sleep

# Import our Twitter credentials from credentials.py
from credentials import *

# Access and authorize our Twitter credentials from credentials.py
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)

## test to make sure your credentials are set up properly
## should print out the user name associated with your account credentials
user = api.me()
print (user.name)

##Test Tweet
# Sending a tweet directly from the python console
tweet = "this is a test tweet from my bot"
print(tweet)
api.update_status(tweet)
{% endhighlight %}

Here's where we get into the meat of the program - where we search for tweets based on keywords, favorite and retweet tweets with the keywords in it, and follow the user that tweeted it.

{% highlight html %}
#For loop to iterate over tweets with #twitterbot, limit to 10
for tweet in tweepy.Cursor(api.search,
                           q='#twitterbot',
                           since='2018-10-06',
                           until='2018-11-08',
                           lang='en').items(10):
#Print out usernames of the last 10 people to use #twitterbot
    try:
        print('I see: @' + tweet.user.screen_name + ' has also made a twitterbot. Nice!')

        #Retweet the tweet
        tweet.retweet()
        print('Retweeted the tweet')

        # Favorite the tweet
        tweet.favorite()
        print('Favorited the tweet')

        # Follow the user who tweeted
        if not tweet.user.following:
            tweet.user.follow()
            print('Followed the user')

        #Have to space everything out so as to no overload Twitter
        sleep(5)

    #Break gracefully
    except tweepy.TweepError as e:
        print(e.reason)

    #Stop for loop
    except StopIteration:
        break
{% endhighlight %}

Finally we get into the last two parts of the program: following everyone who follows you, and tweeting a text file line by line.

{% highlight html %}
##Follow everyone who follows you as of today's date.
now = datetime.datetime.now()
for follower in tweepy.Cursor(api.followers).items():
    follower.follow()
    print ("Followed everyone that is following me as of " + str(now) + ".")

# Open text file stoker.txt (or your chosen file) for reading
stoker = open('stoker.txt', 'r')
# Read lines one by one from my_file and assign to file_lines variable
file_lines = stoker.readlines()
# Close file
stoker.close()

# Create a for loop to iterate over file_lines
# Tweet a line every 10 seconds
def tweet():
    for line in file_lines:
        try:
             print(line)
             if line != '\n':
                 api.update_status(line)
                 sleep(10)
             else:
                pass
        except tweepy.TweepError as e:
            print(e.reason)
            sleep(2)

tweet()
{% endhighlight %}

![That's all folks!](https://media.giphy.com/media/nXxOjZrbnbRxS/giphy.gif)

Thanks for reading along. I'm afraid I am a little behind on homework as of 11/7/18, so I made this quickly but I plan on revising this guide further to go further into the logic and how it works, so please excuse the lack of fine detail. Please let me know if you have any questions by emailing me at zmn3@zips.uakron.edu. Thank you!
---

[1]: http://daringfireball.net/projects/markdown/
[2]: http://www.fileformat.info/info/unicode/char/2163/index.htm
[3]: http://www.markitdown.net/
[4]: http://daringfireball.net/projects/markdown/basics
[5]: http://daringfireball.net/projects/markdown/syntax
[6]: http://kune.fr/wp-content/uploads/2013/10/ghost-blog.jpg

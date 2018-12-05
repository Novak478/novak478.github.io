---
title: "Precursor to 30 days of code, and intro to stopignoring.me"
layout: post
date: 2018-12-05 00:20
image: https://d9np3dj86nsu2.cloudfront.net/thumb/06448182cdf65d7f6355be9dfc55ffc8/240_277
headerImage: true
projects: true
tag:
- programming
- tech
- stopignoring.me
- 30 days of code
category: project
author: zacknovak
description: Introduction to my stopignoring.me project, and a precursor to 30 days of code.
# jemoji: '<img class="emoji" title=":ramen:" alt=":ramen:" src="https://assets.github.com/images/icons/emoji/unicode/1f35c.png" height="20" width="20" align="absmiddle">'
---

## Summary:

This update is meant to cover my plans for the 30 days of code (starting 12/9 and ending 1/8) as well as my project stopignoring.me

---

## Update 0

Hi everybody! I am quitting my college job as a personal shopper / delivery driver for Giant Eagle's Curbside Express on December 8th, and graduating with my Bachelors on December 15th! Very exciting times. After that, I am starting at [CardinalCommerce](https://www.cardinalcommerce.com/) as an Associate Software Developer in their Big Data group in early January. 

Starting on Sunday December 9th, I am doing my own little personal 30 days of code. Other 30 days of code mandate a certain amount spent programming per day, but I figured it would be better for me to mandate a certain amount per week (7 hours at least per week) due to the holidays. With myself not working and just relaxing during this time, I figured this should be an easy goal to hit. I have my professional mentor, Chris M., holding me accountable and following my development on my GitHub as well as doing code reviews for me. 

I am doing everything using Python 3.6 in Microsoft Visual Studio Code with the Python and Code Runner extensions. I am primarily focusing on improving my knowledge with AWS and Python in the 30 days.

---

Just to make sure I was set for Sunday, I got started with Flask today following Salvador's [Flask tutorial](https://medium.freecodecamp.org/how-to-build-a-web-application-using-flask-and-deploy-it-to-the-cloud-3551c985e492) on how to build a web application to make sure everything was at least started okay. I pretty much followed it until the virtualenv part so that my main.py file looks like below:

{% highlight html %}
from flask import Flask, render_template     

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/about")
def about():
    return render_template("about.html")    

@app.route("/zack")
def zack():
    return "Hello, zack"

if __name__ == "__main__":
    app.run(debug=True)
{% endhighlight %}

So yeah, everything is good to go it seems. So what am I doing in these 30 days? I am going to be working on a personal project, stopignoring.me. Let me start with a very short pitch for it below....

--

## stopignoring.me!

Have you been so zoned out working on your computer or busy that you've ignored your phone / company in person? Have you ever turned around and seen your significant other looking at you like this?

![look at my face](https://media.giphy.com/media/3BgE1S5ZHf0li/giphy.gif) 

If you've ever heard the phrase "stop ignoring me", then you need to use stopignoring.me! It is guaranteed to give your friend a way to gather your attention. Don't worry too - you can toggle whether or not you want to be notified of attention alerts at the current time, or even set time zones for when it is ok to be notified. I won't be blowing up phones / emails all the time because ya boi here is not trying to get on a spam / robocaller list.


--

## More information

To make my girlfriend happy, I promised earlier this year that I would build her a website that emails, texts, and in general hits me up to let me know that she wants attention. 

This is not meant to be a serious project / website, but a rather goofy one instead. 

The goal of this is 30 days is to create a flask web application using a microservices architecture. It will have/be:

- a login system complete with authentication of some sort (besides phone/email verification).
- a user dashboard letting you know how many times someone has let you know they want attention from you, common times they want attention, and your most attention-hungry associates.
- a way to parse and respond to text messages (YES/NO, times, etc).
- it will also hopefully be cheap / stay in AWS free tier.




Am I going in over my head? probably, but it's OK. The overall goal is to just have fun and learn a lot while making a fun website to share with friends and family.

Thanks for reading - looking forward to what I can do and learn in the next coming days. Happy Holidays!

![She is happy with me sometimes tho](https://github.com/Novak478/novak478.github.io/blob/master/assets/images/paige_sickoftakingpictures.PNG?raw=true)
---

[1]: http://daringfireball.net/projects/markdown/
[2]: http://www.fileformat.info/info/unicode/char/2163/index.htm
[3]: http://www.markitdown.net/
[4]: http://daringfireball.net/projects/markdown/basics
[5]: http://daringfireball.net/projects/markdown/syntax
[6]: http://kune.fr/wp-content/uploads/2013/10/ghost-blog.jpg

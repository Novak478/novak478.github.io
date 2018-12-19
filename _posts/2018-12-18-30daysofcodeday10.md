---
title: "30 days of code -- Day 10 Overview"
layout: post
date: 2018-12-18 03:00
image: https://i1.wp.com/www.betsandstats.com/wp-content/uploads/2017/03/Day-10.png?w=256
headerImage: true
projects: true
tag:
- programming
- tech
- stopignoring.me
- 30 days of code
category: project
author: zacknovak
description: 30 days of code -- Day 10
# jemoji: '<img class="emoji" title=":ramen:" alt=":ramen:" src="https://assets.github.com/images/icons/emoji/unicode/1f35c.png" height="20" width="20" align="absmiddle">'
---

## Summary:

This update is meant to cover what I did for day 10 of my 30 days of code.

Time spent: ~ 1.5 hours

Total changes:

- set up admin@stopignoring.me
- set up cname and txt records in stopignoring.me DNS to verify and allow MAIL FROM
- verified stopignoring.me with aws
- set up application to send emails from ses

---

## Day 10

So today was more of a transition day from Corey's tutorial to my design. So, initially I realized that using an email like 'stopignoring.me@gmail.com' was a terrible idea - both for validation purposes and also because that email was taken. So, with my hosting, I got a private email using the domain stopignoring.me (2 free months as well, s/o Namecheap), and started on getting that configured. After that, I signed into my AWS account, and configured my IAM to use 2-factor authentication as well as other small details.

From there, I verified the domain stopignoring.me with DKIM as well as my personal email and my email at stop ignoring.me. Amazon's guide surprisingly was not very helpful and after a few google searches I came up on this [handy guide](https://blog.lunchbunch.me/aws-ses-domain-verification) that helped me out significantly with the verification.

Lastly with everything verified, I set up the application to use SES rather than flask-mail for emailing!

I feel like I am finally getting started with AWS. The hardest part today was definately reading the AWS guides and trying to make sure I was getting set up in IAM and SES. Best practices might be the best practices, but they forsure are not the quickest practices lol. Hee yaw!

Thanks for reading. Have a great rest of your day. Start that project you've been putting off.

--- 
## Follow my project on github here!
[Stop Ignoring Me](https://github.com/Novak478/stopignoringme)
---

[1]: http://daringfireball.net/projects/markdown/
[2]: http://www.fileformat.info/info/unicode/char/2163/index.htm
[3]: http://www.markitdown.net/
[4]: http://daringfireball.net/projects/markdown/basics
[5]: http://daringfireball.net/projects/markdown/syntax
[6]: http://kune.fr/wp-content/uploads/2013/10/ghost-blog.jpg

---
title: "How to find specific files in S3"
layout: post
date: 2019-03-29 03:00
projects: true
tag:
    - programming
    - tech
    - aws
    - bigdata
category: project
author: zacknovak
description: Script to find specific files in s3
# jemoji: '<img class="emoji" title=":ramen:" alt=":ramen:" src="https://assets.github.com/images/icons/emoji/unicode/1f35c.png" height="20" width="20" align="absmiddle">'
---

## Teaser

Ever tried to find a specific file for a client or co-worker? It sucks. Use my script.

---

## The juicy bit

I was recently asked to find a specific file at work and map where it goes to because we receive a new one weekly, and while it's currently replaced automatically, my manager had no idea where it went. Well I had no idea where it was because I didn't work on the application that uses it. Thankfully, my coworker immediately recognized it and helped me out.

This scenario caught my attention though. What if none us knew where it went? S3 doesn't allow you to just search for a file like a typical search engine. If you had a plethora of buckets, filled with hundreds of sub-buckets like we do, it would be pretty easy to recognize you're up a creek without a paddle. So I've created a Python 3 script that uses the awscli tool and some packages to track where everything is at. I put the script into a new utility Airflow DAG and set it to run weekly on Monday mornings before work (as it takes ~4 hours to finish) so that we avoid this potential problem. The script is below. I've included the full script, but you can chop it down if you just want to gather the contents of each bucket. Hope this helps if you stumble across this!

## Code

![s3_file_searcher](https://github.com/Novak478/novak478.github.io/blob/b1be658bfa6802d3ae734d4ac9fe35f9d99ac4cb/assets/python/s3_file_searcher.py)

---

[1]: http://daringfireball.net/projects/markdown/
[2]: http://www.fileformat.info/info/unicode/char/2163/index.htm
[3]: http://www.markitdown.net/
[4]: http://daringfireball.net/projects/markdown/basics
[5]: http://daringfireball.net/projects/markdown/syntax
[6]: http://kune.fr/wp-content/uploads/2013/10/ghost-blog.jpg

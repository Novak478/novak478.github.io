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

```python
#!/usr/bin/python
import mmap
import os
import re

import pandas as pd


def s3FileSearch():
    # input the files you are searching for
    filesWeAreSearchingFor = ["example1.csv", "example2.csv"]
    fileTypeWeAreSearchingFor = ".csv"
    # Gets list of buckets and write to .csv file
    getBucketNames = 'aws s3api list-buckets --query "Buckets[].Name" > bucketnames.csv'
    # Runs aws cli command -- this will work as long as you have it installed with access keys.
    os.system(getBucketNames)
    bucketDataFrame = pd.read_csv("bucketnames.csv")
    # dropping first and last row where value is "[" and "]"
    bucketDataFrameWithoutFirstAndLastRow = bucketDataFrame[1:-1]
    found = " WAS found in: "
    notFound = " NOT found in: "
    star = "*** "
    for row in bucketDataFrameWithoutFirstAndLastRow.iterrows():
        bucketNameWhole = str(row)
        bucketName = ""
        try:
            bucketName = re.search('    "(.+?)"', bucketNameWhole)[1]
        except AttributeError:
            print("Invalid bucket name.")
        # Get list of contents per bucket and save in txt file.
        #  --dryrun command makes it so that the command is not actually ran.
        # Using cp because it
        # allows for --exclude and --include args. Rm does too, but it is more risky...
        searchPart = "aws s3 cp s3://"
        searchPart += bucketName
        searchPart = (
            searchPart
            + ' s3://bucket/zackn/ --recursive --exclude "*" --include "*'
            + fileTypeWeAreSearchingFor
            + '"--dryrun > '
        )
        searchPart = searchPart + bucketName + "CONTENTS.txt"
        fileHoldingS3Contents = bucketName + "CONTENTS.txt"
        # Files all .csv files in bucket and writes to individual contents file.
        os.system(searchPart)
        # Searching content file for file we are looking for (example1.csv, example2.csv).
        for file in filesWeAreSearchingFor:
            if os.stat(fileHoldingS3Contents).st_size == 0:
                print(file + notFound + fileHoldingS3Contents)
            else:
                f = open(fileHoldingS3Contents)
                s = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
                if s.find(file) != -1:
                    print(star + file + found + fileHoldingS3Contents + star)


if __name__ == "__s3FileSearch__":
    s3FileSearch()
```

---

[1]: http://daringfireball.net/projects/markdown/
[2]: http://www.fileformat.info/info/unicode/char/2163/index.htm
[3]: http://www.markitdown.net/
[4]: http://daringfireball.net/projects/markdown/basics
[5]: http://daringfireball.net/projects/markdown/syntax
[6]: http://kune.fr/wp-content/uploads/2013/10/ghost-blog.jpg

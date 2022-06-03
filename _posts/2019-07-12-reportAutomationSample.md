---
title: "Sample report automation script"
layout: post
date: 2019-07-12 5:00
projects: true
tag:
    - tech
    - gpg
    - big data
    - reporting
    - automation
category: project
author: zacknovak
description: sample report sftp script to use. all instructions inside.
# jemoji: '<img class="emoji" title=":ramen:" alt=":ramen:" src="https://assets.github.com/images/icons/emoji/unicode/1f35c.png" height="20" width="20" align="absmiddle">'
---

## Script Details

This 🔥bad🔥 boy is called by a cron job every day. When called, the script gets yesterday's date. It then passes this date to the aws cli to go into the destination folder desired (with the date passed) and pulls down all files it is set to gather (ex: csv). It then combines / coalesces all the files into one, encrpyts that file with a recipients public key, and sftp's it to their folder. It also drops off an encrypted copy to the folder it pulled it down from.

---

## How to call script

1. Log in as the user who has trusted the recipient's public key.
    - `sudo su exUser`
2. Open that user's crontab
    - `crontab -e`
3. Add in a new line calling the script above (in this case we have named it reportshipper.sh)
    - `0 19 * * * cd /path/to/file && ./reportshipper.sh`
    - In this case, we are running the job at 19:00 UTC, which is 3:00 PM eastern.
    - More information on cron can be found here: https://www.linode.com/docs/tools-reference/tools/schedule-tasks-with-cron/
4. Finally, you just need to make sure that the script is able to be executed from cron. To do so, cd to your file and change the permissions like so:
    - `cd /path/to/file && chmod +x reportshipper.sh`

---

## Script

## ![report_automation](https://github.com/Novak478/novak478.github.io/blob/b1be658bfa6802d3ae734d4ac9fe35f9d99ac4cb/assets/shellscripts/report_automation.bash)

[1]: http://daringfireball.net/projects/markdown/
[2]: http://www.fileformat.info/info/unicode/char/2163/index.htm
[3]: http://www.markitdown.net/
[4]: http://daringfireball.net/projects/markdown/basics
[5]: http://daringfireball.net/projects/markdown/syntax
[6]: http://kune.fr/wp-content/uploads/2013/10/ghost-blog.jpg

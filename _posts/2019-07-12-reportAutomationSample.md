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
   * `sudo su exUser`
2. Open that user's crontab
   * `crontab -e`
3. Add in a new line calling the script above (in this case we have named it reportshipper.sh)
   * `0 19 * * * cd /path/to/file && ./reportshipper.sh`
   * In this case, we are running the job at 19:00 UTC, which is 3:00 PM eastern.
   * More information on cron can be found here: https://www.linode.com/docs/tools-reference/tools/schedule-tasks-with-cron/
4. Finally, you just need to make sure that the script is able to be executed from cron. To do so, cd to your file and change the permissions like so:
   * `cd /path/to/file && chmod +x reportshipper.sh`
---

## Script


```bash
#!/bin/bash

parent=example/report/location
#automatically picks up yesterdays date. Uncomment for manual date entry when executing script.
#year="$1"
#month="$2"
#day="$3"
year=`date "+%Y" -d yesterday`
month=`date "+%m" -d yesterday`
day=`date "+%d" -d yesterday`

yearlength=${#year}
monthlength=${#month}
daylength=${#day}

if [[ "$yearlength" != "4" ]]
then
echo Year length is too long or too short! YYYY MM DD
echo EXITING
exit 1
fi

if [[ "$monthlength" != "2" ]]
then
echo Month length is too long or too short! YYYY MM DD
echo EXITING
exit 1
fi

if [[ "$daylength" != "2" ]]
then
echo Day length is too long or too short! YYYY MM DD
echo EXITING
exit 1
fi

databasepath=s3://prd-data-processed
datapath=$databasepath/$parent/$year/$month/$day

reportbasepath=/path/to/your/folder
reportpath=$reportbasepath/$parent/$year/$month/$day
reportfile=$reportpath/part-*
reportfileencrypted=$reportpath/<NamingSchema>.$year$month$day.gpg

# Create folder for report
mkdir -p $reportpath

# Download the data
aws s3 cp $datapath/ $reportpath --recursive --exclude "*" --include "part*" --region us-east-1

# Get the header from the first partitioned file. This header will be applied to the output file.
FILES=$reportpath/*
OUT_FILE="part-00000.csv"

for file in $FILES
do
  if [ -f "$file" ] && [[ "$file" == *"part-00000-"* ]]; then
    head -n 1 $file > $reportpath/$OUT_FILE
  fi
done

# Coalesce partitioned files to a single file prepended with the header.
for file in $FILES
do
  if [ -f "$file" ] && [[ "$file" != *$OUT_FILE* ]]; then
    tail -n +2 "$file" > "$file.tmp" && mv "$file.tmp" "$file" # Remove header from partitioned files
    cat $file >> "${reportpath}/$OUT_FILE" # Coalesce header-less partitioned files to a single file
    rm -f $file # Remove partition once added to single file
  fi
done

# Create the output file
gpg --output $reportfileencrypted -r <publicKeyOfRecipient> -e $reportfile

# connect to client, drop encrypted file, disconnect
sftp -v -oPort=22 <sftpLocation>:<Path/To/Drop/Report/Off/In> << !
   put $reportfileencrypted
   bye
!

# Push files to AWS S3
aws s3 cp $reportfileencrypted $datapath/ --region us-east-1
aws s3 cp success.txt $datapath/ --region us-east-1

# Clean up
rm -f $reportpath/*
```

---

[1]: http://daringfireball.net/projects/markdown/
[2]: http://www.fileformat.info/info/unicode/char/2163/index.htm
[3]: http://www.markitdown.net/
[4]: http://daringfireball.net/projects/markdown/basics
[5]: http://daringfireball.net/projects/markdown/syntax
[6]: http://kune.fr/wp-content/uploads/2013/10/ghost-blog.jpg

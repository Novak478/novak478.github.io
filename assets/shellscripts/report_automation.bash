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
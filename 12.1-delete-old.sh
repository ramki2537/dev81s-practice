#!/bin/bash

USERID=$(id -u)

SOURCE_DIR="/root/app-log"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/"$LOG_FILE-$TIMESTAMP.log"

CHECK_ROOT(){
if [ $USERID -ne 0 ]
then
    echo "Error: You need sudo access to perform this script"
    exit 1
}

mkdir app-log

echo "This script execute from here: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files to delete: $FILES_TO_DELETE"

while read -r filepath
do
   echo "Deleting file: $filepath"
   rm -rf $filepath
   echo "Deleted file: $filepath"
done <<< $FILE_TO_DELETE


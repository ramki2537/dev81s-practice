#!/bin/bash

SOURCE_DIR="/root/dev81s-practice/app-log"
LOGS_FOLDER=$"/var/log/practice-log"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

echo "Script starts here: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files to be deleted: $FILES_TO_DELETE

while read -r filepath
do
    echo "Deleting files: $filepath" &>>$LOG_FILE_NAME
    rm -rf $filepath
    echo "Deleted files: $filepath"
done <<< $FILES_TO_DELETE

#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/error-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
       echo -e "$2...$R FAILED $N"
       exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

echo "Script started executing: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo -e "ERROR: Need sudo access to perform this script"
    exit 1
fi

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then 
   dnf install mysql -y &>>$LOG_FILE_NAME
   VALIDATE $? "Installing mysql"
   
else
   echo -e "mysql package already...$Y INSTALLED $N"
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
   dnf install git -y &>>$LOG_FILE_NAME
   VALIDATE $? "Install git"
else
    echo -e "git package already...$Y INSTALLED $N"
fi
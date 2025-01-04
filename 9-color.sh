#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="e\[33m"
N="e\[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
       echo -e "$2...$R FAILED $N"
       exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: Need sudo access to perform this script $N"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
   dnf install mysql -y
   VALIDATE $? "Installing mysql"
   
else
   echo -e "mysql package already...$Y INSTALLED $N"
fi

dnf list installed git

if [ $? -ne 0 ]
then
   dnf install git -y
   VALIDATE $? "Install git"
else
    echo -e "git package already...$Y INSTALLED $N"
fi
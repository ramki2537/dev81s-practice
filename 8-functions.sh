#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
       echo "$2...FAILED"
       exit 1
    else
        echo "$2...SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR: Need sudo access to perform this script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
   dnf install mysql -y
   VALIDATE $? "Installing mysql"
   
else
   echo "mysql package already...INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
then
   dnf install git -y
   VALIDATE $? "Install git"
else
    echo "git package already...INSTALLED"
fi
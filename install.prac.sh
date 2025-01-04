#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error: Need sudo permission to execute this script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then 
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
       echo "Installing mysql....FAILED"
       exit 1
    else
       echo "Installing mysql...SUCCESS"
    fi
else
   echo "mysql package already...INSTALLED"
fi

dnf list installed nodejs

if [ $? -ne 0 ]
then
    dnf install nodejs -y
    if [ $? -ne 0 ]
    then
       echo "Installaing nodejs...FAILED"
       exit 1
    else
       echo "Installing nodejs...SUCCESS"
    fi
else
    echo "nodejs package already...INSTALLED"
fi
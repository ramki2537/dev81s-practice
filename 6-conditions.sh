#!/bin/bash

read -p "Enter number: " NUMBER

if [ $NUMBER -gt 50 ]
then 
   echo "Given number is greater than 50"
else
   echo "Given number is equal or less than 50"
fi

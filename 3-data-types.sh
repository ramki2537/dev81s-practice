#!/bin/bash


read -p "Enter value1: " number1
read -p "Enter value2: " number2

TIMESTAMP=$(date)
echo "Script executed on: $TIMESTAMP"

SUM=$(( number1+number2 ))

echo "SUM of $number1 and $number2 is: $SUM"
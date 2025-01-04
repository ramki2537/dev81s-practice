#!/bin/bash

echo "Enter value1 and value1: "
read -p number1 number2

TIMESTAMP=$(date)
echo "Script executed on: $TIMESTAMP"

SUM=$(( number1+number2 ))

echo "SUM of $number1 and $number2 is: $SUM"
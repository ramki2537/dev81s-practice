#!/bin/bash

echo "All variables passed: $@"
echo "Number of variables passed: $#"
echo "Display passed values at a time: $*"
echo "Script name: $0"
echo "Present working directory: $PWD"
echo "Home directory of the present user: $HOME"
echo "Which user running script: $USER"
echo "Process id of current user: $$"
sleep 10 &
echo "Process id of previous command: $!"
echo "Previous command status: $?"



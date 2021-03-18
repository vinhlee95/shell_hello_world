#!/bin/bash

# Variables
name=Vinh
age=25

# Using \ to escape characters
str="Welcome to my first \"Hello world shell script\""
echo $str

# Using bactic `` to execute a command
currentDate=`date`
echo "Now is $currentDate"

# Condition
# If my age is:
# < 13: children
# 13 -> 19: teenager
# > 19: adult
if [ $age -lt 13 ]
then
	ageGroup="children"
elif [ $age -gt 19 ]
then
	ageGroup="adult"
else
	ageGroup="teenager"
fi

echo "Hello world. My name is $name. I am $age years old. I am a $ageGroup."


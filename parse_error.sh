#!/bin/bash

#Problem: Write a shell script (zsh/bash) that parses this file and outputs the following:
    #The number of HTTP 404 errors in it
    #A list of all HTTP response codes in the log and their count

error_code=$1

number_of_errors=`cat sample.log | awk '{print $10}'| grep "$error_code" | wc -l`

echo "Number of HTTP 404 Errors is: $number_of_errors"

echo "Response code with their count"
cat sample.log | awk '{print $10}' | sort| uniq -c

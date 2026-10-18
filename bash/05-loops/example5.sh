#!/bin/bash

# Example 5
# while loop - repeat while a condition is true
# Checks the condition before each run.
# $((...)) does arithmetic. count+1 will just be a text without it. 


count=1
while [[ $count -le 5 ]];
do
	echo $count
	count=$((count + 1))
done


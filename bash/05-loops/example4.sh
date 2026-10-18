#!/bin/bash

# C-style for loop: When you need a counter
# Three parts: starting value, condition to keep going, what to do each time

for ((num=1; num<=5; num++))
do
	echo "number is $num"
done

# Common mistakes and note:
# seperate each part with a semi-colon ;
# remember to use the (()) to perform the arithmetic not the [[]]
# num++ means add 1

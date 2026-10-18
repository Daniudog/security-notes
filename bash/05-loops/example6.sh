#!/bin/bash

# Example 6
# until loop - repeat until a condition becomes true (the opposite of while loop)


n=1
until [[ $n -gt 5 ]];
do
	echo "n is $n"
	n=$((n+1))
done

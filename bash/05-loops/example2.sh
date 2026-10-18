#!/bin/bash

# Example 2
# For Loop - Repeat over a range of numbers
# I usually like to add the sleep function inside the loop to make it more aestethic. Add it to yours and see the difference. Hint: sleep 1

for count in {1..10}
do
	echo "$count"
	count=$((count + 1))
done

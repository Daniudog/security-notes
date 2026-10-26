#!/bin/bash

# Looping with an index, when you need position too


colors=("red" "blue" "green")

for i in "${!colors[@]}"; do
	echo "$i"
done



# Or you can print both the position/index and the value
for i in "${!colors[@]}"; do
	echo "$i : ${colors[$i]}"
done

# !colors[@] gives you the indexes instead of the values

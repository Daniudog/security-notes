#!/bin/bash


# Building an array from command output

file=(*.sh)
echo "${#file[@]} bash scripts found"
for f in "${file[@]}"; do
	echo $f
done

echo "Total Bashscripts: ${#file[@]}"

# This is a cleaner alternative to for f in *.sh; do ... done when you need to know the count, 
# reuse the list more than once, or process it out of order.

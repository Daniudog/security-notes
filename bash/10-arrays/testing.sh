#!/bin/bash

# Arrays

colors=("red" "blue" "green")

for color in "${colors[@]}"; do
       echo "$color"
done 

echo "Total number of colors: ${#colors[@]}"

for color in "${!colors[@]}"; do
	echo "$color : ${colors[@]}"
done

# adding yellow to the array of colors
colors+=("yellow")
echo "${colors[@]}"

# checking the total again
echo "Total number of color: ${#colors[@]}"

# Confirming what this prints without loop
echo "${!colors[@]}"


# script-like format with arrays
scripts=(*.sh)
for script in "${scripts[@]}"; do
	echo "$script"
done

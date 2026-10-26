#!/bin/bash

# Looping over an array

colors=("red" "green" "blue")

for color in "${colors[@]}"; do
	echo "$color"
done

# Always quote "${colors[@]}" — unquoted, elements containing spaces get split apart, 
# same risk as unquoted variables from Module 2.

#!/bin/bash

# Associative Arrays - named keys instead of numbers

# EXAMPLE


declare -A ages

ages["dot"]=25
ages["daniel"]=30

echo "${ages["dot"]}"


# declare -A is required before using an associative array
# regular arrays don’t need declare, but associative ones do.


declare -A colors

colors["blue"]=1
colors["red"]=2
colors["green"]=3

echo "${colors["blue"]}"

# Looping over associative arrays

for name in "${!ages[@]}"; do
	echo "$name is ${ages[$name]} old"
done

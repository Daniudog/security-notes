#!/bin/bash

# Example 3
# For Loop - Repeat over files in the current directory
# Remember the * is a wildcard in Bash. * means everything i.e everything that matches the .sh in other words anything that ends in .sh.

for file in *.sh
do
	echo "Found script: $file"
done

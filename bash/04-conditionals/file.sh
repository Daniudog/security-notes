#!/bin/bash

# Checking if a file exists

# Basic/Static 
# if [ -f "elif.sh" ]; then
#   echo "elif.sh exists"
# else
#   echo "elif.sh not found"
# fi



# Dynamic: More advanced with user input

read -p "Enter the file name: " file
if [ -f "$file" ]; then
	echo "$file exists"
else
	echo "file not found"
fi

# -f checks for a file. 
# -d checks for a directory. 
# Run this from inside the folder where the file lives, 
# then from a different folder, and compare.

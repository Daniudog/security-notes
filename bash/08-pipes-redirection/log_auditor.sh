#!/bin/bash


# CLASSWORK

# counter function to count the keywords in the file

counter() {
	local total=$(grep "$1" "$file" | wc -l)
	echo "$1 appears $total times in the file"
}

errors() {
	local error=$(grep "error" "$file" | wc -l) 
	if [[ $error -gt 0 ]]; then
		echo "$file contains $error errors" > error_only.txt 2>&1
		grep "error" $file >> error_only.txt 2>&1
		echo "check 'error_only.txt' for errors"
		return 1 # Failed
	else
		echo "$file has $error errors" > error_only.txt 2>&1
		return 0 # Passed
	fi
}

# accept a log file path as an argument ($1)
# checking to see if argument is empty and printing the usage message if true
file=$1
if [[ -z "$file" ]]; then 
	echo "USAGE: ./log_auditor.sh <PATH>"
	exit 1
else
	if [[ -f "$file" && -r "$file" ]]; then
		echo "Starting now..."
		echo "scan for keywords like: error, warning, password, etc"
		echo "scanning for keywords" 	
		read -p "Enter a keyword: " keyword
		counter $keyword
		errors
	else
		echo "$file does not exist or is not readable"
		exit 1
	fi
fi

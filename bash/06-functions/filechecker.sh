#!/bin/bash

# Classwork: health_check.sh

# Build a script that checks several things about the current system/folder and reports pass/fail for each, 
# using functions to organize the checks — a genuinely useful “is everything okay here” tool.


# Functions
total() {
	echo "total nummber of files: $1"
	echo "total number of bashscripts: $2"
	echo "total number of text files: $3"
}

file_type() {

	if [[ $1 == *.sh ]]; then
		echo "$1 is a bashscript"
		bashscript=$(($bashscript + 1))

	elif [[ $1 == *.txt ]]; then
		echo "$1 is a text file"
		textfile=$(($textfile + 1))

	elif [[ $1 == *.py ]]; then
		echo "$1 is a python script"
	elif [[ $1 == *.log ]]; then
		echo "$1 is a log file"
	elif [[ $1 == *.md ]]; then
		echo "$1 is a markdown file"
	else
		echo "file type is unknowm"
	fi

}

count=0
bashscript=0
textfile=0

location=$(pwd)

echo "Current Directory: $location"

for file in *; do
	if [[ -f $file ]]; then
		echo "$file exists"
		file_type $file
		count=$(($count + 1))
	fi
done

total $count $bashscript $textfile


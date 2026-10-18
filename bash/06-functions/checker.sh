#!/bin/bash

# CLASSWORK



# Build a script that checks several things about the current system/folder and reports pass/fail for each, 
# using functions to organize the checks — a genuinely useful “is everything okay here” tool.



# creating the functions
file_type() {
	if [[ $1 == *.sh ]]; then
		echo "$1 is a bash script"
	elif [[ $1 == *.txt ]]; then
		echo "$1 is a text file"
	elif [[ $1 == *.py ]]; then
		echo "$1 is a python script"	
	else
		echo "File type is unknown"
	fi
}


# just for aesthettics
echo "Welcome to the directory checker"
echo "--------------------------------"
echo "--------------------------------"

# Making the user choose an option
echo "------OPTIONS-----------"
echo "1. Start Scan"
echo "2. Quit (q to quit)"

read options

if [[ $options == "1" ]]; then
	echo "Starting Scan..."
	read -p "enter the file extension to scan: " type
	for file in "*.$type"; do
		file_type $file
		#type_count()


	done






elif [[ $options == "2" ]]; then
	echo "Goodbye"
	exit

else
	echo "Invalid Option"
fi




#!/bin/bash

# CLASSWORK


# Just for fun and aesthetics
# added the usage for demonstrative purposes
echo "---------file scanner------------"
sleep 1
echo "USAGE: ./filescanner.sh <EXTENSION>"
echo "example: ./filescanner.sh sh"
echo "example: ./filescanner.sh txt"
echo "example: ./filescanner.sh py"
echo "example: ./filescanner.sh log"
echo "chmod u+x ./filescanner.sh if permission to run is denied"
echo "Without an argument, the scanner automatically checks for bashscripts"


# setting the default to bashscripts
type=${1:-"sh"}

# added this line to show the user input selection on the terminal before the script runs. Again sleep is just for aesthetics
echo "Scanning for files with the .$type extension"

# creating a count variable to track count and total number of files
count=0

# creating a empty variable to track number of empty files 
empty=0

# looping through all files.
for file in *.$type
do
	# to skip hidden files.
	if [[ "$file" == .* ]]; then
  		continue
	fi

	# looping through all file conditions
	if [[ $type == "sh" ]]; # condition for bash scripts
	then
		echo "$file is a bash script"
		if [[ ! -s $file ]]; # checking for file content with -s in reverse 
		then
			echo "$file is empty"
			empty=$((empty + 1)) # incrementing the empty variable if the file is confirmed empty
		else
			echo "$file has content"
		fi
		
		lines=$(wc -l < "$file") # created a lines variable to track the number of lines in each file
		echo "$file has $lines lines"
		
		count=$((count + 1)) # to track the count and the number of files # incrementing the count variable after each loop
		continue
	
	elif [[ $type == "txt" ]]; # condition for text files
	then
		echo "$file is a text file"
		if [[ ! -s $file ]];
		then
			echo "$file is empty"
			empty=$((empty + 1))
		else
			echo "$file has content"
		fi

		lines=$(wc -l < "$file")
		echo "$file has $lines lines"

		count=$((count + 1))
		continue
	
	elif [[ $type == "py" ]]; # condition for python scripts
	then
		echo "$file is a python script"
		if [[ ! -s $file ]];
		then
			echo "$file is empty"
			empty=$((empty + 1))
		else
			echo "$file has content"
		fi
		
		lines=$(wc -l < "$file")
		echo "$file has $lines line"

		count=$((count + 1))	
		continue
	
	elif [[ $type == "log" ]]; # condition for log files
	then
		echo "$file is a log file"
		if [[ ! -s $file ]];
		then
			echo "$file is empty"
			empty=$((empty + 1))
		else
			echo "$file has content"
		fi

		lines=$(wc -l < "$file")
		echo "$file has $lines line"

		count=$((count + 1))
		continue
	
	else # when the selected option doesn't match any
		echo "$type is not an appropriate extension. Use the script usage to select options"
		break # end the loop
	fi
done


# show the total number of files after the loop is over
echo "Total number of $type files: $count"

# show the total number of empty files after the loop is over
echo "Total number of empty files: $empty"



# I can finally see the importance of functions. I had to repeat myself too many times. Definitely coming back to upgrade this script with functions


# Some important details
#
# -s means the file exists and its size is greater than 0. The ! reverses the condition in the if block.
#
# wc -l counts lines. On its own it also prints the filename next to the number (e.g 5 myfile.sh) which we don't want here
# using < to feed the file into wc -l, instead of giving us the file name as an argumen, makes it print just the number, nothing else
# Wrapping it in $(...) captures the number into the lines variable
# CHECK filescanner.adv FOR THE ADVANCED VERSION















: <<'COMMENT'
# The rubbish I was doing until I read the question again

for $file in file.*
do
	for $file in "*.sh"
	do
		echo "$file is a bash script"
	done
	for $file in "*.txt"
	do
		echo "$file is a text file"
	done
	for $file in "*.md"
	do
		echo "$file is a markdown file"
	done
	for $file in "*.py"
	do
		echo "$file is a python script"
	done
done
COMMENT


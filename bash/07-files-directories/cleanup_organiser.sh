#!/bin/bash

# CLASSWORK

# cleanup_organiser.sh
# Build a script that organizes a messy folder by file type, moving files into subfolders based on their extension.
# A genuinely useful tool for tidying up a downloads or notes folder


# accepting a target folder as an argument($1), defualting to the current folder(.)if not given
target=${1:-"/home/dot/bashscripting/19-10-2026"}

bashscript() {
	local file=$1
	if [[ -f $file && $file == *.sh ]]; then
		echo "$file is a bashscript"
		return 0
	else
		return 1
	fi
}

textfile() {
	local file=$1
	if [[ -f $file && $file == *.txt ]]; then
		echo "$file is a textfile"
		return 0
	else
		return 1
	fi
}

# Making the directory to push files to based on their type
safe_mkdir() {
	local bashscripts=$(ls *.sh | wc -l)
	local textfiles=$(ls *.txt | wc -l)
	
	if [[ $bashscripts -ge 1 ]]; then
		if [[ -d shellscripts ]]; then
			echo "'shellscripts' directory exists" #directory exists so skip
		else
			mkdir shellscripts
			echo "created directory: 'shellscripts'"
		fi
	else
		continue
	fi
	
	if [[ $textfiles -ge 1 ]]; then
		if [[ -d textfiles ]]; then
			echo "textfile directory exists"
		else
	 		mkdir textfiles
			echo "created directory: 'textfiles'"
		fi
	else
		continue
	fi		

}


# to track total number of bashscripts
bashscripts=0
textfiles=0

# checking if the target folder actually exists and is a directory
if [[ -e $target ]]; then
	if [[ -f $target ]]; then
		echo "$target is a not a directory"
		exit
	elif [[ -d $target ]]; then
		echo "-----------------------------"
		echo "organising $target"
		echo "-----------------------------"
		
		# checking for available file types and creating the appropriate directory 
		safe_mkdir

		for file in *; do
		#	# skip hidden files
		#	for $file in .*;do
		#		continue
		#	done

			# skip directories
			if [[ -d $file ]]; then
				continue
			fi

			if bashscript $file; then
				bashscripts=$((bashscripts + 1))
				mv $file shellscripts/

			elif textfile $file; then
				textfiles=$((textfiles + 1))
				mv $file textfiles/
			fi
		done

		echo "Total number of bashscripts: $bashscripts"
		echo "Total number of textfiles: $textfiles"










	else
		echo "$target is not a directory"
		exit
	fi
fi

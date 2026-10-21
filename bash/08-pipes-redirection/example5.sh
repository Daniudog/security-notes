#!/bin/bash

# Exit codes - every command reports success or failure

# 0 means it succeeded
# non-zero means it failed.


# Examples
#ls doesnotexist.txt
#echo "Exit code: $?"

#ls output.txt
#echo "Exit code: $?"


# Using exit codes to make decision
#if ls doesnotexist.txt >/dev/null 2>&1; then
#	echo "File exists"
#else
#	echo "File does not exist"
#fi
# The 2>&1 means: send the stderr to where stdout is going - and in this case it is /dev/null
# Both outputs are send to /dev/null
# so the command runs silently and only its exit code matters


# && and || with exit codes
#mkdir backup && echo "Folder created successfully"
#rm doesnotexist || echo "could not delete. File probably does not exist"
# && runs the next command only if the first succeded. 
# || runs the next only if the first failed.

#exit - ending your script a specific code
if [[ ! -f "$1" ]]; then
	echo "File not found"
	exit 1
fi

echo "continuing..."
# exit 1 stops the script immediately and reports failure to whatever called it
# useful so other scripts (or you via $?) can tell your script failed without reading its output

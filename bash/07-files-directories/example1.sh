#!/bin/bash


# FILES AND DIRECTORIES


path="/home/dot/bashscripting/x.sh"

if [[ -e "$path" ]];
then
	echo "$path exists"
fi


if [[ -f "$path" ]];
then
	echo "$path is a regular file"
elif [[ -d "$path" ]];
then
	echo "$path is a directory"
else
	echo "unknown error"
fi


if [[ -r "$path" ]];
then
	echo "$path is readable"
fi

if [[ -w "$path" ]];
then
	echo "$path is writable"
fi

if [[ -x "$path" ]]; then
	echo "$path exists and is executable"
else
	echo "$path is not executable"
fi

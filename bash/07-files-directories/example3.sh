#!/bin/bash

# Looping over files and acting on them


for file in *.sh;
do
	if [[ -f $file ]]; then
		cp "$file" "backup_$file"
	else
		echo "$file is not a file"
	fi
done

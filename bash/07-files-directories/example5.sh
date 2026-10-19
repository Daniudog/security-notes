#!/bin/bash

# A function combining with module 6

safe_mkdir() {
	local dir=$1
	if [[ -d "$dir" ]]; then
		echo "$dir already exists"
		return 1
       	else
		mkdir -p "$dir"
 		echo "$dir created"
		return 0
	fi		
}

safe_mkdir "backups"

# NOTE: -p creates parent folders too and doesn't error if it exists

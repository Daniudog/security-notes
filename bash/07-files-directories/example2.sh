#!/bin/bash

# Listing and counting files






# List matching files
bashscripts=$(ls *.sh)
echo "Bashscripts: $bashscripts"


# count how many
total=$(ls *.sh | wc -l)
echo "Total Bashscripts: $total"

# find files by name, including in subfolders
find . -name "*.sh"

#!/bin/bash

# sed - finds and replace


echo "Hello World" | sed 's/World/Bash/'

# s/old/new/ means substitute. 
# Try it on a file.
# EXAMPLE: sed 's/ERROR/CRITICAL/' sample.log 
# This will print the result but wouldn't change the file
# To change the file with sed use the -i option. -i means "in place". it overwrites the original with no undo
# sed -i 's/ERROR/CRITICAL/' sample.log

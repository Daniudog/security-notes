#!/bin/bash

# cut - pulling out a column

# Basic Syntax: cut -d "" -f ""

echo "dot:x:1000:1000:Dot:/home/dot:/bin/bash" | cut -d ":" -f "2" # This should output 'x'
echo "dot:x:1000:1000:Dot:/home/dot:/bin/bash" | cut -d ":" -f "5" # This should output 'Dot'

# -d ":" sets the delimeter (what seperates the fields)
# -f "1" picks the field 1. -f "2" picks the field 2. -f "3" picks field 3 and so on

# What is really happening is:
#  1   2   3     4     5     6         7 
# dot: x: 1000: 1000: Dot: /home/dot: /bin/bash
#
# For more practices, try it on /etc/passwd

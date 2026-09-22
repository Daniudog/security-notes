#! /bin/bash

# Arguments — values typed after the script name

# Arguments let someone run your script and supply values in the same line, without it stopping to ask. 
# read is for when you want the script to pause and ask while it runs. 
# Real tools often use both.

echo "First argument: $1"
echo "Second argument: $2"
echo "All arguments: $@"
echo "Number of arguments: $#"

# Run it like this: bash argument.sh Dot Can do it
# $1, $2, ... are the arguments in order.
# $@ is all of them.
# $# is how many there are.

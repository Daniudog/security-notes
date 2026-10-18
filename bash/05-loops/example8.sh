#!/bin/bash

# Looping over arguments
# recall $@ is the total number of arguments: without any arguments provided the script will do nothing


for arg in "$@"

do	echo "Argument: $arg"

done

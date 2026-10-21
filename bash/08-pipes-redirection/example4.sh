#!/bin/bash

# Pipes - sending one command's output into another command as input


# Examples
# the 'ls' command should list the files in a particular directory and 
# send that output as input (pipe) into the other command, 'wc -l' that counts the lines
ls | wc -l


# chaining several pipes

ls -la | grep "sh" | wc -l

# This should list the files in the given directory, then from that list select only files with 'sh' and then count how many lines



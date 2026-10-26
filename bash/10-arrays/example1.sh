#!/bin/bash


# Arrays

# Examples

# creating and printing an array

colors=("red" "green" "blue")

echo "${colors[0]}"
# Indexing starts from 0


# print the whole array
# @ means all the content of the arrays
echo "${colors[@]}"

# count the array
# @ means “all of them”, # before an array means “count”
echo "${#colors[@]}"

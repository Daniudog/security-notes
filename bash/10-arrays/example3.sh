#!/bin/bash

# Adding to an array

colors=("red" "green" "blue")

echo "Before adding: ${colors[@]}"

colors+=("yellow")
echo "After adding: ${colors[@]}"

# += appends a new element without disturbing the existing ones
# remember to add the () too

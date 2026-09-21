#! bin/bash
# The second example in this module.

# Creating a variable to print the day of the week
 
today=$(date +%A)
# date +%A prints just the weekday name

echo "Today is $today"


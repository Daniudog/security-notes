#! /bin/bash
# The first line prints an empty value, because bash looks for a variable called fruits. 
#The second uses ${fruit} to mark exactly where the name ends. Use braces whenever text touches a variable.

fruit="mango"
echo "I like $fruits"
echo "I like ${fruit}s"


#Double quotes vs single quotes bash
name="dot"
echo "Hi $name"
echo 'Hi $name'
#Double quotes let bash swap in variables and $(...).
#Single quotes print everything exactly as written

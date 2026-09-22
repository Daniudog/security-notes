#!/bin bash

# ------------------------------------------------------------
# Topic:   Module 3 - User input and arguments
# Purpose: Greet a user using arguments and read
# Run:     chmod +x intro.sh && ./intro.sh [name] [language]
# ------------------------------------------------------------

# --- SETUP ---
# User's name variable with a default argument of stranger
name=${1:-"Stranger"}

# User's favourite language with a default argument of not specified
favourite=${2:-"not specified"}

# Asking the user for their current mood and storing in a variable
read -p "How are you feeling? " mood

# Asking the user for a password as a secret word
read -sp "Set a new password " password
echo
echo " Password created "

# --- LOGIC ---
summary="Your name is $name. Your favourite language is $favourite. You are $mood."

# --- OUTPUT ---
echo "Total number of arguments: $#"
echo "All arguments: $@"
echo "Summary: $summary"

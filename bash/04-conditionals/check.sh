#!/usr/bin/env bash
# ------------------------------------------------------------
# Topic:   Module 4 - Conditionals
# Purpose: Check whether a file exists and is a bash script
# Run:     chmod +x check.sh && ./check.sh [filename]
# ------------------------------------------------------------

# --- SETUP ---
# Take the filename as the first argument, default to intro.sh
file=${1:-"intro.sh"}

# --- LOGIC ---
# Check if the file exists using -f, then nest a second check
# inside for whether it ends in .sh. Nesting means the second
# check only runs if the first one already passed.
if [[ -f "$file" ]]; then
  file_exists=true
  if [[ "$file" == *.sh ]]; then
    is_script=true
  else
    is_script=false
  fi
else
  file_exists=false
fi

# --- OUTPUT ---
# Print exactly one message, based on what LOGIC found above
if [[ "$file_exists" == true && "$is_script" == true ]]; then
  echo "$file exists and is a bash script."
elif [[ "$file_exists" == true && "$is_script" == false ]]; then
  echo "$file exists but is not a bash script."
else
  echo "$file does not exist."
fi

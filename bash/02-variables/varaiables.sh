#!/usr/bin/env bash
# ------------------------------------------------------------
# Topic:   Module 2 - Variables and quoting
# Purpose: Build a small "about me" report using variables
# Run:     chmod +x variables.sh && ./variables.sh
# ------------------------------------------------------------

# --- SETUP ---
# Values I type myself
name="Dot"
project="Security Notes"   # contains a space, so it must be quoted

# Values that come from commands (each command runs only once)
user=$(whoami)
today=$(date +%A)
folder=$(pwd)

# --- LOGIC ---
# Combine several variables into one new variable
summary="$name is working on $project on $today"

# --- OUTPUT ---
echo "===== ABOUT ME ====="
echo "Name:    $name"
echo "Project: $project"
echo "User:    $user"
echo "Day:     $today"
echo "Folder:  $folder"
echo "Summary: $summary"

# Curly braces mark where the variable name ends
echo "${name}'s project is called $project"

# Double quotes swap in the value, single quotes print it as written
echo "Double quotes: $name"
echo 'Single quotes: $name'

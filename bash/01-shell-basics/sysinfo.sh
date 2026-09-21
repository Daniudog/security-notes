#!/usr/bin/env bash
# ------------------------------------------------------------
# Topic:   Module 1 - The shell and your first script
# Purpose: Print basic system info (date, user, folder, files)
# Run:     chmod +x sysinfo.sh && ./sysinfo.sh
# ------------------------------------------------------------

# --- SETUP ---
# No variables yet. They arrive in Module 2.

# --- LOGIC ---
# Title line so the output is easy to read
echo "===== SYSTEM INFO ====="

# $(command) runs the command and pastes its result into the text
echo "Date:           $(date)"
echo "User:           $(whoami)"
echo "Current folder: $(pwd)"

# Print the label first, then let ls print one file per line
echo "Files in this folder:"
ls

# --- OUTPUT ---
# Final message so we know the script reached the end
echo "Done."

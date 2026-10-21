#!/bin/bash
# ------------------------------------------------------------
# Topic:   Module 8 - Pipes, redirection, exit codes
# Purpose: Audit a log file for keyword counts and errors,
#          save a filtered copy of just the error lines
# Run:     chmod +x auditor.sh <logfile>
# ------------------------------------------------------------

# --- FUNCTIONS ---

# Value-producing: counts how many lines contain a keyword
count_keyword() {
  local keyword=$1
  local file=$2
  local total
  total=$(grep -ic "$keyword" "$file")
  echo "$total"
}

# Pass/fail: does the file contain ANY error lines?
has_errors() {
  local file=$1
  if grep -qi "error" "$file"; then
    return 0   # found at least one -> "pass" meaning yes, errors exist
  else
    return 1
  fi
}

# --- SETUP ---
file=$1

if [[ -z "$file" ]]; then
  echo "USAGE: ./auditor.sh <PATH>"
  exit 1
fi

if [[ ! -f "$file" || ! -r "$file" ]]; then
  echo "$file does not exist or is not readable"
  exit 1
fi

# --- LOGIC ---
error_count=$(count_keyword "ERROR" "$file")
warning_count=$(count_keyword "WARNING" "$file")

# Save just the error lines to a filtered file
grep -i "error" "$file" > errors_only.txt

# Only announce success if the file was actually created
[[ -f errors_only.txt ]] && echo "Filtered errors saved to errors_only.txt"

# --- OUTPUT ---
echo "-----------------------------"
echo "Audit of: $file"
echo "ERROR count:   $error_count"
echo "WARNING count: $warning_count"

if has_errors "$file"; then
  echo "Error check: FAIL (errors found)"
else
  echo "Error check: PASS (no errors found)"
fi
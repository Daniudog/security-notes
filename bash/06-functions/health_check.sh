#!/bin/bash
# ------------------------------------------------------------
# Topic:   Module 6 - Functions
# Purpose: Run a few pass/fail checks on the current folder
#          and print a PASS/FAIL report with a summary
# Run:     chmod +x health_check.sh && ./health_check.sh [filename]
# ------------------------------------------------------------

# --- FUNCTIONS ---

# Pass/fail check: does the given file exist?
check_exists() {
  local filename=$1
  if [[ -f "$filename" ]]; then
    return 0   # 0 = pass
  else
    return 1   # 1 = fail
  fi
}

# Pass/fail check: does the given file have content (not empty)?
check_not_empty() {
  local filename=$1
  if [[ -s "$filename" ]]; then
    return 0
  else
    return 1
  fi
}

# Pass/fail check: is there at least one .sh file in this folder?
check_has_scripts() {
  local sh_count
  sh_count=$(ls *.sh 2> /dev/null | wc -l)
  if [[ "$sh_count" -gt 0 ]]; then
    return 0
  else
    return 1
  fi
}

# Value-producing function: builds a formatted summary line.
# Uses echo + $(...), unlike the return-based checks above.
format_summary() {
  local passed=$1
  local failed=$2
  echo "Checks passed: $passed | Checks failed: $failed"
}

# --- SETUP ---
target=${1:-"health_check.sh"}
passed=0
failed=0

# --- LOGIC ---
# Each check is run, then turned into a PASS/FAIL line using its
# return status ($?) via a direct if-check on the function call.

echo "Checking: $target"

if check_exists "$target"; then
  echo "File exists: PASS"
  passed=$((passed + 1))
else
  echo "File exists: FAIL"
  failed=$((failed + 1))
fi

if check_not_empty "$target"; then
  echo "File not empty: PASS"
  passed=$((passed + 1))
else
  echo "File not empty: FAIL"
  failed=$((failed + 1))
fi

if check_has_scripts; then
  echo "Has .sh files in folder: PASS"
  passed=$((passed + 1))
else
  echo "Has .sh files in folder: FAIL"
  failed=$((failed + 1))
fi

# --- OUTPUT ---
echo "----------------------------"
summary=$(format_summary "$passed" "$failed")
echo "$summary"

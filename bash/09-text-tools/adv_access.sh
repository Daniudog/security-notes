#!/bin/bash
# ------------------------------------------------------------
# Topic:   Module 9 - Text tools (grep, cut, sed, awk)
# Purpose: Parse an access log, report level counts, isolate
#          server errors, and save a readable error report
# Run:     chmod +x access_log_report.sh <FILE>
# ------------------------------------------------------------

# --- FUNCTIONS ---

# Value-producing: counts matching lines for a given keyword
count_matches() {
	local keyword=$1
	local file=$2
	grep -ic "$keyword" "$file"
}

# Value-producing: extracts just the status value from a line
# e.g. "...action=login status=200" -> "200"
get_status() {
	local line=$1
	echo "$line" | awk -F"status=" '{print $2}'
}

# Pass/fail: true if there is at least one 500 status
has_server_errors() {
	local file=$1
	grep -q "status=500" "$file"
}

# --- SETUP ---
if [[ -z "$1" ]]; then
	echo "USAGE: ./access_log_report.sh <FILE>"
	exit 1
fi

file=$1

if [[ ! -f "$file" || ! -r "$file" ]]; then
	echo "$file does not exist or is not readable"
	exit 1
fi

report_file="server_errors_report.txt"

# --- LOGIC ---
info_count=$(count_matches "INFO" "$file")
warning_count=$(count_matches "WARNING" "$file")
error_count=$(count_matches "ERROR" "$file")
status500_count=$(grep -c "status=500" "$file")

# Build a readable report of just the 500 lines, saved to a file
grep "status=500" "$file" | sed 's/status=500/*** SERVER ERROR (500) ***/' > "$report_file"

if has_server_errors "$file"; then
	server_check="FAIL"
else
	server_check="PASS"
fi

# Demonstrate get_status on the first matching line, just to show the function works
sample_line=$(grep "status=500" "$file" | head -n 1)
if [[ -n "$sample_line" ]]; then
	sample_status=$(get_status "$sample_line")
fi

# --- OUTPUT ---
echo "============================="
echo " Access Log Report: $file"
echo "============================="
echo "INFO:    $info_count"
echo "WARNING: $warning_count"
echo "ERROR:   $error_count"
echo "-----------------------------"
echo "status=500 occurrences: $status500_count"
[[ -n "$sample_status" ]] && echo "Example extracted status value: $sample_status"
echo "-----------------------------"
echo "Server error check: $server_check"

if [[ "$server_check" == "FAIL" ]]; then
	echo "Details saved to $report_file"
	cat "$report_file"
fi
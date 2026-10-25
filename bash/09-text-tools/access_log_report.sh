
#!/bin/bash
# ------------------------------------------------------------
# Topic:   Module 9 - Text tools (grep, cut, sed, awk)
# Purpose: Parse an access log and report level counts and
#          server errors (status=500)
# Run:     chmod +x access_log_report.sh <FILE>
# ------------------------------------------------------------

# --- FUNCTIONS ---

# Value-producing: counts how many lines match a given level
count_level() {
	local level=$1
	local file=$2
	grep -ic "$level" "$file"
}

# Pass/fail: does the file contain any status=500 lines?
has_server_errors() {
	local file=$1
	if grep -q "status=500" "$file"; then
		return 0
	else
		return 1
	fi
}

# --- SETUP ---
if [[ -z "$1" ]]; then
	echo "USAGE: ./access_log_report.sh <FILE>"
	exit 1
fi

file=$1

if [[ ! -f "$file" || ! -r "$file" ]]; then
	echo "The file does not exist or is not readable"
	exit 1
fi

# --- LOGIC ---
warning_count=$(count_level "WARNING" "$file")
error_count=$(count_level "ERROR" "$file")
info_count=$(count_level "INFO" "$file")
status500_count=$(grep -c "status=500" "$file")

readable_errors=$(grep -in "status=500" "$file" | sed 's/status=500/status=500 [SERVER ERROR]/')

has_server_errors "$file" && errors_found="yes" || errors_found="no"

# --- OUTPUT ---
echo "-----------------------------"
echo "Report for: $file"
echo "WARNING count: $warning_count"
echo "ERROR count:   $error_count"
echo "INFO count:    $info_count"
echo "status=500 count: $status500_count"
echo "-----------------------------"
echo "Server error lines:"
echo "$readable_errors"
echo "-----------------------------"

if [[ "$errors_found" == "yes" ]]; then
	echo "Server error check: FAIL (errors found)"
else
	echo "Server error check: PASS (no errors found)"
fi
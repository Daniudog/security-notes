Classwork: access_log_report.sh

Build a script that parses a log file and extracts a structured report, combining grep, cut/awk, and sed with everything from Modules 1–8. This is the kind of tool used in real log analysis.

Test data first — make a fake access log:

bash
cat > access.log << 'EOF'
2026-10-20 09:15:02 INFO user=dot action=login status=200
2026-10-20 09:16:45 ERROR user=dot action=fetch status=500
2026-10-20 09:20:11 WARNING user=guest action=login status=401
2026-10-20 09:22:33 INFO user=admin action=delete status=200
2026-10-20 09:25:09 ERROR user=guest action=fetch status=500
2026-10-20 09:30:00 INFO user=dot action=logout status=200
EOF

Requirements:

Accept the log file as $1, no default — print usage and exit 1 if missing. Check it exists and is readable, same as Module 8.
Write a function count_level (reusing your Module 8 pattern) that counts lines for a given level (INFO, WARNING, ERROR), and call it for all three.
Use cut or awk to extract just the status= value from each line, and count how many lines have status=500 specifically (a server error) — this is new, think about how to isolate that one field.
Use grep to find all lines where status=500, and sed to transform those lines into something more readable (your choice — e.g. replace status=500 with status=500 [SERVER ERROR]), printing the result rather than editing the file.
Write a pass/fail function has_server_errors (Module 6 pattern) that checks if any status=500 lines exist.
In OUTPUT, print the level counts, the 500-count, the readable error lines from step 4, and a PASS/FAIL line from step 5. Use &&/|| at least once sensibly.
Full script standard, all paths quoted.

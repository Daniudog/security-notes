Classwork: log_auditor.sh

Build a script that audits a log file and produces a filtered summary, combining pipes, redirection, and exit codes with everything from Modules 1–7. This is a realistic security/sysadmin-flavored tool: checking a log for errors without having to read the whole thing.

Requirements:

Accept a log file path as an argument ($1), with no hardcoded default this time — if it’s missing, print a usage message and exit 1.
Check the file exists and is readable (-f, -r). If not, print an error and exit 1.
Write a function that counts how many lines in the file contain a given keyword, using a pipe (grep "$keyword" "$file" | wc -l), and echos the count back (value-producing, Module 6 pattern).
Use that function to count occurrences of at least two keywords — e.g. "ERROR" and "WARNING" — in the log.
Write a second function, this one pass/fail (return), that checks whether the log has any errors at all (hint: you can check the grep count, or use grep -q "$keyword" "$file" directly, which exits 0/1 without printing anything — look up -q).
Use > to write a filtered copy of just the error lines into a new file, e.g. errors_only.txt (hint: grep "ERROR" "$file" > errors_only.txt).
Use && or || at least once sensibly, e.g. to print a message right after the filtered file is created, or to react to the pass/fail check from step 5.
In OUTPUT, print the keyword counts, whether errors were found (PASS/FAIL style, like health_check.sh), and confirm where the filtered file was saved.
Full script standard throughout, all paths quoted.

To test it, make a small fake log file first:

bash
cat > sample.log << 'EOF'
INFO: service started
WARNING: low disk space
ERROR: failed to connect to database
INFO: retrying
ERROR: connection timed out
WARNING: slow response
INFO: service stopped
EOF

(That << is a heredoc — a quick way to create a multi-line file. We’ll cover it properly in a later module, but it’s handy for test data now.)

Write it yourself

e both unquoted — risky if a value ever had a space.
No section labels (SETUP / LOGIC / OUTPUT) and no header comment.
2>&1 on echo "..." > error_only.txt 2>&1 does nothing useful — echo essentially never fails or writes to stderr, so there’s nothing for 2>&1 to redirect. It’s harmless here, but it’s not doing a real job — a sign of copying the pattern without the specific reason behind it.

Module 9 Note: Text tools (grep, cut, sed, awk)

1. grep — finding lines

Flag	Meaning
grep "pattern" file	print matching lines
-i	case-insensitive
-v	invert — lines NOT matching
-c	just the count
-n	show line numbers
-q	quiet — no output, just sets exit code (0 = found, 1 = not found)
-E	extended regex, e.g. `grep -E “ERROR

Example:
grep -ic "error" sample.log      # case-insensitive count
grep -q "status=500" sample.log  # silent, for use in if

2. cut — pulling out a column by delimiter

echo "dot:x:1000:Dot:/bin/bash" | cut -d ":" -f 1

-d sets the delimiter, -f picks the field number(s). Good for fixed-format text like /etc/passwd. Struggles with data that doesn’t split cleanly on one character.

3. sed — find and replace

sed 's/old/new/' file       # print result, file unchanged
sed -i 's/old/new/' file    # edit the file in place (no undo — test without -i first)

4. awk — working with columns, more powerful

awk '{print $1}'              # first whitespace-separated field
awk -F"=" '{print $2}'        # custom delimiter, like cut but more flexible
awk '/ERROR/ {print}'         # pattern match, like grep
awk '{print NR, $0}'          # NR = line number, $0 = whole line

awk’s $1, $2... are columns, unrelated to bash’s $1 meaning “first script argument.”

Chaining tools in a pipeline
grep "ERROR" sample.log | cut -d ":" -f 1
grep "status=500" access.log | sed 's/status=500/[SERVER ERROR]/'

Capturing results for later use
count=$(grep -c "ERROR" sample.log)
status=$(echo "$line" | awk -F"status=" '{print $2}')

Choosing a tool

Fixed, simple delimiter, one field → cut
Flexible delimiter, pattern matching, or multiple fields → awk
Just counting/finding lines → grep
Replacing text → sed

Common mistakes

Forgetting grep is case-sensitive by default — use -i when needed.
Using sed -i before confirming the plain (non -i) output looks right.
Piping into a command that then also takes a filename argument (e.g. grep | sed file) — the file ends up in the wrong place and the pipe gets ignored. Keep the filename attached to the command that should read the file.
Treating a non-local variable inside a function as if each call gets its own copy — it doesn’t; repeated calls overwrite the same value unless you capture each call’s result separately.

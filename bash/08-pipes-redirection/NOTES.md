Module 8 Note: Pipes, redirection, exit codes

(Save as NOTES.md in bash/08-pipes-redirection/.)

Redirection

Syntax	Meaning
cmd > file	Send output to file, overwrite
cmd >> file	Send output to file, append
cmd < file	Feed file in as input
cmd 2> file	Send only errors (stderr) to file
cmd > out 2> err	stdout and stderr to separate files
cmd > /dev/null 2>&1	Discard both output and errors

Every command has two output streams: stdout (stream 1, normal output) and stderr (stream 2, errors). /dev/null is a special file that discards anything sent to it.

Pipes

cmd1 | cmd2 feeds cmd1’s output straight into cmd2 as input, instead of printing it. Chain several: ls -la | grep ".sh" | wc -l — list, filter, count.

Exit codes

Every command reports 0 (success) or non-zero (failure) via $?, same convention as return from Module 6.

bash
if ls realfile.txt > /dev/null 2>&1; then
  echo "found"
fi

&& and ||

cmd1 && cmd2 — run cmd2 only if cmd1 succeeded.
cmd1 || cmd2 — run cmd2 only if cmd1 failed.

exit
exit 1 (or any non-zero number) stops your script immediately and reports failure to whatever called it, letting other scripts or $? detect the failure without reading your script’s printed output.

grep flags worth knowing

-i — case-insensitive match
-q — quiet, prints nothing, just sets the exit code (great for if grep -q ...; then)
-c — print a count of matching lines directly, instead of piping to wc -l

Common mistakes

Assuming grep is case-insensitive by default — it isn’t; use -i.
Writing a separate function per keyword instead of one generic function taking the keyword as an argument.
Piping to wc -l when grep -c already does the counting in one step.
Using 2>&1 out of habit on commands (like echo) that rarely produce errors or write to stderr in the first place.

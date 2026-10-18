Module 5 Note: Loops

What is it?
A loop repeats a block of code without you writing it out multiple times.

for — repeat over a known list

bash
for color in red green blue; do
  echo "Color: $color"
done

for — repeat over a range

bash
for i in {1..5}; do
  echo "Count: $i"
done

for — repeat over matching files (glob)

bash
for file in *.sh; do
  echo "Found: $file"
done

C-style for — when you need a counter

bash
for ((i=1; i<=5; i++)); do
  echo "i is $i"
done

Three parts: start, stop condition, what changes each time.

while — repeat while something is true

bash
count=1
while [[ $count -le 5 ]]; do
  echo "Count is $count"
  count=$((count + 1))
done

Checked before each run. $((...)) does arithmetic.

until — repeat until something becomes true

bash
n=1
until [[ $n -gt 5 ]]; do
  echo "n is $n"
  n=$((n + 1))
done

The opposite of while.

break and continue

bash
for i in {1..10}; do
  if [[ $i -eq 4 ]]; then
    continue   # skip the rest of this round, go to the next one
  fi
  if [[ $i -eq 7 ]]; then
    break      # exit the loop entirely
  fi
  echo "$i"
done

Looping over arguments

bash
for arg in "$@"; do
  echo "Argument: $arg"
done

Common mistakes

A while loop with no line that changes the condition variable never ends (infinite loop).
Forgetting to quote "$file" inside the loop body — breaks on filenames with spaces.
Repeating the same block for every possible case (one per elif) instead of writing the shared logic once and branching only where it actually differs.

Classwork: filescanner.sh

Build a script that reviews files in a folder and reports on them, combining loops with everything from Modules 1–4.

Requirements:

Accept a target file extension as an argument (e.g. sh, txt), defaulting to sh if not given (Module 3).
Loop over every file in the current folder matching that extension (Module 5, globs).
For each file, use a conditional to check (Module 4):
if it’s empty (hint: the test is -s, meaning “has size greater than zero” — look it up and use ! to flip it, or find the opposite test)
otherwise, count how many lines it has (hint: wc -l gives a line count; use $(...) to capture it)
Keep a running counter of how many files were checked and how many were empty, using a while or for loop with a counter variable (Module 2/5).
Skip (continue) any file whose name starts with a dot (hidden files), if you happen to encounter one.
Print a per-file line as you go, plus a summary at the end with the totals.
Follow the script standard: shebang, header, SETUP / LOGIC / OUTPUT, comments throughout.

This is a genuinely useful script — it’s a quick way to audit a folder of scripts or notes before committing them.

Write it yourself first. If you get stuck on one specific piece (like the “file is empty” test), research about it and go again, review your code if possible. Getting stuck is the learning process. Test it inside your bash/ folder where you have real .sh files to check.







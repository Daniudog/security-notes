Module 5 Note: Loops

(Save as NOTES.md in bash/05-loops/.)

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

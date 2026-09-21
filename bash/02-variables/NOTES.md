Variables
A variable is a named box that holds a value. Store a value once, then reuse it anywhere in your script.
<img width="928" height="453" alt="image" src="https://github.com/user-attachments/assets/5c3b458d-ab93-4fa5-b8de-28c31de38592" />

Why quote variables?
Bash replaces $file with its value and then splits the result at every space. If file="my notes.txt", then touch $file creates two files, my and notes.txt. touch "$file" creates one. Always write "$variable".

Naming rules

- Letters, digits, and underscores only.
- Can't start with a digit.
- Convention: lowercase for your own variables (user_name).


Common mistakes:

- Spaces around = (name = "Dot") give command not found.
- Using single quotes when you wanted the value gives the literal $name.
- Forgetting quotes around a value with spaces splits it into pieces.
- Writing $fruits when you meant ${fruit}s reads the wrong variable.

Debug trick: printf '[%s]\n' $var shows how many pieces bash sees.

Module 2 Checkpoint: variables.sh

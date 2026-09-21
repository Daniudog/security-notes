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

Write a script that builds a small "about me" report. Requirements:

- Shebang, comment header (topic, purpose, how to run), and the three sections SETUP, LOGIC, OUTPUT.
- In SETUP, define all your variables:
- name: your name, hardcoded
- project: a value that contains a space, like "Security Notes"
- user: from whoami
- today: the weekday from date +%A
- folder: from pwd
- Each command (whoami, date, pwd) may be called once. Reuse the variables afterwards.
- In LOGIC, build a summary variable that combines at least two of the others, for example one that says who you are and what project you're working on.

 In OUTPUT, print:
- a title line
- each variable with a label, always written as "$variable"
- one line that uses ${...} braces, like ${name}'s
- two lines that show double vs single quotes, printing the same text both ways
- Comment every section and every group of commands.

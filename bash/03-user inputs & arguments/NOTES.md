User input and arguments

What is it?
Scripts can react to the person running them two ways: read pauses and asks a question while running; arguments are values typed right after the script name when it's launched.

read:
<img width="930" height="207" alt="image" src="https://github.com/user-attachments/assets/421203c0-9903-4e94-bc90-5d914d83b970" />



Arguments:
<img width="929" height="260" alt="image" src="https://github.com/user-attachments/assets/15d1697a-c490-4d0b-b0d0-71a9b9af30b9" />

Run arguments like: bash script.sh value1 value2

When to use which:

Arguments: values known up front, one command to run the whole thing.
read: values you want the script to ask for as it goes, or that shouldn't be typed in the command itself (like passwords).

Common mistakes

- Forgetting the space inside "text " in read -p, so typed input runs into the prompt.
- Assuming $1 exists without checking. If no argument was given, $1 is empty. Use ${1:-"default"} or check $# first.
- Confusing $@ (all arguments) with $# (count of arguments).


Module 3 Checkpoint: intro.sh

Write a script that greets a user, combining arguments and read. Requirements:

- Shebang, comment header, and SETUP / LOGIC / OUTPUT sections.
- Accept the user's name as the first argument ($1). If it's missing, default to "stranger".
- Accept a second argument for their favorite language ($2). If missing, default to "not specified".
- Use read -p to ask the user for their current mood (typed while running, not an argument).
- Use read -sp to ask for a "secret word", and confirm it was received without showing it.
- In LOGIC, build one summary variable combining the name, language, and mood.
- In OUTPUT, print:
- $# (how many arguments were given)
- $@ (all arguments)
- the summary
- Comment every section and command group.

Test it two ways and check both outputs match what you expect:

- bash intro.sh Dot Python
- bash intro.sh

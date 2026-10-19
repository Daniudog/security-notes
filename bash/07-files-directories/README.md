Had to add the classwork to the README file.

Classwork: cleanup_organizer.sh

Build a script that organizes a messy folder by file type, moving files into subfolders based on their extension — a genuinely useful tool for tidying up a downloads or notes folder.

Requirements:

Accept a target folder as an argument ($1), defaulting to the current folder (.) if not given.
Check the target folder actually exists and is a directory before doing anything — if not, print an error and stop.
Write a function that takes a filename and returns its extension (think about how you’d pull .sh out of health_check.sh — basename combined with a method of your choice, or look into ${file##*.} if you want a challenge).
For each file in the target folder (skip directories, skip hidden files):
work out its extension
create a subfolder named after that extension if it doesn’t already exist (mkdir -p)
move the file into that subfolder
Keep counters: files moved, folders created, files skipped (e.g. no extension, or hidden).
Print a line per file as it’s processed, and a summary at the end.
Full script standard throughout, and quote every path variable, especially anything near mv.

Test it somewhere safe — make a throwaway test folder with a handful of files like a.txt, b.sh, c.log, .hidden, noextension, and run the script against that, not your real repo.

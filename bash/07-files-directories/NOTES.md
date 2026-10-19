Module 7 Note: Files and directories

Existence and type checks

Test	Checks
-e "$path"	exists (file or directory)
-f "$path"	exists and is a regular file
-d "$path"	exists and is a directory
-r / -w / -x	readable / writable / executable

Creating

mkdir name — fails if it already exists
mkdir -p a/b/c — creates parent folders too, no error if it exists
touch file — creates an empty file

Copying, moving, deleting

cp source dest, cp -r dir1 dir2 (recursive, needed for folders)
mv old new — rename or move
rm file, rm -r folder — delete. Destructive, no confirmation. Always quote the variable: rm -r "$target", not rm -r $target, since an unquoted or empty variable can delete the wrong thing or behave unpredictably.

Listing and searching

ls *.sh — list matching files (current folder only)
ls *.sh | wc -l — count them
find . -name "*.sh" — search recursively into subfolders

Path parts

basename "$path" — just the filename
dirname "$path" — just the folder
"${name##*.}" — strips everything up to and including the last ., leaving just the extension

Common mistakes

Looping over * in the current folder when you meant to loop inside a target folder — use "$target"/*.
Writing one classifier function per file type instead of one generic function (extension extraction) that works for all of them.
continue only works inside a loop. Using it inside a plain function does nothing.
Unquoted paths near mv/rm/mkdir — always quote.

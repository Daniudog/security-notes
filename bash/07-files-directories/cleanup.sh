#!/bin/bash
# ------------------------------------------------------------
# Topic:   Module 7 - Files and directories
# Purpose: Organize a folder by moving files into subfolders
#          named after their extension
# Run:     chmod +x cleanup.sh && ./cleanup.sh [folder]
# ------------------------------------------------------------

# --- FUNCTIONS ---

# Extracts the extension from a filename, e.g. "notes.txt" -> "txt"
# Prints "none" if the file has no extension
get_extension() {
  local file=$1
  local name
  name=$(basename "$file")
  if [[ "$name" != *.* ]]; then
    echo "none"
  else
    echo "${name##*.}"
  fi
}

# --- SETUP ---
target=${1:-"."}
moved=0
created=0
skipped=0

# --- LOGIC ---

if [[ ! -e "$target" ]]; then
  echo "$target does not exist"
  exit 1
fi

if [[ ! -d "$target" ]]; then
  echo "$target is not a directory"
  exit 1
fi

echo "-----------------------------"
echo "Organizing $target"
echo "-----------------------------"

for file in "$target"/*; do
  name=$(basename "$file")

  # skip directories
  if [[ -d "$file" ]]; then
    continue
  fi

  # skip hidden files
  if [[ "$name" == .* ]]; then
    echo "$name skipped (hidden)"
    skipped=$((skipped + 1))
    continue
  fi

  ext=$(get_extension "$file")

  if [[ "$ext" == "none" ]]; then
    echo "$name skipped (no extension)"
    skipped=$((skipped + 1))
    continue
  fi

  dest="$target/$ext"

  if [[ ! -d "$dest" ]]; then
    mkdir -p "$dest"
    echo "Created folder: $ext"
    created=$((created + 1))
  fi

  mv "$file" "$dest/"
  echo "$name -> $ext/"
  moved=$((moved + 1))
done

# --- OUTPUT ---
echo "-----------------------------"
echo "Files moved:    $moved"
echo "Folders created: $created"
echo "Files skipped:   $skipped"

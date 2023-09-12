#!/bin/bash -x

# GOAL: here to build a script that removes files that have been marked for deletion

# make temp directory to work in
mktemp -d tmp_clean-XXXX
# extract and uncompress inputted archive into tmp directory
tar -xzf "$1" --directory tmp_clean*
# search for files containing "DELETE ME!" and removes those files
grep -rl "DELETE ME!" tmp_clean* | xargs rm
# move into tmp directory
cd tmp_clean* || exit
# make a compressed archive using this file name in the new name
tar -czf "cleaned_$1" -- *
# Move the newley created archive to the main cleaning directory
mv "cleaned_$1" ..
# Delete tmp directory
(
cd ..
rm -r tmp_clean*
)


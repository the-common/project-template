#!/bin/sh
 
if git rev-parse --verify HEAD >/dev/null 2>&1
then
        against=HEAD
else
        # Initial commit: diff against an empty tree object
        against=$(git hash-object -t tree /dev/null)
fi
 
# Redirect output to stderr.
exec 1>&2
 
# Run astyle on all .cpp/.hpp files
exec git diff --name-only | grep -E "*.c|*.h|*.cpp|*.cc|*.hpp" | xargs astyle --options="Coding_style_configurations/C_CPP_code.astylerc" --suffix=none 

exit 0
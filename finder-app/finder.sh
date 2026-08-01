#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Error: expected 2 arguments" >&2
    exit 1
fi

filesdir=$1
searchstr=$2

if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "Error: both filesdir and searchstr must be provided" >&2
    exit 1
fi

if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory" >&2
    exit 1
fi

file_count=$(find "$filesdir" -type f | wc -l)
matching_lines=$(grep -R -n -F "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are ${file_count} and the number of matching lines are ${matching_lines}"

#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Error: expected 2 arguments" >&2
    exit 1
fi

writefile=$1
writestr=$2

if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: both writefile and writestr must be provided" >&2
    exit 1
fi

write_dir=$(dirname "$writefile")
mkdir -p "$write_dir"

if ! touch "$writefile" 2>/dev/null; then
    echo "Error: could not create file '$writefile'" >&2
    exit 1
fi

printf '%s' "$writestr" > "$writefile"

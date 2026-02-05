#!/bin/bash

dirA=$1
dirB=$2

echo "Files only in dirA:"
comm -23 <(ls "$dirA" | sort) <(ls "$dirB" | sort)

echo "Files only in dirB:"
comm -13 <(ls "$dirA" | sort) <(ls "$dirB" | sort)

echo "Common files content check:"
for file in $(ls "$dirA")
do
    if [ -f "$dirB/$file" ]; then
        if cmp -s "$dirA/$file" "$dirB/$file"; then
            echo "$file -> Same"
        else
            echo "$file -> Different"
        fi
    fi
done

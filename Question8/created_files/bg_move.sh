#!/bin/bash

dir=$1

mkdir -p "$dir/backup"

for file in "$dir"/*
do
    if [ -f "$file" ]; then
        mv "$file" "$dir/backup/" &
        echo "Background Move PID: $!"
    fi
done

wait
echo "All background move operations completed."

#!/bin/bash

file=$1

words=$(tr -c '[:alpha:]' '\n' < "$file" | tr 'A-Z' 'a-z')

echo "$words" | grep -E '^[aeiou]+$' > vowels.txt
echo "$words" | grep -E '^[bcdfghjklmnpqrstvwxyz]+$' > consonants.txt
echo "$words" | grep -E '^[bcdfghjklmnpqrstvwxyz].*[aeiou].*' > mixed.txt

echo "Files created: vowels.txt, consonants.txt, mixed.txt"

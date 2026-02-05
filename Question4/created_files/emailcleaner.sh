#!/bin/bash

grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt | sort | uniq > valid.txt
grep -Ev '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt

echo "Valid emails saved to valid.txt"
echo "Invalid emails saved to invalid.txt"

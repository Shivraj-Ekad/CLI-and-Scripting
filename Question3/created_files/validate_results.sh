#!/bin/bash

fail_one=0
pass_all=0

while IFS=, read roll name m1 m2 m3
do
    fail=0

    for mark in $m1 $m2 $m3
    do
        if [ $mark -lt 33 ]; then
            fail=$((fail+1))
        fi
    done

    if [ $fail -eq 1 ]; then
        echo "Failed in exactly one subject: $name"
        fail_one=$((fail_one+1))
    fi

    if [ $fail -eq 0 ]; then
        echo "Passed all subjects: $name"
        pass_all=$((pass_all+1))
    fi

done < marks.txt

echo "Count failed in one subject: $fail_one"
echo "Count passed all subjects: $pass_all"

#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 logfile"
    exit 1
fi

file=$1

if [ ! -f "$file" ] || [ ! -r "$file" ]; then
    echo "Error: File not found or not readable"
    exit 1
fi

total=$(wc -l < "$file")
info=$(grep -c "INFO" "$file")
warn=$(grep -c "WARNING" "$file")
error=$(grep -c "ERROR" "$file")

recent_error=$(grep "ERROR" "$file" | tail -1)

echo "Total entries: $total"
echo "INFO: $info"
echo "WARNING: $warn"
echo "ERROR: $error"
echo "Most recent ERROR: $recent_error"

date_now=$(date +%F)
report="logsummary_$date_now.txt"

echo "Log Summary - $date_now" > $report
echo "Total:$total INFO:$info WARNING:$warn ERROR:$error" >> $report
echo "Recent ERROR:$recent_error" >> $report

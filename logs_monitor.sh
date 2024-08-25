#!/bin/bash

# Define the log file to monitor
LOG_FILE="./systems.log"

# Define the keywords to look for
KEYWORDS="ERROR FAIL"

echo "Monitoring the log file for ERROR or FAIL messages..."

# Continuously read new lines from the log file
tail -f "$LOG_FILE" | while read line; do
    # Check if the line contains "ERROR" or "FAIL"
    if echo "$line" | grep -q "ERROR"; then
        echo "ALERT: Found an ERROR!"
        echo "$line"
    elif echo "$line" | grep -q "FAIL"; then
        echo "ALERT: Found a FAIL!"
        echo "$line"
    fi
done

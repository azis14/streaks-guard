#!/bin/bash

COUNTER_FILE=".commit_counter"
README_FILE="README.md"

# Initialize counter if file doesn't exist
if [ ! -f "$COUNTER_FILE" ]; then
  echo 0 > "$COUNTER_FILE"
fi

# Read current counter
count=$(cat "$COUNTER_FILE")

# Increment counter
count=$((count + 1))

# Get the current timestamp in the format YYYY-MM-DD HH:MM:SS
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Append the clock-in line to the README file
# The '>>' operator appends to the file without overwriting it.
echo "clock-in: $TIMESTAMP" >> "$README_FILE"

echo "Appended clock-in to $README_FILE"

# Stage the updated README file so it's included in the commit
git add .

# Commit with the updated message and the changed README
git commit -m "day $count"

# Push the changes to the remote repository
git push origin main

# Update counter file for the next run
echo $count > "$COUNTER_FILE"

echo "Committed with message: day $count"
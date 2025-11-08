#!/bin/bash
# This script monitors a log file for specific keywords.
# It uses 'tail' to read the end of a file.

# --- Configuration ---
LOG_FILE="/var/log/syslog"
# We are looking for lines that contain "ERROR"
KEYWORD="ERROR"

# --- Execution ---
echo "--- Starting Log Monitor for: $KEYWORD ---"
echo "Watching $LOG_FILE..."

# Use 'tail' to get the last 50 lines of the log
# Then, use 'grep' to filter for our keyword.
# 'sudo' is needed as /var/log/syslog is a protected file.
sudo tail -n 50 $LOG_FILE | grep "$KEYWORD"

if [ $? -eq 0 ]; then
  echo "--- Alert: $KEYWORD found in recent logs. ---"
else
  echo "--- No new '$KEYWORD' entries found. ---"
fi

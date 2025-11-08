#!/bin/bash
# This script monitors a log file for keywords and logs its findings.

# --- Configuration ---
LOG_FILE_TO_WATCH="/var/log/syslog"
KEYWORD="ERROR"

# Get the directory where this script is located
SCRIPT_DIR=$(dirname "$0")
LOG_FILE="$SCRIPT_DIR/logs/maintenance.log"

# --- Logging Function ---
log_message() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# --- Execution ---
log_message "--- Log Monitor Started ---"
echo "--- Starting Log Monitor for: $KEYWORD ---"

# We create a variable to hold the results
FOUND_LOGS=$(sudo tail -n 50 $LOG_FILE_TO_WATCH | grep "$KEYWORD")

if [ $? -eq 0 ]; then
    log_message "ALERT: $KEYWORD found in recent logs."
    log_message "Found Entries: $FOUND_LOGS"
    echo "--- Alert: $KEYWORD found in recent logs. See logs/maintenance.log for details. ---"
else
    log_message "--- No new '$KEYWORD' entries found. ---"
    echo "--- No new '$KEYWORD' entries found. ---"
fi

log_message "--- Log Monitor Finished ---"

#!/bin/bash
# A simple backup script with logging and error handling.

# --- Configuration ---
SOURCE_DIR="/home/uvaers/Documents"
BACKUP_ROOT="/home/uvaers/backups"
TIMESTAMP=$(date +%Y-%m-%d)
DEST_DIR="$BACKUP_ROOT/docs_backup_$TIMESTAMP"

# Get the directory where this script is located
SCRIPT_DIR=$(dirname "$0")
LOG_FILE="$SCRIPT_DIR/logs/maintenance.log"

# --- Logging Function ---
# This function appends a message to the log file with a timestamp.
log_message() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# --- Execution ---
log_message "--- Backup Script Started ---"
log_message "Starting backup of $SOURCE_DIR..."

# Create the root backup directory if it doesn't exist
mkdir -p $BACKUP_ROOT
log_message "Backup directory $BACKUP_ROOT is ready."

# Create the timestamped destination directory
mkdir $DEST_DIR
log_message "Created new backup folder: $DEST_DIR"

# Copy the source to the destination recursively and log the output
cp -r $SOURCE_DIR $DEST_DIR >> "$LOG_FILE" 2>&1

# Error Handling: Check the exit status of the last command
if [ $? -eq 0 ]; then
    log_message "Backup complete! Files copied to $DEST_DIR"
    echo "Backup successful. See logs/maintenance.log for details."
else
    log_message "ERROR: Backup failed. 'cp' command returned an error."
    echo "ERROR: Backup failed. Check logs/maintenance.log."
fi

log_message "--- Backup Script Finished ---"

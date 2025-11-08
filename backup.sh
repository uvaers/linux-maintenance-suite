#!/bin/bash
# A simple backup script
# This script creates a timestamped backup of the ~/Documents folder

# --- Configuration ---
# Set the source directory you want to back up
SOURCE_DIR="/home/uvaers/Documents"

# Set the main backup destination folder
BACKUP_ROOT="/home/uvaers/backups"

# Create a timestamp (e.g., 2025-11-08)
TIMESTAMP=$(date +%Y-%m-%d)

# Set the final destination for this specific backup
DEST_DIR="$BACKUP_ROOT/docs_backup_$TIMESTAMP"

# --- Execution ---
echo "Starting backup of $SOURCE_DIR..."

# Create the root backup directory if it doesn't exist
# We use 'mkdir' to create a new folder
mkdir -p $BACKUP_ROOT
echo "Backup directory $BACKUP_ROOT is ready."

# Create the timestamped destination directory
mkdir $DEST_DIR
echo "Created new backup folder: $DEST_DIR"

# Copy the source to the destination recursively
# We use 'cp -r' to copy directories
cp -r $SOURCE_DIR $DEST_DIR

echo "Backup complete! Files copied to $DEST_DIR"

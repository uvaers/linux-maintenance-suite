#!/bin/bash
# This script updates and cleans the system using apt, with logging.
# (REMOVED 'sudo' for Docker compatibility)

# Get the directory where this script is located
SCRIPT_DIR=$(dirname "$0")
LOG_FILE="$SCRIPT_DIR/logs/maintenance.log"

# --- Logging Function ---
log_message() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

log_message "--- Update Script Started ---"
echo "--- Starting System Update (see logs/maintenance.log for detailed output) ---"

# --- Step 1: apt update ---
log_message "Running 'apt update'..."
apt update >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log_message "ERROR: 'apt update' failed."
    echo "ERROR: 'apt update' failed. Check log."
    log_message "--- Update Script Finished with Errors ---"
    exit 1
fi
log_message "'apt update' successful."
echo "Step 1/3: Update complete."

# --- Step 2: apt upgrade ---
log_message "Running 'apt upgrade -y'..."
apt upgrade -y >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log_message "ERROR: 'apt upgrade' failed."
    echo "ERROR: 'apt upgrade' failed. Check log."
    log_message "--- Update Script Finished with Errors ---"
    exit 1
fi
log_message "'apt upgrade' successful."
echo "Step 2/3: Upgrade complete."

# --- Step 3: apt autoremove ---
log_message "Running 'apt autoremove -y'..."
apt autoremove -y >> "$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log_message "ERROR: 'apt autoremove' failed."
    echo "ERROR: 'apt autoremove' failed. Check log."
    log_message "--- Update Script Finished with Errors ---"
    exit 1
fi
log_message "'apt autoremove' successful."
echo "Step 3/3: Autoremove complete."

log_message "--- Maintenance Complete ---"
echo "--- System Maintenance Finished Successfully ---"

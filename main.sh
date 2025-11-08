#!/bin/bash
# This is the main menu for the maintenance suite.
# It runs the other scripts and logs menu actions.

# Get the directory where this script is located
SCRIPT_DIR=$(dirname "$0")
LOG_FILE="$SCRIPT_DIR/logs/maintenance.log"

# --- Logging Function ---
log_message() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Log the start of the menu
log_message "--- Main Menu Started ---"

while true; do
    echo "--- Linux Maintenance Suite ---"
    echo "1. Run Backup (backup.sh)"
    echo "2. Run System Update (update.sh)"
    echo "3. Monitor System Logs (monitor_logs.sh)"
    echo "4. Exit"
    echo "---------------------------------"
    read -p "Please select an option (1-4): " choice

    case $choice in
        1)
            log_message "Menu: Option 1 (Backup) selected."
            echo "Running backup script..."
            bash "$SCRIPT_DIR/backup.sh"
            ;;
        2)
            log_message "Menu: Option 2 (Update) selected."
            echo "Running system update script..."
            bash "$SCRIPT_DIR/update.sh"
            ;;
        3)
            log_message "Menu: Option 3 (Log Monitor) selected."
            echo "Running log monitoring script..."
            bash "$SCRIPT_DIR/monitor_logs.sh"
            ;;
        4)
            log_message "Menu: Option 4 (Exit) selected. Exiting."
            echo "Exiting suite. Goodbye."
            break
            ;;
        *)
            log_message "Menu: Invalid option '$choice' entered."
            echo "Invalid option. Please try again."
            ;;
    esac

    echo ""
    read -p "Press Enter to return to the menu..."
done

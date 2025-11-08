#!/bin/bash
# This is the main menu for the maintenance suite.
# It runs the other scripts.

# Get the directory where this script is located
SCRIPT_DIR=$(dirname "$0")

# Loop until the user chooses to exit
while true; do
    # Display the menu
    echo "--- Linux Maintenance Suite ---"
    echo "1. Run Backup (backup.sh)"
    echo "2. Run System Update (update.sh)"
    echo "3. Monitor System Logs (monitor_logs.sh)"
    echo "4. Exit"
    echo "---------------------------------"
    read -p "Please select an option (1-4): " choice

    # 'case' statement to handle the user's choice
    case $choice in
        1)
            echo "Running backup script..."
            # Call the script using its path
            bash "$SCRIPT_DIR/backup.sh"
            ;;
        2)
            echo "Running system update script..."
            bash "$SCRIPT_DIR/update.sh"
            ;;
        3)
            echo "Running log monitoring script..."
            bash "$SCRIPT_DIR/monitor_logs.sh"
            ;;
        4)
            echo "Exiting suite. Goodbye."
            break # Exit the while loop
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac

    echo "" # Add a blank line for readability
    read -p "Press Enter to return to the menu..."
done

# Linux Maintenance Suite

This repository is my submission for the Capstone Project. It is a simple suite of Bash scripts designed to automate common system maintenance tasks on a Linux (Ubuntu/Debian-based) system.

## Features

* **Interactive Menu:** An easy-to-use menu (`main.sh`) to run all tasks.
* **Automated Backups:** Creates a timestamped backup of your `Documents` folder into `~/backups`.
* **System Updater:** Safely updates package lists, upgrades all installed packages, and cleans up old dependencies.
* **Log Monitor:** Quickly scans your `syslog` for lines containing "ERROR".
* **Full Logging:** All actions are automatically recorded in the `logs/maintenance.log` file for easy review.

## How to Run

1.  Clone this repository.
2.  Navigate into the `linux-maintenance-suite` directory.
3.  Run the main menu:

    ```bash
    bash main.sh
    ```
4.  Follow the on-screen prompts.

## Scripts Included

* `main.sh`: The main menu you run.
* `backup.sh`: Handles the backup process.
* `update.sh`: Runs `apt update`, `upgrade`, and `autoremove`.
* `monitor_logs.sh`: Checks `/var/log/syslog` for errors.
* `.gitignore`: Tells Git to ignore the `logs/` directory.

## Credits

Done by- Nishant Kumar Jena[2241010042]

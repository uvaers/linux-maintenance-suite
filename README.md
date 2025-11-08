# Linux Maintenance Suite
This repository contains a suite of Bash scripts for basic Linux system maintenance, as required for the Capstone Project.

## Features
- **Menu-Driven:** A simple main menu (`main.sh`) to run all tasks.
- **Automated Backups:** Creates timestamped backups of your Documents.
- **System Updates:** Fully updates and cleans your system.
- **Log Monitoring:** Checks system logs for "ERROR" messages.
- **Logging:** All script actions and errors are logged to `logs/maintenance.log`.

## How to Run
To start the suite, run the main menu script:
```bash
bash main.sh
```

## Individual Scripts
* **main.sh**: The main menu to run all other scripts.
* **backup.sh**: A script to automate system backups.
* **update.sh**: A script to perform system updates and clean up.
* **monitor_logs.sh**: A script to monitor system logs for errors.

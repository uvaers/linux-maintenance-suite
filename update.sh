#!/bin/bash
# This script updates and cleans the system using apt.
# We must use 'sudo' for admin privileges.

echo "--- Starting System Update ---"
# 'apt update' refreshes the package lists.
sudo apt update

echo "--- Upgrading Installed Packages ---"
# 'apt upgrade' upgrades all installed packages.
# The '-y' flag automatically answers 'yes' to prompts.
sudo apt upgrade -y

echo "--- Cleaning Up Unused Dependencies ---"
# 'apt autoremove' cleans up unused dependencies.
sudo apt autoremove -y

echo "--- Maintenance Complete ---"

#!/bin/bash

echo "=== System Information ==="
echo "Hostname: $(hostname)"
echo "Operating System: $(uname -s)"
echo "Kernel Version: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Current User: $(whoami)"
echo "Current Date: $(date)"

#!/bin/bash

USER=$(whoami)
TODAY=$(date +%Y-%m-%d)
HOSTNAME=$(hostname)

echo "=== System Information Script ==="
echo "User: $USER"
echo "Hostname: $HOSTNAME"
echo "Date: $TODAY"
echo "Operating System: $(uname -s)"

#!/bin/bash

USER=$(whoami)
DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "=== System Information Script ==="
echo "User: $USER"
echo "Disk Usage: ${DISK_USAGE}%"

if [ $DISK_USAGE -gt 80 ]; then
    echo "⚠️  WARNING: Disk usage is above 80%!"
else
    echo "✓ Disk usage is normal"
fi

#!/bin/bash

echo "=== Listing files in current directory ==="

for file in *; do
    echo "Found: $file"
done

#!/bin/bash

BACKUP_DIR="$HOME/log_backups"
LOG_DIR="$HOME/test_logs"  # We'll create test logs here
DAYS_OLD=7
DATE=$(date +%Y%m%d_%H%M%S)

#!/bin/bash

BACKUP_DIR="$HOME/log_backups"
LOG_DIR="$HOME/test_logs"  # We'll create test logs here
DAYS_OLD=7
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p $BACKUP_DIR
mkdir -p $LOG_DIR

echo "Creating test log files..."
touch $LOG_DIR/app.log
touch $LOG_DIR/error.log
touch $LOG_DIR/access.log
echo "Test log entry $(date)" >> $LOG_DIR/app.log

echo "=== Found Log Files ==="
ls -lh $LOG_DIR/*.log

echo -e "\n=== Starting Backup ==="
BACKUP_FILE="$BACKUP_DIR/logs_backup_$DATE.tar.gz"
tar -czf $BACKUP_FILE $LOG_DIR/*.log 2>/dev/null

if [ -f $BACKUP_FILE ]; then
    echo "✓ Backup created successfully: $BACKUP_FILE"
    ls -lh $BACKUP_FILE
else
    echo "✗ Backup failed!"
fi

echo -e "\n=== Cleaning Old Backups ==="
find $BACKUP_DIR -name "*.tar.gz" -mtime +$DAYS_OLD -exec rm {} \;
echo "Old backups cleaned up"

echo -e "\n=== Automation Complete ==="
mkdir -p $BACKUP_DIR
mkdir -p $LOG_DIR

echo "Creating test log files..."
touch $LOG_DIR/app.log
touch $LOG_DIR/error.log
touch $LOG_DIR/access.log
echo "Test log entry $(date)" >> $LOG_DIR/app.log

echo "=== Found Log Files ==="
ls -lh $LOG_DIR/*.log

echo -e "\n=== Starting Backup ==="
BACKUP_FILE="$BACKUP_DIR/logs_backup_$DATE.tar.gz"
tar -czf $BACKUP_FILE $LOG_DIR/*.log 2>/dev/null

if [ -f $BACKUP_FILE ]; then
    echo "✓ Backup created successfully: $BACKUP_FILE"
    ls -lh $BACKUP_FILE
else
    echo "✗ Backup failed!"
fi

echo -e "\n=== Cleaning Old Backups ==="
find $BACKUP_DIR -name "*.tar.gz" -mtime +$DAYS_OLD -exec rm {} \;
echo "Old backups cleaned up"

echo -e "\n=== Automation Complete ==="

#!/bin/bash

EXECUTION_LOG="execution_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a $EXECUTION_LOG)
exec 2>&1

echo "All output is being saved to: $EXECUTION_LOG"

#!/bin/bash
#
#########################################################
# Script Name: devops_automation.sh
# Description: Automates log backup and cleanup tasks
# Author: Your Name
# Date Created: 2026-02-09
# Version: 1.0
#
# Usage: ./devops_automation.sh
# 
# Requirements:
#   - Bash shell
#   - tar command
#   - Read/write permissions for directories
#
# Exit Codes:
#   0 - Success
#   1 - Backup failed
#########################################################

#=======================================================
# CONFIGURATION VARIABLES
#=======================================================

BACKUP_DIR="$HOME/log_backups"      # Where backups are stored
LOG_DIR="$HOME/test_logs"            # Source log directory
DAYS_OLD=7                           # Age threshold for cleanup
DATE=$(date +%Y%m%d_%H%M%S)         # Timestamp for backup files

EXECUTION_LOG="execution_$DATE.log"

#=======================================================
# SETUP AND INITIALIZATION
#=======================================================

exec > >(tee -a $EXECUTION_LOG)
exec 2>&1

echo "========================================="
echo "DevOps Automation Script Started"
echo "Execution Time: $(date)"
echo "========================================="

#=======================================================
# FUNCTION DEFINITIONS
#=======================================================

create_directories() {
    echo -e "\n[INFO] Creating necessary directories..."
    
    mkdir -p $BACKUP_DIR
    mkdir -p $LOG_DIR
    
    if [ -d $BACKUP_DIR ] && [ -d $LOG_DIR ]; then
        echo "[SUCCESS] Directories created/verified"
        return 0
    else
        echo "[ERROR] Failed to create directories"
        return 1
    fi
}

create_test_logs() {
    echo -e "\n[INFO] Creating test log files..."
    
    echo "Application started at $(date)" > $LOG_DIR/app.log
    echo "Error: Sample error at $(date)" > $LOG_DIR/error.log
    echo "Access log entry at $(date)" > $LOG_DIR/access.log
    
    echo "[SUCCESS] Test logs created"
}

display_logs() {
    echo -e "\n========================================="
    echo "LOG FILES FOUND"
    echo "========================================="
    
    if ls $LOG_DIR/*.log 1> /dev/null 2>&1; then
        ls -lh $LOG_DIR/*.log
    else
        echo "[WARNING] No log files found"
    fi
}

backup_logs() {
    echo -e "\n========================================="
    echo "CREATING BACKUP"
    echo "========================================="
    
    BACKUP_FILE="$BACKUP_DIR/logs_backup_$DATE.tar.gz"
    
    # Create compressed archive of log files
    tar -czf $BACKUP_FILE $LOG_DIR/*.log 2>/dev/null
    
    # Verify backup was created
    if [ -f $BACKUP_FILE ]; then
        echo "[SUCCESS] Backup created: $BACKUP_FILE"
        echo "[INFO] Backup size: $(du -h $BACKUP_FILE | cut -f1)"
        return 0
    else
        echo "[ERROR] Backup creation failed!"
        return 1
    fi
}

cleanup_old_backups() {
    echo -e "\n========================================="
    echo "CLEANING OLD BACKUPS"
    echo "========================================="
    
    BEFORE_COUNT=$(find $BACKUP_DIR -name "*.tar.gz" 2>/dev/null | wc -l)
    echo "[INFO] Backups before cleanup: $BEFORE_COUNT"
    
    find $BACKUP_DIR -name "*.tar.gz" -mtime +$DAYS_OLD -delete 2>/dev/null
    
    AFTER_COUNT=$(find $BACKUP_DIR -name "*.tar.gz" 2>/dev/null | wc -l)
    echo "[INFO] Backups after cleanup: $AFTER_COUNT"
    echo "[INFO] Removed $((BEFORE_COUNT - AFTER_COUNT)) old backup(s)"
}

display_summary() {
    echo -e "\n========================================="
    echo "EXECUTION SUMMARY"
    echo "========================================="
    echo "Backup Directory: $BACKUP_DIR"
    echo "Log Directory: $LOG_DIR"
    echo "Execution Log: $EXECUTION_LOG"
    echo "Completion Time: $(date)"
    echo "========================================="
}

#=======================================================
# MAIN EXECUTION
#=======================================================

echo -e "\n[INFO] Starting automation tasks...\n"

create_directories

create_test_logs

display_logs

backup_logs
BACKUP_STATUS=$?

cleanup_old_backups

display_summary

if [ $BACKUP_STATUS -eq 0 ]; then
    echo -e "\n[SUCCESS] All automation tasks completed successfully!"
    exit 0
else
    echo -e "\n[ERROR] Automation completed with errors"
    exit 1
fi

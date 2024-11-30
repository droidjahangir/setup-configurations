#!/bin/bash

# Directory to store backups
BACKUP_DIR="/home/dbdump"  # Replace with the directory where you want to store the backups
LOG_FILE="/var/log/dbbackup.log"      # Replace with the path to your log file

# Current date and time
DATE=$(date +"%Y%m%d%H%M%S")

# Perform the backup
mysqldump --no-tablespaces --single-transaction -u test-user -p'test123' --databases test-db | gzip > $BACKUP_DIR/test_backup_$DATE.sql.gz

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') Backup was successful! Backup file: $BACKUP_DIR/test_backup_$DATE.sql.gz" >> $LOG_FILE
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') Backup failed!" >> $LOG_FILE
fi
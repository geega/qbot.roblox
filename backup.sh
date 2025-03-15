#!/bin/bash

# Define paths
BACKUP_DIR="./backup"
SQLITE_DB="./src/database/migrations/qbotdata.db"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/sqlite_backup_$TIMESTAMP.db"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Copy SQLite file
cp $SQLITE_DB $BACKUP_FILE

# Keep only the last 7 backups
find $BACKUP_DIR -type f -name "sqlite_backup_*.db" -mtime +7 -exec rm {} \;

echo "Backup completed: $BACKUP_FILE"

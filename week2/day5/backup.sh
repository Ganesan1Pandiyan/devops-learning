#!/bin/bash
# Backup Script - Ganesan

SOURCE="devops"
DEST="$HOME/backups"
DATE=$(date +%Y-%m-%d_%H-%M)
FILE="$DEST/devops_$DATE.tar.gz"
LOG="$DEST/backup.log"

mkdir -p "$DEST"

if tar -czf "$FILE" -C "$HOME" "$SOURCE"; then
    echo "$(date) SUCCESS $FILE" >> "$LOG"
    echo "Backup done: $FILE"
else
    echo "$(date) FAILED" >> "$LOG"
    echo "Backup FAILED!"
fi

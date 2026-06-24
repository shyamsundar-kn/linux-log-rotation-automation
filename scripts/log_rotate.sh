#!/bin/bash

# Load configuration
source ../config/app.conf

DATE=$(date +%Y%m%d_%H%M%S)

if [ -f "$LOG_FILE" ]; then

    FILE_SIZE=$(du -m "$LOG_FILE" | cut -f1)

    if [ "$FILE_SIZE" -ge "$MAX_SIZE_MB" ]; then

        echo "[$(date)] Rotating log file..."

        mv "$LOG_FILE" "$LOG_DIR/app_$DATE.log"

        touch "$LOG_FILE"

        chmod 644 "$LOG_FILE"

        gzip "$LOG_DIR/app_$DATE.log"

        echo "[$(date)] Rotation completed"

    else
        echo "[$(date)] Log size within threshold"
    fi

else
    echo "[$(date)] Log file not found"
fi

# Cleanup old compressed logs

find "$LOG_DIR" -name "*.gz" -mtime +"$RETENTION_DAYS" -exec rm -f {} \;

echo "[$(date)] Cleanup completed"

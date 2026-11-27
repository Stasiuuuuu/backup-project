
#!/usr/bin/env bash
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_NAME=$1
FILE_NAME=$(basename "$PROJECT_NAME")
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
LOG_FILE="$PROJECT_ROOT/logs/backup.log"
BACKUP_DIR="$PROJECT_ROOT/backups"

if [[ -z "$PROJECT_NAME" ]]; then
        echo "provide the filename"
        echo "$TIMESTAMP | ERROR | No filename provided" >> "$LOG_FILE"
        exit 1
else
    if [[ -f "$PROJECT_NAME" ]]; then
            if tar -czf "$BACKUP_DIR/${FILE_NAME}_${TIMESTAMP}.tar.gz" -C "$(dirname "$PROJECT_NAME")" "$FILE_NAME"; then
                if tar -tzf "$BACKUP_DIR/${FILE_NAME}_${TIMESTAMP}.tar.gz" > /dev/null; then
                     echo "File $PROJECT_NAME is archived at $TIMESTAMP"
                     echo "$TIMESTAMP | SUCCESS | $PROJECT_NAME" >> "$LOG_FILE"
                else
                     echo "Your file isnt archived"
                     echo "$TIMESTAMP | ERROR | File isnt archived" >> "$LOG_FILE"
                     exit 1
                fi
            else
                echo "The file is not archived"
                echo "$TIMESTAMP | ERROR | Failed to create archive: $PROJECT_NAME" >> "$LOG_FILE"
                exit 1
            fi
     else
         echo "there is no file named $PROJECT_NAME"
         echo "$TIMESTAMP | ERROR | File doesnt exist" >> "$LOG_FILE"
         exit 1
     fi
fi


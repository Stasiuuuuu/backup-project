#!/usr/bin/env bash

PROJECT_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_SCRIPT="$PROJECT_ROOT/scripts/backup.sh"

echo "Running tests..."
TEST_FILE="$PROJECT_ROOT/scripts/test.txt"

if bash "$BACKUP_SCRIPT" "$TEST_FILE"; then
    echo "PASS: Backup command succeeded"
else
    echo "FAIL: Backup command failed"
    exit 1
fi


MISSING_FILE="$PROJECT_ROOT/missing_test_file.txt"

if bash "$BACKUP_SCRIPT" "$MISSING_FILE"; then
    echo "FAIL: Missing file was accepted"
    exit 1
else
    echo "PASS: Missing file was rejected"
fi

if bash "$BACKUP_SCRIPT"; then
    echo "FAIL: Backup ran without a filename"
    exit 1
else
    echo "PASS: Missing argument was rejected"
fi

#!/bin/bash

# Source folder to be backed up
SOURCE_FOLDER="/home/soydev/dev_profile"

# Destination folder on your HDD
DESTINATION_FOLDER="/media/soydev/Seagate- 1st Part/backups"

# Create a timestamp for the backup folder
TIMESTAMP=$(date +%Y_%B_%d)

# Create the backup folder with the timestamp
BACKUP_FOLDER="$DESTINATION_FOLDER/backup_$TIMESTAMP"

# Perform the backup using rsync
rsync -avz --progress "$SOURCE_FOLDER" "$BACKUP_FOLDER"

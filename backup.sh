#!/bin/bash
echo Latest Backups:
echo
./listBackup.sh

echo
echo Enter name of backup:
read backupName

echo
echo Pausing all containers
docker pause $(docker ps -q)

echo
echo Creating Backup
borg create --stats --progress \
  --compression lz4 \
  --exclude ~/Servers/jellyfin/library/cache \
  --exclude ~/Servers/jellyfin/library/data/metadata/People \
  ~/ServerBackup/::$backupName ~/Servers

echo
echo Resuming all containers
docker unpause $(docker ps -q)

echo
echo Syncing to OneDrive
rclone sync --progress ~/ServerBackup/ remote:/ServerBackup/
#!/bin/bash
backupName="daily_backup_$(date +\%Y-\%m-\%d)"

echo Starting backup process for $backupName

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
echo pruning backups older than 1 month
borg prune -v --list --keep-daily=31 ~/ServerBackup/

echo
echo compacting backups
borg compact ~/ServerBackup/

echo
echo Syncing to OneDrive
rclone sync --progress ~/ServerBackup/ remote:/ServerBackup/

echo
echo Backup finished
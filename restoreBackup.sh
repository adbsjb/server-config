#!/bin/bash
echo
echo "About to sync from OneDrive. Are you sure you want to overwrite local backup files? [y/n]"
read overwriteResponse

if [ $overwriteResponse != "y" ]; then
    exit 0
fi

echo
echo Syncing from OneDrive
rclone sync --progress remote:/ServerBackup/ ~/ServerBackup/

echo Latest Backups:
echo
./listBackup.sh

echo
echo Enter name of backup to restore:
read backupName

echo "Which file/folder  do you want to extract? (leave blank for all)"
read specificFiles

cd ~/ServerBackupExtract/
borg extract --list ~/ServerBackup/::$backupName $specificFiles
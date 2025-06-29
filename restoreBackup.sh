#!/bin/bash
echo Latest Backups:
echo
./listBackup.sh

echo
echo Enter name of backup:
read backupName

echo "Which file/folder  do you want to extract? (leave blank for all)"
read specificFiles

cd ~/ServerBackupExtract/
borg extract --list ~/ServerBackup/::$backupName $specificFiles
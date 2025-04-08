#!/bin/bash
echo Enter name of backup:

read backupName

borg create --stats --progress \
  --compression lz4 \
  --exclude /mnt/c/Servers/jellyfin/library/cache \
  --exclude /mnt/c/Servers/jellyfin/library/data/metadata/People \
  /mnt/c/Users/adbsj/OneDrive/Documents/ServerBackups/::$backupName /mnt/c/Servers
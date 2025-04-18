#!/bin/bash
echo Enter name of backup:

read backupName

borg create --stats --progress \
  --compression lz4 \
  --exclude /mnt/c/Servers/jellyfin/library/cache \
  --exclude /mnt/c/Servers/jellyfin/library/data/metadata/People \
  ~/ServerBackups/::$backupName /mnt/c/Servers
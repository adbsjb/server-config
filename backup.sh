#!/bin/bash
echo Enter name of backup:

read backupName

borg create --stats --progress \
  --compression lz4 \
  --exclude ~/Servers/jellyfin/library/cache \
  --exclude ~/Servers/jellyfin/library/data/metadata/People \
  ~/ServerBackups/::$backupName ~/Servers
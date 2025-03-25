#!/bin/bash
echo Enter name of backup:

read backupName

borg create --stats --progress --compression lz4 /mnt/c/Users/adbsj/OneDrive/Documents/ServerBackups/::$backupName /mnt/c/Servers
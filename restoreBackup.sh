#!/bin/bash
echo Enter name of backup to restore:

read backupName


borg extract --list ~/ServerBackups::$backupName mnt/c/Servers
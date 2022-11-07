#!/bin/bash
 
# The source path to backup. Can be local or remote.
SOURCE=/home/david/Desktop/Seguridad
# Where to store the incremental backups
DESTBASE=/var/tmp/Backups
 
# Where to store today's backup
DEST="$DESTBASE/$(date +%d-%m-%Y)"
# Where to find yesterday's backup
YESTERDAY="$DESTBASE/$(date -d yesterday +%Y-%m-%d)/"
 
# Use yesterday's backup as the incremental base if it exists
if [ -d "$YESTERDAY" ]
then
	OPTS="--link-dest $YESTERDAY"
fi
 
# Run the rsync
rsync -av $OPTS "$SOURCE" "$DEST"


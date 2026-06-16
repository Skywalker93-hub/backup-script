#!/bin/bash 
#Variables

BACKUP_DIR='/opt/archive'
ARCHIVE_NAME='/opt/archive.tar.gz'
SCPDIR='/opt/backup'
PASSWD='****'
IP='****'
REMOTE_DIR='/opt/backup'
USER='****'

#Create a folder and archive it

set -e

tar -czf "$ARCHIVE_NAME" "$BACKUP_DIR"

if [[ $? == 0 ]]; then
   echo "The folder is archived"
else
   echo "The folder isn't archived"
fi

#Check server availability

if sshpass -p "$PASSWD" ssh -q "$USER"@"$IP" "exit"; then
   echo "The server is okay"
else
   echo "The server is not okay"
fi

#Connect to the server and send an archive file

sshpass -p "$PASSWD" scp "$ARCHIVE_NAME" "$USER"@"$IP":"$REMOTE_DIR"

if [[ $? == 0 ]]; then
   echo "The folder has been moved successfully"
else
   echo "The folder hasn't been moved"
fi

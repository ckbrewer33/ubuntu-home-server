#!/bin/bash

CONTAINER_NAME=$1
WORLD_DIRECTORY=$2

if [ -z "$CONTAINER_NAME" ] || [ -z "$WORLD_DIRECTORY" ]
then
  echo "Usage: minecraftWorldDockerBackup.sh <docker-container-name> <world-directory>"
  exit -1
fi

echo "--------------------------------------"
echo "Beginning backup of $CONTAINER_NAME..."
echo "--------------------------------------"

DATE=`date +%Y-%m-%d`
FILENAME="$DATE-$CONTAINER_NAME.tar.gz"
BUCKET_NAME="<s3-bucket>"

# Stop the server while the backup is being made
echo "Stopping $CONTAINER_NAME server for backup"
docker stop $CONTAINER_NAME

# Create the backup
echo "Creating backup file"
tar -czf $FILENAME $WORLD_DIRECTORY

# Restart the server
echo "Restarting the $CONTAINER_NAME server"
docker start $CONTAINER_NAME

# Upload the backup file to S3
echo "Uploading $CONTAINER_NAME backup to S3"
aws s3 cp $FILENAME $BUCKET_NAME/$CONTAINER_NAME/

# Remove the backup file from disk to save space
echo "Cleaning up backup file from local disk"
rm $FILENAME

echo "-------------------------------"
echo "$CONTAINER_NAME Backup Complete"
echo "-------------------------------"
#!/bin/bash

echo "Configuring NAS connection"
sudo apt update
sudo apt install nfs-common -y

# Create a directory for the NAS mount point
mkdir -p /nfs/media

# Backup and modify /etc/fstab to auto-mount the NAS volume
cp /etc/fstab /etc/fstab_backup
echo "<ip-address>:<media-folder> /nfs/media nfs defaults 0 0" >> /etc/fstab

# Mount the NAS volume from etc/fstab
mount -a
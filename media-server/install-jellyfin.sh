#!/bin/bash

echo "Installing Jellyfin"
mkdir -p /srv/jellyfin
mkdir /srv/jellyfin/config
mkdir /srv/jellyfin/cache

docker compose up -d
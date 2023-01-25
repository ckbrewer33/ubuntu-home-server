#!/bin/bash
BACKUP_SCRIPT_HOME="<path-backup-script>"
WORLD_HOME="<directory-with-all-worlds"

$BACKUP_SCRIPT_HOME/backupMinecraftDockerWorld.sh minecraft_kiddoSurvival $WORLD_HOME/kiddoSurvival
$BACKUP_SCRIPT_HOME/backupMinecraftDockerWorld.sh minecraft_game_world    $WORLD_HOME/game_world
$BACKUP_SCRIPT_HOME/backupMinecraftDockerWorld.sh minecraft_creative      $WORLD_HOME/minecraft_creative
$BACKUP_SCRIPT_HOME/backupMinecraftDockerWorld.sh minecraft_hydrogen      $WORLD_HOME/minecraft_hydrogen

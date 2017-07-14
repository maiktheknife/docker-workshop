#!/usr/bin/env bash

echo "Start"

GAMEMODE=$1
DIFFICULTY=$2
MOTD=$3

sed -i 's/gamemode=0/gamemode=GAMEMODE/g' src/server.properties
sed -i 's/difficulty=1/difficulty=$DIFFICULTY/g' src/server.properties
sed -i 's/motd=A Minecraft Server/motd=MOTD/g' src/server.properties

java -jar minecraft_server.jar
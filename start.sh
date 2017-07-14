#!/usr/bin/env bash

# cat src/server.properties

sed -i 's/gamemode=0/gamemode='"$GAMEMODE"'/g' server.properties
sed -i 's/difficulty=0/difficulty='"$DIFFICULTY"'/g' server.properties
sed -i 's/motd=test/motd='"$MOTD"'/g' server.properties

# cat src/server.properties

java -jar minecraft_server.jar

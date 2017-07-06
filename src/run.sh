#!/usr/bin/env bash
CONFIG_OPTIONS=(PLAYER_SPEED MOTD MAX_CONNECTIONS_PER_IP)
for option in "${CONFIG_OPTIONS[@]}"; do
	sed -i "s/{${option}}/${!option}/g" gameserver.ini
done

exec node index.js
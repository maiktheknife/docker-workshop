#!/usr/bin/env bash
set -e

envsubst < server.properties.template > server.properties

if [ ! -f "${MC_HOME}/ServerStart.sh" ]; then
	java -Xms${JVM_MEMORY} -Xmx${JVM_MEMORY} -jar minecraft_server.jar nogui
else
	exec sh "${MC_HOME}/ServerStart.sh"
fi
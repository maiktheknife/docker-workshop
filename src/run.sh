#!/usr/bin/env bash
envsubst < server.properties.template > server.properties
java -Xms${JVM_MEMORY} -Xmx${JVM_MEMORY} -jar minecraft_server.jar nogui
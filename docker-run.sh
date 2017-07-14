#!/usr/bin/env bash

docker run -v /c/docker/minecraft:/home/docker-7/minecraft/world -p 25565:25565 -e GAMEMODE=2 max/minecraft

#!/usr/bin/env bash

docker build -t max/minecraft --build-arg GAMEMODE=1 --build-arg DIFFICULTY=1 --build-arg MOTD="hello from docker" .
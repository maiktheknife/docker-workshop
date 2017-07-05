#!/usr/bin/env bash
set -e

envsubst < motd_text_default.txt.template > "game/${GAME}/motd_text_default.txt"
game/srcds_run -game ${GAME} +sv_lan 1 $@

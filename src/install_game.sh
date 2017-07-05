#!/usr/bin/env bash
set -e

export GAME_ID=0

case $GAME in
    csgo)
		echo "Installing Counter Strike: GO"
        GAME_ID=740
        ;;
    tf)
        echo "Installing Team Fortress 2"
        GAME_ID=232250
        ;;
    *)
		echo "Game ${GAME} unknown. Choose from: tf, csgo"
        exit 1
esac

envsubst < app_ds.txt.template > app_ds.txt
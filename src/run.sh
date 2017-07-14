#!/usr/bin/env bash

envsubst < /etlegacy/etl_server.cfg.template > /etlegacy/etmain/etl_server.cfg

exec ./etlded_bot.sh

#!/usr/bin/env bash
set -e

envsubst < motd_text_default.txt.template > tf2/tf/motd_text_default.txt
tf2/srcds_run $@

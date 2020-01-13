#!/bin/sh

#
# Script options (exit script on command fail).
#
set -e

INOTIFY_EVENTS_DEFAULT="create,delete,modify,move"
INOTIFY_OPTONS_DEFAULT=''
COMMAND_DEFAULT='pwd'
#
# Display settings on standard out.
#
echo "inotify settings"
echo "================"
echo
echo "  Command:          ${COMMAND:=${COMMAND_DEFAULT}}"
echo "  Volumes:          ${VOLUMES}"
echo "  Inotify_Events:   ${INOTIFY_EVENTS:=${INOTIFY_EVENTS_DEFAULT}}"
echo "  Inotify_Options:  ${INOTIFY_OPTONS:=${INOTIFY_OPTONS_DEFAULT}}"
echo

#
# Inotify part.
#

inotifywait_command="inotifywait -e ${INOTIFY_EVENTS} ${INOTIFY_OPTONS} \"${VOLUMES}\""
echo "[Starting inotifywait [${inotifywait_command}] ...]"

while eval "$inotifywait_command"; do
    eval "${COMMAND}"
done

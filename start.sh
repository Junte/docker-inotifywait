#!/bin/sh

#
# Script options (exit script on command fail).
#
set -e

CURL_OPTIONS_DEFAULT=
INOTIFY_EVENTS_DEFAULT="create,delete,modify,move"
INOTIFY_OPTONS_DEFAULT='--monitor'
COMMAND_DEFAULT='ps'
#
# Display settings on standard out.
#
echo "inotify settings"
echo "================"
echo
echo "  Command:          ${COMMAND:=${COMMAND_DEFAULT}}"
echo "  Volumes:          ${VOLUMES}"
echo "  Curl_Options:     ${CURL_OPTIONS:=${CURL_OPTIONS_DEFAULT}}"
echo "  Inotify_Events:   ${INOTIFY_EVENTS:=${INOTIFY_EVENTS_DEFAULT}}"
echo "  Inotify_Options:  ${INOTIFY_OPTONS:=${INOTIFY_OPTONS_DEFAULT}}"
echo

#
# Inotify part.
#

echo "[Starting inotifywait: ...]"

inotifywait_command="inotifywait -e ${INOTIFY_EVENTS} ${INOTIFY_OPTONS} \"${VOLUMES}\""
eval "$inotifywait_command" | \
    while read -r notifies;
    do
    	echo "$notifies"
        docker_command="docker ${COMMAND}"
        echo "notify received, run docker command: ${docker_command}"
        eval "$docker_command"
    done


#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

exec "$SCRIPTPATH/Obsidian-1.5.8.AppImage" &> /dev/null &



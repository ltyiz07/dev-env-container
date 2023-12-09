#!/bin/bash

export GROUP_ID=$(id -g ${USER})
export USER_ID=$(id -u ${USER})
export USER_NAME="dever"

docker compose down
docker compose up -d --build 


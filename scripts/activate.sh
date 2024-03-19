#!/bin/bash

# docker start --user $(id -u):$(id -g) works_env
# docker exec -it --user $(id -u):$(id -g) works_env zsh

docker start works_env
docker exec -it works_env zsh

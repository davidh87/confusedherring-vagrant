#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/common.sh

git clone https://github.com/davidh87/confusedherring-docker.git $MY_DOCKER_DIR

echo $SCRIPT_DIR

source $SCRIPT_DIR/setup-homeshaft.sh

#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/common.sh

sed -i -e 's/.*bind-address.*/bind-address = 127.0.0.1\nbind-address = 172.17.0.1/g' /etc/mysql/my.cnf
service mysql restart

git clone https://github.com/davidh87/confusedherring-docker.git $MY_DOCKER_DIR

echo $SCRIPT_DIR

source $SCRIPT_DIR/setup-homeshaft.sh

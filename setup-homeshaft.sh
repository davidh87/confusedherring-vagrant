#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPT_DIR/common.sh

git clone https://github.com/davidh87/homeshaft.git /tmp/homeshaft

echo "create database homeshaft; "\
     "grant all on homeshaft.* to 'homeshaft'@'%' identified by 'homey'; "\
     "flush privileges; " \
    | mysql -uroot -ppass123

cat /tmp/homeshaft/sql/schema.sql | mysql -uroot -ppass123 homeshaft
cat /tmp/homeshaft/sql/dev-seed.sql | mysql -uroot -ppass123 homeshaft

source $MY_DOCKER_DIR/run-homeshaft.sh

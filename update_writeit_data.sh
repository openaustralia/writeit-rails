#!/bin/bash

set -e

export DIR=writeit_local_for_testing
export VIRTUALENV=writeit_for_testing
export YAML_FILE_NAME="$1"

cd $DIR;
source $VIRTUALENV/bin/activate;

export YAML_FILE_NAME="$1";

if [ ! -e current_data.txt ]; then touch current_data.txt; fi

CURRENT_DATA=`cat current_data.txt`;

if [ "$CURRENT_DATA" != "$YAML_FILE_NAME" ]
then
        echo "$YAML_FILE_NAME" > current_data.txt;
        python manage.py flush --noinput
        python manage.py loaddata $YAML_FILE_NAME;
        
else
        echo "$CURRENT_DATA and $YAML_FILE_NAME are equal";
fi
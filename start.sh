#! /bin/bash

set -e -x

echo "Will initiate target-config.json from j2"

env | j2 --format=env /app/tap-facebook/config.j2 > /app/singer-wrapper/target-config.json

echo "Executing Python Script"

cd /app/singer-wrapper/

if [ ! -f target-config.json ]; then
    echo "File not found!"
fi

python3 __init__.py -c target-config.json -T facebook

echo "Completed Executing script"
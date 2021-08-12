#!/bin/bash

app="$1"
version="$2"

if [ -d ./$app/ ]; then
    cd ./$app/
    echo "Cambiando version para CD a: '$version' ..."
    _chart_=$(cat ./Chart.yaml | awk "{gsub(/appVersion:.*/,\"appVersion: $version\")}1")
    echo "$_chart_" > ./Chart.yaml

    git add ./Chart.yaml
    git commit -m "Deploy: $app:$version by DroneCI"
    git push
else 
    echo El proyecto no esta preparado para este ambiente. Porfavor contacte con el resposable de los despliegues.
    exit 13
fi

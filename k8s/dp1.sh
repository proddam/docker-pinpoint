#!/bin/bash

files="
pinpoint-collector-deployment.yaml \
pinpoint-collector-service.yaml \
pinpoint-web-deployment.yaml \
pinpoint-web-service.yaml \
"

for file in $files
do
  echo "$file"
  kubectl apply -f $file
done

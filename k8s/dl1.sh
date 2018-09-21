#!/bin/bash

files="
pinpoint-web-service.yaml \
pinpoint-web-deployment.yaml \
pinpoint-collector-service.yaml \
pinpoint-collector-deployment.yaml \
"

for file in $files
do
  echo "$file"
  kubectl delete -f $file
done

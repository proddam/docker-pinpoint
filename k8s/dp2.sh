#!/bin/bash

files="
rancher-server-deployment.yaml \
rancher-server-service.yaml \
"

for file in $files
do
  echo "$file"
  kubectl apply -f $file
done

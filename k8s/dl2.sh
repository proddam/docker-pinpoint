#!/bin/bash

files="
rancher-server-service.yaml \
rancher-server-deployment.yaml \
"

for file in $files
do
  echo "$file"
  kubectl delete -f $file
done

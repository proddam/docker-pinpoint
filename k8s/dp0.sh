#!/bin/bash

files="
pinpoint-hbase-deployment.yaml \
pinpoint-hbase-service.yaml \
"

for file in $files
do
  echo "$file"
  kubectl apply -f $file
done

#!/bin/bash

files="
pinpoint-hbase-service.yaml \
pinpoint-hbase-deployment.yaml \
"

for file in $files
do
  echo "$file"
  kubectl delete -f $file
done

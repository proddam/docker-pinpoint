#!/bin/bash

PINPOINT_VERSION=${PINPOINT_VERSION:-1.8.0}

for module in hbase web collector agent
do
  cd pinpoint-$module
  docker build -t proddam/pinpoint-$module:${PINPOINT_VERSION} .
  cd ..
done

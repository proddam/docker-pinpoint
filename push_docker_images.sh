#!/bin/bash

PINPOINT_VERSION=${PINPOINT_VERSION:-1.8.0}

for module in hbase web collector agent
do
  docker push proddam/pinpoint-$module:${PINPOINT_VERSION}
done

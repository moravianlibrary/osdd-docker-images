#!/bin/bash

docker build -t iipsrv-builder .
if [ -n "${KAKADU_HOME+1}" ]; then
  s2i build --incremental=false --rm --ref=master --inject $KAKADU_HOME:/tmp/kakadu git@github.com:moravianlibrary/iipsrv.git iipsrv-builder iipsrv-devel
else
  s2i build --incremental=false --rm --ref=master git@github.com:moravianlibrary/iipsrv.git iipsrv-builder iipsrv-devel
fi

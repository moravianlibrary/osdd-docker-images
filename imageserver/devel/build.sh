#!/bin/bash
docker build -t iipsrv-builder .
s2i build --incremental=false --rm --ref=master /home/rumanekm/workspace/iipsrv iipsrv-builder iipsrv-devel


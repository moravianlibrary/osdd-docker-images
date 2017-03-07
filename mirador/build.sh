#!/bin/bash

docker build -t mirador-builder .
s2i build --incremental=false --exclude="" --rm --ref=master https://github.com/ProjectMirador/mirador.git mirador-builder mirador

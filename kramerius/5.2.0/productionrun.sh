#!/bin/sh
docker run -v /kramerius-data:/kramerius-data  -t -i -p 80:80 moravianlibrary/kramerius /init.sh


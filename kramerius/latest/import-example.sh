#!/bin/bash

#wget  http://ftp-devel.mzk.cz/example/example-jp2.tar -O - | tar x -C /data/imageserver/
wget http://ftp-devel.mzk.cz/example/example-foxml.tar -O - | tar x -C /data/foxml-import/

curl -vv -u "krameriusAdmin:krameriusAdmin" -H "Content-Type: application/json" -d '{"parameters": ["import.directory", "data/foxml-import/2619298459"]}' http://localhost:8080/search/api/v4.6/processes?def=parametrizedimport


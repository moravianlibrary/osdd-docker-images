#!/bin/bash

/usr/bin/spawn-fcgi -f /usr/lib/cgi-bin/iipsrv.fcgi -p $PORT -F $CHILDREN
exec cat /tmp/iipsrv.log
